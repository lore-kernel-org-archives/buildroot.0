From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:02 +0200
Subject: [Buildroot] [PATCH 02/14] freescale-imx: update imx-lib package
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <9d9f29b2bb24fe1dc3210a79a48f0ece79a6fb88.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

The include files from the FSL kernel are properly separated out in
uapi, so we must include that instead of the kernel-side headers.

imx-lib no longer includes VPU code and therefore is now free from
Freescale License. It is now LGPLv2.1+.

Also, it is now provided as a normal .tar.gz, so _SOURCE is no longer
needed. So, remove our custom _EXTRACT_CMDS.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: _SOURCE is no longer needed, rework commit
 log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 package/freescale-imx/imx-lib/imx-lib.mk | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 4f605d7..ecaee25 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -6,9 +6,8 @@
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
-IMX_LIB_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)
+IMX_LIB_LICENSE = LGPLv2.1+
 IMX_LIB_LICENSE_FILES = EULA
-IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
 
 IMX_LIB_INSTALL_STAGING = YES
 
@@ -17,7 +16,7 @@ IMX_LIB_DEPENDENCIES += linux
 IMX_LIB_INCLUDE = \
 	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
 	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
-	-idirafter $(LINUX_DIR)/include
+	-idirafter $(LINUX_DIR)/include/uapi
 
 IMX_LIB_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
@@ -26,23 +25,6 @@ IMX_LIB_MAKE_ENV = \
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
1.9.1
