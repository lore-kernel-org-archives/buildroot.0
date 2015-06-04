From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jun 2015 17:05:18 +0200
Subject: [Buildroot] [PATCH 00/12] iso9660 support improvements
Message-ID: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
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

In sequence:

 * Patch 1 extends the common filesystem infrastructure with a
   POST_GEN_HOOKS mechanism.

 * Patch 2 convers the existing ISO9660 logic to use the common
   filesystem infrastructure.

 * Patches 3 to 7 do some minor improvements/cleanups to the ISO9660
   handling.

 * Patch 8 adds the ability to put the root filesystem directly in the
   ISO9660 filesystem (keeping the possibility of using
   initrd/initramfs as alternate solutions)

 * Patches 9/10 add support for isolinux and hybrid image generation.

 * Patches 11/12 add support for Grub2

This series superseds the following patches:

  http://patchwork.ozlabs.org/patch/430655/
  http://patchwork.ozlabs.org/patch/328052/
  http://patchwork.ozlabs.org/patch/328051/

Best regards,

Thomas

Thomas Petazzoni (12):
  fs/common: add <fs>_POST_GEN_HOOKS support
  fs/iso9660: convert to the filesystem infrastructure
  fs/iso9660: use if ... endif block instead of depends on
  fs/iso9660: enable Joliet extension
  fs/iso9660: rename all variables to use the ROOTFS_ISO9660 prefix
  fs/iso9660: change the location of the splash image
  fs/iso9660: prepare cleaner kernel/initrd path handling
  fs/iso9660: support building a real iso9660 filesystem
  fs/iso9660: add support for isolinux
  fs/iso9660: add hybrid image support
  grub2: prepare and install El Torito image
  fs/iso9660: add support for grub2

 boot/grub2/grub2.mk     |   2 +
 fs/common.mk            |   4 ++
 fs/iso9660/Config.in    |  85 +++++++++++++++++++---
 fs/iso9660/grub.cfg     |   7 ++
 fs/iso9660/iso9660.mk   | 184 +++++++++++++++++++++++++++++++++++++-----------
 fs/iso9660/isolinux.cfg |   6 ++
 fs/iso9660/menu.lst     |   6 +-
 7 files changed, 242 insertions(+), 52 deletions(-)
 create mode 100644 fs/iso9660/grub.cfg
 create mode 100644 fs/iso9660/isolinux.cfg

-- 
2.1.0
