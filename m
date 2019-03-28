From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 29 Mar 2019 00:55:24 +0530
Subject: [Buildroot] [PATCH v2] package/unixbench: new package
Message-ID: <20190328192524.28352-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

UnixBench tries to compile its binaries regargless of them being
compiled or not. We patch it to disable this behaviour since
we may not always have a compiler onboard.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - fixed entry into DEVELOPERS files (suggested by Yann E. Morin)
  - added commit log to .patch file (suggested by Yann, Romain)
  - removed commented out lines (suggested by Yann, Romain)
  - UnixBench now depends on having a MMU and selects Perl for
    runtime (Suggested by Yann, Romain)
  - added hash for LICENSE file (suggested by Yann, Romain)
  - now makefile does not copy unnecessary directories onto target
    (suggested by Romain)

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 .../unixbench/0001-remove-make-check.patch    | 37 +++++++++++++++++
 package/unixbench/Config.in                   | 18 ++++++++
 package/unixbench/unixbench                   |  3 ++
 package/unixbench/unixbench.hash              |  3 ++
 package/unixbench/unixbench.mk                | 41 +++++++++++++++++++
 7 files changed, 106 insertions(+)
 create mode 100644 package/unixbench/0001-remove-make-check.patch
 create mode 100644 package/unixbench/Config.in
 create mode 100644 package/unixbench/unixbench
 create mode 100644 package/unixbench/unixbench.hash
 create mode 100644 package/unixbench/unixbench.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0a4814a86..f8b920d019 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -236,6 +236,9 @@ F:	package/luasec/
 F:	package/lua-ev/
 F:	package/orbit/
 
+N:	Atharva Lele <itsatharva@gmail.com>
+F:	package/unixbench/
+
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	package/qt5/qt5scxml/
 
diff --git a/package/Config.in b/package/Config.in
index b5321aeb49..521308c1d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -132,6 +132,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
+	source "package/unixbench/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
diff --git a/package/unixbench/0001-remove-make-check.patch b/package/unixbench/0001-remove-make-check.patch
new file mode 100644
index 0000000000..e8f5d683a1
--- /dev/null
+++ b/package/unixbench/0001-remove-make-check.patch
@@ -0,0 +1,37 @@
+From dc6b30c57a35aca7119d18f916dcd0a40c0fc047 Mon Sep 17 00:00:00 2001
+From: Atharva Lele <itsatharva@gmail.com>
+Date: Thu, 28 Mar 2019 22:58:16 +0530
+Subject: [PATCH] remove make check
+
+Our target board/system may not always have an oboard
+compiler. And, we already have the built binaries.
+
+Remove the make command from the Run script
+to avoid erroring out while executing the program.
+
+Signed-off-by: Atharva Lele <itsatharva@gmail.com>
+---
+ Run | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/UnixBench/Run b/UnixBench/Run
+index b4abd26..e86a08a 100755
+--- a/UnixBench/Run
++++ b/UnixBench/Run
+@@ -875,13 +875,6 @@ sub preChecks {
+ 
+     # Check that the required files are in the proper places.
+     my $make = $ENV{MAKE} || "make";
+-    system("$make check");
+-    if ($? != 0) {
+-        system("$make all");
+-        if ($? != 0) {
+-            abortRun("\"$make all\" failed");
+-        }
+-    }
+ 
+     # Create a script to kill this run.
+     system("echo \"kill -9 $$\" > \"${TMPDIR}/kill_run\"");
+-- 
+2.21.0
+
diff --git a/package/unixbench/Config.in b/package/unixbench/Config.in
new file mode 100644
index 0000000000..b2ba055bfb
--- /dev/null
+++ b/package/unixbench/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_UNIXBENCH
+	bool "unixbench"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_PERL # runtime
+	help
+	  UnixBench is the original BYTE UNIX benchmark suite,
+	  updated and revised by many people over the years.
+
+	  The purpose of UnixBench is to provide a basic indicator
+	  of the performance of a Unix-like system; hence multiple
+	  tests are used to test various aspects of the system's
+	  performance. These test results are then compared to the
+	  scores from a baseline system to produce an index value,
+	  which is easier to handle than raw scores. The entire set
+	  of index values is then combined to make an overall index
+	  for the system. Multi-CPU systems are supported.
+
+	  https://github.com/kdlucas/byte-unixbench
diff --git a/package/unixbench/unixbench b/package/unixbench/unixbench
new file mode 100644
index 0000000000..18863553a9
--- /dev/null
+++ b/package/unixbench/unixbench
@@ -0,0 +1,3 @@
+#!/bin/sh
+cd /usr/lib/unixbench
+exec ./Run "${@}"
diff --git a/package/unixbench/unixbench.hash b/package/unixbench/unixbench.hash
new file mode 100644
index 0000000000..fdc50b2627
--- /dev/null
+++ b/package/unixbench/unixbench.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256 1677dcdcbed78805848b3c3fd58a6d052b677b6a4ee7add4db74acc4d3364a79 unixbench-070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.txt
diff --git a/package/unixbench/unixbench.mk b/package/unixbench/unixbench.mk
new file mode 100644
index 0000000000..570ef6a75f
--- /dev/null
+++ b/package/unixbench/unixbench.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# unixbench
+#
+################################################################################
+
+# The latest updates to the git tree of UnixBench enable setting compiler flags
+# using make. They also fix various compiler warnings and update the makefile
+# structure. The tree hasn't been updated since early 2018, and the binaries
+# built from the latest commit have been stable.
+UNIXBENCH_VERSION = 070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a
+UNIXBENCH_SITE = $(call github,kdlucas,byte-unixbench,$(UNIXBENCH_VERSION))
+UNIXBENCH_LICENSE = GPL-2.0
+UNIXBENCH_LICENSE_FILE = LICENSE.txt
+
+# UnixBench tries to compile its binaries regargless of them being compiled
+# or not. The patch will disable that since we may not always have a compiler
+# onboard.
+
+# Auto detection would set CFLAGS for the host machine, using -march=native
+# and -mtune=native which does not make sense for cross compilation, resulting
+# in a failed compile. Setting UB_GCC_OPTIONS skips the detection process
+# and forces CFLAGS we're interested in.
+define UNIXBENCH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) \
+		-C $(@D)/UnixBench \
+		UB_GCC_OPTIONS="$(TARGET_CFLAGS)" \
+		CC="$(TARGET_CC)"
+endef
+
+# Copy the compiled files into the proper location and install the binary.
+# pgms stores binaries, results stores results, Run is the perl script to
+# run the benchmark.
+define UNIXBENCH_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/unixbench
+	cp -a $(@D)/UnixBench/{pgms,results,Run} $(TARGET_DIR)/usr/lib/unixbench/
+	$(INSTALL) -D -m 0755 $(UNIXBENCH_PKGDIR)/unixbench $(TARGET_DIR)/usr/bin/unixbench
+endef
+
+$(eval $(generic-package))
-- 
2.21.0
