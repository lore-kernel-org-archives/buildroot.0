From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Oct 2011 10:19:54 +0200
Subject: [Buildroot] [git commit] package: add 'pv' (Pipe-Viewer)
Message-ID: <20111007113306.5E4E98E289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f7cff5239a29e9a8e6436650ea4fad3a736d90d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Roeland Van Praet <roelvp@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in               |    1 +
 package/pv/Config.in            |    8 ++++++++
 package/pv/pv-1.2.0-fixld.patch |   21 +++++++++++++++++++++
 package/pv/pv.mk                |   11 +++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 173e19d..904ebb6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -31,6 +31,7 @@ source "package/oprofile/Config.in"
 source "package/strace/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
+source "package/pv/Config.in"
 endmenu
 
 menu "Development tools"
diff --git a/package/pv/Config.in b/package/pv/Config.in
new file mode 100644
index 0000000..671f78e
--- /dev/null
+++ b/package/pv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PV
+	bool "pv"
+	help
+	  Pipe Viewer - is a terminal-based tool for
+	  monitoring the progress of data through a
+	  pipeline.
+
+	  http://www.ivarch.com/programs/pv.shtml
diff --git a/package/pv/pv-1.2.0-fixld.patch b/package/pv/pv-1.2.0-fixld.patch
new file mode 100644
index 0000000..9df279d
--- /dev/null
+++ b/package/pv/pv-1.2.0-fixld.patch
@@ -0,0 +1,21 @@
+[PATCH] fix linker variable
+
+The linker variable LD was always set to 'ld' instead of the value from
+the environment. This breaks any linking, especially when dealing with
+a cross-compiler toolchain.
+The fix takes the CC variable and changes the 'gcc' extension to 'ld'.
+
+Signed-off-by: Roeland Van Praet <roelvp@mind.be>
+---
+diff -ruN a/autoconf/make/vars.mk b/autoconf/make/vars.mk
+--- a/autoconf/make/vars.mk	2010-03-11 00:43:19.000000000 +0100
++++ b/autoconf/make/vars.mk	2011-10-06 15:47:18.000000000 +0200
+@@ -30,7 +30,7 @@
+ @SET_MAKE@
+ SHELL = /bin/sh
+ CC = @CC@
+-LD = ld
++LD = $(CC:gcc=ld)
+ DO_GZIP = @DO_GZIP@
+ INSTALL = @INSTALL@
+ INSTALL_DATA = @INSTALL_DATA@
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
new file mode 100644
index 0000000..5f15f5b
--- /dev/null
+++ b/package/pv/pv.mk
@@ -0,0 +1,11 @@
+#######################
+#
+# pv - Pipe Viewer
+#
+#######################
+
+PV_VERSION = 1.2.0
+PV_SOURCE = pv-$(PV_VERSION).tar.bz2
+PV_SITE = http://pipeviewer.googlecode.com/files
+
+$(eval $(call AUTOTARGETS))
