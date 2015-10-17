From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Oct 2015 14:28:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/wavpack: Fix iconv support
Message-ID: <1445084909-17569-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/wavpack/wavpack.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
2.6.1
