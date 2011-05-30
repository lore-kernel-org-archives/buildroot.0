From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:22:51 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.08/bootloaders
Message-ID: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We have a package infrastructure that allows to share a lot of common
behaviour between packages, and allows to add new features easily to
all existing packages (Git/Mercurial download support, or usage of an
external source tree, etc.).

Unfortunately, some of the packages that would most benefit from those
new infrastructure features are the bootloader and kernel, since it's
typically the software components that have to be modified/tuned
during the course of an embedded Linux project.

Therefore, this series converts all bootloaders makefiles and the
kernel makefile to the package infrastructure, and adds the
possibility of fetching the kernel and u-boot through Git (it can be
added to other bootloaders with just a few lines of changes, mostly at
the Config.in level).

It also does various other things :

 * Integrate Allan Nielsen patch that allows package to override the
   default extract command. Allan wrote it for the ATI fglrx drivers,
   but this is also required by this patchset for the AT91Bootstrap
   bootloader, which is provided as a .zip file.

 * Allow the kernel to be installed in /boot in the root
   filesystem. This is mostly useful for x86 and x86_64 systems, where
   it is traditional to have the kernel inside the root filesystem.

 * Modify the way the kernel is configured, to always use a defconfig
   mechanism. This allows to make a silent oldconfig after linux.mk
   has tuned the kernel configuration according to various Buildroot
   configuration options (see the commit log for details).

 * Modify the package infrastructure to provide a <pkg>_INSTALL_IMAGE
   knob in addition to <pkg>_INSTALL_STAGING and <pkg>_INSTALL_TARGET.

 * Fix the patching procedure for host packages. It was incorrect,
   because it required the target package to exist even if only the
   host package was actually useful.

 * Adds support for post-download hooks at the package infrastructure
   level. This is needed for the kernel, as the kernel requires to
   download a custom list of patches.

Most of the changes have already been tested sucessfully by Luca Ceresoli.

Regards,

Thomas

The following changes since commit 9ab73b51e8f0f30e1720639d40732fa20aab9d1a:

  Update for 2011.05 (2011-05-27 16:18:21 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.08/bootloaders

Allan W. Nielsen (1):
      Makefile.package.in: Makes it possible to override the default extract commands

Thomas Petazzoni (25):
      Fix quoting in default extract command
      linux: make it possible to install the kernel in /boot
      linux: use the defconfig mechanism after tuning the config
      package: add infrastructure to install things in images/
      package: fix patching procedure for host packages
      barebox: use = instead of := and re-indent
      barebox: convert to GENTARGETS
      at91bootstrap: use = instead of := and indent properly
      at91bootstrap: convert to GENTARGETS
      at91dataflashboot: use = instead of := and indent
      at91dataflashboot: convert to GENTARGETS
      syslinux: convert to GENTARGETS
      grub: convert to AUTOTARGETS
      grub2: remove package
      u-boot: convert to GENTARGETS
      uboot-mkimage: new package
      linux: rename LINUX26 to LINUX
      linux: indent and align some definitions
      package: add support for post-download hooks
      linux: convert to the GENTARGETS infrastructure
      boot: rename BR2_TARGET_* to BR2_BOOT_*
      u-boot: rename options BR2_BOOT_UBOOT* to BR2_BOOT_U_BOOT*
      Improve TARGETS handling for bootloaders and kernel
      linux: allow specification of a custom Git repository as a source
      u-boot: allow specification of custom Git repo as source

 boot/Config.in                                     |    1 -
 boot/at91bootstrap/Config.in                       |   18 +-
 boot/at91bootstrap/at91bootstrap.mk                |   69 ++----
 boot/at91dataflashboot/Config.in                   |   24 +--
 boot/at91dataflashboot/at91dataflashboot.mk        |   49 +---
 boot/barebox/Config.in                             |    8 +-
 boot/barebox/barebox.mk                            |   74 +++----
 boot/grub/Config.in                                |   94 ++++----
 boot/grub/grub.500-build-fix.patch                 |   14 ++
 boot/grub/grub.mk                                  |  157 +++++--------
 boot/grub2/Config.in                               |    9 -
 boot/grub2/grub2.mk                                |   93 --------
 boot/syslinux/Config.in                            |   16 +-
 boot/syslinux/syslinux.mk                          |   59 ++----
 boot/u-boot/Config.in                              |   89 ++++----
 boot/u-boot/u-boot.mk                              |  234 +++++++-------------
 linux/Config.in                                    |   23 ++
 linux/linux.mk                                     |  210 +++++++++---------
 package/Makefile.package.in                        |   72 +++++--
 .../uboot-mkimage-2011.03-drop-configh.patch       |    0
 package/uboot-mkimage/uboot-mkimage.mk             |   16 ++
 21 files changed, 561 insertions(+), 768 deletions(-)
 create mode 100644 boot/grub/grub.500-build-fix.patch
 delete mode 100644 boot/grub2/Config.in
 delete mode 100644 boot/grub2/grub2.mk
 rename boot/u-boot/u-boot-2011.03-drop-configh.patch => package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch (100%)
 create mode 100644 package/uboot-mkimage/uboot-mkimage.mk

Thanks,
-- 
Thomas Petazzoni
