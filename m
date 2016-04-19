From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Apr 2016 00:16:37 +0200
Subject: [Buildroot] [PATCH 3/4] vpnc: bump to newer upstream version
In-Reply-To: <1455145392-2355-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455145392-2355-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160419221637.GK3505@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-02-11 00:03 +0100, Thomas Petazzoni spake thusly:
> While the official upstream has not published any new tarball, they
> have continued to update their Subversion repository with additional
> changes. This commit therefore updates the vpnc package to a newer
> version, using the Github repository that replicates the original
> Subversion repository.
> 
> Since the update required some updates to the patches, we took this
> opportunity to split them in more fine-grained changes, and document
> them more properly. Consequently:
> 
>  - The patch 0001 that fixes the Makefile gets split into 3 patches,
>    0001, 0002 and 0003, each for one specific issue.
> 
>  - Patch 0002 to disable building the manpages gets changed into a
>    solution that is potentially upstreamable, and is now patch 0004.
> 
>  - A new patch 0005 is added to specify a custom libgcrypt-config
>    path, since this tool is now used to know how to link with
>    libgcrypt.
> 
>  - The SUSv3 function removal patch is now patch 0006, and gains a
>    better commit log.
> 
> Also, this vpnc version now depends on gnutls, which basically is a
> better replacement for OpenSSL, whose support was not enabled by
> default due to licensing issues (vpnc is under the GPL, which isn't
> compatible with the OpenSSL license).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
[--SNIP--]
> diff --git a/package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch b/package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch
> new file mode 100644
> index 0000000..5b6df68
> --- /dev/null
> +++ b/package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch
> @@ -0,0 +1,32 @@
> +From 7314d232f8e85879d8f4c311ced44ee5b21fb239 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Wed, 10 Feb 2016 23:26:27 +0100
> +Subject: [PATCH] Makefile: allow to override the PREFIX variable
> +
> +Some people may not want to install in /usr/local, so this commit
> +makes it possible to override the PREFIX variable from the make
> +command line.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> +Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6

There has been a comment to request the patches be mailed to the "real"
upstream, and the PR was closed.

[--SNIP--]
> diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
> index bc27331..caf8c20 100644
> --- a/package/vpnc/Config.in
> +++ b/package/vpnc/Config.in
> @@ -1,8 +1,10 @@
>  config BR2_PACKAGE_VPNC
>  	bool "vpnc"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR

Is it because of gnutls, or does vpnc requires it for itself?
If the former, you forgot the associated comment:

    depends on BR2_USE_WCHAR # gnutls

>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBGPG_ERROR
> +	select BR2_PACKAGE_GNUTLS
>  	help
>  	  Client for Cisco VPN concentrator
>  	  3000 Series VPN Concentrator
> @@ -11,3 +13,7 @@ config BR2_PACKAGE_VPNC
>  	  Juniper/Netscreen
>  
>  	  http://www.unix-ag.uni-kl.de/~massar/vpnc
> +
> +commit "vpnc needs a toolchain w/ wchar"

Nope, this is not a commit; this is a comment. ;-)

Regards,
Yann E. MORIN.

> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR
> diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
> index 3474057..c35f0d5 100644
> --- a/package/vpnc/vpnc.hash
> +++ b/package/vpnc/vpnc.hash
> @@ -1,2 +1,2 @@
>  # locally computed hash
> -sha256 925c8e879f78f1d575b69ee3868b886a0139926ea84c2138a89b9b7d8696f50a vpnc-70f1211f6f26e87e374d66f9a986e855215b8e3e.tar.gz
> +sha256 d71ae6a6c2801c6c21490227d29896ea75deade05fc38153de9ae07b25a6a60d  vpnc-024aa17a0a86716cac0db185b44bf07ba4f8c135.tar.gz
> diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
> index 5dfc2ba..62dedc6 100644
> --- a/package/vpnc/vpnc.mk
> +++ b/package/vpnc/vpnc.mk
> @@ -4,24 +4,23 @@
>  #
>  ################################################################################
>  
> -VPNC_VERSION = 70f1211f6f26e87e374d66f9a986e855215b8e3e
> +VPNC_VERSION = 024aa17a0a86716cac0db185b44bf07ba4f8c135
>  VPNC_SITE = $(call github,ndpgroup,vpnc,$(VPNC_VERSION))
>  VPNC_LICENSE = GPLv2+
>  VPNC_LICENSE_FILES = COPYING
>  
> -VPNC_DEPENDENCIES = libgcrypt libgpg-error
> -
> -VPNC_LDFLAGS = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
> -VPNC_CPPFLAGS = -DVERSION=\\\"$(VPNC_VERSION)\\\"
> +VPNC_DEPENDENCIES = libgcrypt libgpg-error gnutls host-pkgconf
>  
>  define VPNC_BUILD_CMDS
> -	$(MAKE)	-C $(@D) $(TARGET_CONFIGURE_OPTS) \
> -		CPPFLAGS="$(VPNC_CPPFLAGS)" LDFLAGS="$(VPNC_LDFLAGS)"
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> +		VERSION=$(VPNC_VERSION) MANS=
>  endef
>  
>  define VPNC_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) \
> -		CPPFLAGS="$(VPNC_CPPFLAGS)" LDFLAGS="$(VPNC_LDFLAGS)" \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) \
> +		VERSION=$(VPNC_VERSION) MANS= \
>  		DESTDIR="$(TARGET_DIR)" PREFIX=/usr
>  endef
>  
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
