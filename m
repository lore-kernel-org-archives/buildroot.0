From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 11 Jan 2016 10:58:35 +0200
Subject: [Buildroot] [PATCH 1/1] sphinxbase: new package
Message-ID: <1452502715-20600-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

CMUSphinx toolkit is a speech recognition toolkit with various tools
used to build speech applications. CMU Sphinx toolkit has a number of
packages for different tasks and applications. The toolkit is designed
for use on mobile platforms.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in                  |    1 +
 package/sphinxbase/Config.in       |   13 +++++++++++++
 package/sphinxbase/sphinxbase.hash |    2 ++
 package/sphinxbase/sphinxbase.mk   |   22 ++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/sphinxbase/Config.in
 create mode 100644 package/sphinxbase/sphinxbase.hash
 create mode 100644 package/sphinxbase/sphinxbase.mk

diff --git a/package/Config.in b/package/Config.in
index 442021f..41faddd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1211,6 +1211,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/sphinxbase/Config.in b/package/sphinxbase/Config.in
new file mode 100644
index 0000000..ee9ca31
--- /dev/null
+++ b/package/sphinxbase/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SPHINXBASE
+	bool "sphinxbase"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  CMUSphinx toolkit is a leading speech recognition toolkit with
+	  various tools used to build speech applications. CMU Sphinx
+	  toolkit has a number of packages for different tasks and
+	  applications.
+
+	  http://cmusphinx.sourceforge.net/
+
+comment "sphinxbase needs a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
new file mode 100644
index 0000000..483fda3
--- /dev/null
+++ b/package/sphinxbase/sphinxbase.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b8b19a207d1a285753a93ed67c36aacba0ebdc0892471fd3be6f6ffaba776f88 sphinxbase-5prealpha.tar.gz
diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
new file mode 100644
index 0000000..c5bc229
--- /dev/null
+++ b/package/sphinxbase/sphinxbase.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sphinxbase
+#
+################################################################################
+
+# At the time of this submission (20160110) the github cmusphinx/sphinxbase
+# commit e34b1c632392276101ed16e8a05862e43f038a7c does not build successfully
+# and the rep contains no 5prealpha or other tags, so we use the SourceForge
+# sources.
+SPHINXBASE_VERSION = 5prealpha
+SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/$(SPHINXBASE_VERSION)
+SPHINXBASE_SOURCE = sphinxbase-$(SPHINXBASE_VERSION).tar.gz
+SPHINXBASE_AUTORECONF = YES
+SPHINXBASE_LICENSE = MIT
+# The license is contained in the copyright notice at the top of each source
+# file. There is no specific file with a general license notice.
+SPHINXBASE_LICENSE_FILES = 
+SPHINXBASE_CONF_OPTS = --without-python
+SPHINXBASE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
