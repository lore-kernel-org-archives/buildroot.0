From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:26:11 +0200
Subject: [Buildroot] [git commit] package/wavpack: Fix iconv support
Message-ID: <20151017142700.4151881D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aec1ea344632e9283f33acdf91d70a750c0caf53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wavpack fails to link with libiconv

/bin/bash ../libtool  --tag=CC   --mode=link /home/bernd/buildroot/br3/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc  -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os    -o wvunpack wvunpack-wvunpack.o wvunpack-utils.o wvunpack-md5.o  ../src/.libs/libwavpack.la -lm
libtool: link: /home/bernd/buildroot/br3/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o wvunpack wvunpack-wvunpack.o wvunpack-utils.o wvunpack-md5.o  ../src/.libs/libwavpack.so -lm -Wl,-rpath -Wl,/home/bernd/buildroot/br3/output/build/wavpack-4.75.2/src/.libs
/home/bernd/buildroot/br3/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.9.3/../../../../i586-buildroot-linux-uclibc/bin/ld: wvunpack-wvunpack.o: undefined reference to symbol 'libiconv_open'

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_WAVPACK=y

Patch suggested by Peter:
http://lists.busybox.net/pipermail/buildroot/2014-February/090596.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wavpack/wavpack.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 02184e3..ae16454 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -12,6 +12,10 @@ WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3c
 WAVPACK_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+WAVPACK_CONF_OPTS += LIBS=-liconv
+endif
+
 # WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
 # for ARM is written for ARMv7 only and building WavPack for an ARM-non-v7
 # architecture will fail. We explicitly enable ASM for the supported
