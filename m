From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 09:46:03 +0200
Subject: [Buildroot] [git commit] boot/opensbi: add support for including
 Linux payload
Message-ID: <20190803083010.32C6D8D4D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b5b7165deb91bad3cdb1ea0dd8f940eff75f3a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Thomas:
 - Config.in: move the BR2_TARGET_OPENSBI_PLAT dependency to a
   "depends on", there's no need to have an if...endif block just for
   that.
 - Config.in: drop the BR2_TARGET_OPENSBI_LIBRARY_ONLY dependency,
   since this option doesn't exist
 - opensbi.mk: don't use qstrip on BR2_TARGET_OPENSBI_LINUX_PAYLOAD,
   since it's a boolean option
 - opensbi.mk: use += when adding linux to DEPENDENCIES
 - opensbki.mk: refactor the firmware file installation with a loop]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/opensbi/Config.in  |  9 +++++++++
 boot/opensbi/opensbi.mk | 22 +++++++++++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 5f3cc13312..b9b0ace8af 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -22,4 +22,13 @@ config BR2_TARGET_OPENSBI_PLAT
 	  library libsbi.a is built. If a platform is specified then
 	  the platform specific static library libplatsbi.a and firmware
 	  examples are built.
+
+config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
+	bool "Include Linux as OpenSBI Payload"
+	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_LINUX_KERNEL_IMAGE
+	help
+	  Build OpenSBI with the Linux kernel as a Payload.
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 83552a5442..e202bd0b97 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -19,19 +19,31 @@ ifneq ($(OPENSBI_PLAT),)
 OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
 endif
 
+ifeq ($(BR2_TARGET_OPENSBI_LINUX_PAYLOAD),y)
+OPENSBI_DEPENDENCIES += linux
+OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
+endif
+
 define OPENSBI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 ifneq ($(OPENSBI_PLAT),)
 OPENSBI_INSTALL_IMAGES = YES
+OPENSBI_FW_IMAGES += jump dynamic
+ifeq ($(BR2_TARGET_OPENSBI_LINUX_PAYLOAD),y)
+OPENSBI_FW_IMAGES += payload
+endif
+endif
+
 define OPENSBI_INSTALL_IMAGES_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
-	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
-	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.bin $(BINARIES_DIR)/fw_dynamic.bin
-	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.elf $(BINARIES_DIR)/fw_dynamic.elf
+	$(foreach f,$(OPENSBI_FW_IMAGES),\
+		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).bin \
+			$(BINARIES_DIR)/fw_$(f).bin
+		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).elf \
+			$(BINARIES_DIR)/fw_$(f).elf
+	)
 endef
-endif
 
 # libsbi.a is not a library meant to be linked in user-space code, but
 # with bare metal code, which is why we don't install it in
