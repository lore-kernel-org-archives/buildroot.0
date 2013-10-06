From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:07:39 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: bump version and other fixes
Message-ID: <20131006184759.A43429B92C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca3524ba707126de7284210c00268a8e7ca6379a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ltp-testsuite to the latest version available. In
addition to that, it also:

 * Removes the ltp-testsuite-disable-controllers.patch file, which
   becomes useless thanks to the workaround that consists in removing
   -D_FILE_OFFSET_BITS=64 from the CFLAGS. This is necessary because
   ltp-testsuite uses the non-largefile compatible <fts.h> interface.

 * Marks the package as not-available on AArch64, since it doesn't
   build properly. A bug has been submitted upstream to the Linaro
   people doing the AArch64 support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in                    |    7 +++-
 .../ltp-testsuite-disable-controllers.patch        |   29 --------------------
 package/ltp-testsuite/ltp-testsuite.mk             |   10 +++++-
 3 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 75b029f..3681eaf 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -7,6 +7,9 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# aarch64 build currently broken, reported at
+	# https://bugs.launchpad.net/linaro-aarch64/+bug/1236027
+	depends on !BR2_aarch64
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
@@ -20,5 +23,5 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://ltp.sourceforge.net/
 
 comment "ltp-testsuite requires a toolchain with IPV6, RPC and thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on (!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC) && !BR2_aarch64
diff --git a/package/ltp-testsuite/ltp-testsuite-disable-controllers.patch b/package/ltp-testsuite/ltp-testsuite-disable-controllers.patch
deleted file mode 100644
index 85ef262..0000000
--- a/package/ltp-testsuite/ltp-testsuite-disable-controllers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Disable controllers testcases.
-This fix is carried over from 20101031 version.
-
-The cpuset controllers testcases do not build due to bug
-https://sourceforge.net/tracker/?func=detail&aid=3126942&group_id=3382&atid=103382.
-Disabling just the cpuset controllers do not seem to be easily possible, and
-those controller features are rarely used on embedded systems anyway.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Jerin Jacob  <jerinjacobk@gmail.com>
----
- testcases/kernel/Makefile |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
-index 4b4800d..d6ab7b6 100644
---- a/testcases/kernel/Makefile
-+++ b/testcases/kernel/Makefile
-@@ -37,7 +37,6 @@ ifneq ($(UCLINUX),1)
- # KEEP THIS LIST ALPHABETIZED PLEASE!
- SUBDIRS			+= connectors \
- 			   containers \
--			   controllers \
- 			   fs \
- 			   hotplug \
- 			   io \
--- 
-1.7.6.5
-
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 16d1fe8..594fa18 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20130109
-LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
+LTP_TESTSUITE_VERSION = 20130904
+LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
@@ -17,4 +17,10 @@ else
 LTP_TESTSUITE_CONF_ENV += ac_cv_lib_cap_cap_compare=no
 endif
 
+# ltp-testsuite uses <fts.h>, which isn't compatible with largefile
+# support.
+LTP_TESTSUITE_CONF_ENV += \
+	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+
 $(eval $(autotools-package))
