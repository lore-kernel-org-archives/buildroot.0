From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:44:14 +0200
Subject: [Buildroot] [git commit] syslinux: install helper programs to the
	host
Message-ID: <20140420095635.8363A9C82B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e0d4118982ae5a29e462f0a476d82772459cf5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though syslinux is built for the target, it does create helper
programs intended to be run on the host such as syslinux and extlinux.
This change installs these helper programs to the host so that they may be
called by post image creation scripts.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index eedc364..7b3f9cf 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -11,7 +11,6 @@ SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 SYSLINUX_LICENSE = GPLv2+
 SYSLINUX_LICENSE_FILES = COPYING
 
-SYSLINUX_INSTALL_TARGET = NO
 SYSLINUX_INSTALL_IMAGES = YES
 
 SYSLINUX_DEPENDENCIES = host-nasm host-util-linux
@@ -23,6 +22,12 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" AR="$(HOSTAR)" -C $(@D)
 endef
 
+define SYSLINUX_INSTALL_TARGET_CMDS
+	# While the actual bootloader is compiled for the target, several
+	# utilities for installing the bootloader are meant for the host.
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
+endef
+
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
 
