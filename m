From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 29 Apr 2016 09:56:59 +0200
Subject: [Buildroot] [PATCH 2/3] uboot-tools: install libubootenv to staging
In-Reply-To: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1461916620-5170-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libubootenv is required by swupdate.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/uboot-tools/uboot-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f47b3db..ed17fba 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -9,6 +9,7 @@ UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
+UBOOT_TOOLS_INSTALL_STAGING = YES
 
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
@@ -50,6 +51,9 @@ define UBOOT_TOOLS_INSTALL_FWPRINTENV
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 endef
+define UBOOT_TOOLS_INSTALL_LIBUBOOTENV
+	$(INSTALL) -D -m 0755 $(@D)/tools/env/lib.a $(STAGING_DIR)/usr/lib/libubootenv.a
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
@@ -58,6 +62,10 @@ define UBOOT_TOOLS_INSTALL_DUMPIMAGE
 endef
 endif
 
+define UBOOT_TOOLS_INSTALL_STAGING_CMDS
+	$(UBOOT_TOOLS_INSTALL_LIBUBOOTENV)
+endef
+
 define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
-- 
2.8.0
