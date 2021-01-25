From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 25 Jan 2021 08:57:42 -0600
Subject: [Buildroot] [PATCH 2/2] package/uboot-tools: env/script generation
 need BINARIES_DIR
In-Reply-To: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>

The host build of uboot-tools can occur early in the build process and may
require the creation of BINARIES_DIR before generation of an enabled envimage
and/or boot script binary.

Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 10cbd1cdd9..f9ff170266 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -128,6 +128,7 @@ endif
 
 define HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE
 	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)
+	mkdir -p $(BINARIES_DIR)
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
 		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
 		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
@@ -164,6 +165,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 	$(HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE)
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT),
+		mkdir -p $(BINARIES_DIR); \
 		$(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
 			-d $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)) \
 			$(BINARIES_DIR)/boot.scr)
-- 
2.17.1
