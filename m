From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 19:33:09 +0200
Subject: [Buildroot] [PATCH 2/2] pacage/xbmc-addon-xvdr: new package
In-Reply-To: <cover.1396719130.git.yann.morin.1998@free.fr>
References: <cover.1396719130.git.yann.morin.1998@free.fr>
Message-ID: <8ae0abc237b2226c537597eeea513d1808472472.1396719130.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc-addon-xvdr/Config.in                  | 14 +++++++++++
 .../xbmc-addon-xvdr-0001-foreign-automake.patch    | 28 ++++++++++++++++++++++
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         | 25 +++++++++++++++++++
 package/xbmc/Config.in                             |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 package/xbmc-addon-xvdr/Config.in
 create mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
 create mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk

diff --git a/package/xbmc-addon-xvdr/Config.in b/package/xbmc-addon-xvdr/Config.in
new file mode 100644
index 0000000..7329a9a
--- /dev/null
+++ b/package/xbmc-addon-xvdr/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XBMC_ADDON_XVDR
+	bool "xbmc-addon-xvdr"
+	help
+	  This is a PVR add-on for XBMC to add VDR (http://tvdr.de/)
+	  as a TV/PVR Backend to XBMC.
+
+	  It adds support for Live TV watching, replaying of Recordings,
+	  programming Timers and EPG TV Guide to use on same computer or
+	  over the Network.
+
+	  https://github.com/pipelka/xbmc-addon-xvdr
+
+	  Note: since the VDR server is not packaged in Buildroot, using
+	  this addon requires that a remote VDR server be used.
diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch b/package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
new file mode 100644
index 0000000..0f49dcf
--- /dev/null
+++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
@@ -0,0 +1,28 @@
+commit 846b0b5a8b559f94dffadf5b2f95ca845b6ba9f1
+Author: Yann E. MORIN <yann.morin.1998@free.fr>
+Date:   Wed Mar 26 07:45:58 2014 +0100
+
+    configure: set the foreign flag
+    
+    This is required since we do not bundle the necessary files (NEWS,
+    INSTALL et al.) Setting it in configure.in is needed to be able
+    to run autoreconf (in lieu of the weird autogen.sh)
+    
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+Patch accepted upstream in master:
+    https://github.com/pipelka/xbmc-addon-xvdr/commit/84e5860f488e67a3a3386c779f9a56adeb3dc220
+
+diff --git a/configure.in b/configure.in
+index 6e692e1..7be0d18 100755
+--- a/configure.in
++++ b/configure.in
+@@ -12,7 +12,7 @@ AC_CANONICAL_HOST
+ AC_CANONICAL_TARGET
+ 
+ dnl Setup for automake
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ dnl Check for tools
+ 
diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
new file mode 100644
index 0000000..28c90f7
--- /dev/null
+++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# xbmc-addon-xvdr
+#
+################################################################################
+
+# This cset is on the branch 'xbmc-frodo'
+# When XBMC is updated, then this should be updated to the corresponding branch
+XBMC_ADDON_XVDR_VERSION = acd4e145fc3220cf708aaf40d895904732dce2c7
+XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
+XBMC_ADDON_XVDR_LICENSE = GPLv2+
+XBMC_ADDON_XVDR_LICENSE_FILES = COPYING
+
+# There's no ./configure in the git tree, we need to generate it
+# xbmc-addon-xvdr uses a weird autogen.sh script, which
+# is even incorrect (it's missing the #! ) Sigh... :-(
+# Fortunately, with our little patch, it autoreconfs nicely! :-)
+XBMC_ADDON_XVDR_AUTORECONF = YES
+
+# This really is a runtime dependency, but we need XBMC to be installed
+# first, since we'll install files in XBMC's directories _after_ XBMC has
+# installed his own files
+XBMC_ADDON_XVDR_DEPENDENCIES = xbmc
+
+$(eval $(autotools-package))
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index ef9f8bd..ed8872b 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -160,6 +160,7 @@ config BR2_PACKAGE_XBMC_WAVPACK
 
 comment "XBMC addons"
 
+source "package/xbmc-addon-xvdr/Config.in"
 source "package/xbmc-pvr-addons/Config.in"
 
 endif # BR2_PACKAGE_XBMC
-- 
1.8.3.2
