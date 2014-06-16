From: William Frost <tsmrnd0@gmail.com>
Date: Mon, 16 Jun 2014 09:21:49 +0900
Subject: [Buildroot] [PATCH] Changes v2 -> v3: (suggested by Thomas De
	Schampheleire): - removed version selection option,
	only stable release is used - added and empty new line between the
	comment header and the first variable definition - fixed
	license file reference - reduced and cleaning DCMTK_CFLAGS
	and DCMTK_CXXFLAGS declarations - removed
	DCMTK_INSTALL_STAGING_OPT and DCMTK_INSTALL_TARGET_OPT -
	unconditionally use --with-zlib - removed duplicated build commands
In-Reply-To: <Thomas De Schampheleire>
References: <Thomas De Schampheleire>
Message-ID: <1402878109-4292-1-git-send-email-tsmrnd0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: William Frost <tsmrnd0@gmail.com>
---
 package/Config.in       |  1 +
 package/dcmtk/Config.in | 12 ++++++++++++
 package/dcmtk/dcmtk.mk  | 23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/dcmtk/Config.in
 create mode 100644 package/dcmtk/dcmtk.mk

diff --git a/package/Config.in b/package/Config.in
index 07fd166..b88c0b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -568,6 +568,7 @@ endmenu
 menu "Graphics"
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
+source "package/dcmtk/Config.in"
 source "package/fltk/Config.in"
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
diff --git a/package/dcmtk/Config.in b/package/dcmtk/Config.in
new file mode 100644
index 0000000..0800c72
--- /dev/null
+++ b/package/dcmtk/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DCMTK
+	bool "dcmtk"
+	help
+	  DCMTK is a collection of libraries and applications implementing 
+	  large parts the DICOM standard. It includes software for examining, 
+	  constructing and converting DICOM image files, handling offline 
+	  media, sending and receiving images over a network connection, as 
+	  well as demonstrative image storage and worklist servers. DCMTK is 
+	  is written in a mixture of ANSI C and C++. It comes in complete 
+	  source code and is made available as "open source" software.
+
+	  http://dicom.offis.de/dcmtk.php.en
\ No newline at end of file
diff --git a/package/dcmtk/dcmtk.mk b/package/dcmtk/dcmtk.mk
new file mode 100644
index 0000000..ae2c265
--- /dev/null
+++ b/package/dcmtk/dcmtk.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# dcmtk
+#
+################################################################################
+
+DCMTK_VERSION = $(call qstrip,"3.6.0")
+DCMTK_SITE = http://dicom.offis.de/download/dcmtk/dcmtk360
+
+DCMTK_LICENSE = BSD
+DCMTK_LICENSE_FILES = COPYRIGHT
+DCMTK_INSTALL_STAGING = YES
+
+DCMTK_CFLAGS = $(TARGET_CFLAGS) -O -Wall
+DCMTK_CXXFLAGS = $(TARGET_CXXFLAGS) -O  -Wall
+DCMTK_CONF_OPT = \
+	--disable-rpath --with-zlib \
+	ac_cv_my_c_rightshift_unsigned=no
+
+DCMTK_CONF_ENV = ARFLAGS=cru
+DCMTK_MAKE_OPT	= DESTDIR=$(STAGING_DIR) install-lib
+
+$(eval $(autotools-package))
-- 
1.8.1.4
