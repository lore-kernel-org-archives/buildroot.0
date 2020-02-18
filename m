From: Jean Burgat <jeanburgat33@gmail.com>
Date: Tue, 18 Feb 2020 09:32:47 +0100
Subject: [Buildroot] [PATCH v3] package/openfpgaloader: new package
Message-ID: <20200218083247.15882-1-jeanburgat33@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openFPGALoader is a tool for programming FPGA.

Signed-off-by: Jean Burgat <jeanburgat33@gmail.com>
---
Changes v2 -> v3
 - hash: use 2 spaces (Heiko)
Changes v1 -> v2
 - openFPGALoader -> openfpgaloader (Thomas)
 - merge DEVELOPERS in first patch (Thomas)
 - select BR2_PACKAGE_ARGP_STANDALONE when non glibc (Thomas)
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/openfpgaloader/Config.in           | 18 ++++++++++++++++++
 package/openfpgaloader/openfpgaloader.hash |  3 +++
 package/openfpgaloader/openfpgaloader.mk   | 18 ++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/openfpgaloader/Config.in
 create mode 100644 package/openfpgaloader/openfpgaloader.hash
 create mode 100644 package/openfpgaloader/openfpgaloader.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e4a3bcb24a..69b460f12c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1216,6 +1216,9 @@ F:	package/quota/
 N:	Jason Pruitt <jrspruitt@gmail.com>
 F:	package/librtlsdr/
 
+N:	Jean Burgat <jeanburgat33@gmail.com>
+F:	package/openfpgaloader/
+
 N:	Jens Kleintje <scooby22@web.de>
 F:	package/gcnano-binaries/
 
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..53cf280c8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,6 +499,7 @@ endmenu
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
+	source "package/openfpgaloader/Config.in"
 	source "package/openipmi/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
new file mode 100644
index 0000000000..24551fb414
--- /dev/null
+++ b/package/openfpgaloader/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_OPENFPGALOADER
+	bool "openfpgaloader"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi1
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
+	depends on BR2_USE_WCHAR # libftdipp1
+	select BR2_PACKAGE_ARGP_STANDALONE \
+	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL # argp
+	select BR2_PACKAGE_LIBFTDI1
+	select BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
+	help
+	  Universal utility for programming FPGA
+
+	  https://github.com/trabucayre/openFPGALoader/
+
+comment "openfpgaloader needs a toolchain w/ threads, wchar, C++, udev"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
new file mode 100644
index 0000000000..037d4915ae
--- /dev/null
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fcff4999164ee2d3734f16b7f1d2063b3a68e237921e8d63c2afe75e16cdc7ce  openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61.tar.gz
+sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
new file mode 100644
index 0000000000..372a684e62
--- /dev/null
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# openfpgaloader
+#
+################################################################################
+
+OPENFPGALOADER_VERSION = 849e5751e06d4d00f323205d5f02ee01f9f59a61
+OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,$(OPENFPGALOADER_VERSION))
+OPENFPGALOADER_LICENSE = AGPL-3.0
+OPENFPGALOADER_LICENSE_FILES = LICENSE
+OPENFPGALOADER_DEPENDENCIES = libftdi1 udev
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+OPENFPGALOADER_DEPENDENCIES += argp-standalone
+OPENFPGALOADER_CONF_OPTS = -DCMAKE_CXX_STANDARD_LIBRARIES="-largp"
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
