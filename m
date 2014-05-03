From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:49:00 +0200
Subject: [Buildroot] [git commit] boot/syslinux: bump version
Message-ID: <20140503200856.14C5C9CAD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93be225d928cf659c7a2dffd9bb3ce165a1b50b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version has a very, very weird build system. There are different
images that syslinux can now build:
  - the plain legacy-bios images we already supported previously
  - two new EFI32 and EFI64 applications

To build one or the other, the Makefile accepts one or more of:
    make (bios|efi32|efi64)

Specify all of them, and it builds all. Specify 'install', and it installs
all of them, as one may expect.

Still a regular behaviour, is to build only a subset (down to one):
    make bios           <-- builds just the legacy-bios images
    make efi32 bios     <-- builds just the legacy-bios and efi32 images

Where it gets weird is the install procedure. Can you guess how it's done?
Hint: the syslinux guys have invented the multiple-argument parsing in
pure Makefiles. To build then install only the bios images, one would do:
    make bios
    make bios install

Yep, that's it. make bios install. Two arguments, one action.

That makes for some funky workarounds in our install procedure...

'bios' is the only image we support so far, with efi to come in a future
patch.

Using MAKE1, as there are issues with highly-parallel builds.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk |   32 ++++++++++++++++++++++++--------
 1 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index ee71a0a..2c197df 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,32 +4,48 @@
 #
 ################################################################################
 
-SYSLINUX_VERSION = 4.07
-SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
+SYSLINUX_VERSION = 6.02
+SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.xz
+SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/
 
 SYSLINUX_LICENSE = GPLv2+
 SYSLINUX_LICENSE_FILES = COPYING
 
 SYSLINUX_INSTALL_IMAGES = YES
 
-SYSLINUX_DEPENDENCIES = host-nasm host-util-linux
+SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
+
+# The syslinux tarball comes with pre-compiled binaries.
+# Since timestamps might not be in the correct order, a rebuild is
+# not always triggered for all the different images.
+# Cleanup the mess even before we attempt a build, so we indeed
+# build everything from source.
+define SYSLINUX_CLEANUP
+	rm -rf $(@D)/bios $(@D)/efi32 $(@D)/efi64
+endef
+SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" AR="$(HOSTAR)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
+	    AR="$(HOSTAR)" -C $(@D) bios
 endef
 
 # While the actual bootloader is compiled for the target, several
 # utilities for installing the bootloader are meant for the host.
+# Repeat the target, otherwise syslinux will try to build everything
+# Repeat CC and AR, since syslinux really wants to check them at
+# install time
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
+	    AR="$(HOSTAR)" INSTALLROOT=$(HOST_DIR) \
+	    -C $(@D) bios install
 endef
 
-SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += core/isolinux.bin
-SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += core/pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
 
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
