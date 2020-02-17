From: Jean Burgat <jeanburgat33@gmail.com>
Date: Mon, 17 Feb 2020 19:18:24 +0100
Subject: [Buildroot] [PATCH] package/openFPGALoader: new package
Message-ID: <20200217181825.29766-1-jeanburgat33@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean Burgat <jeanburgat33@gmail.com>
---
 package/Config.in                          |  1 +
 package/openFPGALoader/Config.in           | 18 ++++++++++++++++++
 package/openFPGALoader/openFPGALoader.hash |  3 +++
 package/openFPGALoader/openFPGALoader.mk   | 13 +++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/openFPGALoader/Config.in
 create mode 100644 package/openFPGALoader/openFPGALoader.hash
 create mode 100644 package/openFPGALoader/openFPGALoader.mk

diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..daf2feaae9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,6 +499,7 @@ endmenu
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
+	source "package/openFPGALoader/Config.in"
 	source "package/openipmi/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
diff --git a/package/openFPGALoader/Config.in b/package/openFPGALoader/Config.in
new file mode 100644
index 0000000000..0e96e81906
--- /dev/null
+++ b/package/openFPGALoader/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_OPENFPGALOADER
+	bool "openFPGALoader"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_USES_GLIBC # argp
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
+	depends on BR2_USE_WCHAR # libftdipp1
+	select BR2_PACKAGE_LIBFTDI1
+	select BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
+	help
+	  Universal utility for programming FPGA
+
+	  https://github.com/trabucayre/openFPGALoader/
+
+comment "openFPGALoader needs a glibc toolchain w/ threads, wchar, C++, udev"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/openFPGALoader/openFPGALoader.hash b/package/openFPGALoader/openFPGALoader.hash
new file mode 100644
index 0000000000..1e65809fd3
--- /dev/null
+++ b/package/openFPGALoader/openFPGALoader.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 fcff4999164ee2d3734f16b7f1d2063b3a68e237921e8d63c2afe75e16cdc7ce  openFPGALoader-849e5751e06d4d00f323205d5f02ee01f9f59a61.tar.gz
+sha256 8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/openFPGALoader/openFPGALoader.mk b/package/openFPGALoader/openFPGALoader.mk
new file mode 100644
index 0000000000..6706e7ffbf
--- /dev/null
+++ b/package/openFPGALoader/openFPGALoader.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# openFPGALoader
+#
+################################################################################
+
+OPENFPGALOADER_VERSION = 849e5751e06d4d00f323205d5f02ee01f9f59a61
+OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,$(OPENFPGALOADER_VERSION))
+OPENFPGALOADER_LICENSE = AGPL-3.0
+OPENFPGALOADER_LICENSE_FILES = LICENSE
+OPENFPGALOADER_DEPENDENCIES = libftdi1 udev
+
+$(eval $(cmake-package))
-- 
2.11.0
