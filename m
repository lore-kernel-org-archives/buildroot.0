From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Nov 2016 19:18:50 +0100
Subject: [Buildroot] [PATCH] libmpeg2: add patch to fix build on ARMv7-M
Message-ID: <1478369930-10514-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to libmpeg2 that improves the ARM detection
to not use the optimized ARM code on ARMv7-M architectures.

Fixes:

  http://autobuild.buildroot.net/results/9c44de035ce81c6cc8a92ea8bad4def25cd99cd0

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmpeg2/0003-fix-arm-detection.patch | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libmpeg2/0003-fix-arm-detection.patch

diff --git a/package/libmpeg2/0003-fix-arm-detection.patch b/package/libmpeg2/0003-fix-arm-detection.patch
new file mode 100644
index 0000000..69ec454
--- /dev/null
+++ b/package/libmpeg2/0003-fix-arm-detection.patch
@@ -0,0 +1,39 @@
+Improve the ARM detection to work on Thumb-only architecture
+
+The ARM-specific assembly code doesn't build on Thumb-only
+architectures such as ARMv7-M, but the configure script assumes that
+if the host tuple is arm*, then it can build and use the ARM optimized
+code.
+
+This patch improves the configure.ac detection logic, by building one
+of the instruction of the optimized assembly code, and using this to
+decide whether or not the optimizations should be enabled.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,8 +101,10 @@
+     alpha*)
+ 	AC_DEFINE([ARCH_ALPHA],,[alpha architecture]);;
+     arm*)
+-	arm_conditional=:
+-	AC_DEFINE([ARCH_ARM],,[ARM architecture]);;
++	AC_TRY_LINK([], [asm(".syntax divided\nstmfd sp!,{r4-r11,lr}")],
++	     [AC_DEFINE([ARCH_ARM],,[ARM architecture])
++	      use_arm_optimization=yes],
++	     [use_arm_optimization=no])
+     esac
+ elif test x"$CC" = x"tendracc"; then
+     dnl TenDRA portability checking compiler
+@@ -122,7 +124,7 @@
+     esac
+ fi
+ 
+-AM_CONDITIONAL(ARCH_ARM, ${arm_conditional})
++AM_CONDITIONAL(ARCH_ARM, test "${use_arm_optimization}" = "yes")
+ 
+ dnl Checks for libtool - this must be done after we set cflags
+ AC_LIBTOOL_WIN32_DLL
-- 
2.7.4
