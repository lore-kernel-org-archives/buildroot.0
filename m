From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 13:42:47 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/samba4: Do not force target python
In-Reply-To: <20200103112516.1501782-1-fontaine.fabrice@gmail.com>
References: <20200103112516.1501782-1-fontaine.fabrice@gmail.com>
Message-ID: <20200103134247.15b63dc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 12:25:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/samba4/Config.in b/package/samba4/Config.in
> index 493c79f3f8..a34eaa8088 100644
> --- a/package/samba4/Config.in
> +++ b/package/samba4/Config.in
> @@ -18,7 +18,6 @@ config BR2_PACKAGE_SAMBA4
>  	select BR2_PACKAGE_GNUTLS
>  	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_PACKAGE_POPT
> -	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  Provides secure, stable and fast file and print services
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index c5d2d6c6ea..31a598333c 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -26,14 +26,11 @@ SAMBA4_CONF_ENV = \
>  	WAF_NO_PREFORK=1
>  
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -SAMBA4_PYTHON = \
> -	PYTHON="$(HOST_DIR)/bin/python3" \
> -	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
> -SAMBA4_DEPENDENCIES += host-python3 python3
> +SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
> +SAMBA4_DEPENDENCIES += host-python3
>  else
>  SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2"
>  SAMBA4_DEPENDENCIES += host-python
> -SAMBA4_CONF_OPTS += --disable-python
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> @@ -143,9 +140,10 @@ define SAMBA4_INSTALL_TARGET_CMDS
>  endef
>  
>  ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
> -SAMBA4_DEPENDENCIES += jansson
> +SAMBA4_CONF_ENV += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
> +SAMBA4_DEPENDENCIES += jansson python3
>  else
> -SAMBA4_CONF_OPTS += --without-ad-dc --without-json
> +SAMBA4_CONF_OPTS += --disable-python --without-ad-dc --without-json
>  endif

So there is nothing Python related in samba4, besides the AD DC
support? In his e-mail at
http://lists.busybox.net/pipermail/buildroot/2019-November/266563.html,
Trent said:

  But having looked at it more, samba's python support beyond the AD DC
  feature might not be all that useful.  There is a python module, but
  nothing in buildroot uses it.  Fedora 31 has only two (non-samba)
  packages, freeipa and fleet-commander, that use it.  Neither is in
  buildroot.

To me, this feels like there are indeed some Python modules in Samba4,
and those should be built and installed when Python is enabled, even if
AD DC support is disabled.

So in this patch, I would in fact keep only the Config.in change that
makes Python no longer mandatory on the target. But the rest could be
kept as-is: if BR2_PACKAGE_PYTHON3=y, we do get the Python modules of
Samba4, regardless of whether AD DC support is enabled or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
