From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat, 16 Mar 2013 14:42:22 +0200
Subject: [Buildroot] [PATCH 1/1] Added lcms2 package
In-Reply-To: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
References: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1363437742-2562-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Little CMS intends to be an OPEN SOURCE small-footprint color management engine,
with special focus on accuracy and performance.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
Changelog:
        Removed excess empty lines from Config.in
        Added licensing info to lcms2.mk
	Chaned LCMS2_SITE to correct url
	Added options to include support for zlib, jpeg and tiff
	Removed dependency on host-lcms2

 package/Config.in       |    1 +
 package/lcms2/Config.in |   11 +++++++++++
 package/lcms2/lcms2.mk  |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/lcms2/Config.in
 create mode 100644 package/lcms2/lcms2.mk

diff --git a/package/Config.in b/package/Config.in
index 21c3ec9..4cf71d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -421,6 +421,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/lcms2/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/lcms2/Config.in b/package/lcms2/Config.in
new file mode 100644
index 0000000..33999fa
--- /dev/null
+++ b/package/lcms2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LCMS2
+	bool "lcms2"
+	help
+	  Little Color Management Software
+	  Little CMS intends to be an OPEN SOURCE small-footprint color 
+	  management engine, with special focus on accuracy and performance. 
+	  It uses the International Color Consortium standard (ICC), which is
+	  the modern standard when regarding to color management.
+
+	  http://www.littlecms.com/
+
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
new file mode 100644
index 0000000..1766bec
--- /dev/null
+++ b/package/lcms2/lcms2.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# lcms2
+#
+#############################################################
+
+LCMS2_VERSION = 2.4
+LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
+LCMS2_LICENSE = MIT
+LCMS2_LICENSE_FILES = COPYING
+
+LCMS2_CONF_OPT = \
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	LCMS2_CONF_OPT += --with-jpeg 
+	LCMS2_DEPENDENCIES += jpeg
+else
+	LCMS2_CONF_OPT += --without-jpeg 
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+	LCMS2_CONF_OPT += --with-tiff 
+	LCMS2_DEPENDENCIES += tiff
+else
+	LCMS2_CONF_OPT += --without-tiff 
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	LCMS2_CONF_OPT += --with-zlib 
+	LCMS2_DEPENDENCIES += zlib
+else
+	LCMS2_CONF_OPT += --without-zlib 
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
