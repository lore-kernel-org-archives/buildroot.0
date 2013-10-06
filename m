From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun,  6 Oct 2013 12:47:48 -0700
Subject: [Buildroot] [PATCH 2/2] i.MX: Update versions to match latest
	Freescale release
In-Reply-To: <1381088868-12739-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1381088868-12739-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1381088868-12739-3-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 package/freescale-imx/freescale-imx.mk               |  6 ++----
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk             |  6 +++++-
 package/freescale-imx/imx-lib/imx-lib.mk             | 16 ++++++++++++++--
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk |  2 +-
 package/libfslcodec/libfslcodec.mk                   |  2 +-
 package/libfslparser/libfslparser.mk                 |  4 +++-
 package/libfslvpuwrap/libfslvpuwrap.mk               | 20 +++++++++++++++++++-
 7 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 0dd5629..39ffa8a 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 1.1.0
-
-# No official download site from freescale, just this mirror
-FREESCALE_IMX_SITE   = http://download.ossystems.com.br/bsp/freescale/source
+FREESCALE_IMX_VERSION = 3.5.7-1.0.0
+FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 8e979ee..e799fd2 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
-GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
+ifeq ($(BR2_ARM_EABIHF),y)
+GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
+else
+GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
+endif
 GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
 GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index e1a68ef..416bb1b 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -6,8 +6,8 @@
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
-IMX_LIB_LICENSE = LGPLv2.1+
-# No license file included
+IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement
+IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
 
 IMX_LIB_INSTALL_STAGING = YES
 
@@ -25,6 +25,18 @@ IMX_LIB_MAKE_ENV = \
 	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
 	INCLUDE="$(IMX_LIB_INCLUDE)"
 
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (imx-lib-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since the EULA in the bin file differs from the one in the tar file,
+# extract the one from the bin file as well.
+define IMX_LIB_EXTRACT_CMDS
+	(cd $(BUILD_DIR); \
+		sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept)
+endef
+
 define IMX_LIB_BUILD_CMDS
 	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 4437875..9ec92d8 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_FSL_PLUGINS_VERSION = 3.0.1
+GST_FSL_PLUGINS_VERSION = $(FREESCALE_IMX_VERSION)
 GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index ad1cc63..d52158c 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 3.0.1
+LIBFSLCODEC_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 3aab3a7..1aa975b 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = 3.0.1
+LIBFSLPARSER_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
@@ -36,4 +36,6 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
+LIBFSLPARSER_AUTORECONF = YES
+
 $(eval $(autotools-package))
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 346a20a..45193c4 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 1.0.17
+LIBFSLVPUWRAP_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
+LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
@@ -14,4 +15,21 @@ LIBFSLVPUWRAP_INSTALL_STAGING = YES
 
 LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
 
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (libfslvpuwrap-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since the EULA in the bin file differs from the one in the tar file,
+# extract the one from the bin file as well.
+define LIBFSLVPUWRAP_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept
+endef
+
 $(eval $(autotools-package))
-- 
1.8.1.2
