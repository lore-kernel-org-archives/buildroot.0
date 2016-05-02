From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  2 May 2016 13:16:53 +0200
Subject: [Buildroot] [PATCH v3 1/3] uboot-tools: install libubootenv to
	staging
Message-ID: <1462187815-2414-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libubootenv is required by swupdate.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v3:
 - install the library header file fw_env.h to staging, too
v2:
 - install the static library to staging unconditionally (Thomas Petazzoni)
---
 package/uboot-tools/uboot-tools.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f47b3db..bc8e7c1 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -9,6 +9,7 @@ UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
+UBOOT_TOOLS_INSTALL_STAGING = YES
 
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
@@ -58,6 +59,15 @@ define UBOOT_TOOLS_INSTALL_DUMPIMAGE
 endef
 endif
 
+define UBOOT_TOOLS_INSTALL_LIBUBOOTENV
+	$(INSTALL) -D -m 0755 $(@D)/tools/env/lib.a $(STAGING_DIR)/usr/lib/libubootenv.a
+	$(INSTALL) -D -m 0644 $(@D)/tools/env/fw_env.h $(STAGING_DIR)/usr/include/fw_env.h
+endef
+
+define UBOOT_TOOLS_INSTALL_STAGING_CMDS
+	$(UBOOT_TOOLS_INSTALL_LIBUBOOTENV)
+endef
+
 define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
-- 
2.8.2
