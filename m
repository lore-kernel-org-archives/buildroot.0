From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 10 Feb 2017 12:00:12 +0100
Subject: [Buildroot] [PATCH 1/2] augeas: new package
Message-ID: <20170210110013.30448-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Augeas is a configuration editing tool. It parses configuration files in
their native formats and transforms them into a tree. Configuration
changes are made by manipulating this tree and saving it back into
native config files.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/Config.in          |  1 +
 package/augeas/Config.in   | 11 +++++++++++
 package/augeas/augeas.hash |  2 ++
 package/augeas/augeas.mk   | 22 ++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/augeas/Config.in
 create mode 100644 package/augeas/augeas.hash
 create mode 100644 package/augeas/augeas.mk

diff --git a/package/Config.in b/package/Config.in
index 114a5ad5f..6956a788a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1409,6 +1409,7 @@ menu "Security"
 endmenu
 
 menu "Text and terminal handling"
+	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
 	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
diff --git a/package/augeas/Config.in b/package/augeas/Config.in
new file mode 100644
index 000000000..efbc19b43
--- /dev/null
+++ b/package/augeas/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_AUGEAS
+	bool "augeas"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_READLINE
+	help
+	  Augeas is a configuration editing tool. It parses configuration
+	  files in their native formats and transforms them into a tree.
+	  Configuration changes are made by manipulating this tree and
+	  saving it back into native config files.
+
+	  http://augeas.net
diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
new file mode 100644
index 000000000..9640757eb
--- /dev/null
+++ b/package/augeas/augeas.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b9315575d07f7ba28ca2f9f60b4987dfe77b5970c98b59dc6ca7873fc4979763  augeas-1.7.0.tar.gz
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
new file mode 100644
index 000000000..7a1f2f8ce
--- /dev/null
+++ b/package/augeas/augeas.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# augeas
+#
+################################################################################
+
+AUGEAS_VERSION = 1.7.0
+AUGEAS_SITE = http://download.augeas.net
+AUGEAS_INSTALL_STAGING = YES
+AUGEAS_LICENSE = LGPLv2.1+
+AUGEAS_LICENSE_FILES = COPYING
+AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
+
+AUGEAS_CONF_OPTS = --disable-gnulib-tests
+
+# Remove the test lenses which occupy about 1.4 MB on the target
+define AUGEAS_REMOVE_TEST_LENSES
+	rm -rf $(TARGET_DIR)/usr/share/augeas/lenses/dist/tests
+endef
+AUGEAS_POST_INSTALL_TARGET_HOOKS += AUGEAS_REMOVE_TEST_LENSES
+
+$(eval $(autotools-package))
-- 
2.11.1
