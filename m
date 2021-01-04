From: Andreas Klinger <ak@it-klinger.de>
Date: Mon, 4 Jan 2021 21:21:07 +0100
Subject: [Buildroot] [PATCH] package/ply: add new package
Message-ID: <20210104202106.GA21286@arbad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ply is a light-weight dynamic tracer for Linux. By means of using the
BPF it can attach probes to the linux kernel (e. g. kprobes).

It's a small alternative to LLVM based tracers for embedded systems.

Project page:
https://github.com/iovisor/ply

Documentation can be found here:
https://wkz.github.io/ply/

Tested with beaglebone_defconfig (uClibc-ng as well as glibc)

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...ure.ac-fix-error-with-version-string.patch | 29 +++++++++++++++++++
 ...02-printxf.h-add-stdarg.h-in-include.patch | 27 +++++++++++++++++
 package/ply/Config.in                         | 16 ++++++++++
 package/ply/ply.hash                          |  4 +++
 package/ply/ply.mk                            | 15 ++++++++++
 7 files changed, 95 insertions(+)
 create mode 100644 package/ply/0001-configure.ac-fix-error-with-version-string.patch
 create mode 100644 package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
 create mode 100644 package/ply/Config.in
 create mode 100644 package/ply/ply.hash
 create mode 100644 package/ply/ply.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ddab7073b8..18e3c2ced7 100644
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
index 219dba1c9d..2ea61a3551 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -123,6 +123,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/pax-utils/Config.in"
 	source "package/pcm-tools/Config.in"
 	source "package/piglit/Config.in"
+	source "package/ply/Config.in"
 	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
diff --git a/package/ply/0001-configure.ac-fix-error-with-version-string.patch b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
new file mode 100644
index 0000000000..bab5e5ac90
--- /dev/null
+++ b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
@@ -0,0 +1,29 @@
+From 684bae6043fa2242a5c6551c3f260c9db0cf7dc8 Mon Sep 17 00:00:00 2001
+From: Andreas Klinger <ak@it-klinger.de>
+Date: Mon, 4 Jan 2021 08:40:50 +0100
+Subject: [PATCH 1/2] configure.ac: fix error with version string
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
++AC_INIT(ply, [m4_esyscmd_s(git describe --always --dirty)],
+ 	     https://github.com/wkz/ply/issues)
+ 
+ AC_GNU_SOURCE
+-- 
+2.20.1
+
diff --git a/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch b/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
new file mode 100644
index 0000000000..19233659fc
--- /dev/null
+++ b/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
@@ -0,0 +1,27 @@
+From 3fb3cb779c535ec28cbba80573bbea42435108c0 Mon Sep 17 00:00:00 2001
+From: Andreas Klinger <ak@it-klinger.de>
+Date: Mon, 4 Jan 2021 20:48:41 +0100
+Subject: [PATCH 2/2] printxf.h: add stdarg.h in include
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
index 0000000000..2effc73a9f
--- /dev/null
+++ b/package/ply/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PLY
+	bool "ply"
+	help
+	  ply is a light-weight dynamic tracer for Linux. By means of using
+	  the BPF it can attach probes to the linux kernel (e. g. kprobes).
+
+	  It's a small alternative to LLVM based tracers for embedded
+	  systems.
+
+	  When using debugfs needs to be mounted on /sys/kernel/debug.
+
+	  Project page:
+	  https://github.com/iovisor/ply
+
+	  Documentation can be found here:
+	  https://wkz.github.io/ply/
diff --git a/package/ply/ply.hash b/package/ply/ply.hash
new file mode 100644
index 0000000000..2f1ddf1726
--- /dev/null
+++ b/package/ply/ply.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256	cecf0913c65027750ac3272e936110c9f843435938f9ca2edbc34e99ba6c00e2  ply-2.1.1.tar.gz
+sha256	86c646ec6e0da6f5a365267a166e3d05cebd97ba82c74ba495c1f368ea0c6fee  0001-configure.ac-fix-error-with-version-string.patch
+sha256	b445002ea0869a667e1195aad1b118d13eb3396adf10b85b80037669a59c6657  0002-printxf.h-add-stdarg.h-in-include.patch
diff --git a/package/ply/ply.mk b/package/ply/ply.mk
new file mode 100644
index 0000000000..5feabc0d17
--- /dev/null
+++ b/package/ply/ply.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# ply
+#
+################################################################################
+
+PLY_VERSION = 2.1.1
+PLY_SITE = $(call github,iovisor,ply,$(PLY_VERSION))
+PLY_AUTORECONF = YES
+
+PLY_LICENSE = GPL-2.0
+PLY_LICENSE_FILES = COPYING
+PLY_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.20.1
