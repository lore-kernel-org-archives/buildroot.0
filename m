From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:46 -0700
Subject: [Buildroot] [PATCH v2 03/11] freescale-imx: update imx-lib package
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-4-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imx-lib no longer includes VPU code and therefore is now free from Freescale
License.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/imx-lib/imx-lib.mk | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 4f605d7..2a94430 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -6,9 +6,9 @@
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
-IMX_LIB_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)
+IMX_LIB_LICENSE = LGPLv2.1+
 IMX_LIB_LICENSE_FILES = EULA
-IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
+IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).tar.gz
 
 IMX_LIB_INSTALL_STAGING = YES
 
@@ -17,7 +17,7 @@ IMX_LIB_DEPENDENCIES += linux
 IMX_LIB_INCLUDE = \
 	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
 	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
-	-idirafter $(LINUX_DIR)/include
+	-idirafter $(LINUX_DIR)/include/uapi
 
 IMX_LIB_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
@@ -26,23 +26,6 @@ IMX_LIB_MAKE_ENV = \
 	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
 	INCLUDE="$(IMX_LIB_INCLUDE)"
 
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (imx-lib-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since there's a EULA in the bin file, extract it to imx-lib-x.y.z/EULA
-#
-define IMX_LIB_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(IMX_LIB_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
-endef
-
 define IMX_LIB_BUILD_CMDS
 	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
-- 
2.0.0
