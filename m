From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 22:05:06 +0200
Subject: [Buildroot] [git commit] boot/syslinux: add option to install c32
	modules
Message-ID: <20140503200856.3745E9CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d98e0457f35300b069fbe5d5115cf20c7e6dd88d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: reworded comment slightly]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/Config.in   |   10 ++++++++++
 boot/syslinux/syslinux.mk |    9 +++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

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
index 5432d0a..c46c7b2 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -63,10 +63,19 @@ SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_MBR) += bios/mbr/mbr.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.efi
 
+SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
+
+# We install the c32 modules from the host-installed tree, where they
+# are all neatly installed in a single location, while they are
+# scattered around everywhere in the build tree.
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
