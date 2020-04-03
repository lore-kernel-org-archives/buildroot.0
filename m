From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  3 Apr 2020 21:45:35 +0200
Subject: [Buildroot] [PATCH v1] package/libnss: fix compile failure
Message-ID: <20200403194535.3063-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix neon related compile failure
(tested with rpi3 configuration).

Fixes:
  http://autobuild.buildroot.net/results/ebfa6bfabfe98fddbc1590c4d5d8038f3eb8992c
  http://autobuild.buildroot.net/results/7626a9f4d604b3657b88a4a6da4db3a8eb810059
  http://autobuild.buildroot.net/results/2625066922fb83db42ad4ddbc26bdf0b3ef09cb1
  http://autobuild.buildroot.net/results/c4b3a4a6d39773c2faa8595f64f1ce747971f5a0

  .../host/bin/arm-linux-gnueabihf-gcc -o Linux2.6_arm_arm-linux-gnueabihf-gcc_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o -c -std=c99 -g -fPIC   -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR -DLINUX -Dlinux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -Wshadow -DNSS_NO_GCC48 -DXP_UNIX -DSHLIB_SUFFIX=\"so\" -DSHLIB_PREFIX=\"lib\" -DSHLIB_VERSION=\"3\" -DSOFTOKEN_SHLIB_VERSION=\"3\" -DRIJNDAEL_INCLUDE_TABLES -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -D_REENTRANT -DNSS_NO_INIT_SUPPORT -DNSS_DISABLE_ALTIVEC -DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT -DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES -DFREEBL_NO_DEPEND -DFREEBL_LOWHASH -DUSE_HW_AES -DMP_ASSEMBLY_MULTIPLY -DMP_ASSEMBLY_SQUARE  -DMP_USE_UINT_DIGIT -DSHA_NO_LONG_LONG  -DKRML_VERIFIED_UINT128 -DMP_API_COMPATIBLE -I.../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/nspr -I.../build/libnss-3.51/dist/include -I../../../dist/public/nss -I../../../dist/private/nss -Impi -Iecl -Iverified -Iverified/kremlin/include -Iverified/kremlin/kremlib/dist/minimal  -march=armv7 -mfpu=neon gcm-arm32-neon.c
  cc1: error: target CPU does not support ARM mode

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...t-force-ARMv7-for-gcm-arm32-neon-r-j.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch

diff --git a/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch b/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
new file mode 100644
index 0000000000..64cc18c8c3
--- /dev/null
+++ b/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
@@ -0,0 +1,30 @@
+From 63d548663871e0157a4513a661b4a721002192e6 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 1 Apr 2020 09:41:08 -0700
+Subject: [PATCH] Bug 1624864 - Don't force ARMv7 for gcm-arm32-neon r=jcj
+
+--HG--
+extra : rebase_source : e046bbe45276b8cdf686c4f61006aff08865f1c0
+
+[Upstream: https://github.com/nss-dev/nss/commit/ab8d2425728f37b1f21dbff712daf4a767c82149]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ nss/lib/freebl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 2802fdf..eedebd3 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -773,7 +773,7 @@ ifeq ($(CPU_ARCH),arm)
+ USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
+ $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
+ ifndef NSS_DISABLE_GCM_ARM32_NEON
+-$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
++$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
+ endif
+ endif
+ ifeq ($(CPU_ARCH),aarch64)
+-- 
+2.26.0
+
-- 
2.26.0
