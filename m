From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2011 20:44:12 +0200
Subject: [Buildroot] [PATCH] Adding Fluxbox window manager
In-Reply-To: <20110802191004.66ae3ee3@gmail.com>
References: <20110802191004.66ae3ee3@gmail.com>
Message-ID: <20110802204412.4be907e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 2 Aug 2011 19:10:04 +0200,
Frederic Bassaler <frederic.bassaler@gmail.com> a ?crit :

> Hope this is ok, sorry I'm a git-newbie
> 
> (if it's not good, can somebody tell me the proper git commands?
> thanks)

This should be a proper patch description, as it will end up in the
commit log. You must also add a Signed-off-by line.

> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_FLUXBOX
> +	bool "fluxbox"
> +        depends on BR2_PACKAGE_XORG7
> +        depends on BR2_INSTALL_LIBSTDCPP
> +        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +        select BR2_PACKAGE_XLIB_LIBX11
> +  	help
> +	  The Fluxbox lightweight window manager for X
> +
> +	  http://fluxbox.org
> +
> +comment "fluxbox requires a toolchain with C++ support enabled"
> +        depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP

"bool", "depends on", "select" must be prefixed by a tab, not spaces.
The help text must be indented with one tab + 2 spaces.

> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
> new file mode 100644
> index 0000000..726a133
> --- /dev/null
> +++ b/package/fluxbox/fluxbox.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# FLUXBOX
> +#
> +#############################################################
> +
> +FLUXBOX_VERSION:=1.3.1
> +FLUXBOX_SOURCE:=fluxbox-$(FLUXBOX_VERSION).tar.bz2
> +FLUXBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/

Please use = instead of :=.

> +FLUXBOX_AUTORECONF:=NO
> +FLUXBOX_INSTALL_STAGING:=NO
> +FLUXBOX_INSTALL_TARGET:=YES

Not needed, those are the default values.

> +FLUXBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
> +		--x-libraries=$(STAGING_DIR)/usr/lib
> +
> +FLUXBOX_DEPENDENCIES = xlib_libX11

This doesn't really match the dependencies expressed in the Config.in
file, but it's true that our dependencies on X.org stuff are a bit
broken today (all client applications depend on the server, which is
not correct from a build point of view).

For the time being, I guess this will be fine, until we find the time
to clean up those dependencies.

> +ifneq ($(BR2_ENABLE_LOCALE),y)
> +FLUXBOX_DEPENDENCIES += libiconv
> +endif
> +
> +$(eval $(call AUTOTARGETS,package,fluxbox))

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
