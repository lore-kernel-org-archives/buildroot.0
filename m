From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Nov 2017 22:27:20 +0100
Subject: [Buildroot] [PATCH v5 1/2] zlib-ng: rename zlib to libzlib
In-Reply-To: <20171129211714.1326-1-stefan.froberg@petroprogram.com>
References: <20171129211714.1326-1-stefan.froberg@petroprogram.com>
Message-ID: <20171129212720.GA4091@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stfean, All,

On 2017-11-29 23:17 +0200, Stefan Fr?berg spake thusly:
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
> Changes v4 -> v5:
> 
> - Added host-zlib support to virtual zlib package

Indeed. ;-)  But see below...

[--SNIP--]
> diff --git a/package/zlib/Config.in b/package/zlib/Config.in
> index 6201aba142..043c3cefa4 100644
> --- a/package/zlib/Config.in
> +++ b/package/zlib/Config.in
> @@ -1,7 +1,32 @@
>  config BR2_PACKAGE_ZLIB
> +	bool "zlib support"
> +	help
> +	  Select the desired Zlib library provider.
> +
> +if BR2_PACKAGE_ZLIB
> +
> +choice
> +	prompt "zlib variant"
> +	default BR2_PACKAGE_LIBZLIB
> +	help
> +	  Select the desired Zlib library provider.
> +
> +config BR2_PACKAGE_LIBZLIB
>  	bool "zlib"
> +	select BR2_PACKAGE_HAS_ZLIB
>  	help
>  	  Standard (de)compression library. Used by things like
>  	  gzip and libpng.
>  
>  	  http://www.zlib.net
> +
> +endchoice
> +
> +config BR2_PACKAGE_HAS_ZLIB
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_ZLIB
> +	string
> +	default "libzlib" if BR2_PACKAGE_LIBZLIB
> +
> +endif

So far, only zlib is a target provider, so a host provider.

But when you add zlib-ng, selecting zlib-ng for the target will imply
zlib-ng for the host.

It sounds weird that the choice of a target package has an impact on the
host package.

Besides, if zlib is not enabled in the configuration, then there will be
no host variant either.

So, we want to do something similar to what was done for openssl: always
use one variant for the host (and I think we want it to be zlib, not
zlib-ng).

See for reference: 915a627f (openssl: unconditionally define
BR2_PACKAGE_PROVIDES_HOST_OPENSSL)

Regards,
Yann E. MORIN.

> diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
> index 9b5f52e807..78f48ff059 100644
> --- a/package/zlib/zlib.mk
> +++ b/package/zlib/zlib.mk
> @@ -4,74 +4,5 @@
>  #
>  ################################################################################
>  
> -ZLIB_VERSION = 1.2.11
> -ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
> -ZLIB_SITE = http://www.zlib.net
> -ZLIB_LICENSE = Zlib
> -ZLIB_LICENSE_FILES = README
> -ZLIB_INSTALL_STAGING = YES
> -
> -# It is not possible to build only a shared version of zlib, so we build both
> -# shared and static, unless we only want the static libs, and we eventually
> -# selectively remove what we do not want
> -ifeq ($(BR2_STATIC_LIBS),y)
> -ZLIB_PIC =
> -ZLIB_SHARED = --static
> -else
> -ZLIB_PIC = -fPIC
> -ZLIB_SHARED = --shared
> -endif
> -
> -define ZLIB_CONFIGURE_CMDS
> -	(cd $(@D); rm -rf config.cache; \
> -		$(TARGET_CONFIGURE_ARGS) \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
> -		./configure \
> -		$(ZLIB_SHARED) \
> -		--prefix=/usr \
> -	)
> -endef
> -
> -define HOST_ZLIB_CONFIGURE_CMDS
> -	(cd $(@D); rm -rf config.cache; \
> -		$(HOST_CONFIGURE_ARGS) \
> -		$(HOST_CONFIGURE_OPTS) \
> -		./configure \
> -		--prefix="$(HOST_DIR)" \
> -		--sysconfdir="$(HOST_DIR)/etc" \
> -	)
> -endef
> -
> -define ZLIB_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
> -endef
> -
> -define HOST_ZLIB_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
> -endef
> -
> -define ZLIB_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
> -endef
> -
> -define ZLIB_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
> -endef
> -
> -# We don't care removing the .a from target, since it not used at link
> -# time to build other packages, and it is anyway removed later before
> -# assembling the filesystem images anyway.
> -ifeq ($(BR2_SHARED_LIBS),y)
> -define ZLIB_RM_STATIC_STAGING
> -	rm -f $(STAGING_DIR)/usr/lib/libz.a
> -endef
> -ZLIB_POST_INSTALL_STAGING_HOOKS += ZLIB_RM_STATIC_STAGING
> -endif
> -
> -define HOST_ZLIB_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) LDCONFIG=true install
> -endef
> -
> -$(eval $(generic-package))
> -$(eval $(host-generic-package))
> +$(eval $(virtual-package))
> +$(eval $(host-virtual-package))
> -- 
> 2.13.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
