From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 5 Jan 2014 13:20:39 +0100
Subject: [Buildroot] [PATCH 1/1] Adding extlinux to sysliux binaries copied
 into target/images.
Message-ID: <20140105122039.GA4201@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the mail address I have on Github, which is the reason for the difference
in addresses.


Signed-off-by: Thomas Lundquist <thomasez@redpill-linpro.com>
---
 boot/syslinux/Config.in   | 4 ++++
 boot/syslinux/syslinux.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 2c39e65..5773abb 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -17,4 +17,8 @@ config BR2_TARGET_SYSLINUX_PXELINUX
 	bool "Install pxelinux"
 	default y
 
+config BR2_TARGET_SYSLINUX_EXTLINUX
+	bool "Install extlinux"
+	default y
+
 endif
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index eedc364..bfc2694 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -26,10 +26,17 @@ endef
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
 
+ifeq ($(BR2_TARGET_SYSLINUX_EXTLINUX),y)
+define SYSLINUX_INSTALL_EXTLINUX
+	$(INSTALL) -D -m 0755 $(@D)/extlinux/extlinux $(BINARIES_DIR)/extlinux;
+endef
+endif
+
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
 		$(INSTALL) -D -m 0755 $(@D)/core/$$i $(BINARIES_DIR)/$$i; \
 	done
+    $(SYSLINUX_INSTALL_EXTLINUX)
 endef
 
 
-- 
1.8.3.2


----- End forwarded message -----
