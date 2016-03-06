From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Mar 2016 09:52:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: Do not use -latomic with
	non-threaded toolchains
Message-ID: <1457254351-9933-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ec4/ec4e48c0e4b8fa72d8bb7ef4ad67a166699c0b62/

Gcc used by the defconfig was compiled with --disable-libatomic:

$ /home/bernd/buildroot/buildroot/output/host/usr/bin/arm-linux-gcc -v
[...]
Thread model: single
gcc version 4.9.3 (Buildroot 2015.11-rc1-00072-g4880195)

Configure fails due to

configure:3517: checking whether the C compiler works
configure:3539: /home/peko/autobuild/instance-2/output/host/usr/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DCAIRO_NO_MUTEX=1  conftest.c -latomic >&5
/home/peko/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -latomic

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cairo/cairo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6b54b28..d27a172 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -18,7 +18,7 @@ endif
 
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 CAIRO_CONF_ENV += LIBS="-latomic"
 endif
 
-- 
2.7.0
