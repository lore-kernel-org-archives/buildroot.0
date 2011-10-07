From: Roeland Van Praet <roelvp@mind.be>
Date: Fri, 07 Oct 2011 09:04:26 +0200
Subject: [Buildroot] Add 'pv' (Pipe-Viewer) to BuildRoot
In-Reply-To: <1317920141.3905.1.camel@roelpc.telenet.be>
References: <1317913244.21369.15.camel@roelpc.telenet.be>
 <20111006183012.24ff3f7d@skate> <1317920141.3905.1.camel@roelpc.telenet.be>
Message-ID: <1317971066.3800.2.camel@roelpc.telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff -ruN a/package/Config.in b/package/Config.in
--- a/package/Config.in	2011-10-06 16:47:32.000000000 +0200
+++ b/package/Config.in	2011-10-06 16:47:47.000000000 +0200
@@ -31,6 +31,7 @@
 source "package/strace/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
+source "package/pv/Config.in"
 endmenu
 
 menu "Development tools"
diff -ruN a/package/pv/Config.in b/package/pv/Config.in
--- a/package/pv/Config.in	1970-01-01 01:00:00.000000000 +0100
+++ b/package/pv/Config.in	2011-10-07 08:36:52.000000000 +0200
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PV
+	bool "pv"
+	help
+	  Pipe Viewer - is a terminal-based tool for
+	  monitoring the progress of data through a
+	  pipeline.
+
+	  http://www.ivarch.com/programs/pv.shtml
diff -ruN a/package/pv/pv-1.2.0-fixld.patch b/package/pv/pv-1.2.0-fixld.patch
--- a/package/pv/pv-1.2.0-fixld.patch	1970-01-01 01:00:00.000000000 +0100
+++ b/package/pv/pv-1.2.0-fixld.patch	2011-10-07 08:39:12.000000000 +0200
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
diff -ruN a/package/pv/pv.mk b/package/pv/pv.mk
--- a/package/pv/pv.mk	1970-01-01 01:00:00.000000000 +0100
+++ b/package/pv/pv.mk	2011-10-07 08:45:45.000000000 +0200
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
