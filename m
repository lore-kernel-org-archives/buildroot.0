From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 22:59:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150726225918.5773dfda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Sun, 26 Jul 2015 18:35:11 +0100, Brendan Heading wrote:
> exfat-utils build would not build on Linux unless __GLIBC__ was defined.
> Reworked header file to relax this requirement in favour of other libcs.
> patch submitted to the exfat-utils mailing list for comment.
> 
> Also added missing dependency - exfat requires libfuse.

The libfuse dependency seems to be unrelated to the musl problem, so it
should be a separate patch.

Also, I just did a build of exfat-utils which libfuse, and it built
just fine, so I think you're wrong with the fact that it needs libfuse.
Here is the defconfig I've used:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_EXFAT_UTILS=y
# BR2_TARGET_ROOTFS_TAR is not set

And the list of steps that were done:

>>> skeleton undefined Extracting
>>> skeleton undefined Patching
>>> skeleton undefined Configuring
>>> skeleton undefined Building
>>> skeleton undefined Installing to target
>>> toolchain-external undefined Extracting
>>> toolchain-external undefined Patching
>>> toolchain-external undefined Configuring
>>> toolchain-external undefined Building
>>> toolchain-external undefined Installing to staging directory
>>> toolchain-external undefined Copying external toolchain sysroot to staging...
>>> toolchain-external undefined Building ext-toolchain wrapper
>>> toolchain-external undefined Fixing libtool files
>>> toolchain-external undefined Installing to target
>>> toolchain-external undefined Copying external toolchain libraries to target...
>>> toolchain virtual Extracting
>>> toolchain virtual Patching
>>> toolchain virtual Configuring
>>> toolchain virtual Building
>>> toolchain virtual Installing to target
>>> host-m4 1.4.17 Extracting
>>> host-m4 1.4.17 Patching
>>> host-m4 1.4.17 Updating config.sub and config.guess
>>> host-m4 1.4.17 Patching libtool
>>> host-m4 1.4.17 Configuring
>>> host-m4 1.4.17 Building
>>> host-m4 1.4.17 Installing to host directory
>>> host-libtool 2.4.6 Extracting
>>> host-libtool 2.4.6 Patching
>>> host-libtool 2.4.6 Updating config.sub and config.guess
>>> host-libtool 2.4.6 Configuring
>>> host-libtool 2.4.6 Building
>>> host-libtool 2.4.6 Installing to host directory
>>> host-autoconf 2.69 Extracting
>>> host-autoconf 2.69 Patching
>>> host-autoconf 2.69 Updating config.sub and config.guess
>>> host-autoconf 2.69 Patching libtool
>>> host-autoconf 2.69 Configuring
>>> host-autoconf 2.69 Building
>>> host-autoconf 2.69 Installing to host directory
>>> host-automake 1.15 Extracting
>>> host-automake 1.15 Patching
>>> host-automake 1.15 Updating config.sub and config.guess
>>> host-automake 1.15 Patching libtool
>>> host-automake 1.15 Configuring
>>> host-automake 1.15 Building
>>> host-automake 1.15 Installing to host directory
>>> host-pkgconf 0.8.9 Extracting
>>> host-pkgconf 0.8.9 Patching
>>> host-pkgconf 0.8.9 Updating config.sub and config.guess
>>> host-pkgconf 0.8.9 Patching libtool
>>> host-pkgconf 0.8.9 Configuring
>>> host-pkgconf 0.8.9 Building
>>> host-pkgconf 0.8.9 Installing to host directory
>>> host-expat 2.1.0 Extracting
>>> host-expat 2.1.0 Patching
>>> host-expat 2.1.0 Updating config.sub and config.guess
>>> host-expat 2.1.0 Patching libtool
>>> host-expat 2.1.0 Configuring
>>> host-expat 2.1.0 Building
>>> host-expat 2.1.0 Installing to host directory
>>> host-zlib 1.2.8 Extracting
>>> host-zlib 1.2.8 Patching
>>> host-zlib 1.2.8 Configuring
>>> host-zlib 1.2.8 Building
>>> host-zlib 1.2.8 Installing to host directory
>>> host-python 2.7.10 Extracting
>>> host-python 2.7.10 Patching
>>> host-python 2.7.10 Updating config.sub and config.guess
>>> host-python 2.7.10 Configuring
>>> host-python 2.7.10 Autoreconfiguring
>>> host-python 2.7.10 Building
>>> host-python 2.7.10 Installing to host directory
>>> host-scons 2.3.0 Extracting
>>> host-scons 2.3.0 Patching
>>> host-scons 2.3.0 Configuring
>>> host-scons 2.3.0 Building
>>> host-scons 2.3.0 Installing to host directory
>>> exfat-utils 1.1.1 Downloading
>>> exfat-utils 1.1.1 Extracting
>>> exfat-utils 1.1.1 Patching
>>> exfat-utils 1.1.1 Configuring
>>> exfat-utils 1.1.1 Building
>>> exfat-utils 1.1.1 Installing to target
>>>   Finalizing target directory

As you can see, no libfuse anywhere, and still it built fine. The
SConstruct indeed does:

program('fuse/*.c', 'fuse/mount.exfat-fuse', 'mount.exfat', [libs + [libfuse]])

but I don't see any fuse/ subdirectory in the exfat-utils sources. Am I
missing something?

> diff --git a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
> new file mode 100644
> index 0000000..90740fa
> --- /dev/null
> +++ b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
> @@ -0,0 +1,53 @@
> +[PATCH] fix compilation when libc does not define __GLIBC__
> +
> +libexfat would only compile on Linux with __GLIBC__ defined. Changed
> +the logic around to use standard defaults on Linux which will work
> +for glibc/uclibc/musl.
> +
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +---
> + platform.h |   23 ++++++++++-------------
> + 1 file changed, 10 insertions(+), 13 deletions(-)
> +
> +Index: libexfat/libexfat/platform.h
> +===================================================================
> +--- libexfat/libexfat/platform.h	(revision 422)
> ++++ libexfat/libexfat/platform.h	(working copy)
> +@@ -24,19 +24,8 @@
> + #ifndef PLATFORM_H_INCLUDED
> + #define PLATFORM_H_INCLUDED
> + 
> +-#if defined(__GLIBC__)
> ++#if defined(__APPLE__)
> + 
> +-#include <endian.h>
> +-#include <byteswap.h>
> +-#define exfat_bswap16(x) bswap_16(x)
> +-#define exfat_bswap32(x) bswap_32(x)
> +-#define exfat_bswap64(x) bswap_64(x)
> +-#define EXFAT_BYTE_ORDER __BYTE_ORDER
> +-#define EXFAT_LITTLE_ENDIAN __LITTLE_ENDIAN
> +-#define EXFAT_BIG_ENDIAN __BIG_ENDIAN
> +-
> +-#elif defined(__APPLE__)
> +-
> + #include <machine/endian.h>
> + #include <libkern/OSByteOrder.h>
> + #define exfat_bswap16(x) OSSwapInt16(x)
> +@@ -57,7 +46,15 @@
> + #define EXFAT_BIG_ENDIAN _BIG_ENDIAN
> + 
> + #else 
> +-#error Unknown platform
> ++/* Assume Linux. glibc, uclibc(ng) and musl all provide bswap_X functions. */

Rather than doing this, just change:

#if defined(__GLIBC__)

by

#if defined(__linux__)

It will be a much simpler change (one-liner).

In the mean time, I'll mark your patch as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
