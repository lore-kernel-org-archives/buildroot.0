From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 13 Feb 2014 17:26:20 -0700
Subject: [Buildroot] [PATCH V5 3/3] i.MX: use temp directory for Freescale
	self-extractors
In-Reply-To: <1392337580-16568-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1392337580-16568-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1392337580-16568-4-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Freescale packages imx-lib, libfslcodec, libfslparser, and libfslvpuwrap
are each bundled as self-extracting tar-balls that contain a shell script
and a EULA in their package headers.

These self-extractors also contain a command to create the destination
directory using "mkdir" (no -p) prior to extraction.

Since we want to place the output into the build directory, which has already
been created at the time of extraction, this causes a warning message
from "mkdir".

This patch changes things so that each package is extracted first into a
sub-directory, and the content is moved into the eventual build directory.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
This patch is new in V5.

 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 13 ++++++++-----
 package/freescale-imx/imx-lib/imx-lib.mk                   | 11 +++++++----
 package/libfslcodec/libfslcodec.mk                         |  9 ++++++---
 package/libfslparser/libfslparser.mk                       |  9 ++++++---
 package/libfslvpuwrap/libfslvpuwrap.mk                     |  9 ++++++---
 5 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index e799fd2..ec8c774 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
+GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
 ifeq ($(BR2_ARM_EABIHF),y)
-GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
+GPU_VIV_BIN_MX6Q_EXTRACT = gpu-viv-bin-mx6q-$(FREESCALE_IMX_VERSION)-hfp
 else
-GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
+GPU_VIV_BIN_MX6Q_EXTRACT = gpu-viv-bin-mx6q-$(FREESCALE_IMX_VERSION)-sfp
 endif
 GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
-GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
+GPU_VIV_BIN_MX6Q_SOURCE  = $(GPU_VIV_BIN_MX6Q_EXTRACT).bin
 
 GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
 
@@ -37,8 +38,10 @@ endif
 # The --auto-accept skips the license check - not needed for us
 # because we have legal-info.
 define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
-	(cd $(BUILD_DIR); \
-		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)
+	(cd $(@D); \
+		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept ; \
+		mv $(GPU_VIV_BIN_MX6Q_EXTRACT)/* ./ ; \
+		rm -rf $(GPU_VIV_BIN_MX6Q_EXTRACT)/)
 endef
 
 # Instead of building, we fix up the inconsistencies that exist
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 4f605d7..124b376 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -8,7 +8,8 @@ IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)
 IMX_LIB_LICENSE_FILES = EULA
-IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
+IMX_LIB_EXTRACT = imx-lib-$(IMX_LIB_VERSION)
+IMX_LIB_SOURCE = $(IMX_LIB_EXTRACT).bin
 
 IMX_LIB_INSTALL_STAGING = YES
 
@@ -34,13 +35,15 @@ IMX_LIB_MAKE_ENV = \
 # Since there's a EULA in the bin file, extract it to imx-lib-x.y.z/EULA
 #
 define IMX_LIB_EXTRACT_CMDS
+	cd $(@D); \
+	sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept ; \
+	mv $(IMX_LIB_EXTRACT)/* ./; \
+	rm -rf $(IMX_LIB_EXTRACT); \
 	awk 'BEGIN      { start=0; } \
 	     /^EOEULA/  { start = 0; } \
 	                { if (start) print; } \
 	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(IMX_LIB_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
+	    $(DL_DIR)/$(IMX_LIB_SOURCE) > EULA
 endef
 
 define IMX_LIB_BUILD_CMDS
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index d52158c..2baa4a4 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -6,7 +6,8 @@
 
 LIBFSLCODEC_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
-LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
+LIBFSLCODEC_EXTRACT = libfslcodec-$(LIBFSLCODEC_VERSION)
+LIBFSLCODEC_SOURCE = $(LIBFSLCODEC_EXTRACT).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
 # This is a legal minefield: the EULA in the bin file specifies that
@@ -24,13 +25,15 @@ LIBFSLCODEC_INSTALL_STAGING = YES
 # Since the EULA in the bin file differs from the one in the tar file,
 # extract the one from the bin file as well.
 define LIBFSLCODEC_EXTRACT_CMDS
+	cd $(@D); \
+	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept ; \
+	mv $(LIBFSLCODEC_EXTRACT)/* ./ ; \
+	rm -rf $(LIBFSLCODEC_EXTRACT)/* ; \
 	awk 'BEGIN      { start=0; } \
 	     /^EOEULA/  { start = 0; } \
 	                { if (start) print; } \
 	     /<<EOEULA/ { start=1; }'\
 	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
 endef
 
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 0d92e02..4c4e903 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -6,7 +6,8 @@
 
 LIBFSLPARSER_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
-LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
+LIBFSLPARSER_EXTRACT = libfslparser-$(LIBFSLPARSER_VERSION)
+LIBFSLPARSER_SOURCE = $(LIBFSLPARSER_EXTRACT).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
 # This is a legal minefield: the EULA in the bin file specifies that
@@ -24,13 +25,15 @@ LIBFSLPARSER_INSTALL_STAGING = YES
 # Since the EULA in the bin file differs from the one in the tar file,
 # extract the one from the bin file as well.
 define LIBFSLPARSER_EXTRACT_CMDS
+	cd $(@D); \
+	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept; \
+	mv $(LIBFSLPARSER_EXTRACT)/* ./; \
+	rm -rf $(LIBFSLPARSER_EXTRACT)/; \
 	awk 'BEGIN      { start=0; } \
 	     /^EOEULA/  { start = 0; } \
 	                { if (start) print; } \
 	     /<<EOEULA/ { start=1; }'\
 	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
 endef
 
 # The Makefile installs several versions of the libraries, but we only
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 75c9887..67ac95b 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -6,7 +6,8 @@
 
 LIBFSLVPUWRAP_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
-LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
+LIBFSLVPUWRAP_EXTRACT = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION)
+LIBFSLVPUWRAP_SOURCE = $(LIBFSLVPUWRAP_EXTRACT).bin
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
 # N.B.: the content of the two license files is different
 LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt
@@ -24,13 +25,15 @@ LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
 # Since the EULA in the bin file differs from the one in the tar file,
 # extract the one from the bin file as well.
 define LIBFSLVPUWRAP_EXTRACT_CMDS
+	cd $(@D); \
+	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept; \
+	mv $(LIBFSLVPUWRAP_EXTRACT)/* ./; \
+	rm -rf $(LIBFSLVPUWRAP_EXTRACT); \
 	awk 'BEGIN      { start=0; } \
 	     /^EOEULA/  { start = 0; } \
 	                { if (start) print; } \
 	     /<<EOEULA/ { start=1; }'\
 	    $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept
 endef
 
 $(eval $(autotools-package))
-- 
1.8.3.2
