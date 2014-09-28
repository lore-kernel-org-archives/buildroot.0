From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:39:30 +0200
Subject: [Buildroot] [git commit] tiff: fix prefer-static build by using
	default install
Message-ID: <20140928204114.603D49D795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66a2dcc058fc654d7bd5e873870af601544af58a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace hand-coded .so install with default install, plus tiff bins fixup
to remove unwanted tools.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk |   42 +++++++++++++++++++++++++++++++-----------
 1 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8d2e087..99a5b15 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -15,12 +15,34 @@ TIFF_CONF_OPT = \
 
 TIFF_DEPENDENCIES = host-pkgconf
 
-TIFF_TOOLS_LIST =
-ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),y)
-	TIFF_TOOLS_LIST += tiff2pdf
+TIFF_TOOLS_TO_DELETE = \
+	bmp2tiff \
+	fax2ps \
+	fax2tiff \
+	gif2tiff \
+	pal2rgb \
+	ppm2tiff \
+	ras2tiff \
+	raw2tiff \
+	rgb2ycbcr \
+	thumbnail \
+	tiff2bw \
+	tiff2ps \
+	tiff2rgba \
+	tiffcmp \
+	tiffcrop \
+	tiffdither \
+	tiffdump \
+	tiffinfo \
+	tiffmedian \
+	tiffset \
+	tiffsplit \
+
+ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),)
+	TIFF_TOOLS_TO_DELETE += tiff2pdf
 endif
-ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),y)
-	TIFF_TOOLS_LIST += tiffcp
+ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),)
+	TIFF_TOOLS_TO_DELETE += tiffcp
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
@@ -75,12 +97,10 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 	TIFF_CONF_OPT += --disable-jbig
 endif
 
-define TIFF_INSTALL_TARGET_CMDS
-	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
-	for i in $(TIFF_TOOLS_LIST); \
-	do \
-		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
-	done
+define TIFF_REMOVE_TOOLS_FIXUP
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(TIFF_TOOLS_TO_DELETE))
 endef
 
+TIFF_POST_INSTALL_TARGET_HOOKS += TIFF_REMOVE_TOOLS_FIXUP
+
 $(eval $(autotools-package))
