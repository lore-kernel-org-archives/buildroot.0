From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Jul 2012 12:01:25 +0200
Subject: [Buildroot] [PATCH] mediastreamer: fix build with libX11 and
	sdl without x11 support
In-Reply-To: <20120723115637.36b5b8cc@skate> (Thomas Petazzoni's message of
 "Mon, 23 Jul 2012 11:56:37 +0200")
References: <1343036959-7639-1-git-send-email-jacmet@sunsite.dk>
 <20120723115637.36b5b8cc@skate>
Message-ID: <87k3xupzii.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 23 Jul 2012 11:49:19 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 >> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 >> +# mediastreamer assumes SDL has X11 support if --enable-x11 (and X11 support
 >> +# is only used for SDL output)
 >> +ifeq ($(BR2_PACKAGE_SDL_X11),y)
 >> MEDIASTREAMER_CONF_OPT += --enable-x11
 >> -MEDIASTREAMER_DEPENDENCIES += xlib_libX11
 >> else
 >> MEDIASTREAMER_CONF_OPT += --disable-x11
 >> endif

 Thomas> So this means that it is not possible to use mediastreamer on X11
 Thomas> without SDL?

Indeed. The Xlib support is only used for the SDL videoouput:

grep -rls HAVE_X11_XLIB_H mediastreamer-2.8.2
mediastreamer-2.8.2/configure
mediastreamer-2.8.2/mediastreamer-config.h.in
mediastreamer-2.8.2/src/videoout.c
mediastreamer-2.8.2/mediastreamer-config.h
mediastreamer-2.8.2/tests/test_x11window.c

Where videoout.c is:

grep -B1 -A1 videoout mediastreamer-2.8.2/src/Makefile.am
if BUILD_SDL
libmediastreamer_la_SOURCES+=videoout.c
endif

 Thomas> I understand that when SDL support is enabled, it wants SDL to support
 Thomas> X11. But when X11 is enabled, does it requires SDL ?

It does (and ffmpeg). The option should probably have been called
--enable-sdl-x11 instead.

-- 
Bye, Peter Korsgaard
