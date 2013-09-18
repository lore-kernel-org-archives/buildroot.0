From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Tue, 17 Sep 2013 23:26:41 -0500
Subject: [Buildroot] [PATCH v2] bc: new package
Message-ID: <1379478401-1018-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
  * Replaced site to use GNU MIRROR package/bc/bc.mk (suggested by Thomas)
  * Removed defaults (staging and source) package/bc/bc.mk (suggested by Thomas)

 package/Config.in    |    1 +
 package/bc/Config.in |   14 ++++++++++++++
 package/bc/bc.mk     |   17 +++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
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
index 0000000..3f1f7e7
--- /dev/null
+++ b/package/bc/bc.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# bc
+#
+################################################################################
+
+BC_VERSION = 1.06
+BC_SITE = $(BR2_GNU_MIRROR)/bc/
+BC_LICENSE = GPLv2+ LGPLv2.1+
+BC_LICENSE_FILES = COPYING COPYING.LIB
+
+# Build after busybox so target ends up with bc's "dc" version
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+BC_DEPENDENCIES += busybox
+endif
+
+$(eval $(autotools-package))
-- 
1.7.1
