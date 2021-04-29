From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Apr 2021 09:46:33 +0200
Subject: [Buildroot] [PATCH 2/4] boot/opensbi: allow using U-Boot as a
 payload
In-Reply-To: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210429074636.724046-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opensbi package already allows to use Linux as a payload for
OpenSBI, but in some cases, U-Boot as payload is useful. This commit
adds a BR2_TARGET_OPENSBI_UBOOT_PAYLOAD option, modeled after the
existing BR2_TARGET_OPENSBI_LINUX_PAYLOAD.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/opensbi/Config.in  | 7 +++++++
 boot/opensbi/opensbi.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 83f40f04fa..236bf74a90 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -82,4 +82,11 @@ config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
 	help
 	  Build OpenSBI with the Linux kernel as a Payload.
 
+config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
+	bool "Include U-Boot as OpenSBI Payload"
+	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on BR2_TARGET_UBOOT
+	help
+	  Build OpenSBI with the U-Boot as a Payload.
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 250a6078af..8ebe4566fd 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -41,6 +41,11 @@ OPENSBI_DEPENDENCIES += linux
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
 endif
 
+ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
+OPENSBI_DEPENDENCIES += uboot
+OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
+endif
+
 define OPENSBI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
 endef
@@ -51,6 +56,9 @@ OPENSBI_FW_IMAGES += jump dynamic
 ifeq ($(BR2_TARGET_OPENSBI_LINUX_PAYLOAD),y)
 OPENSBI_FW_IMAGES += payload
 endif
+ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
+OPENSBI_FW_IMAGES = payload
+endif
 endif
 
 define OPENSBI_INSTALL_IMAGES_CMDS
-- 
2.30.2
