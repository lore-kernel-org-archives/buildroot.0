From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 12 Mar 2014 11:45:57 +0800
Subject: [Buildroot] [PATCH 06/10 v2] package/powerpc-utils: Add powerpc
	hardware utilities
In-Reply-To: <1394595957.563937.119075350083.0.gpush@pablo>
Message-ID: <1394595957.565885.179025903671.6.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds a package definition for the powerpc-utils project,
containing a set of powerpc-specific hardware management utilities.

We're using a git tag from upstream, which contains a few build-system
fixes.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/Config.in                                                               |    1 
 package/powerpc-utils/Config.in                                                 |    5 
 package/powerpc-utils/powerpc-utils-01-add-subdir-objects-automake-option.patch |   71 ++++++++++
 package/powerpc-utils/powerpc-utils.mk                                          |   16 ++
 4 files changed, 93 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..5fe0594 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1062,6 +1062,7 @@ source "package/monit/Config.in"
 source "package/ncdu/Config.in"
 source "package/numactl/Config.in"
 source "package/nut/Config.in"
+source "package/powerpc-utils/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
new file mode 100644
index 0000000..c919094
--- /dev/null
+++ b/package/powerpc-utils/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_POWERPC_UTILS
+	bool "powerpc-utils"
+	select BR2_PACKAGE_ZLIB
+	help
+	  System utilities for powerpc machines
diff --git a/package/powerpc-utils/powerpc-utils-01-add-subdir-objects-automake-option.patch b/package/powerpc-utils/powerpc-utils-01-add-subdir-objects-automake-option.patch
new file mode 100644
index 0000000..0311280
--- /dev/null
+++ b/package/powerpc-utils/powerpc-utils-01-add-subdir-objects-automake-option.patch
@@ -0,0 +1,71 @@
+From c9e3c0cde53b4b77728590bd2375e62a3dfaaf62 Mon Sep 17 00:00:00 2001
+From: Jeremy Kerr <jk@ozlabs.org>
+Date: Wed, 12 Mar 2014 10:43:46 +0800
+Subject: [PATCH] automake: Add subdir-objects automake option
+
+Current git builds fail for me, with:
+
+  configure.ac:13: installing 'build-aux/compile'
+  automake: warnings are treated as errors
+  src/Makefile.am:8: warning: source file 'common/pseries_platform.c' is in a subdirectory,
+  src/Makefile.am:8: but option 'subdir-objects' is disabled
+  automake: warning: possible forward-incompatibility.
+  automake: At least a source file is in a subdirectory, but the 'subdir-objects'
+  automake: automake option hasn't been enabled.  For now, the corresponding output
+  automake: object file(s) will be placed in the top-level directory.  However,
+  automake: this behaviour will change in future Automake versions: they will
+  automake: unconditionally cause object files to be placed in the same subdirectory
+  automake: of the corresponding sources.
+  automake: You are advised to start using 'subdir-objects' option throughout your
+  automake: project, to avoid future incompatibilities.
+  src/drmgr/Makefile.am:9: warning: source file '$(COM_DIR)/pseries_platform.c' is in a subdirectory,
+  src/drmgr/Makefile.am:9: but option 'subdir-objects' is disabled
+  autoreconf: automake failed with exit status: 1
+
+Using:
+
+automake (GNU automake) 1.14.1
+
+Since we're using objects in subdirectories, we need the subdir-objects
+atuomake option.
+
+Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
+---
+ Makefile.am           | 2 +-
+ src/Makefile.am       | 2 ++
+ src/drmgr/Makefile.am | 2 ++
+ 3 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 35df9f7..b3309c7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-AUTOMAKE_OPTIONS = foreign
++AUTOMAKE_OPTIONS = foreign subdir-objects
+ SUBDIRS = src man scripts
+ 
+ docdir = $(datadir)/doc/packages/@PACKAGE@
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8f17cd2..18403b8 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,3 +1,5 @@
++AUTOMAKE_OPTIONS = subdir-objects
++
+ AM_CFLAGS = -Wall -g -I common/ 
+ AM_LDFLAGS =
+ 
+diff --git a/src/drmgr/Makefile.am b/src/drmgr/Makefile.am
+index 2127b0d..4255fac 100644
+--- a/src/drmgr/Makefile.am
++++ b/src/drmgr/Makefile.am
+@@ -1,3 +1,5 @@
++AUTOMAKE_OPTIONS = subdir-objects
++
+ COM_DIR = $(top_srcdir)/src/common
+ 
+ AM_CFLAGS = -Wall -g -I $(COM_DIR)
+-- 
+1.8.3.2
+
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
new file mode 100644
index 0000000..6f8448c
--- /dev/null
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# powerpc-utils
+#
+################################################################################
+
+POWERPC_UTILS_VERSION = 64fe85e9473d05607dd8deda5023c7dd426216a5
+POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
+POWERPC_UTILS_AUTORECONF = YES
+POWERPC_UTILS_DEPENDENCIES = zlib
+POWERPC_UTILS_LICENSE = Common Public License Version 1.0
+POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
+
+POWERPC_UTILS_CONF_OPT = --without-librtas
+
+$(eval $(autotools-package))
