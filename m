From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 20:02:35 +0100
Subject: [Buildroot] [PATCH 07/14] libecore: Add new package
In-Reply-To: <CAFbHwiSnt-EoeBa+Ke9ccdbQB7BxQbPbeGeiv5oUYAW7Ks5Sow@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:36 +0000")
References: <CAFbHwiSnt-EoeBa+Ke9ccdbQB7BxQbPbeGeiv5oUYAW7Ks5Sow@mail.gmail.com>
Message-ID: <874nvejpro.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed with minor tweaks (see below), thanks.

 Will> ---
 Will>  package/efl/Config.in            |    1 +
 Will>  package/efl/libecore/Config.in   |   36 ++++++++++++++++++++++
 Will>  package/efl/libecore/libecore.mk |   62 ++++++++++++++++++++++++++++++++++++++
 Will>  3 files changed, 99 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/efl/libecore/Config.in
 Will>  create mode 100644 package/efl/libecore/libecore.mk

 Will> diff --git a/package/efl/Config.in b/package/efl/Config.in
 Will> index 27d1f95..3007783 100644
 Will> --- a/package/efl/Config.in
 Will> +++ b/package/efl/Config.in
 Will> @@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_EFL
 Will>  if BR2_PACKAGE_EFL

 Will>  source "package/efl/libeina/Config.in"
 Will> +source "package/efl/libecore/Config.in"
 Will>  source "package/efl/libeet/Config.in"
 Will>  source "package/efl/libevas/Config.in"

 Will> diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
 Will> new file mode 100644
 Will> index 0000000..35c9966
 Will> --- /dev/null
 Will> +++ b/package/efl/libecore/Config.in
 Will> @@ -0,0 +1,36 @@
 Will> +config BR2_PACKAGE_LIBECORE
 Will> +	bool "libecore"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	help
 Will> +	  Ecore is the event/X abstraction layer that makes doing
 Will> +	  selections, Xdnd, general X stuff, event loops, timeouts and
 Will> +	  idle handlers fast, optimized, and convenient.

Missing upstream URL.


 Will> +
 Will> +if BR2_PACKAGE_LIBECORE
 Will> +
 Will> +config BR2_PACKAGE_LIBECORE_DIRECTFB
 Will> +	bool "libecore DirectFB support"
 Will> +	select BR2_PACKAGE_DIRECTFB

People with directfb enabled probably want to enable this as well, so it
makes sense to use default y.


 Will> +config BR2_PACKAGE_LIBECORE_FB
 Will> +	bool "libecore framebuffer support"
 Will> +
 Will> +config BR2_PACKAGE_LIBECORE_SDL
 Will> +	bool "libecore SDL support"
 Will> +	select BR2_PACKAGE_SDL
 Will> +
 Will> +config BR2_PACKAGE_LIBECORE_X
 Will> +	bool "libecore X support"
 Will> +	depends on BR2_PACKAGE_XORG7
 Will> +	select BR2_PACKAGE_XLIB_LIBXEXT

This should select libX11 as well.


 Will> +
 Will> +config BR2_PACKAGE_LIBECORE_X_XCB
 Will> +	bool "libecore XCB support"
 Will> +	depends on BR2_PACKAGE_LIBECORE_X
 Will> +	select BR2_PACKAGE_XCB_PROTO

This seems independent of LIBECORE_X. Looking at configure.ac it seems
it should select libxcb and xcb-util as well.


 Will> +
 Will> +config BR2_PACKAGE_LIBECORE_EVAS
 Will> +	bool "libecore Evas support"
 Will> +	select BR2_PACKAGE_LIBEVAS
 Will> +
 Will> +endif # BR2_PACKAGE_LIBECORE
 Will> diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
 Will> new file mode 100644
 Will> index 0000000..c2ebef4
 Will> --- /dev/null
 Will> +++ b/package/efl/libecore/libecore.mk
 Will> @@ -0,0 +1,62 @@
 Will> +#############################################################
 Will> +#
 Will> +# libecore
 Will> +#
 Will> +#############################################################
 Will> +
 Will> +LIBECORE_VERSION = 1.1.0
 Will> +LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
 Will> +LIBECORE_SITE = http://download.enlightenment.org/releases/
 Will> +LIBECORE_INSTALL_STAGING = YES
 Will> +
 Will> +LIBECORE_DEPENDENCIES = host-pkg-config libeina
 Will> +
 Will> +HOST_LIBECORE_DEPENDENCIES = host-pkg-config host-libeina host-libevas
 Will> +HOST_LIBECORE_CONF_OPT += --enable-ecore-evas
 Will> +
 Will> +# default options
 Will> +LIBECORE_CONF_OPT = --disable-simple-x11
 Will> +
 Will> +# libecore
 Will> +ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
 Will> +LIBECORE_CONF_OPT += --enable-ecore-directfb

You forgot to add directfb to _DEPENDENCIES

 Will> +else
 Will> +LIBECORE_CONF_OPT += --disable-ecore-directfb
 Will> +endif
 Will> +
 Will> +ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
 Will> +LIBECORE_CONF_OPT += --enable-ecore-fb
 Will> +else
 Will> +LIBECORE_CONF_OPT += --disable-ecore-fb
 Will> +endif
 Will> +
 Will> +ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
 Will> +LIBECORE_CONF_OPT += --enable-ecore-sdl

You forgot to add sdl to _DEPENDENCIES

 Will> +else
 Will> +LIBECORE_CONF_OPT += --disable-ecore-sdl
 Will> +endif
 Will> +
 Will> +ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
 Will> +LIBECORE_CONF_OPT += --enable-ecore-x
 Will> +LIBECORE_DEPENDENCIES += xlib_libXext

You missed xlib_libX11

 Will> +else
 Will> +LIBECORE_CONF_OPT += --disable-ecore-x
 Will> +endif
 Will> +
 Will> +ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
 Will> +LIBECORE_CONF_OPT += --enable-ecore-x-xcb
 Will> +LIBECORE_DEPENDENCIES += xcb-proto

xlib_libX11, libxcb and xcb-util are needed as well. Upstream is broken
for cross compilation as it builds src/util/makekeys for the target, and
then tries to run it to generate a header file, so we need a workaround
similar to how we do it for libX11.

 Will> +else
 Will> +LIBECORE_CONF_OPT += --disable-ecore-x-xcb
 Will> +endif
 Will> +
 Will> +# libecore-evas
 Will> +ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
 Will> +LIBECORE_CONF_OPT += --enable-ecore-evas
 Will> +LIBECORE_DEPENDENCIES += libevas
 Will> +else
 Will> +LIBECORE_CONF_OPT += --disable-ecore-evas
 Will> +endif
 Will> +
 Will> +$(eval $(call AUTOTARGETS))
 Will> +$(eval $(call AUTOTARGETS,host))
 Will> -- 
 Will> 1.7.1

 Will> _______________________________________________
 Will> buildroot mailing list
 Will> buildroot at busybox.net
 Will> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
