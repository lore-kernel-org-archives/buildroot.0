From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 02:27:51 +0100
Subject: [Buildroot] [PATCH 3/7] libevas: Add new package.
In-Reply-To: <CAFbHwiR1j6z42ZfV+htJ8pYjzf-i1pxmqBBAkHP_XfYMf+tfMQ@mail.gmail.com>
References: <CAFbHwiR1j6z42ZfV+htJ8pYjzf-i1pxmqBBAkHP_XfYMf+tfMQ@mail.gmail.com>
Message-ID: <201201210227.52231.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 12:15:31 Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +config BR2_PACKAGE_LIBEVAS_SDL
> +	bool "libevas sdl backend"
 I would expect a select BR2_PACKAGE_SDL here.

> +	help
> +	  This is the sdl engine that uses sdl library
> +	  (http://www.libsdl.org). This library should work on many
> +	  operating system.
[snip]
> +comment "libevas code tunning"
 tuning, not tunning

 I would expect the following to be a choice rather than a set of bools.
Or can you sensibly compile libevas with no code?

> +
> +config BR2_PACKAGE_LIBEVAS_C
> +	bool "libevas c code"
 This probably needs a 'default y'.

> +	help
> +	  This enabled the c code. you can actually build the code
> +	  without the c fallback code and only have the mmx routines
> +	  for example.
> +
> +config BR2_PACKAGE_LIBEVAS_MMX
> +	bool "libevas mmx routines"
> +	depends on BR2_i386 || BR2_x86_64
 These dependencies could be a bit more accurate.  You can find in 'man gcc'
 which architectures support MMX.  I guess something like this should work:
depends on (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_i686 && !BR2_x86_pentiumpro) || BR2_x86_64

> +	help
> +	  This enables the mmx optimised routines. this works for
> +	  pentium, pentium2, pentium3, pentium4, athlon and duron
> +	  processors.
> +
> +config BR2_PACKAGE_LIBEVAS_SSE
> +	bool "libevas sse routines"
> +	depends on BR2_i386 || BR2_x86_64
 Same remark, but here you should find out of it is SSE, SSE2, SSE3, or 
SSSE3 is required.

> +	help
> +	  This enables sse optimizations availbale in he pentium3 and
> +	  4 cpus (not athlon and duron or pentium 2 or pentium cpu's).
> +
[snip]
> diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
> new file mode 100644
> index 0000000..7bea475
> --- /dev/null
> +++ b/package/efl/libevas/libevas.mk
> @@ -0,0 +1,165 @@
> +#############################################################
> +#
> +# libevas
> +#
> +#############################################################
> +
> +LIBEVAS_VERSION = 1.1.0
> +LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
> +LIBEVAS_SITE = http://download.enlightenment.org/releases/
> +LIBEVAS_INSTALL_STAGING = YES
> +LIBEVAS_INSTALL_TARGET = YES
 _INSTALL_TARGET already defaults to YES.

> +LIBEVAS_DEPENDENCIES = host-pkg-config zlib libeina freetype
> +
> +LIBEVAS_CONF_OPT =
 _CONF_OPT defaults to empty.  It's OK to immediately assign using +=.

[snip]
> +ifeq ($(BR2_PACKAGE_LIBEVAS_GL_X11),y)
> +
> +LIBEVAS_CONF_OPT += --enable-gl-x11
> +LIBEVAS_DEPENDENCIES += xserver_xorg-server
 This doesn't correspond to the dependency in Config.in.

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
