From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:07:09 +0200
Subject: [Buildroot] [git commit] xapian: new package
Message-ID: <20181008160727.42C038E43A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d91237989ab0ed83be04b729840f1aec16f6002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Thomas:
 - add zlib to the DEPENDENCIES variable
 - add missing Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/xapian/Config.in   | 18 ++++++++++++++++++
 package/xapian/xapian.hash |  3 +++
 package/xapian/xapian.mk   | 15 +++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab741d4ef5..b4294e2c48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -903,6 +903,7 @@ F:	package/leptonica/
 F:	package/ocrad/
 F:	package/tesseract-ocr/
 F:	package/webp/
+F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 F:	package/sunxi-mali-mainline/
diff --git a/package/Config.in b/package/Config.in
index 19ee391b3b..1f3c7e7f4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1672,6 +1672,7 @@ endif
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/xapian/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xapian/Config.in b/package/xapian/Config.in
new file mode 100644
index 0000000000..5d54ed3a1b
--- /dev/null
+++ b/package/xapian/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_XAPIAN
+	bool "xapian"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
+	help
+	  Xapian is an open Source search engine Library
+	  It is a highly adaptable toolkit which allows developers
+	  to easily add advanced indexing and search facilities to
+	  their own applications.
+	  It has built-in support for several families of weighting
+	  models and supports a rich set of boolean query operators.
+
+	  https://xapian.org/
+
+comment "xapian needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
new file mode 100644
index 0000000000..4fd0dd134d
--- /dev/null
+++ b/package/xapian/xapian.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 13f08a0b649c7afa804fa0e85678d693fd6069dd394c9b9e7d41973d74a3b5d3 xapian-core-1.4.7.tar.xz
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
new file mode 100644
index 0000000000..241f37b220
--- /dev/null
+++ b/package/xapian/xapian.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xapian
+#
+################################################################################
+
+XAPIAN_VERSION = 1.4.7
+XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
+XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
+XAPIAN_LICENSE = GPL-2.0+
+XAPIAN_LICENSE_FILES = COPYING
+XAPIAN_INSTALL_STAGING = YES
+XAPIAN_DEPENDENCIES = zlib
+
+$(eval $(autotools-package))
