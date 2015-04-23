From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:18:16 +0200
Subject: [Buildroot] [PATCH v5] package/tiff: Rework tiff utilities handling
Message-ID: <1429823896-32708-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Remove all utility-specific options in favour of a generic
option which select either all or no packages. If users
want something more fine-grained than that, they can always
remove the unnecessary tools in a post-build script.

Since tiff has no configure option or Makefile target to prevent
the build/install of its utilities specific Makefile targets are
called to build the libtiff and, optionally, the utilities.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: more compact implementation, slightly extend help text]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v5: More compact implementation with SUBDIRS instead of overriding the
    autotools _CMDS; extend Config.in text tiffutils -> tiff utilities;
    extend Config.in help text with capitalization and _all_ utilities.
v4: rebased
v3: rebased
v2: Replaced submenu with a new all-or-nothing option (Thomas)
---
 Config.in.legacy       | 16 ++++++++++++++++
 package/tiff/Config.in | 11 +++--------
 package/tiff/tiff.mk   | 39 +++++----------------------------------
 3 files changed, 24 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 70a9043..90f474c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,22 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_PACKAGE_TIFF_TIFF2PDF
+	bool "tiff utility-specific option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_TIFF_UTILITIES
+	help
+	  utility-specific options have been removed in favour of
+	  the new option BR2_PACKAGE_TIFF_UTILITIES.
+
+config BR2_PACKAGE_TIFF_TIFFCP
+	bool "tiff utility-specific option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_TIFF_UTILITIES
+	help
+	  utility-specific options have been removed in favour of
+	  the new option BR2_PACKAGE_TIFF_UTILITIES.
+
 config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	bool "RTAI patch file path has been removed"
 	help
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 3a929f7..acb335c 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -60,14 +60,9 @@ config BR2_PACKAGE_TIFF_JBIG
 	default y
 endmenu
 
-config BR2_PACKAGE_TIFF_TIFF2PDF
-	bool "tiff2pdf"
+config BR2_PACKAGE_TIFF_UTILITIES
+	bool "tiff utilities"
 	help
-	  tiff2pdf utility
-
-config BR2_PACKAGE_TIFF_TIFFCP
-	bool "tiffcp"
-	help
-	  tiffcp utility
+	  Install all tiff utilities.
 
 endif
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 06f0e34..6db2abd 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -15,36 +15,6 @@ TIFF_CONF_OPTS = \
 
 TIFF_DEPENDENCIES = host-pkgconf
 
-TIFF_TOOLS_TO_DELETE = \
-	bmp2tiff \
-	fax2ps \
-	fax2tiff \
-	gif2tiff \
-	pal2rgb \
-	ppm2tiff \
-	ras2tiff \
-	raw2tiff \
-	rgb2ycbcr \
-	thumbnail \
-	tiff2bw \
-	tiff2ps \
-	tiff2rgba \
-	tiffcmp \
-	tiffcrop \
-	tiffdither \
-	tiffdump \
-	tiffinfo \
-	tiffmedian \
-	tiffset \
-	tiffsplit \
-
-ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),)
-TIFF_TOOLS_TO_DELETE += tiff2pdf
-endif
-ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),)
-TIFF_TOOLS_TO_DELETE += tiffcp
-endif
-
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
@@ -97,10 +67,11 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 TIFF_CONF_OPTS += --disable-jbig
 endif
 
-define TIFF_REMOVE_TOOLS_FIXUP
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(TIFF_TOOLS_TO_DELETE))
-endef
+TIFF_SUBDIRS = port libtiff
+ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
+TIFF_SUBDIRS += tools
+endif
 
-TIFF_POST_INSTALL_TARGET_HOOKS += TIFF_REMOVE_TOOLS_FIXUP
+TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
 
 $(eval $(autotools-package))
-- 
2.1.4
