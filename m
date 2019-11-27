From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2019 10:19:09 +0100
Subject: [Buildroot] [PATCH-NEXT] package/webrtc-audio-processing: bump to
 version 0.3.1
Message-ID: <20191127091910.2977-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0001-configure.ac-fix-architecture-detection.patch as it is now
upstream.  Aarch64 is now supported, so update _ARCH_SUPPORTS to match.

Add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...etection-of-cxxabi.h-and-execinfo.h.patch} |  0
 ...figure.ac-fix-architecture-detection.patch | 84 -------------------
 package/webrtc-audio-processing/Config.in     |  2 +-
 .../webrtc-audio-processing.hash              |  3 +-
 .../webrtc-audio-processing.mk                |  5 +-
 5 files changed, 5 insertions(+), 89 deletions(-)
 rename package/webrtc-audio-processing/{0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch => 0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch} (100%)
 delete mode 100644 package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch

diff --git a/package/webrtc-audio-processing/0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch b/package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
similarity index 100%
rename from package/webrtc-audio-processing/0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
rename to package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
diff --git a/package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch b/package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch
deleted file mode 100644
index d0ea4bd6bd..0000000000
--- a/package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 233413841882608c6d5b98b6ce89fcb8a292db82 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 6 Aug 2016 10:22:34 +0200
-Subject: [PATCH] configure.ac: fix architecture detection
-
-The current architecture detection, based on the "host_cpu" part of the
-tuple does not work properly for a number of reason:
-
- - The code assumes that if host_cpu starts with "arm" then ARM
-   instructions are available, which is incorrect. Indeed, Cortex-M
-   platforms can run Linux, they are ARM platforms (so host_cpu = arm),
-   but they don't support ARM instructions: they support only the
-   Thumb-2 instruction set.
-
- - The armv7 case is also not very useful, as it is not standard at all
-   to pass armv7 as host_cpu even if the host system is actually ARMv7
-   based.
-
- - For the same reason, the armv8 case is not very useful: armv8 is
-   never used as the host_cpu part of a tuple.
-
-So, this commit moves away from a host_cpu based logic, and instead
-tests using AC_CHECK_DECLS() the built-in definitions of the compiler:
-
- - If we have __ARM_ARCH_ISA_ARM defined, then it's an ARM processor
-   that supports the ARM instruction set (this allows to exclude Thumb-2
-   only processors).
-
- - If we have __ARM_ARCH_7A__, then we have an ARMv7-A processor, and
-   we can enable the corresponding optimizations
-
- - Same for __i386__ and __x86_64__.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Submitted upstream, under a slightly different form so that it applies
-on master:
-
-  https://lists.freedesktop.org/archives/pulseaudio-discuss/2016-August/026600.html
----
- configure.ac | 27 +++++++++------------------
- 1 file changed, 9 insertions(+), 18 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6f9553b..836c6ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,24 +55,15 @@ AS_CASE(["${host}"],
- )
- AC_SUBST(PLATFORM_CFLAGS)
- 
--AS_CASE(["${host_cpu}"],
--    [i?86|x86_64],
--        [
--         HAVE_X86=1
--        ],
--    [armv7*|armv8*],
--        [
--         HAVE_ARM=1
--         HAVE_ARMV7=1
--         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7"
--        ],
--    [arm*],
--        [
--         HAVE_ARM=1
--         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
--        ]
--    # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
--)
-+# Testing __ARM_ARCH_ISA_ARM since the code contains ARM instructions,
-+# which don't work on Thumb-2 only platforms (ARMv7-M).
-+AC_CHECK_DECLS([__ARM_ARCH_ISA_ARM],
-+	[HAVE_ARM=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM"])
-+AC_CHECK_DECLS([__ARM_ARCH_7A__],
-+	[HAVE_ARMV7=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM_V7"])
-+AC_CHECK_DECLS([__i386__], [HAVE_X86=1])
-+AC_CHECK_DECLS([__x86_64__], [HAVE_X86=1])
-+
- AM_CONDITIONAL(HAVE_X86, [test "x${HAVE_X86}" = "x1"])
- AM_CONDITIONAL(HAVE_ARM, [test "x${HAVE_ARM}" = "x1"])
- AM_CONDITIONAL(HAVE_ARMV7, [test "x${HAVE_ARMV7}" = "x1"])
--- 
-2.7.4
-
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 02715b080a..64138269b5 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_i386 || BR2_x86_64
+	default y if BR2_aarch64 || BR2_arm || BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.hash b/package/webrtc-audio-processing/webrtc-audio-processing.hash
index fe07119160..1376054f20 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.hash
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	756e291d4f557d88cd50c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa  webrtc-audio-processing-0.3.tar.xz
+sha256	a0fdd938fd85272d67e81572c5a4d9e200a0c104753cb3c209ded175ce3c5dbf  webrtc-audio-processing-0.3.1.tar.xz
+sha256	9b79539028e216e813e152d45f5c1ed5fdd0554426ad50270fb03134e7082dac  COPYING
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 668e20d730..7edeaf961f 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-WEBRTC_AUDIO_PROCESSING_VERSION = 0.3
+WEBRTC_AUDIO_PROCESSING_VERSION = 0.3.1
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
 WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3-Clause
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
-# 0001-configure.ac-fix-architecture-detection.patch
-# 0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
+# 0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
 WEBRTC_AUDIO_PROCESSING_AUTORECONF = YES
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-- 
2.20.1
