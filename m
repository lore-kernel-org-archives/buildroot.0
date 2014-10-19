From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 11:52:32 +0200
Subject: [Buildroot] [git commit] fs/iso9660: add dependencies for make
	source
Message-ID: <20141019095316.1776BA387D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4a436f5e4a96a90051dc8265878f5a370343702
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "iso image" rootfs target is a special one, as it does not use the
ROOTFS_TARGET infrastructure. The absence of ROOTFS_*_DEPENDENCIES
variable makes "make source" to skip this target's dependencies
(namely host-cdrkit and it's children) obstructing an offline build.

[Thomas: add the rootfs-iso9660-show-depends target, so that 'make
graph-depends' doesn't break when iso9660 is selected.]

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b0e755d..908f0e9 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -10,7 +10,9 @@
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
+ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
+
+$(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
@@ -41,6 +43,9 @@ endif
 
 rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 
+rootfs-iso9660-show-depends:
+	@echo $(ROOTFS_ISO9660_DEPENDENCIES)
+
 ################################################################################
 #
 # Toplevel Makefile options
