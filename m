From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:53:51 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	for-2011.08/bootloaders
Message-ID: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
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

 * Integrate Philippe Reynes patch that adds support for the x-loader
   first stage bootloader (for OMAP-based platforms).

The changes have already been tested sucessfully by Luca
Ceresoli. Thanks to him for testing this patch set and for the
feedback provided, as well as the bug fixes. Many, many thanks!

Changes since v2 (July, 4th) :

 - When the kernel is selected for installation in /boot, do not
   install into the images/ output directory.

 - Make sure that the installation of the kernel in /boot cannot be
   selected when initramfs is used.

 - Use := instead of = in various places, at least do not use = where
   := was used in the past.

 - Improve generation of RAWNAME in the package infrastructure, using
   patsubst instead of subst.

 - Fixed a Linux 2.6 comment in linux/linux.mk

 - Rebase on top of current master.

Changes since v1 (May, 30th) :

 - Made the option that allows to have the kernel installed in /boot
   available to all architectures, not only x86 and x86_64

 - Fixed the package infrastructure modifications so that packages in
   subdirectories (such as package/multimedia/) continue to work
   properly.

 - Add the x-loader bootloader, contributed by Philippe Reynes

 - Bump Barebox version

Regards,

Thomas

The following changes since commit 0387830b2e6c6cb2513802b8abe86914d49f605c:

  lame: fix build if host has libgtk12-dev (gtk-config) (2011-07-05 14:58:20 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.08/bootloaders

Allan W. Nielsen (1):
      Makefile.package.in: Makes it possible to override the default extract commands

Philippe Reynes (1):
      Add x-loader bootloader

Thomas Petazzoni (26):
      Fix quoting in default extract command
      linux: make it possible to install the kernel in /boot
      linux: use the defconfig mechanism after tuning the config
      package: add infrastructure to install things in images/
      package: fix patching procedure for host packages
      barebox: re-indent variable definitions
      barebox: convert to GENTARGETS
      at91bootstrap: indent properly variable definitions
      at91bootstrap: convert to GENTARGETS
      at91dataflashboot: indent properly variable definitions
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
      barebox: bump version

 boot/Config.in                                     |    2 +-
 boot/at91bootstrap/Config.in                       |   18 +-
 boot/at91bootstrap/at91bootstrap.mk                |   69 ++----
 boot/at91dataflashboot/Config.in                   |   24 +--
 boot/at91dataflashboot/at91dataflashboot.mk        |   48 +---
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
 boot/x-loader/Config.in                            |   15 ++
 boot/x-loader/x-loader.mk                          |   35 +++
 linux/Config.in                                    |   23 ++
 linux/linux.mk                                     |  213 +++++++++---------
 package/Makefile.package.in                        |   72 +++++--
 .../uboot-mkimage-2011.03-drop-configh.patch       |    0
 package/uboot-mkimage/uboot-mkimage.mk             |   16 ++
 23 files changed, 614 insertions(+), 768 deletions(-)
 create mode 100644 boot/grub/grub.500-build-fix.patch
 delete mode 100644 boot/grub2/Config.in
 delete mode 100644 boot/grub2/grub2.mk
 create mode 100644 boot/x-loader/Config.in
 create mode 100644 boot/x-loader/x-loader.mk
 rename boot/u-boot/u-boot-2011.03-drop-configh.patch => package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch (100%)
 create mode 100644 package/uboot-mkimage/uboot-mkimage.mk

Thanks,
-- 
Thomas Petazzoni
