From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 08:40:06 +0200
Subject: [Buildroot] [git commit] stress: new package
Message-ID: <20120505064758.D11D296A99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a90617b6271c86769a03ea8f7cfc5a58451e02c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                 |    1 +
 package/stress/Config.in                          |    8 +++++++
 package/stress/stress-0001-Remove-largefile.patch |   22 +++++++++++++++++++++
 package/stress/stress.mk                          |   13 ++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index caa618b..b25f31a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -37,6 +37,7 @@ source "package/netperf/Config.in"
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
