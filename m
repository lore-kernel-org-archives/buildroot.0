From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 22:48:03 +0100
Subject: [Buildroot] [git commit] package/ply: new package
Message-ID: <20210123213645.6CA17814EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=544fcc772f7381033bbea341e0c11fe5fcf996b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ply is a light-weight dynamic tracer for Linux. By means of using the
BPF it can attach probes to the linux kernel (e. g. kprobes).

It's a small alternative to LLVM based tracers for embedded systems.

Project page:
https://github.com/wkz/ply/releases

Documentation can be found here:
https://wkz.github.io/ply/

Tested with beaglebone_defconfig (uClibc-ng as well as glibc)

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 ...onfigure.ac-fix-error-with-version-string.patch | 29 ++++++++++++++++++++++
 .../0002-printxf.h-add-stdarg.h-in-include.patch   | 27 ++++++++++++++++++++
 package/ply/Config.in                              | 23 +++++++++++++++++
 package/ply/ply.hash                               |  3 +++
 package/ply/ply.mk                                 | 14 +++++++++++
 7 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f815259d2d..687a9400e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -131,6 +131,9 @@ F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
 
+N:	Andreas Klinger <ak@it-klinger.de>
+F:	package/ply/
+
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-backports-shutil-get-terminal-size/
 F:	package/python-decorator/
diff --git a/package/Config.in b/package/Config.in
index fb1312b21f..f42cc01032 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -125,6 +125,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/pax-utils/Config.in"
 	source "package/pcm-tools/Config.in"
 	source "package/piglit/Config.in"
+	source "package/ply/Config.in"
 	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
diff --git a/package/ply/0001-configure.ac-fix-error-with-version-string.patch b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
new file mode 100644
index 0000000000..e80599c649
--- /dev/null
+++ b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
@@ -0,0 +1,29 @@
+From 684bae6043fa2242a5c6551c3f260c9db0cf7dc8 Mon Sep 17 00:00:00 2001
+From: Andreas Klinger <ak@it-klinger.de>
+Date: Mon, 4 Jan 2021 08:40:50 +0100
+Subject: [PATCH] configure.ac: fix error with version string
+
+When autoreconfiguring there's an error: "configure.ac:6: error: AC_INIT
+should be called with package and version arguments".
+
+Put version string in square brackets to satisfy autoconfigure.
+
+Signed-off-by: Andreas Klinger <ak@it-klinger.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 65387d6..7a0054e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+ AC_PREREQ(2.61)
+-AC_INIT(ply, m4_esyscmd_s(git describe --always --dirty),
++AC_INIT(ply, [2.1.1],
+ 	     https://github.com/wkz/ply/issues)
+ 
+ AC_GNU_SOURCE
+-- 
+2.20.1
+
diff --git a/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch b/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
new file mode 100644
index 0000000000..f56e9a8e72
--- /dev/null
+++ b/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
@@ -0,0 +1,27 @@
+From 3fb3cb779c535ec28cbba80573bbea42435108c0 Mon Sep 17 00:00:00 2001
+From: Andreas Klinger <ak@it-klinger.de>
+Date: Mon, 4 Jan 2021 20:48:41 +0100
+Subject: [PATCH] printxf.h: add stdarg.h in include
+
+Include of <stdarg.h> is needed for va_list.
+
+Signed-off-by: Andreas Klinger <ak@it-klinger.de>
+---
+ include/ply/printxf.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/ply/printxf.h b/include/ply/printxf.h
+index a59f0d2..e985936 100644
+--- a/include/ply/printxf.h
++++ b/include/ply/printxf.h
+@@ -8,6 +8,7 @@
+ #define _PRINTXF_H
+ 
+ #include <stdio.h>
++#include <stdarg.h>
+ 
+ struct printxf;
+ 
+-- 
+2.20.1
+
diff --git a/package/ply/Config.in b/package/ply/Config.in
new file mode 100644
index 0000000000..aa03d03858
--- /dev/null
+++ b/package/ply/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PLY_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_powerpc
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_PLY
+	bool "ply"
+	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 # BPF_FUNC_get_stackid
+	help
+	  ply is a light-weight dynamic tracer for Linux. By means of
+	  using the BPF it can attach probes to the linux kernel
+	  (e. g. kprobes).
+
+	  It's a small alternative to LLVM based tracers for embedded
+	  systems.
+
+	  When using debugfs needs to be mounted on /sys/kernel/debug.
+
+	  https://wkz.github.io/ply/
diff --git a/package/ply/ply.hash b/package/ply/ply.hash
new file mode 100644
index 0000000000..0ee2709b30
--- /dev/null
+++ b/package/ply/ply.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  cecf0913c65027750ac3272e936110c9f843435938f9ca2edbc34e99ba6c00e2  ply-2.1.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ply/ply.mk b/package/ply/ply.mk
new file mode 100644
index 0000000000..0e4141f650
--- /dev/null
+++ b/package/ply/ply.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# ply
+#
+################################################################################
+
+PLY_VERSION = 2.1.1
+PLY_SITE = $(call github,wkz,ply,$(PLY_VERSION))
+PLY_AUTORECONF = YES
+PLY_LICENSE = GPL-2.0
+PLY_LICENSE_FILES = COPYING
+PLY_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
