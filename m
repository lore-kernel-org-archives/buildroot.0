From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:04:38 +0200
Subject: [Buildroot] [git commit] bc: new package
Message-ID: <20130919190641.962F19B7F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c95dcd464512ede5ffdef5567558611f05e2e52b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in    |    1 +
 package/bc/Config.in |   14 ++++++++++++++
 package/bc/bc.mk     |   17 +++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ae0214c..e187aa3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -733,6 +733,7 @@ endmenu
 
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
