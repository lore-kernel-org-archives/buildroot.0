From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 09:23:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/sdl2: Fix Raspberry Pi support
 for SDL2
In-Reply-To: <20180116033450.6926-1-g@maral.me>
References: <20180116033450.6926-1-g@maral.me>
Message-ID: <20180116092341.17c72427@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 19:34:49 -0800, Guillermo A. Amaral wrote:

> diff --git a/package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch b/package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch
> new file mode 100644
> index 000000000..1866579f1
> --- /dev/null
> +++ b/package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch
> @@ -0,0 +1,90 @@
> +From 76cb63afbe53c984c9734dc4f034c670791ca4d2 Mon Sep 17 00:00:00 2001
> +From: "Guillermo A. Amaral" <g@maral.me>
> +Date: Sun, 14 Jan 2018 23:01:47 -0800
> +Subject: [PATCH] sdl2: Get Raspberry Pi video working on Buildroot

It's not nice to have this specific to Buildroot. It shouldn't be that
way, and having it specific to Buildroot means that the patch cannot be
accepted upstream. See below for a suggestion on how to improve.

> + configure           |  8 +++++++-

Do you really need to patch the configure script? What about fixing
just configure.in, and using AUTORECONF = YES ?

> + configure.in        |  8 +++++++-
> + src/video/SDL_egl.c | 12 ++++++------
> + 3 files changed, 20 insertions(+), 8 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 5ac2130..daee88b 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1566,6 +1566,9 @@ AC_HELP_STRING([--enable-video-rpi], [use Raspberry Pi video driver [[default=ye
> +         if test x$ARCH = xnetbsd; then
> +             RPI_CFLAGS="-I/usr/pkg/include -I/usr/pkg/include/interface/vcos/pthreads -I/usr/pkg/include/interface/vmcs_host/linux"
> +             RPI_LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib -lbcm_host"
> ++        elif test x$VENDOR = xbuildroot; then
> ++            RPI_CFLAGS="-I${STAGING_DIR}/usr/include/interface/vcos/pthreads -I${STAGING_DIR}/usr/include/interface/vmcs_host/linux"
> ++            RPI_LDFLAGS="-L${STAGING_DIR}/usr/lib -lbcm_host -lvchostif"
> +         else
> +             RPI_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
> +             RPI_LDFLAGS="-L/opt/vc/lib -lbcm_host"

Here is a different suggestion. In the "else", do the following:

	AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
	if test x$PKG_CONFIG != xno && $PKG_CONFIG --exists bcm_host; then
		RPI_CFLAGS=`$PKG_CONFIG --cflags bcm_host`
		RPI_LDFLAGS=`$PKG_CONFIG --libs bcm_host`
	else
		RPI_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
		RPI_LDFLAGS="-L/opt/vc/lib -lbcm_host"
	fi

This should use pkg-config if available, and bcm_host is available as
pkg-config module, and if not default to the hardcoded path in /opt/vc.

> +@@ -3260,7 +3263,10 @@ case "$host" in
> +                     SUMMARY_video="${SUMMARY_video} android"
> +                 fi
> +                 ;;
> +-            *-*-linux*)         ARCH=linux ;;
> ++            *-*-linux*)
> ++                ARCH=linux
> ++                VENDOR=buildroot
> ++                ;;

It would make this change unneeded.

> + #if SDL_VIDEO_DRIVER_RPI
> + /* Raspbian places the OpenGL ES/EGL binaries in a non standard path */
> +-#define DEFAULT_EGL "/opt/vc/lib/libbrcmEGL.so"
> +-#define DEFAULT_OGL_ES2 "/opt/vc/lib/libbrcmGLESv2.so"
> +-#define ALT_EGL "/opt/vc/lib/libEGL.so"
> +-#define ALT_OGL_ES2 "/opt/vc/lib/libGLESv2.so"
> +-#define DEFAULT_OGL_ES_PVR "/opt/vc/lib/libGLES_CM.so"
> +-#define DEFAULT_OGL_ES "/opt/vc/lib/libGLESv1_CM.so"
> ++#define DEFAULT_EGL "libbrcmEGL.so"
> ++#define DEFAULT_OGL_ES2 "libbrcmGLESv2.so"
> ++#define ALT_EGL "libEGL.so"
> ++#define ALT_OGL_ES2 "libGLESv2.so"
> ++#define DEFAULT_OGL_ES_PVR "libGLES_CM.so"
> ++#define DEFAULT_OGL_ES "libGLESv1_CM.so"

I am not totally sure how to solve this though. I think the easiest
solution is for the configure script to fill in another variable, like
RPI_LIB_DIR. It would be set to empty in the pkg-config case, assuming
the libraries are in the right location, and set to /opt/vc/lib in the
hardcoded case. Or for the pkg-config case you do:

	RPI_LIB_DIR=`PKG_CONFIG_SYSROOT_DIR=/ $PKG_CONFIG --libs-only-L bcm_host | sed 's/^-L//'`

But I believe leaving it to empty is fine as well. Indeed dlopen()
automatically searches in the default library paths, and if the library
is not installed in the default location, it's up to the user to pass
LD_LIBRARY_PATH.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
