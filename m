From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:30:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/lrzip: Add new package lrzip
 (Long Range ZIP or LZMA RZIP)
In-Reply-To: <20190907185615.7800-1-sam@gpsm.co.uk>
References: <20190907185615.7800-1-sam@gpsm.co.uk>
Message-ID: <20190907213013.1575e477@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

Thanks for your contribution! I was about to apply after a few fixes,
but unfortunately this package doesn't build here, so a new iteration
of the patch will be needed.

On Sat,  7 Sep 2019 19:56:15 +0100
sam at gpsm.co.uk wrote:

> From: Sam Lancia <sam@gpsm.co.uk>
> 
> lrzip is a compression utility that excels at compressing
> large files (usually > 10-50 MB)
> 
> Signed-off-by: Sam Lancia <sam@gpsm.co.uk>

First, the commit title should be just:

	package/lrzip: new package

>  package/Config.in        |  1 +
>  package/lrzip/Config.in  | 22 ++++++++++++++++++++++
>  package/lrzip/lrzip.hash |  2 ++
>  package/lrzip/lrzip.mk   | 14 ++++++++++++++

Please add an entry with your name and this package in the DEVELOPERS
file, so that you get notified when there are build failures about this
package.

> diff --git a/package/Config.in b/package/Config.in
> index 9336261c5d..bb82de6ef1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -70,6 +70,7 @@ menu "Compressors and decompressors"
>  	source "package/lz4/Config.in"
>  	source "package/lzip/Config.in"
>  	source "package/lzop/Config.in"
> +        source "package/lrzip/Config.in"

Indentation in this file is with tabs, and you should respect the
alphabetic ordering. Note that "make check-package" would have told you
about the improper alphabetic ordering.

>  	source "package/p7zip/Config.in"
>  	source "package/pigz/Config.in"
>  	source "package/pixz/Config.in"
> diff --git a/package/lrzip/Config.in b/package/lrzip/Config.in
> new file mode 100644
> index 0000000000..e4badfc09d
> --- /dev/null
> +++ b/package/lrzip/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LRZIP
> +	bool "lrzip"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LZO
> +	select BR2_PACKAGE_BZIP2
> +	help
> +	  A compression utility that excels at compressing large files
> +	  (usually > 10-50 MB). Larger files and/or more free RAM means
> +	  that the utility will be able to more effectively compress
> +	  your files (ie: faster / smaller size), especially if the
> +	  filesize(s) exceed 100 MB. You can either choose to optimise
> +	  for speed (fast compression / decompression) or size,
> +	  but not both.
> +
> +	  https://github.com/ckolivas/lrzip
> +
> +comment "lrzip needs a toolchain w/ wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR

You forgot the thread dependency here.

> diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
> new file mode 100644
> index 0000000000..ebd658845d
> --- /dev/null
> +++ b/package/lrzip/lrzip.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 10315c20d5a47590e7220c210735ba169677824d5672509266682eccec84d952  lrzip-v0.631.tar.gz

You'll have to change the file name to lrzip-0.631.tar.gz, see below
why.

Also, please add the hash of the COPYING file.

> diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
> new file mode 100644
> index 0000000000..b3865f2682
> --- /dev/null
> +++ b/package/lrzip/lrzip.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# lrzip
> +#
> +################################################################################
> +
> +LRZIP_VERSION = v0.631

We want this to be:

LRZIP_VERSION = 0.631

> +LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))

and this to:

LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))

Indeed, we want the VERSION variable to really only contain the version
number, and not any prefix such as 'v'.

However, as said above, this package doesn't build with the following
defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LRZIP=y
# BR2_TARGET_ROOTFS_TAR is not set

It fails like this:

In file included from rzip.h:22:0,
                 from main.c:56:
lrzip_private.h:179:0: warning: "bswap_32" redefined
 #define bswap_32(x) \
 ^
In file included from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/endian.h:59:0,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/types.h:216,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/procfs.h:32,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:25,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:329,
                 from main.c:25:
/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:32:0: note: this is the location of the previous definition
 #define bswap_32(x) __bswap_32 (x)
 ^
In file included from rzip.h:22:0,
                 from main.c:56:
lrzip_private.h:183:0: warning: "bswap_64" redefined
 # define bswap_64(x) \
 ^
In file included from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/endian.h:59:0,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/types.h:216,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/procfs.h:32,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:25,
                 from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:329,
                 from main.c:25:
/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:36:0: note: this is the location of the previous definition
 # define bswap_64(x) __bswap_64 (x)
 ^
In file included from decompress_demo.c:26:0:
./Lrzip.h:135:137: error: unknown type name ?va_list?
 typedef void (*Lrzip_Log_Cb)(void *data, unsigned int level, unsigned int line, const char *file, const char *func, const char *format, va_list args);
                                                                                                                                         ^
./Lrzip.h:506:34: error: unknown type name ?Lrzip_Log_Cb?
 void lrzip_log_cb_set(Lrzip *lr, Lrzip_Log_Cb cb, void *log_data);
                                  ^
make[4]: *** [Makefile:791: decompress_demo.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [Makefile:937: all-recursive] Error 1
make[2]: *** [Makefile:541: all] Error 2
make[1]: *** [package/pkg-generic.mk:241: /home/thomas/projets/buildroot/output/build/lrzip-0.631/.stamp_built] Error 2

Could you test your package with the ./utils/test-pkg program ? It will
help you find the most common/obvious build failures about your new
package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
