From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Jan 2012 23:48:21 +0100
Subject: [Buildroot] [PATCH 06/14] libevas: Add new package
In-Reply-To: <CAFbHwiTPx=X_FuZ9=UnsYhUETaNCM-LPF=oA8QH-GQUyriNrUQ@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:33 +0000")
References: <CAFbHwiTPx=X_FuZ9=UnsYhUETaNCM-LPF=oA8QH-GQUyriNrUQ@mail.gmail.com>
Message-ID: <87bopnjvey.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks, committed with minor tweaks.

 Will> +comment "libevas backends"
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_BUFFER
 Will> +	bool "libevas buffer backend"
 Will> +	depends on BR2_PACKAGE_XORG7
 Will> +	help
 Will> +	  This enables the software buffer rendering engine. There is
 Will> +	  no hardware assist here.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_DIRECTFB
 Will> +	bool "libevas DirectFB backend"
 Will> +	depends on BR2_PACKAGE_DIRECTFB

It makes sense to enable this if directfb is enabled, so I added
         default y

 Will> +	help
 Will> +	  This is the DirectFB engine that uses the DirectFB library
 Will> +	  (http://www.directfb.org) on Linux to access the framebuffer
 Will> +	  with (or maybe without) acceleration.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_FB
 Will> +	bool "libevas frame buffer backend"
 Will> +	help
 Will> +	  This is the software framebuffer driving engine. this uses
 Will> +	  the linux framebuffer device (/dev/fb<x>) and will currently
 Will> +	  just inherit the current framebuffer settings on the fb
 Will> +	  device and use them to run in.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_SDL
 Will> +	bool "libevas SDL backend"
 Will> +	select BR2_PACKAGE_SDL
 Will> +	help
 Will> +	  This is the software SDL engine that uses SDL library
 Will> +	  (http://www.libsdl.org). This library should work on many
 Will> +	  operating systems.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_SDL_GL
 Will> +	bool "libevas SDL OpenGL backend"
 Will> +	select BR2_PACKAGE_SDL

This seems to only be supported by the X11 SDL backend, so I made it
depend on BR2_PACKAGE_SDL_X11



 Will> +comment "libevas code tuning"
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_DISABLE_C
 Will> +	bool "libevas disable C code"
 Will> +	depends on BR2_PACKAGE_LIBEVAS_MMX || BR2_PACKAGE_LIBEVAS_SSE ||
 Will> BR2_PACKAGE_LIBEVAS_SSE3
 Will> +	help
 Will> +	  This disables the generic C fallback code which is not required
 Will> +	  if MMX or SSE is used instead.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_MMX
 Will> +	bool "libevas MMX routines"
 Will> +	depends on BR2_i386 || BR2_x86_64
 Will> +	help
 Will> +	  This enables the MMX optimized routines. this works for
 Will> +	  Pentium, Pentium 2, Pentium 3, Pentium 4, Athlon and Duron
 Will> +	  processors.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_SSE
 Will> +	bool "libevas SSE routines"
 Will> +	depends on BR2_i386 || BR2_x86_64
 Will> +	help
 Will> +	  This enables SSE optimizations available in the Pentium 3 and
 Will> +	  4 cpus (not Athlon and Duron or Pentium 2 or Pentium cpus).
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_SSE3
 Will> +	bool "libevas SSE3 routines"
 Will> +	depends on BR2_i386 || BR2_x86_64
 Will> +	help
 Will> +	  This enables SSE3 optimizations available in the Pentium 4 and
 Will> +	  above cpus.
 Will> +
 Will> +config BR2_PACKAGE_LIBEVAS_ALTIVEC
 Will> +	bool "libevas altivec routines"
 Will> +	depends on BR2_powerpc
 Will> +	help
 Will> +	  This enables AltiVec optimizations available in soem PowerPC cpus.

s/soem/some/

All of this is bound to give problems with randconfig builds, so I
prefer autoselect these options depending on the CPU variant selected in
BR, similar to how we do it for ffmpeg.

-- 
Bye, Peter Korsgaard
