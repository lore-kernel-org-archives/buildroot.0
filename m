From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun, 29 Sep 2013 15:54:58 -0700
Subject: [Buildroot] [PATCH 4/4] i.MX: Bump library versions to latest
	release (3.0.35-4.1.0)
In-Reply-To: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380495298-22823-5-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset updates the Freescale gstreamer and GPU libraries
to the latest release (3.0.35_4.1.0).

Note that the package names refer to and are compatible with
an alpha release of kernel version 3.5.7, and the package
release versions reflect that by using the nomenclature
3.5.7_1.0.0.

The primary release package (based on LTIB) is available
here and includes documentation.
	https://community.freescale.com/docs/DOC-95560

The 3.5.7 kernel sources are available here:
	http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=imx_3.5.7_1.0.0_alpha

Note that there are some structural changes for various
packages in this release:
	- gpu-viv-bin-mx6q gains two variants for ARMEL (sfp)
	and ARMHF (hfp).
	- imx-lib and libfslvpuwrap packages are distributed
	as self-extracting shell scripts requiring acceptance
	of an end-user license agreement (EULA).

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 package/freescale-imx/freescale-imx.mk               |  2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk             |  6 +++++-
 package/freescale-imx/imx-lib/imx-lib.mk             | 16 ++++++++++++++--
 package/freescale-imx/libfslcodec/libfslcodec.mk     |  2 +-
 package/freescale-imx/libfslparser/libfslparser.mk   |  4 +++-
 package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk | 20 +++++++++++++++++++-
 6 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 47e7be2..2762972 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 1.1.0
+FREESCALE_IMX_VERSION = 3.5.7-1.0.0
 
 FREESCALE_IMX_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 #FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
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
diff --git a/package/freescale-imx/libfslcodec/libfslcodec.mk b/package/freescale-imx/libfslcodec/libfslcodec.mk
index ad1cc63..d52158c 100644
--- a/package/freescale-imx/libfslcodec/libfslcodec.mk
+++ b/package/freescale-imx/libfslcodec/libfslcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 3.0.1
+LIBFSLCODEC_VERSION = $(FREESCALE_IMX_VERSION)
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
diff --git a/package/freescale-imx/libfslparser/libfslparser.mk b/package/freescale-imx/libfslparser/libfslparser.mk
index 3aab3a7..1aa975b 100644
--- a/package/freescale-imx/libfslparser/libfslparser.mk
+++ b/package/freescale-imx/libfslparser/libfslparser.mk
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
diff --git a/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk b/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
index 346a20a..45193c4 100644
--- a/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
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
