From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Tue, 17 Sep 2013 23:12:29 -0500
Subject: [Buildroot] [PATCH 1/1] bc: new package
Message-ID: <1379477549-5783-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Built against GCC4.7 ARM glib and x86 ulibc.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/Config.in    |    1 +
 package/bc/Config.in |   14 ++++++++++++++
 package/bc/bc.mk     |   18 ++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/bc/Config.in
 create mode 100644 package/bc/bc.mk

diff --git a/package/Config.in b/package/Config.in
index 973d32c..e9af20c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -731,6 +731,7 @@ endmenu
 
 menu "Miscellaneous"
 source "package/aespipe/Config.in"
+source "package/bc/Config.in"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
diff --git a/package/bc/Config.in b/package/bc/Config.in
new file mode 100644
index 0000000..a28978d
--- /dev/null
+++ b/package/bc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_BC
+	bool "bc"
+	help
+	  'bc' is an arbitrary precision numeric processing language
+	  Its syntax is similar to C, but differs in many substantial
+	  areas. It supports interactive execution of statements. 'Bc'
+	  is a utility included in the POSIX P1003.2/D11 draft standard.
+	  This version does not use the historical method of having bc
+	  be a compiler for the dc calculator (the POSIX document doesn't
+	  specify how bc must be implemented). This version has a single
+	  executable that both compiles the language and runs the resulting
+	  'byte code.' The byte code is not the dc language.
+
+	  http://www.gnu.org/software/bc
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
new file mode 100644
index 0000000..ad13021
--- /dev/null
+++ b/package/bc/bc.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bc
+#
+################################################################################
+BC_VERSION = 1.06
+BC_SITE = http://ftp.gnu.org/pub/gnu/bc/
+BC_SOURCE = bc-$(BC_VERSION).tar.gz
+BC_LICENSE = GPLv2+ LGPLv2.1+
+BC_LICENSE_FILES = COPYING COPYING.LIB
+BC_INSTALL_STAGING = NO
+
+# Build after busybox so target ends up with bc's "dc" version
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+BC_DEPENDENCIES += busybox
+endif
+
+$(eval $(autotools-package))
-- 
1.7.1
