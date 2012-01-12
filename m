From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Jan 2012 11:06:10 +0100
Subject: [Buildroot] [git commit] tiff: add utility commands and library
	options
Message-ID: <20120112104709.CE66790314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af42c27da6485464087cee123a4b0208d0721cfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added support for compiling tiffcp and tiff2pdf.

Added options for compiling out various libtiff features. By default,
all libtiff features are built so that the result is the same as before
this change.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tiff/Config.in |   71 ++++++++++++++++++++++++++++++++++++++++++++++-
 package/tiff/tiff.mk   |   66 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 3 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index c6336e2..7850965 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -1,8 +1,75 @@
 config BR2_PACKAGE_TIFF
 	bool "tiff"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_JPEG
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
 
 	  http://www.libtiff.org/
+
+if BR2_PACKAGE_TIFF
+menu "tiff Options"
+
+config BR2_PACKAGE_TIFF_CCITT
+	bool "CCITT Group 3 & 4 support"
+	default y
+
+config BR2_PACKAGE_TIFF_PACKBITS
+	bool "Macintosh PackBits algorithm"
+	default y
+
+config BR2_PACKAGE_TIFF_LZW
+	bool "LZW algorithm"
+	default y
+
+config BR2_PACKAGE_TIFF_THUNDER
+	bool "ThunderScan 4-bit RLE algorithm"
+	default y
+
+config BR2_PACKAGE_TIFF_NEXT
+	bool "NeXT 2-bit RLE algorithm"
+	default y
+
+config BR2_PACKAGE_TIFF_LOGLUV
+	bool "LogLuv high dynamic range encoding"
+	default y
+
+config BR2_PACKAGE_TIFF_MDI
+	bool "Microsoft Document Imaging"
+	default y
+
+config BR2_PACKAGE_TIFF_ZLIB
+	bool "Zlib usage (required for Deflate compression)"
+	select BR2_PACKAGE_ZLIB
+	default y
+
+config BR2_PACKAGE_TIFF_PIXARLOG
+	bool "Pixar log-format algorithm (requires Zlib)"
+	select BR2_PACKAGE_TIFF_ZLIB
+	default y
+
+config BR2_PACKAGE_TIFF_JPEG
+	bool "JPEG compression"
+	select BR2_PACKAGE_JPEG
+	default y
+
+config BR2_PACKAGE_TIFF_OLD_JPEG
+	bool "Old JPEG decompression"
+	default y
+
+config BR2_PACKAGE_TIFF_JBIG
+	bool "JBIG compression"
+	default y
+endmenu
+
+endif
+
+config BR2_PACKAGE_TIFF_TIFF2PDF
+	bool "tiff2pdf"
+	depends on BR2_PACKAGE_TIFF
+	help
+	  tiff2pdf utility
+
+config BR2_PACKAGE_TIFF_TIFFCP
+	bool "tiffcp"
+	depends on BR2_PACKAGE_TIFF
+	help
+	  tiffcp utility
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 1d57db7..ed05bf1 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -12,10 +12,74 @@ TIFF_CONF_OPT = \
 	--disable-cxx \
 	--without-x \
 
-TIFF_DEPENDENCIES = host-pkg-config zlib jpeg
+TIFF_DEPENDENCIES = host-pkg-config
+
+TIFF_TOOLS_LIST =
+ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),y)
+	TIFF_TOOLS_LIST += tiff2pdf
+endif
+ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),y)
+	TIFF_TOOLS_LIST += tiffcp
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
+	TIFF_CONF_OPT += --disable-ccitt
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_PACKBITS),y)
+	TIFF_CONF_OPT += --disable-packbits
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_LZW),y)
+	TIFF_CONF_OPT += --disable-lzw
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_THUNDER),y)
+	TIFF_CONF_OPT += --disable-thunder
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_NEXT),y)
+	TIFF_CONF_OPT += --disable-next
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_LOGLUV),y)
+	TIFF_CONF_OPT += --disable-logluv
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_MDI),y)
+	TIFF_CONF_OPT += --disable-mdi
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_ZLIB),y)
+	TIFF_CONF_OPT += --disable-zlib
+else
+	TIFF_DEPENDENCIES += zlib
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_PIXARLOG),y)
+	TIFF_CONF_OPT += --disable-pixarlog
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_JPEG),y)
+	TIFF_CONF_OPT += --disable-jpeg
+else
+	TIFF_DEPENDENCIES += jpeg
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_OLD_JPEG),y)
+	TIFF_CONF_OPT += --disable-old-jpeg
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
+	TIFF_CONF_OPT += --disable-jbig
+endif
 
 define TIFF_INSTALL_TARGET_CMDS
 	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
+	for i in $(TIFF_TOOLS_LIST); \
+	do \
+		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
+	done
 endef
 
 $(eval $(call AUTOTARGETS))
