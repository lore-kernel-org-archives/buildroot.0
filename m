From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 11 Mar 2017 13:47:44 +0100
Subject: [Buildroot] [PATCH v2] augeas: new package
Message-ID: <20170311124744.22020-1-joerg.krause@embedded.rocks>
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
Cc: Romain Naour <romain.naour@gmail.com>
---
v2 (suggested by Romain Naour):
 * fix line wrap of help text
 * disable for arc (toolchain issue)
 * depend of wchar
 * fetch upstream patch to fix static linking
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/augeas/Config.in   | 19 +++++++++++++++++++
 package/augeas/augeas.hash |  3 +++
 package/augeas/augeas.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/augeas/Config.in
 create mode 100644 package/augeas/augeas.hash
 create mode 100644 package/augeas/augeas.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8daf6705f..99e275442 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -913,6 +913,7 @@ F:	package/x11r7/xdriver_xf86-video-imx-viv/
 N:	J?rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
+F:	package/augeas/
 F:	package/bctoolbox/
 F:	package/libshout/
 F:	package/libupnpp/
diff --git a/package/Config.in b/package/Config.in
index 7721727bb..16e232e67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1417,6 +1417,7 @@ menu "Security"
 endmenu
 
 menu "Text and terminal handling"
+	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
 	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
diff --git a/package/augeas/Config.in b/package/augeas/Config.in
new file mode 100644
index 000000000..c308db9a9
--- /dev/null
+++ b/package/augeas/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_AUGEAS
+	bool "augeas"
+	# ARC toolchain issue:
+	# https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/108
+	depends on !BR2_arc
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_READLINE
+	help
+	  Augeas is a configuration editing tool. It parses
+	  configuration files in their native formats and transforms
+	  them into a tree. Configuration changes are made by
+	  manipulating this tree and saving it back into native config
+	  files.
+
+	  http://augeas.net
+
+comment "augeas needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
new file mode 100644
index 000000000..04fbcba3e
--- /dev/null
+++ b/package/augeas/augeas.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b9315575d07f7ba28ca2f9f60b4987dfe77b5970c98b59dc6ca7873fc4979763  augeas-1.7.0.tar.gz
+sha256  12a987e78166032b59d816aced96c97813cb109108e7c2336cb8ae369c32e2bf  05a27f4e374e9f0dc2cda6301b52d2a6b109b2e8.patch
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
new file mode 100644
index 000000000..e52ef046d
--- /dev/null
+++ b/package/augeas/augeas.mk
@@ -0,0 +1,25 @@
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
+# Fetch upstream patch to fix static linking
+AUGEAS_PATCH = https://github.com/hercules-team/augeas/commit/05a27f4e374e9f0dc2cda6301b52d2a6b109b2e8.patch
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
2.12.0
