From: Andreas Ziegler <br015@umbiko.net>
Date: Tue, 09 Mar 2021 18:25:17 +0000
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: fix build failure
 when no firmware item selected
Message-ID: <539abc1b8ea48daa694b45242cab63d0@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest change in Linux firmware handling breaks the build if no 
specific firmware item is selected below BR2_PACKAGE_LINUX_FIRMWARE.

The firmware archive is only created if at least one firmware 
sub-category is selected; the installation step wants to unpack the 
archive unconditionally.

Use the same condition to control install command definition as in the 
build step.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>

diff --git a/package/linux-firmware/linux-firmware.mk 
b/package/linux-firmware/linux-firmware.mk
index 5e92b0446e..5dfc4a657d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -675,6 +675,7 @@ endif
  # sure we canonicalize the pointed-to file, to cover the symlinks of 
the form
  # a/foo -> ../b/foo  where a/ (the directory where to put the symlink) 
does
  # not yet exist.
+ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
  define LINUX_FIRMWARE_INSTALL_FW
         mkdir -p $(1)
         $(TAR) xf $(@D)/br-firmware.tar -C $(1)
@@ -695,5 +696,6 @@ endef
  define LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
         $(call LINUX_FIRMWARE_INSTALL_FW, $(BINARIES_DIR))
  endef
+endif # LINUX_FIRMWARE_FILES || LINUX_FIRMWARE_DIRS

  $(eval $(generic-package))
