From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:53:01 +0100
Subject: [Buildroot] [PATCH] ffmpeg: V1.0 configure ffmpeg with
 --enable-libfreetype if libfreetype package is enabled
In-Reply-To: <548262C1.7080000@ou.edu>
References: <548262C1.7080000@ou.edu>
Message-ID: <20141207215301.06e6dffb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

Thanks for your contribution! There are a few issues in your submission
though, so you'll see some comments below. If you could rework your
patch and send an updated version, it would be nice.

First, the title is a bit too long, and should not contain a version
number, so the title should be something like:

	ffmpeg: enable freetype support

On Fri, 05 Dec 2014 19:58:25 -0600, Steve Kenton wrote:
> [Buildroot][PATCH] ffmpeg: V1.0 configure ffmpeg with --enable-libfreetype if libfreetype package is enabled

There is no need to repeat the title in the commit log itself.

> I needed ffmpeg on the target configured using --enable-libfreetype and using "Additional parameters for ./configure" missed the dependency.
> Modeled on the blocks above and below it in ffmpeg.mk - let me know if the order is important and I need to move it somewhere else.

Please wrap the commit log to a reasonable length (~80 characters or
so). Also don't put some "personal" comments in the commit log. If you
have some personal comments to make, they must go after the "---" line
so that they don't get committed, only seen during review.

In terms of order, alphabetic ordering is usually preferred.

> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>
> 

This empty new line is not needed.

> ---
> diff -ru buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk buildroot-2014.11/package/ffmpeg/ffmpeg.mk
> --- buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk
> +++ buildroot-2014.11/package/ffmpeg/ffmpeg.mk
> @@ -50,7 +50,6 @@
>  	--disable-libopencv \
>  	--disable-libdc1394 \
>  	--disable-libfaac \
> -	--disable-libfreetype \
>  	--disable-libgsm \
>  	--disable-libmp3lame \
>  	--disable-libnut \
> @@ -229,6 +228,13 @@
>  FFMPEG_CONF_OPTS += --disable-libvpx
>  endif
> 
> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
> +FFMPEG_CONF_OPTS += --enable-libfreetype
> +FFMPEG_DEPENDENCIES += freetype
> +else
> +FFMPEG_CONF_OPTS += --disable-libfreetype
> +endif

This looks good, except that it fails to build with uClibc, because the
freetype support in ffmpeg uses "fenv", which isn't available on uClibc
except on x86 and x86-64:

CC	libavfilter/vf_drawtext.o
CC	libavfilter/vf_extractplanes.o
CC	libavfilter/vf_elbg.o
CC	libavfilter/vf_edgedetect.o
CC	libavfilter/vf_fade.o
libavfilter/vf_drawtext.c:40:18: fatal error: fenv.h: No such file or directory
 #include <fenv.h>

Generated with the following configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FREETYPE=y
# BR2_TARGET_ROOTFS_TAR is not set

So we would need to make sure the freetype support gets only enabled if
the toolchain does not use uClibc or if we're on x86 or x86-64. I'm
starting to wonder if we don't need a BR2_TOOLCHAIN_HAS_FENV knob,
because we have the same problem in the python-numpy package. Or at
least some ffmpeg sub-options to enable freetype support, which could
depend on the appropriate options.

Can you resend an updated version of your patch to fix those issues?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
