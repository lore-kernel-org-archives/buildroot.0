From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:09:42 +0200
Subject: [Buildroot] [git commit] freescale-imx: add imx-vpu package
Message-ID: <20140715211144.D03E09CE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b701f89eb89e03af58dedf5a14d2c536367f4259
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of 3.10.17-1.0.0 release, VPU code is now in its own package.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: slightly rework the kconfig comment; fold the
 imx-vpu patches into this changeset; add one missing license file]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/Config.in                    |    1 +
 package/freescale-imx/imx-vpu/Config.in            |   16 +++++
 ...-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch |   32 +++++++++++
 ...-lib-fix-IOGetVirtMem-return-value-checks.patch |   59 ++++++++++++++++++++
 package/freescale-imx/imx-vpu/imx-vpu.mk           |   53 ++++++++++++++++++
 5 files changed, 161 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 0626a74..d8c6efc 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -43,6 +43,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
new file mode 100644
index 0000000..cf5ab5f
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IMX_VPU
+	bool "imx-vpu"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Library of userspace helpers specific for the Freescale i.MX
+	  platform. It wraps the kernel interfaces for the i.MX platform
+	  Video Processing Unit (VPU) driver. It requires a kernel that
+	  includes the i.MX specific headers to be built.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
+comment "imx-vpu needs an imx-specific Linux kernel to be built"
+	depends on BR2_arm
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch b/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
new file mode 100644
index 0000000..ed93193
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
@@ -0,0 +1,32 @@
+[PATCH] vpu-io: fix IOSystemInit failure
+
+When using a kernel where user/kernel split is 3G/1G, the address
+returned by IOGetVirtMem() can appear to be a negative int.
+
+IOSystemInit() incorrectly checks the return value of IOGetVirtMem().
+IOGetVirtMem() returns -1 on error (and not MAP_FAILED, nor any other
+negative value.)
+
+Fix that by correctly checking against -1 (and not MAP_FAILED!)
+
+Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
+[yann.morin.1998 at free.fr: expand the commit log]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ vpu/vpu_io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vpu/vpu_io.c b/vpu/vpu_io.c
+index 8cbb571..14759da 100644
+--- a/vpu/vpu_io.c
++++ b/vpu/vpu_io.c
+@@ -265,7 +265,7 @@ int IOSystemInit(void *callback)
+ 		goto err;
+ 	}
+ 
+-	if (IOGetVirtMem(&bit_work_addr) <= 0)
++	if (IOGetVirtMem(&bit_work_addr) == -1)
+ 		goto err;
+ #endif
+ 	UnlockVpu(vpu_semap);
+
diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch b/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
new file mode 100644
index 0000000..583a508
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
@@ -0,0 +1,59 @@
+[PATCH] vpu-lib: fix IOGetVirtMem return value checks
+
+When using a kernel where user/kernel split is 3G/1G, the address
+returned by IOGetVirtMem() can appear to be a negative int.
+
+IOSystemInit() incorrectly checks the return value of IOGetVirtMem().
+IOGetVirtMem() returns -1 on error (and not MAP_FAILED, nor any other
+negative value.)
+
+Fix that by correctly checking against -1 (and not MAP_FAILED!)
+
+Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
+[yann.morin.1998 at free.fr: expand the commit log]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ vpu/vpu_lib.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/vpu/vpu_lib.c b/vpu/vpu_lib.c
+index 1fb731b..7a7f42d 100644
+--- a/vpu/vpu_lib.c
++++ b/vpu/vpu_lib.c
+@@ -1764,7 +1764,7 @@ RetCode vpu_EncStartOneFrame(EncHandle handle, EncParam * param)
+ 				err_msg("Unable to obtain physical mem\n");
+ 				return RETCODE_FAILURE;
+ 			}
+-			if (IOGetVirtMem(&pEncInfo->picParaBaseMem) <= 0) {
++			if (IOGetVirtMem(&pEncInfo->picParaBaseMem) == -1) {
+ 				IOFreePhyMem(&pEncInfo->picParaBaseMem);
+ 				pEncInfo->picParaBaseMem.phy_addr = 0;
+ 				err_msg("Unable to obtain virtual mem\n");
+@@ -2982,7 +2982,7 @@ RetCode vpu_DecGetInitialInfo(DecHandle handle, DecInitialInfo * info)
+ 			UnlockVpu(vpu_semap);
+ 			return RETCODE_FAILURE;
+ 		}
+-		if (IOGetVirtMem(&pDecInfo->userDataBufMem) <= 0) {
++		if (IOGetVirtMem(&pDecInfo->userDataBufMem) == -1) {
+ 			IOFreePhyMem(&pDecInfo->userDataBufMem);
+ 			pDecInfo->userDataBufMem.phy_addr = 0;
+ 			err_msg("Unable to obtain virtual mem\n");
+@@ -4017,7 +4017,7 @@ RetCode vpu_DecStartOneFrame(DecHandle handle, DecParam * param)
+ 				UnlockVpu(vpu_semap);
+ 				return RETCODE_FAILURE;
+ 			}
+-			if (IOGetVirtMem(&pDecInfo->picParaBaseMem) <= 0) {
++			if (IOGetVirtMem(&pDecInfo->picParaBaseMem) == -1) {
+ 				IOFreePhyMem(&pDecInfo->picParaBaseMem);
+ 				pDecInfo->picParaBaseMem.phy_addr = 0;
+ 				err_msg("Unable to obtain virtual mem\n");
+@@ -4057,7 +4057,7 @@ RetCode vpu_DecStartOneFrame(DecHandle handle, DecParam * param)
+ 			UnlockVpu(vpu_semap);
+ 			return RETCODE_FAILURE;
+ 		}
+-		if (IOGetVirtMem(&pDecInfo->userDataBufMem) <= 0) {
++		if (IOGetVirtMem(&pDecInfo->userDataBufMem) == -1) {
+ 			IOFreePhyMem(&pDecInfo->userDataBufMem);
+ 			pDecInfo->userDataBufMem.phy_addr = 0;
+ 			err_msg("Unable to obtain virtual mem\n");
+
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
new file mode 100644
index 0000000..f7e7ab6
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# imx-vpu
+#
+################################################################################
+
+IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_VPU_SITE    = $(FREESCALE_IMX_SITE)
+IMX_VPU_LICENSE = Freescale License
+IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
+IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
+
+IMX_VPU_INSTALL_STAGING = YES
+
+# imx-vpu needs access to imx-specific kernel headers
+IMX_VPU_DEPENDENCIES += linux
+IMX_VPU_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
+	INCLUDE="-idirafter $(LINUX_DIR)/include"
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (imx-vpu-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since there's a EULA in the bin file, extract it to imx-vpu-x.y.z/EULA
+#
+define IMX_VPU_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(IMX_VPU_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept
+endef
+
+define IMX_VPU_BUILD_CMDS
+	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define IMX_VPU_INSTALL_STAGING_CMDS
+	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
+endef
+
+define IMX_VPU_INSTALL_TARGET_CMDS
+	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
