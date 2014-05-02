From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:37 +0200
Subject: [Buildroot] [PATCH 11/12] boot/syslinux: add option to install c32
	modules
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <f66cc7a87e5bcdc8a958dc40444541c4063cd5ab.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 boot/syslinux/Config.in   | 10 ++++++++++
 boot/syslinux/syslinux.mk |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 28c5329..f4b9870 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -46,4 +46,14 @@ config BR2_TARGET_SYSLINUX_EFI
 
 endchoice
 
+if BR2_TARGET_SYSLINUX_LEGACY_BIOS
+
+config BR2_TARGET_SYSLINUX_C32
+	string "modules to install"
+	help
+	  Enter a space-separated list of .c32 modules to install.
+	  Leave empty to install no module.
+
+endif # BR2_TARGET_SYSLINUX_LEGACY_BIOS
+
 endif # BR2_TARGET_SYSLINUX
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 5432d0a..e627f48 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -63,10 +63,19 @@ SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_MBR) += bios/mbr/mbr.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.efi
 
+SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
+
+# We install the c32 modules from the host-installed tree, they are all
+# neatly installed in the same location, while they are scaterred around
+# everywhere in the build tree.
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/$${i##*/}; \
 	done
+	for i in $(SYSLINUX_C32); do \
+		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
+				   $(BINARIES_DIR)/$${i}; \
+	done
 endef
 
 $(eval $(generic-package))
-- 
1.8.3.2
