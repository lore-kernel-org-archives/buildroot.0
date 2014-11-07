From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 17:03:24 +0100
Subject: [Buildroot] [PATCH 4/7] libfsl*: Use self-extractible helper
In-Reply-To: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
References: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415376207-23292-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libfslcodec/libfslcodec.mk     | 23 ++++-------------------
 package/libfslparser/libfslparser.mk   | 23 ++++-------------------
 package/libfslvpuwrap/libfslvpuwrap.mk | 24 +++++-------------------
 3 files changed, 13 insertions(+), 57 deletions(-)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index 1a364bb..7c6bed3 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -7,30 +7,15 @@
 LIBFSLCODEC_VERSION = 3.0.11
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
+LIBFSLCODEC_INSTALL_STAGING = YES
+
+# See freescale-imx.mk
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
-# This is a legal minefield: the EULA in the bin file specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
 LIBFSLCODEC_REDISTRIBUTE = NO
 
-LIBFSLCODEC_INSTALL_STAGING = YES
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslcodec-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
 define LIBFSLCODEC_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBFSLCODEC_SOURCE))
 endef
 
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index d52b151..16f5587 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -7,30 +7,15 @@
 LIBFSLPARSER_VERSION = 3.0.11
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
+LIBFSLPARSER_INSTALL_STAGING = YES
+
+# See freescale-imx.mk
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
-# This is a legal minefield: the EULA in the bin file specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
 LIBFSLPARSER_REDISTRIBUTE = NO
 
-LIBFSLPARSER_INSTALL_STAGING = YES
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslparser-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
 define LIBFSLPARSER_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBFSLPARSER_SOURCE))
 endef
 
 # The Makefile installs several versions of the libraries, but we only
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index c3a5c1c..f8c1c6c 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -7,30 +7,16 @@
 LIBFSLVPUWRAP_VERSION = 1.0.46
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
+LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
+LIBFSLVPUWRAP_INSTALL_STAGING = YES
+
+# See freescale-imx.mk
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
-# N.B.: the content of the two license files is different
 LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
 
-LIBFSLVPUWRAP_INSTALL_STAGING = YES
-
-LIBFSLVPUWRAP_DEPENDENCIES += imx-vpu
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslvpuwrap-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
 define LIBFSLVPUWRAP_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBFSLVPUWRAP_SOURCE))
 endef
 
 $(eval $(autotools-package))
-- 
1.9.1
