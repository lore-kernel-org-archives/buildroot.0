From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:51 +0100
Subject: [Buildroot] [PATCH next 06/12] package/tinifier: new package
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a Go package that needs vendor modules to be downloaded at
build time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/tinifier/Config.in     | 10 ++++++++++
 package/tinifier/tinifier.hash |  3 +++
 package/tinifier/tinifier.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/tinifier/Config.in
 create mode 100644 package/tinifier/tinifier.hash
 create mode 100644 package/tinifier/tinifier.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d0c9c16423..eb97cfeac0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2590,6 +2590,7 @@ F:	package/rtc-tools/
 F:	package/sam-ba/
 F:	package/scons/
 F:	package/squashfs/
+F:	package/tinifier/
 F:	package/wayland/
 F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
diff --git a/package/Config.in b/package/Config.in
index d32a271113..a93959ada8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -298,6 +298,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/tesseract-ocr/Config.in"
+	source "package/tinifier/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
new file mode 100644
index 0000000000..fbadfe6bd9
--- /dev/null
+++ b/package/tinifier/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TINIFIER
+	bool "tinifier"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  CLI tool for images compressing
+
+	  This tool uses tinypng.com API endpoint for compressing your
+	  local jpg/png images (it supports parallel jobs).
+
+	  https://github.com/tarampampam/tinifier
diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
new file mode 100644
index 0000000000..146700817b
--- /dev/null
+++ b/package/tinifier/tinifier.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  707a1d9e55aab8c83b65bb10f3ec8c3bc094d77cd576b266f821d9f39133ac3c  tinifier-2.1.0.tar.gz
+sha256  791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6  LICENSE
diff --git a/package/tinifier/tinifier.mk b/package/tinifier/tinifier.mk
new file mode 100644
index 0000000000..b47d265a8e
--- /dev/null
+++ b/package/tinifier/tinifier.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinifier
+#
+################################################################################
+
+TINIFIER_VERSION = 2.1.0
+TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))
+TINIFIER_LICENSE = MIT
+TINIFIER_LICENSE_FILES = LICENSE
+TINIFIER_GOMOD = tinifier
+
+$(eval $(golang-package))
-- 
2.28.0
