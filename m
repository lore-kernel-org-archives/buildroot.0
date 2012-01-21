From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 02:44:08 +0100
Subject: [Buildroot] [PATCH 4/7] libecore: Add new package.
In-Reply-To: <CAFbHwiSB2HaSTBAwYPxZczj8t2+FfySNtbroM_wijRnn9WkyDg@mail.gmail.com>
References: <CAFbHwiSB2HaSTBAwYPxZczj8t2+FfySNtbroM_wijRnn9WkyDg@mail.gmail.com>
Message-ID: <201201210244.08837.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 12:17:30 Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
> new file mode 100644
> index 0000000..fd4da93
> --- /dev/null
> +++ b/package/efl/libecore/Config.in
> @@ -0,0 +1,81 @@
> +config BR2_PACKAGE_LIBECORE
> +	bool "libecore"
> +	select BR2_PACKAGE_LIBEINA
> +	help
> +	  Ecore is the event/X abstraction layer that makes doing
> +	  selections, Xdnd, general X stuff, event loops, timeouts and
> +	  idle handlers fast, optimized, and convenient.
> +
> +if BR2_PACKAGE_LIBECORE
> +
> +config BR2_PACKAGE_LIBECORE_DIRECTFB
> +	bool "libecore directfb support"
> +	depends on BR2_PACKAGE_DIRECTFB
 You could add a 'default y' (which will only apply if directfb is 
selected).  But I'm not sure if that's a good idea.

> +
> +config BR2_PACKAGE_LIBECORE_FB
> +	bool "libecore framebuffer support"
 Don't add default y here!

> +
> +config BR2_PACKAGE_LIBECORE_SDL
> +	bool "libecore sdl support"
> +	depends on BR2_PACKAGE_SDL
> +
> +config BR2_PACKAGE_LIBECORE_X
> +	bool "libecore x support"
> +	depends on BR2_PACKAGE_X11R7
> +
> +config BR2_PACKAGE_LIBECORE_EVAS
> +	bool "libecore evas support"
> +	select BR2_PACKAGE_EVAS
> +
> +if BR2_PACKAGE_LIBECORE_EVAS
> +
> +config BR2_PACKAGE_LIBECORE_EVAS_BUFFER
> +	bool "libecore evas software buffer support"
> +	select BR2_PACKAGE_LIBEVAS
 Redundant select: already selected by LIBECORE_EVAS.  But you probably
meant 'select BR2_PACKAGE_LIBEVAS_BUFFER', in which case you should add
the dependency on BR2_PACKAGE_XORG7.  Or maybe it should depend on
BR2_PACKAGE_LIBECORE_X?

> +config BR2_PACKAGE_LIBECORE_EVAS_X11
> +	bool "libecore evas x11 support"
> +	depends on BR2_PACKAGE_X11R7
 BR2_PACKAGE_X11R7 doesn't exist...

 Since there's a big group of similar dependencies here, I would wrap them
in an 'if BR2_PACKAGE_XORG7' instead of adding individual 'depends on'.

 This probably misses a select BR2_PACKAGE_LIBEVAS_X11.  And more like that
in the following options.

 I wonder though...  Won't the libecore configure script find out automatically
which evas backends are supported, and enable just those?  Then it's sufficient
to select the backends in libevas.

[snip]
> diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
> new file mode 100644
> index 0000000..acd7fa3
> --- /dev/null
> +++ b/package/efl/libecore/libecore.mk
> @@ -0,0 +1,124 @@
> +#############################################################
> +#
> +# libecore
> +#
> +#############################################################
> +
> +LIBECORE_VERSION = 1.1.0
> +LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
> +LIBECORE_SITE = http://download.enlightenment.org/releases/
> +LIBECORE_INSTALL_STAGING = YES
> +LIBECORE_INSTALL_TARGET = YES
 _INSTALL_TARGET already defaults to YES.

[snip]
> +ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_XCB),y)
> +#LIBECORE_CONF_OPT += --enable-ecore-evas-software-xcb
> +LIBECORE_CONF_OPT += --enable-ecore-x-xcb
> +LIBECORE_DEPENDENCIES += xcb-proto
> +else
> +#LIBECORE_CONF_OPT += --disable-ecore-evas-software-xcb
> +LIBECORE_CONF_OPT += --disable-ecore-x-xcb
> +endif
 Don't leave those commented-out lines in the patch.  Or if there is a good
reason for it, add a FIXME comment to explain it.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
