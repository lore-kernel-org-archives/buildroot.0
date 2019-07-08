From: Alistair Francis <alistair.francis@wdc.com>
Date: Mon,  8 Jul 2019 14:53:51 -0700
Subject: [Buildroot] [PATCH 1/2] boot/opensbi: Add support for including
 Linux payload
Message-ID: <20190708215353.9107-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 boot/opensbi/Config.in  |  9 +++++++++
 boot/opensbi/opensbi.mk | 22 +++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 5f3cc13312..5cb8aace3e 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -22,4 +22,13 @@ config BR2_TARGET_OPENSBI_PLAT
 	  library libsbi.a is built. If a platform is specified then
 	  the platform specific static library libplatsbi.a and firmware
 	  examples are built.
+
+if BR2_TARGET_OPENSBI_PLAT != ""
+config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
+	bool "Include Linux as OpenSBI Payload"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_LINUX_KERNEL_IMAGE
+	help
+	  Build OpenSBI with the Linux kernel as a Payload.
+endif
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 45a3fc4859..2179d846e3 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -19,18 +19,34 @@ ifneq ($(OPENSBI_PLAT),)
 OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
 endif
 
+OPENSBI_LINUX_PAYLOAD = $(call qstrip,$(BR2_TARGET_OPENSBI_LINUX_PAYLOAD))
+ifeq ($(OPENSBI_LINUX_PAYLOAD), y)
+OPENSBI_DEPENDENCIES = linux
+OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
+endif
+
 define OPENSBI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 ifneq ($(OPENSBI_PLAT),)
 OPENSBI_INSTALL_IMAGES = YES
-define OPENSBI_INSTALL_IMAGES_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
+OPENSBI_INSTALL_IMAGES_CMDS_PLAT = \
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin; \
 	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
-endef
 endif
 
+ifeq ($(OPENSBI_LINUX_PAYLOAD), y)
+OPENSBI_INSTALL_IMAGES_CMDS_PAYLOAD = \
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_payload.bin $(BINARIES_DIR)/fw_payload.bin; \
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_payload.elf $(BINARIES_DIR)/fw_payload.elf
+endif
+
+define OPENSBI_INSTALL_IMAGES_CMDS
+	$(OPENSBI_INSTALL_IMAGES_CMDS_PLAT)
+	$(OPENSBI_INSTALL_IMAGES_CMDS_PAYLOAD)
+endef
+
 # libsbi.a is not a library meant to be linked in user-space code, but
 # with bare metal code, which is why we don't install it in
 # $(STAGING_DIR)/usr/lib
-- 
2.22.0
