From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Aug 2016 12:02:44 +0200
Subject: [Buildroot] [PATCH 1/2] webrtc-audio-processing: fix build on ARM
	Cortex-M
Message-ID: <1470477765-9014-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The webrtc-audio-processing configure script assumes that if the
host_cpu part of the tuple is "arm", then ARM instructions are
available. This is obviously incorrect for ARM Cortex-M platforms, which
only support the Thumb-2 instruction set.

In order to address this, we add a patch,
0001-configure.ac-fix-architecture-detection.patch, which changes how
webrtc-audio-processing detects the architecture: instead of relying on
the host_cpu part of the tuple, it relies on the built-in definitions of
the compiler.

Not only it fixes the Cortex-M detection, but it also enables ARMv7
optimizations on ARMv7-A: until now they were only enabled when the
host_cpu part of the tuple was armv7, which is never the case in
Buildroot.

However, once this issue is fixed for Cortex-M, the build nonetheless
fails later due to the usage of NPTL-only functions. So we change the
thread dependency to a NPTL dependency.

Fixes:

  http://autobuild.buildroot.net/results/4933082cd7cc5781404c77ccef5c2b9333c5f714/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-configure.ac-fix-architecture-detection.patch | 84 ++++++++++++++++++++++
 package/webrtc-audio-processing/Config.in          |  7 +-
 .../webrtc-audio-processing.mk                     |  2 +
 3 files changed, 90 insertions(+), 3 deletions(-)
 create mode 100644 package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch

diff --git a/package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch b/package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch
new file mode 100644
index 0000000..d0ea4bd
--- /dev/null
+++ b/package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch
@@ -0,0 +1,84 @@
+From 233413841882608c6d5b98b6ce89fcb8a292db82 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 6 Aug 2016 10:22:34 +0200
+Subject: [PATCH] configure.ac: fix architecture detection
+
+The current architecture detection, based on the "host_cpu" part of the
+tuple does not work properly for a number of reason:
+
+ - The code assumes that if host_cpu starts with "arm" then ARM
+   instructions are available, which is incorrect. Indeed, Cortex-M
+   platforms can run Linux, they are ARM platforms (so host_cpu = arm),
+   but they don't support ARM instructions: they support only the
+   Thumb-2 instruction set.
+
+ - The armv7 case is also not very useful, as it is not standard at all
+   to pass armv7 as host_cpu even if the host system is actually ARMv7
+   based.
+
+ - For the same reason, the armv8 case is not very useful: armv8 is
+   never used as the host_cpu part of a tuple.
+
+So, this commit moves away from a host_cpu based logic, and instead
+tests using AC_CHECK_DECLS() the built-in definitions of the compiler:
+
+ - If we have __ARM_ARCH_ISA_ARM defined, then it's an ARM processor
+   that supports the ARM instruction set (this allows to exclude Thumb-2
+   only processors).
+
+ - If we have __ARM_ARCH_7A__, then we have an ARMv7-A processor, and
+   we can enable the corresponding optimizations
+
+ - Same for __i386__ and __x86_64__.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream, under a slightly different form so that it applies
+on master:
+
+  https://lists.freedesktop.org/archives/pulseaudio-discuss/2016-August/026600.html
+---
+ configure.ac | 27 +++++++++------------------
+ 1 file changed, 9 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6f9553b..836c6ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,24 +55,15 @@ AS_CASE(["${host}"],
+ )
+ AC_SUBST(PLATFORM_CFLAGS)
+ 
+-AS_CASE(["${host_cpu}"],
+-    [i?86|x86_64],
+-        [
+-         HAVE_X86=1
+-        ],
+-    [armv7*|armv8*],
+-        [
+-         HAVE_ARM=1
+-         HAVE_ARMV7=1
+-         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7"
+-        ],
+-    [arm*],
+-        [
+-         HAVE_ARM=1
+-         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
+-        ]
+-    # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
+-)
++# Testing __ARM_ARCH_ISA_ARM since the code contains ARM instructions,
++# which don't work on Thumb-2 only platforms (ARMv7-M).
++AC_CHECK_DECLS([__ARM_ARCH_ISA_ARM],
++	[HAVE_ARM=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM"])
++AC_CHECK_DECLS([__ARM_ARCH_7A__],
++	[HAVE_ARMV7=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM_V7"])
++AC_CHECK_DECLS([__i386__], [HAVE_X86=1])
++AC_CHECK_DECLS([__x86_64__], [HAVE_X86=1])
++
+ AM_CONDITIONAL(HAVE_X86, [test "x${HAVE_X86}" = "x1"])
+ AM_CONDITIONAL(HAVE_ARM, [test "x${HAVE_ARM}" = "x1"])
+ AM_CONDITIONAL(HAVE_ARMV7, [test "x${HAVE_ARMV7}" = "x1"])
+-- 
+2.7.4
+
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 7c69903..79a06d8 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -3,14 +3,15 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  AudioProcessing library based on Google's implementation of
 	  WebRTC.
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, gcc >= 4.8"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 587f1aa..5a5d1ce 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -10,6 +10,8 @@ WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3c
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
+# 0001-configure.ac-fix-architecture-detection.patch
+WEBRTC_AUDIO_PROCESSING_AUTORECONF = YES
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 WEBRTC_AUDIO_PROCESSING_CONF_OPTS += --with-ns-mode=fixed
-- 
2.7.4
