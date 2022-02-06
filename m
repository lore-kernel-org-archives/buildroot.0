Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 13:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4B29400C1;
	Sun,  6 Feb 2022 13:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YB4U3pjya6y8; Sun,  6 Feb 2022 13:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA4840201;
	Sun,  6 Feb 2022 13:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9268D1BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A38340272
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEVhidCESrdv for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 13:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB08B400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 13:55:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5168982BC7; Sun,  6 Feb 2022 13:47:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 14:53:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edd57e0db8d5adbce36692400889373e67f6f7a6
X-Git-Newrev: 76b5cb700410878e52f9366428402b8b6b4fcf86
X-Patchwork-Hint: ignore
Message-Id: <20220206134759.5168982BC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenh264: bump to version 2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76b5cb700410878e52f9366428402b8b6b4fcf86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/cisco/openh264/releases/tag/v2.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Add-USE_STACK_PROTECTOR-option.patch      | 100 ---------------------
 package/libopenh264/0002-fix-mips-build.patch      |  73 ---------------
 ...common-inc-asmdefs_mmi.h-fix-mips32-build.patch |  89 ------------------
 package/libopenh264/libopenh264.hash               |   2 +-
 package/libopenh264/libopenh264.mk                 |   2 +-
 5 files changed, 2 insertions(+), 264 deletions(-)

diff --git a/package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch b/package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch
deleted file mode 100644
index 3758cd668b..0000000000
--- a/package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 1e7435751c055723b7103dd1d5bb68530e1a2678 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 8 Oct 2019 20:18:18 +0200
-Subject: [PATCH] Add USE_STACK_PROTECTOR option
-
--fstack-protector-all is not supported on all linux toolchains so add an
-option to disable it (and enable it by default to keep current behavior)
-
-Fixes:
- - http://autobuild.buildroot.org/results/377818cf8c1f2632cabdccb32bf4e7f06c0fdbbd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cisco/openh264/pull/3175]
----
- Makefile                  | 1 +
- build/platform-android.mk | 5 ++++-
- build/platform-bsd.mk     | 5 ++++-
- build/platform-darwin.mk  | 5 ++++-
- build/platform-linux.mk   | 5 ++++-
- 5 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 74ff029d..c2061f6a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -34,6 +34,7 @@ GTEST_VER=release-1.8.1
- CCASFLAGS=$(CFLAGS)
- STATIC_LDFLAGS=-lstdc++
- STRIP ?= strip
-+USE_STACK_PROTECTOR = Yes
- 
- SHAREDLIB_MAJORVERSION=5
- FULL_VERSION := 2.0.0
-diff --git a/build/platform-android.mk b/build/platform-android.mk
-index 6f6ce347..06534301 100644
---- a/build/platform-android.mk
-+++ b/build/platform-android.mk
-@@ -44,7 +44,10 @@ SYSROOT = $(NDKROOT)/platforms/android-$(NDKLEVEL)/arch-$(ARCH)
- CXX = $(TOOLCHAINPREFIX)g++
- CC = $(TOOLCHAINPREFIX)gcc
- AR = $(TOOLCHAINPREFIX)ar
--CFLAGS += -DANDROID_NDK -fpic --sysroot=$(SYSROOT) -MMD -MP -fstack-protector-all
-+CFLAGS += -DANDROID_NDK -fpic --sysroot=$(SYSROOT) -MMD -MP
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS +=-fstack-protector-all
-+endif
- CFLAGS += -isystem $(NDKROOT)/sysroot/usr/include -isystem $(NDKROOT)/sysroot/usr/include/$(TOOLCHAIN_NAME) -D__ANDROID_API__=$(NDKLEVEL)
- CXXFLAGS += -fno-rtti -fno-exceptions
- LDFLAGS += --sysroot=$(SYSROOT)
-diff --git a/build/platform-bsd.mk b/build/platform-bsd.mk
-index e60d2cc0..2e0bf2cc 100644
---- a/build/platform-bsd.mk
-+++ b/build/platform-bsd.mk
-@@ -3,7 +3,10 @@ SHAREDLIBSUFFIX = so
- SHAREDLIBSUFFIXFULLVER=$(SHAREDLIBSUFFIX).$(FULL_VERSION)
- SHAREDLIBSUFFIXMAJORVER=$(SHAREDLIBSUFFIX).$(SHAREDLIB_MAJORVERSION)
- SHLDFLAGS = -Wl,-soname,$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
--CFLAGS += -fPIC -fstack-protector-all
-+CFLAGS += -fPIC
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS += -fstack-protector-all
-+endif
- LDFLAGS += -lpthread
- STATIC_LDFLAGS += -lpthread -lm
- ifeq ($(ASM_ARCH), x86)
-diff --git a/build/platform-darwin.mk b/build/platform-darwin.mk
-index 6c7b2443..718c8e2f 100644
---- a/build/platform-darwin.mk
-+++ b/build/platform-darwin.mk
-@@ -10,7 +10,10 @@ SHLDFLAGS = -dynamiclib -twolevel_namespace -undefined dynamic_lookup \
- 	$(SHAREDLIB_DIR)/$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
- SHARED = -dynamiclib
- SHARED += -current_version $(CURRENT_VERSION) -compatibility_version $(COMPATIBILITY_VERSION)
--CFLAGS += -Wall -fPIC -MMD -MP -fstack-protector-all
-+CFLAGS += -Wall -fPIC -MMD -MP
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS += -fstack-protector-all
-+endif
- ifeq ($(ASM_ARCH), x86)
- ASMFLAGS += -DPREFIX
- ifeq ($(ARCH), x86_64)
-diff --git a/build/platform-linux.mk b/build/platform-linux.mk
-index 44fe2424..b5c006b2 100644
---- a/build/platform-linux.mk
-+++ b/build/platform-linux.mk
-@@ -3,7 +3,10 @@ SHAREDLIBSUFFIX = so
- SHAREDLIBSUFFIXFULLVER=$(SHAREDLIBSUFFIX).$(FULL_VERSION)
- SHAREDLIBSUFFIXMAJORVER=$(SHAREDLIBSUFFIX).$(SHAREDLIB_MAJORVERSION)
- SHLDFLAGS = -Wl,-soname,$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
--CFLAGS += -Wall -fno-strict-aliasing -fPIC -MMD -MP -fstack-protector-all
-+CFLAGS += -Wall -fno-strict-aliasing -fPIC -MMD -MP
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS += -fstack-protector-all
-+endif
- LDFLAGS += -lpthread
- STATIC_LDFLAGS += -lpthread -lm
- AR_OPTS = crD $@
--- 
-2.23.0
-
diff --git a/package/libopenh264/0002-fix-mips-build.patch b/package/libopenh264/0002-fix-mips-build.patch
deleted file mode 100644
index c4927d567b..0000000000
--- a/package/libopenh264/0002-fix-mips-build.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9d5981eecde2133b9d6099eb99f96b1c29c3e520 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 13 Apr 2020 12:03:01 +0200
-Subject: [PATCH] fix mips build
-
-In total three PR were sent upstream to fix mips builds:
-https://github.com/cisco/openh264/pull/3185
-https://github.com/cisco/openh264/pull/3217
-https://github.com/cisco/openh264/pull/3225
-
-Buildroot used the first version
-https://git.buildroot.net/buildroot/commit/package/libopenh264?id=e8d0df569e1844f7ba28918a53ee38027b325b8f
-downloaded from https://github.com/cisco/openh264/pull/3185
-
-During discussion the gcc option '-march=loongson3a' was changed to
-'-Wa,-mloongson-mmi,-mloongson-ext':
-https://github.com/cisco/openh264/pull/3185#discussion_r337818960
-
-This causes build errors with gcc version 8.3.0 (Buildroot 2020.02)
-
-tmp/cctgEQaw.s:662: Error: opcode not supported on this processor: loongson3a (mips64r2) `bc .L22'
-/tmp/cctgEQaw.s:1679: Error: opcode not supported on this processor: loongson3a (mips64r2) `bc .L27'
-/tmp/cctgEQaw.s:2218: Error: opcode not supported on this processor: loongson3a (mips64r2) `jrc $31'
-
-This patch partly reverts the change to fix mips build.
-
-$ /home/bernd/buildroot/br5/output/host/bin/mips64el-linux-gcc -v
-
-Using built-in specs.
-COLLECT_GCC=/home/bernd/buildroot/br5/output/host/opt/ext-toolchain/bin/mips64el-linux-gcc.br_real
-COLLECT_LTO_WRAPPER=/home/bernd/buildroot/br5/output/host/opt/ext-toolchain/bin/../libexec/gcc/mips64el-buildroot-linux-gnu/8.3.0/lto-wrapper
-Target: mips64el-buildroot-linux-gnu
-Configured with: ./configure --prefix=/opt/br-mips64r6-n64-el-hf-2020.02 --sysconfdir=/opt/br-mips64r6-n64-el-hf-2020.02/etc --enable-static --target=mips64el-buildroot-linux-gnu --with-sysroot=/opt/br-mips64r6-n64-el-hf-2020.02/mips64el-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --with-gmp=/opt/br-mips64r6-n64-el-hf-2020.02 --with-mpc=/opt/br-mips64r6-n64-el-hf-2020.02 --with-mpfr=/opt/br-mips64r6-n64-el-hf-2020.02 --with-pkgversion='Buildroot 2020.02' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --enable-tls --enable-threads --without-isl --without-cloog --with-arch=mips64r6 --with-abi=64 --with-nan=2008 --enable-languages=c,c++ --with-build-time-tools=/opt/br-mips64r6-n64-el-hf-2020.02/mips64el-buildroot-linux-gnu/bin --enable-shared --disable-libgomp
-Thread model: posix
-gcc version 8.3.0 (Buildroot 2020.02)
-
-Patch sent upstream: https://github.com/cisco/openh264/pull/3267
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- build/arch.mk            | 2 +-
- build/mips-simd-check.sh | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/build/arch.mk b/build/arch.mk
-index 1bf318ab..c6570ed4 100644
---- a/build/arch.mk
-+++ b/build/arch.mk
-@@ -41,7 +41,7 @@ ASMFLAGS += -I$(SRC_PATH)codec/common/mips/
- ifeq ($(ENABLE_MMI), Yes)
- ENABLE_MMI = $(shell $(SRC_PATH)build/mips-simd-check.sh $(CC) mmi)
- ifeq ($(ENABLE_MMI), Yes)
--CFLAGS += -DHAVE_MMI -Wa,-mloongson-mmi,-mloongson-ext
-+CFLAGS += -DHAVE_MMI -march=loongson3a
- endif
- endif
- #msa
-diff --git a/build/mips-simd-check.sh b/build/mips-simd-check.sh
-index 5efffbef..d0d72f9e 100755
---- a/build/mips-simd-check.sh
-+++ b/build/mips-simd-check.sh
-@@ -15,7 +15,7 @@ TMPO=$(mktemp tmp.XXXXXX.o)
- if [ $2 == "mmi" ]
- then
-    echo "void main(void){ __asm__ volatile(\"punpcklhw \$f0, \$f0, \$f0\"); }" > $TMPC
--   $1 -Wa,-mloongson-mmi $TMPC -o $TMPO &> /dev/null
-+   $1 -march=loongson3a $TMPC -o $TMPO &> /dev/null
-    if test -s $TMPO
-    then
-       echo "Yes"
--- 
-2.25.0
-
diff --git a/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch b/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch
deleted file mode 100644
index e11b1d13ef..0000000000
--- a/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From c505f81e336088b6729a5407a03459f488353288 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 24 May 2021 22:54:01 +0200
-Subject: [PATCH] codec/common/inc/asmdefs_mmi.h: fix mips32 build
-
-Fix the following build failure on mips32 which is raised since version
-2.0.0 and
-https://github.com/cisco/openh264/commit/b13e5bceb18ebb93d0313b46aab4af6f480ca933:
-
-codec/common/mips/copy_mb_mmi.c: In function 'WelsCopy16x16_mmi':
-./codec/common/inc/asmdefs_mmi.h:293:21: error: '_ABI64' undeclared (first use in this function)
-  293 |    if (_MIPS_SIM == _ABI64)                                    \
-      |                     ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cba3e9d0fd061cc3a92cb732bcdc2c7b66dbf6cb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cisco/openh264/pull/3384]
----
- codec/common/inc/asmdefs_mmi.h | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/codec/common/inc/asmdefs_mmi.h b/codec/common/inc/asmdefs_mmi.h
-index 69a7ae39..5d1aed93 100644
---- a/codec/common/inc/asmdefs_mmi.h
-+++ b/codec/common/inc/asmdefs_mmi.h
-@@ -288,9 +288,9 @@
- /**
-  * backup register
-  */
-+#if defined(_ABI64) && _MIPS_SIM == _ABI64
- #define BACKUP_REG \
-    double __attribute__((aligned(16))) __back_temp[8];         \
--   if (_MIPS_SIM == _ABI64)                                    \
-    __asm__ volatile (                                          \
-      "gssqc1       $f25,      $f24,       0x00(%[temp])  \n\t" \
-      "gssqc1       $f27,      $f26,       0x10(%[temp])  \n\t" \
-@@ -299,8 +299,10 @@
-      :                                                         \
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
--   );                                                          \
--  else                                                         \
-+   );
-+#else
-+#define BACKUP_REG \
-+   double __attribute__((aligned(16))) __back_temp[8];         \
-    __asm__ volatile (                                          \
-      "gssqc1       $f22,      $f20,       0x00(%[temp])  \n\t" \
-      "gssqc1       $f26,      $f24,       0x10(%[temp])  \n\t" \
-@@ -309,12 +311,13 @@
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
-    );
-+#endif
- 
- /**
-  * recover register
-  */
-+#if defined(_ABI64) && _MIPS_SIM == _ABI64
- #define RECOVER_REG \
--   if (_MIPS_SIM == _ABI64)                                    \
-    __asm__ volatile (                                          \
-      "gslqc1       $f25,      $f24,       0x00(%[temp])  \n\t" \
-      "gslqc1       $f27,      $f26,       0x10(%[temp])  \n\t" \
-@@ -323,8 +326,9 @@
-      :                                                         \
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
--   );                                                          \
--   else                                                        \
-+   );
-+#else
-+#define RECOVER_REG \
-    __asm__ volatile (                                          \
-      "gslqc1       $f22,      $f20,       0x00(%[temp])  \n\t" \
-      "gslqc1       $f26,      $f24,       0x10(%[temp])  \n\t" \
-@@ -333,6 +337,7 @@
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
-    );
-+#endif
- 
- # define OK             1
- # define NOTOK          0
--- 
-2.30.2
-
diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 0689ab961f..712425a024 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  af173e90fce65f80722fa894e1af0d6b07572292e76de7b65273df4c0a8be678  libopenh264-2.1.1.tar.gz
+sha256  e4e5c8ba48e64ba6ce61e8b6e2b76b2d870c74c270147649082feabb40f25905  libopenh264-2.2.0.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 0c17579979..ea41f72661 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.1.1
+LIBOPENH264_VERSION = 2.2.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
