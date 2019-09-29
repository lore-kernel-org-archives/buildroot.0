From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 29 Sep 2019 21:49:12 +0200
Subject: [Buildroot] [PATCH v1] package/flac: fix powerpc compile failure
 (missing sys/auxv.h)
Message-ID: <20190929194912.18502-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  cpu.c:57:10: fatal error: sys/auxv.h: No such file or directory

From build/flac-1.3.3/src/libFLAC/cpu.c:

  56 #if defined FLAC__CPU_PPC
  57 #include <sys/auxv.h>
  58 #endif

Fixed by configure.ac patch checking for for sys/auxv.h before defining
FLAC__CPU_PPC (fallback already implemented for ppc_cpu_info method in
case FLAC__CPU_PPC is not defined).

[1] http://autobuild.buildroot.net/results/eb3a59a78dbb0c83cff78aac2384edea890af830

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ck-for-sys-auxv.h-before-defining-FL.patch | 36 +++++++++++++++++++
 package/flac/flac.mk                          |  4 +++
 2 files changed, 40 insertions(+)
 create mode 100644 package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch

diff --git a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch b/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
new file mode 100644
index 0000000000..4ad2a60bd7
--- /dev/null
+++ b/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
@@ -0,0 +1,36 @@
+From 14a0713389fbfef59225d027ea466ebb478a8c6b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 19 Sep 2019 21:18:04 +0200
+Subject: [PATCH] configure.ac: check for sys/auxv.h before defining FLAC__CPU_PPC
+
+Upstream: https://github.com/xiph/flac/pull/142
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0228a12..64cb3f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -144,7 +144,7 @@ case "$host_cpu" in
+ 	powerpc64|powerpc64le)
+ 		cpu_ppc64=true
+ 		cpu_ppc=true
+-		AC_DEFINE(FLAC__CPU_PPC)
++		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
+ 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
+ 		AC_DEFINE(FLAC__CPU_PPC64)
+ 		AH_TEMPLATE(FLAC__CPU_PPC64, [define if building for PowerPC64])
+@@ -152,7 +152,7 @@ case "$host_cpu" in
+ 		;;
+ 	powerpc|powerpcle)
+ 		cpu_ppc=true
+-		AC_DEFINE(FLAC__CPU_PPC)
++		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
+ 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
+ 		asm_optimisation=$asm_opt
+ 		;;
+--
+2.23.0
+
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index a2cf186d10..f2922ffefc 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -11,6 +11,10 @@ FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
+
+# patch touching configure.ac
+FLAC_AUTORECONF = YES
+
 FLAC_CONF_OPTS = \
 	--disable-cpplibs \
 	--disable-xmms-plugin \
--
2.23.0
