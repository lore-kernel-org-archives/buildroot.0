From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:39:03 +0100
Subject: [Buildroot] [git commit] augeas: new package
Message-ID: <20170321223923.F344F82629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb687f76a5a4819f61e653997516dc4b88ad5094
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Augeas is a configuration editing tool. It parses configuration files in
their native formats and transforms them into a tree. Configuration
changes are made by manipulating this tree and saving it back into
native config files.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Romain Naour <romain.naour@gmail.com>
[Thomas: fix Config.in comment dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/augeas/Config.in   | 20 ++++++++++++++++++++
 package/augeas/augeas.hash |  3 +++
 package/augeas/augeas.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e77bbd6..186f48f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -921,6 +921,7 @@ F:	package/x11r7/xdriver_xf86-video-imx-viv/
 N:	J??rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
+F:	package/augeas/
 F:	package/bctoolbox/
 F:	package/libshout/
 F:	package/libupnpp/
diff --git a/package/Config.in b/package/Config.in
index 5ec3e8b..ec54880 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "Security"
 endmenu
 
 menu "Text and terminal handling"
+	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
 	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
diff --git a/package/augeas/Config.in b/package/augeas/Config.in
new file mode 100644
index 0000000..df8c517
--- /dev/null
+++ b/package/augeas/Config.in
@@ -0,0 +1,20 @@
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
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR
diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
new file mode 100644
index 0000000..04fbcba
--- /dev/null
+++ b/package/augeas/augeas.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b9315575d07f7ba28ca2f9f60b4987dfe77b5970c98b59dc6ca7873fc4979763  augeas-1.7.0.tar.gz
+sha256  12a987e78166032b59d816aced96c97813cb109108e7c2336cb8ae369c32e2bf  05a27f4e374e9f0dc2cda6301b52d2a6b109b2e8.patch
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
new file mode 100644
index 0000000..e52ef04
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
