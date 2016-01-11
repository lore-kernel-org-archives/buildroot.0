From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 11 Jan 2016 13:55:35 +0200
Subject: [Buildroot] [PATCH 1/1] pocketsphinx: new package
Message-ID: <1452513336-5839-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

PocketSphinx is one of Carnegie Mellon University's open source large
vocabulary, speaker-independent, continuous speech recognition engines.

PocketSphinx is designed for mobile applications.
PocketSphinx is a toolkit that uses the Sphinxbase library.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in                      |    1 +
 package/pocketsphinx/Config.in         |   16 ++++++++++++++++
 package/pocketsphinx/pocketsphinx.hash |    3 +++
 package/pocketsphinx/pocketsphinx.mk   |   23 +++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/pocketsphinx/Config.in
 create mode 100644 package/pocketsphinx/pocketsphinx.hash
 create mode 100644 package/pocketsphinx/pocketsphinx.mk

diff --git a/package/Config.in b/package/Config.in
index 41faddd..b4470fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1206,6 +1206,7 @@ endif
 	source "package/netbsd-queue/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
+	source "package/pocketsphinx/Config.in"
 	source "package/poco/Config.in"
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
diff --git a/package/pocketsphinx/Config.in b/package/pocketsphinx/Config.in
new file mode 100644
index 0000000..b6666c1
--- /dev/null
+++ b/package/pocketsphinx/Config.in
@@ -0,0 +1,16 @@
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
+
+comment "pocketsphinx depends on sphinxbase"
+	depends on !BR2_PACKAGE_SPHINXBASE
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
index 0000000..27e66d5
--- /dev/null
+++ b/package/pocketsphinx/pocketsphinx.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# pocketsphinx
+#
+################################################################################
+
+# At the time of this submission (20160110) the github cmusphinx/pocketsphinx
+# commit 9ee2fc6f83ed8a1d19ffee689ee3c6c48a8c4d58 does not build successfully
+# and the rep contains no 5prealpha or other tags, so we use the SourceForge
+# sources.
+POCKETSPHINX_VERSION = 5prealpha
+POCKETSPHINX_SITE = http://downloads.sourceforge.net/project/cmusphinx/pocketsphinx/$(POCKETSPHINX_VERSION)
+POCKETSPHINX_SOURCE = pocketsphinx-$(POCKETSPHINX_VERSION).tar.gz
+POCKETSPHINX_AUTORECONF = YES
+POCKETSPHINX_LICENSE = MIT
+# The license is contained in the copyright notice at the top of each source
+# file. There is no specific file with a general license notice.
+POCKETSPHINX_LICENSE_FILES = 
+POCKETSPHINX_CONF_OPTS = --without-python
+POCKETSPHINX_INSTALL_STAGING = YES
+POCKETSPHINX_DEPENDENCIES = sphinxbase
+
+$(eval $(autotools-package))
-- 
1.7.9.5
