From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  4 May 2012 23:32:56 +0200
Subject: [Buildroot] [PATCH resend] stress: new package
In-Reply-To: <87bom71xbv.fsf@macbook.be.48ers.dk>
References: <87bom71xbv.fsf@macbook.be.48ers.dk>
Message-ID: <1336167176-22185-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Feedback from Peter
 * .tar.gz is default
 * newline at end of file
 * Remove largefile dependency

 package/Config.in                                 |    1 +
 package/stress/Config.in                          |    8 ++++++++
 package/stress/stress-0001-Remove-largefile.patch |   22 +++++++++++++++++++++
 package/stress/stress.mk                          |   13 ++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a310146..9dd2158 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
+source "package/stress/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 source "package/pv/Config.in"
diff --git a/package/stress/Config.in b/package/stress/Config.in
new file mode 100644
index 0000000..b092b03
--- /dev/null
+++ b/package/stress/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STRESS
+	bool "stress"
+	help
+	  A deliberately simple workload generator for POSIX systems.
+	  It imposes a configurable amount of CPU, memory, I/O, and
+	  disk stress on the system.
+
+	  http://weather.ou.edu/~apw/projects/stress/
diff --git a/package/stress/stress-0001-Remove-largefile.patch b/package/stress/stress-0001-Remove-largefile.patch
new file mode 100644
index 0000000..bf894bc
--- /dev/null
+++ b/package/stress/stress-0001-Remove-largefile.patch
@@ -0,0 +1,22 @@
+Remove largefile
+
+Otherwise it doesn't compile in uClibc without largefile.
+
+If the toolchain does support largefile, it will still work on large files
+anyway.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+Upstream status: mail sent to apw at rossby.metr.ou.edu
+---
+diff -rup stress-1.0.4.orig/src/Makefile.am stress-1.0.4/src/Makefile.am
+--- stress-1.0.4.orig/src/Makefile.am	2009-12-03 02:04:05.000000000 +0100
++++ stress-1.0.4/src/Makefile.am	2012-05-04 23:09:48.229842463 +0200
+@@ -1,7 +1,5 @@
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+-AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
+-
+ bin_PROGRAMS = stress
+ stress_SOURCES = stress.c
+ stress_MANS = stress.1
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
new file mode 100644
index 0000000..8b4f40b
--- /dev/null
+++ b/package/stress/stress.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# stress - a workload generator
+#
+# http://weather.ou.edu/~apw/projects/stress/
+#
+#############################################################
+
+STRESS_VERSION = 1.0.4
+STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
+STRESS_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
-- 
tg: (524a8ab..) t/stress (depends on: master)
