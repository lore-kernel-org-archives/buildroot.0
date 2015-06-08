From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 00:21:33 +0200
Subject: [Buildroot] [PATCHv2 00/15] iso9660 support improvements
Message-ID: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The following patch series brings a number of improvements to the
ISO9660 support. It takes into account some of the patches that have
been submitted on the topic, and that still sit in patchwork due to
the patches not being completely appropriate, and hopefully
re-implement the same features (and more) in a solution that is
acceptable in Buildroot.

The main features are:

 * Ability to put the root filesystem directly as the ISO9660
   filesystem, instead of having to use an initrd/initramfs to embed
   the root filesystem.

 * Support for using isolinux or Grub2 as alternate bootloaders to
   grub.

 * Support for generating hybrid ISO images (which can boot from
   either CD-ROM or USB keys), when isolinux is used.

Changes since v1:

 - Use $(BUILD_DIR)/rootfs-iso9660.tmp instead of $(BUILD_DIR)/iso9660
   as the temporary directory, as suggested by Yann.

 - Leave the temporary directory around after the build, as suggested
   by Arnout. This allows to remove the need for <fs>_POST_GEN_HOOKS.

 - Invert logic for the splash screen test in order to use positive
   logic. Suggested by Yann.

 - Put the simple "fs/iso9660: use if ... endif block instead of
   depends on" patch earlier in the series. Suggested by Yann.

 - Add Acked-by to the different patches when provided, and when the
   corresponding patches have not been changed in any significant way.

 - Fixed commit log for "fs/iso9660: change the location of the splash
   image", as noticed by Yann.

 - Add patch to install the Grub splash image from $(TARGET_DIR)
   instead of picking it up from the Buildroot sources (allows
   customization of the splash image using rootfs overlay or
   post-build script). Suggested by Yann.

 - Improve commit log of "fs/iso9660: prepare cleaner kernel/initrd
   path handling", as suggested by Yann.

 - In "fs/iso9660: support building a real iso9660 filesystem", fix
   comment (noticed by Samuel), and use positive logic (suggested by
   Yann).

 - Split the patch "fs/iso9660: add support for isolinux" into several
   smaller patches, as suggested by Yann.

 - Use partition type 0x96 when generating an hybrid ISO
   image. Suggested by Yann.

 - Use the syslinux images from BINARIES_DIR (for isolinux.bin) and
   HOST_DIR (for linuxld.c32). Suggested by Yann.

Best regards,

Thomas

Thomas Petazzoni (15):
  fs/iso9660: use if ... endif block instead of depends on
  fs/iso9660: convert to the filesystem infrastructure
  fs/iso9660: enable Joliet extension
  fs/iso9660: rename all variables to use the ROOTFS_ISO9660 prefix
  fs/iso9660: change the location of the splash image
  fs/iso9660: get grub splash from $(TARGET_DIR)
  fs/iso9660: prepare cleaner kernel/initrd path handling
  fs/iso9660: support building a real iso9660 filesystem
  fs/iso9660: introduce new variables
  fs/iso9660: introduce bootloader choice
  fs/iso9660: use 'depends on' instead of 'select' for bootloader
  fs/iso9660: add isolinux support
  fs/iso9660: add hybrid image support
  grub2: prepare and install El Torito image
  fs/iso9660: add support for grub2

 boot/grub2/grub2.mk     |   2 +
 fs/iso9660/Config.in    |  83 ++++++++++++++++++++--
 fs/iso9660/grub.cfg     |   7 ++
 fs/iso9660/iso9660.mk   | 180 +++++++++++++++++++++++++++++++++++++-----------
 fs/iso9660/isolinux.cfg |   5 ++
 fs/iso9660/menu.lst     |   6 +-
 6 files changed, 233 insertions(+), 50 deletions(-)
 create mode 100644 fs/iso9660/grub.cfg
 create mode 100644 fs/iso9660/isolinux.cfg

-- 
2.1.0
