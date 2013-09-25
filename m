From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 25 Sep 2013 12:07:52 -0700
Subject: [Buildroot] [PATCH 4/4] i.MX6: Update Freescale
	hardware-acceleration bits to latest versions
In-Reply-To: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380136072-9879-5-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset updates the Freescale gstreamer and GPU libraries
to the latest release (3.0.35_4.1.0).

Note that the package names refer to and are compatible with
an alpha release of kernel version 3.5.7.

The primary release package (based on LTIB) is available
here and includes documentation.
	https://community.freescale.com/docs/DOC-95560

The 3.5.7 kernel sources are available here:
	http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=imx_3.5.7_1.0.0_alpha

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 package/freescale-imx/freescale-imx.mk             |  4 ++--
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  8 +++++---
 package/freescale-imx/imx-lib/imx-lib.mk           | 11 ++++++++++-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  4 ++--
 package/libfslcodec/libfslcodec.mk                 |  4 ++--
 package/libfslparser/libfslparser.mk               |  8 +++++---
 package/libfslvpuwrap/libfslvpuwrap.mk             | 22 ++++++++++++++++++++--
 7 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index d35a62e..42ef11c 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 1.1.0
+FREESCALE_IMX_VERSION = 3.5.7-1.0.0
 
 # No official download site from freescale, just this mirror
-FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
+FREESCALE_IMX_MIRROR_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index c48d108..499f617 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -3,8 +3,12 @@
 # gpu-viv-bin-mx6q
 #
 ################################################################################
+ifeq ($(BR2_ARM_EABIHF),y)
+GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
+else
+GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
+endif
 
-GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
 GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
 GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
@@ -30,8 +34,6 @@ endif
 # The archive is a shell-self-extractor of a bzipped tar. It happens
 # to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
 # The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
 define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
 	(cd $(BUILD_DIR); \
 		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index bd7e174..e3c29b1 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -6,7 +6,8 @@
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
-IMX_LIB_LICENSE = LGPLv2.1+
+IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
+IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement
 # No license file included
 
 IMX_LIB_INSTALL_STAGING = YES
@@ -25,6 +26,14 @@ IMX_LIB_MAKE_ENV = \
 	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
 	INCLUDE="$(IMX_LIB_INCLUDE)"
 
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (imx-lib-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+define IMX_LIB_EXTRACT_CMDS
+	(cd $(BUILD_DIR); \
+		sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept)
+endef
+
 define IMX_LIB_BUILD_CMDS
 	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index ccdb521..c46073d 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GST_FSL_PLUGINS_VERSION = 3.0.1
+GST_FSL_PLUGINS_VERSION = 3.5.7-1.0.0
 # No official download site from freescale, just this mirror
-GST_FSL_PLUGINS_SITE = http://download.ossystems.com.br/bsp/freescale/source
+GST_FSL_PLUGINS_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
 # LGPLv2.1+, which essentially makes it LGPLv2.1+
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index c18332a..b1991f8 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 3.0.1
+LIBFSLCODEC_VERSION = 3.5.7-1.0.0
 # No official download site from freescale, just this mirror
-LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLCODEC_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 3e27a6a..66068fe 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = 3.0.1
+LIBFSLPARSER_VERSION = 3.5.7-1.0.0
 # No official download site from freescale, just this mirror
-LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLPARSER_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
@@ -31,7 +31,9 @@ define LIBFSLPARSER_EXTRACT_CMDS
 	     /<<EOEULA/ { start=1; }'\
 	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
 	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
+	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept ; \
+	cd libfslparser-3.5.7-1.0.0; \
+	pwd && sh ./autogen.sh
 endef
 
 # The Makefile installs several versions of the libraries, but we only
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 1bc7129..cf11968 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 1.0.17
+LIBFSLVPUWRAP_VERSION = 3.5.7-1.0.0
 # No official download site from freescale, just this mirror
-LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLVPUWRAP_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
+LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
@@ -15,4 +16,21 @@ LIBFSLVPUWRAP_INSTALL_STAGING = YES
 
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
