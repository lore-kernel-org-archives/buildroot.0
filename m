From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:31:10 +0100
Subject: [Buildroot] [git commit] uboot-tools: add option for dumpimage
Message-ID: <20160302202757.BDAAC7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7993116ab530e7100b08dc5ee9eefff3a651496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tool dumpimage extracts data from U-Boot images.
U-Boot added dumpimage tool on release 2014.01.
This commit allows installation on target and host.

Signed-off-by: Paulo Zaneti <paulo.zaneti@datacom.ind.br>
Tested-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/Config.in      | 6 ++++++
 package/uboot-tools/uboot-tools.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index e2c621c..aca310b 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -53,4 +53,10 @@ config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	  bootloader, which allows access to the U-Boot environment
 	  from Linux.
 
+config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
+	bool "dumpimage"
+	help
+	  The dumpimage tool from Das U-Boot bootloader, which allows
+	  extraction of data from U-Boot images.
+
 endif
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 3150279..264e9dd 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -52,10 +52,17 @@ define UBOOT_TOOLS_INSTALL_FWPRINTENV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
+define UBOOT_TOOLS_INSTALL_DUMPIMAGE
+	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(TARGET_DIR)/usr/sbin/dumpimage
+endef
+endif
+
 define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
+	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 endef
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
@@ -79,6 +86,7 @@ endef
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/usr/bin/mkenvimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/usr/bin/dumpimage
 endef
 
 $(eval $(generic-package))
