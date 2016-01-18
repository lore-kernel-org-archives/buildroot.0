From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 18 Jan 2016 18:33:17 +0200
Subject: [Buildroot] [PATCH 1/1 v2] pocketsphinx: new package
Message-ID: <1453134797-17963-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

PocketSphinx is one of Carnegie Mellon University's open source large
vocabulary, speaker-independent, continuous speech recognition engines.

PocketSphinx is a toolkit that uses the Sphinxbase library.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
Changes v1 -> v2:
 1. Applied all review comments by Arnout Vandecappelle:
  a. Removed comments regarding github repo
  b. Added comment regarding missing license file upstream bug report
  c. Added example source file as license file
  d. Removed redundant source specification
  e. Added config opt --with-sphinxbase=auto

 2. Tested patch application with git apply --check

 package/Config.in                      |    1 +
 package/pocketsphinx/Config.in         |   13 +++++++++++++
 package/pocketsphinx/pocketsphinx.hash |    3 +++
 package/pocketsphinx/pocketsphinx.mk   |   18 ++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/pocketsphinx/Config.in
 create mode 100644 package/pocketsphinx/pocketsphinx.hash
 create mode 100644 package/pocketsphinx/pocketsphinx.mk

diff --git a/package/Config.in b/package/Config.in
index b555808..d5b66e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1208,6 +1208,7 @@ endif
 	source "package/netbsd-queue/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
+	source "package/pocketsphinx/Config.in"
 	source "package/poco/Config.in"
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
diff --git a/package/pocketsphinx/Config.in b/package/pocketsphinx/Config.in
new file mode 100644
index 0000000..8892c2e
--- /dev/null
+++ b/package/pocketsphinx/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_POCKETSPHINX
+	bool "pocketsphinx"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_SPHINXBASE
+	help
+	  PocketSphinx is one of Carnegie Mellon University's open
+	  source large vocabulary, speaker-independent, continuous
+	  speech recognition engine.
+
+	  http://cmusphinx.sourceforge.net/
+
+comment "pocketsphinx needs a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pocketsphinx/pocketsphinx.hash b/package/pocketsphinx/pocketsphinx.hash
new file mode 100644
index 0000000..9815d98
--- /dev/null
+++ b/package/pocketsphinx/pocketsphinx.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 34c4d218bbb8c5bb85622909426a137fe89140ea2e35c65e84fe3ccc42356a39 pocketsphinx-5prealpha.tar.gz
+
diff --git a/package/pocketsphinx/pocketsphinx.mk b/package/pocketsphinx/pocketsphinx.mk
new file mode 100644
index 0000000..a02e7e1
--- /dev/null
+++ b/package/pocketsphinx/pocketsphinx.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# pocketsphinx
+#
+################################################################################
+
+POCKETSPHINX_VERSION = 5prealpha
+POCKETSPHINX_SITE = http://downloads.sourceforge.net/project/cmusphinx/pocketsphinx
+POCKETSPHINX_LICENSE = MIT
+# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
+# 5prealpha tarballs". The license is contained in the copyright notice at the
+# top of each source file. For example:
+POCKETSPHINX_LICENSE_FILES = src/programs/batch.c
+POCKETSPHINX_CONF_OPTS = --without-python --with-sphinxbase=auto
+POCKETSPHINX_INSTALL_STAGING = YES
+POCKETSPHINX_DEPENDENCIES = sphinxbase
+
+$(eval $(autotools-package))
-- 
1.7.9.5
