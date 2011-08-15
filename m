From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 15 Aug 2011 15:38:07 +0200
Subject: [Buildroot] [PATCH] package: add Fluxbox 1.3.1 window manager
In-Reply-To: <20110803192301.4d5c4462@gmail.com>
References: <20110803192301.4d5c4462@gmail.com>
Message-ID: <4E49213F.2040401@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 03.08.2011 19:23, schrieb Frederic Bassaler:
> Here is (hopefully!) a proper patch
> 
> (added signed-off line, fixed indentation and removed unnecessary lines
> following Thomas' recommandations)
> 
> 
> 
>>From 1f853bce53f86ff849cfd5af1f927a79dd1b25be Mon Sep 17 00:00:00 2001
> From: Frederic Bassaler <frederic.bassaler@gmail.com>
> Date: Wed, 3 Aug 2011 19:06:50 +0200
> Subject: [PATCH] package: add Fluxbox 1.3.1 window manager
> 
> Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
> ---
>  package/Config.in          |    1 +
>  package/fluxbox/Config.in  |   13 +++++++++++++
>  package/fluxbox/fluxbox.mk |   20 ++++++++++++++++++++
>  3 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 package/fluxbox/Config.in
>  create mode 100644 package/fluxbox/fluxbox.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7112e05..c4cecfa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -127,6 +127,7 @@ comment "X Window managers"
>  source "package/matchbox/Config.in"
>  source "package/metacity/Config.in"
>  source "package/blackbox/Config.in"
> +source "package/fluxbox/Config.in"
>  
>  comment "X applications"
>  source "package/alsamixergui/Config.in"
> diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
> new file mode 100644
> index 0000000..854f2a1
> --- /dev/null
> +++ b/package/fluxbox/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_FLUXBOX
> +	bool "fluxbox"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  The Fluxbox lightweight window manager for X
> +
> +	  http://fluxbox.org
> +
> +comment "fluxbox requires a toolchain with C++ support enabled"
> +	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
> new file mode 100644
> index 0000000..864cf07
> --- /dev/null
> +++ b/package/fluxbox/fluxbox.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# FLUXBOX
> +#
> +#############################################################
> +
> +FLUXBOX_VERSION=1.3.1
> +FLUXBOX_SOURCE=fluxbox-$(FLUXBOX_VERSION).tar.bz2
> +FLUXBOX_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
> +
> +FLUXBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
> +		--x-libraries=$(STAGING_DIR)/usr/lib
> +
> +FLUXBOX_DEPENDENCIES = xlib_libX11
> +
> +ifneq ($(BR2_ENABLE_LOCALE),y)
> +FLUXBOX_DEPENDENCIES += libiconv
> +endif
> +
> +$(eval $(call AUTOTARGETS,package,fluxbox))

I've tried the patch and after installing xdm I can start the window manager. What is basic buildroot configuration to get keboard and mouse working?

Yegor 
