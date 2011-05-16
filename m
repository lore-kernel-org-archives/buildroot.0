From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 22:21:52 +0200
Subject: [Buildroot] [RFC] Review request for branch for-2011.08/bootloaders
Message-ID: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is not a pull request. This is stuff I'm preparing for the next
Buildroot release, and which I'm posting now to let everybody now that
I'm working on this, and to get early comments. Feedback is therefore
very welcome.

Basically, the idea is that we have a package infrastructure, and
features such as Git/Mercurial download, or usage of an existing
source tree should be added at the level of the package infrastructure
and not specifically for each package.

Unfortunately, some of the packages that would most benefit from those
new infrastructure features are the bootloader and kernel, since it's
typically the software components that have to be modified/tuned
during the course of an embedded Linux project.

Therefore, this series converts all bootloaders makefiles and the
kernel makefile to the package infrastructure. It also does a few
other related things.

More improvements are probably needed at the infrastructure level
(like changing the BR2_PACKAGE_<pkg> test to know if a target needs to
be added to TARGETS or not), but hopefully, you'll get the general
idea and have some feedback/ideas.

Thanks for your review,

Thomas

The following changes since commit 5c88d720f99ce6374a2a9b6afcb93ff627f464fa:

  Merge branch 'for-2011.05/new-codesourcery-toolchain' of http://free-electrons.com/~thomas/buildroot (2011-05-13 15:30:37 +0200)

are available in the git repository at:

  http://free-electrons.com/~thomas/buildroot.git for-2011.08/bootloaders

Allan W. Nielsen (1):
      Makefile.package.in: Makes it possible to override the default extract commands

Thomas Petazzoni (20):
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

 boot/Config.in                                     |    1 -
 boot/at91bootstrap/at91bootstrap.mk                |   57 ++----
 boot/at91dataflashboot/Config.in                   |   24 +--
 boot/at91dataflashboot/at91dataflashboot.mk        |   44 ++---
 boot/barebox/barebox.mk                            |   68 +++----
 boot/grub/grub.500-build-fix.patch                 |   14 ++
 boot/grub/grub.mk                                  |  102 ++++------
 boot/grub2/Config.in                               |    9 -
 boot/grub2/grub2.mk                                |   93 ---------
 boot/syslinux/Config.in                            |   14 +-
 boot/syslinux/syslinux.mk                          |   50 ++---
 boot/u-boot/Config.in                              |    5 -
 boot/u-boot/u-boot.mk                              |  218 +++++++-------------
 linux/Config.in                                    |    8 +
 linux/linux.mk                                     |  203 ++++++++++---------
 package/Makefile.package.in                        |   56 ++++--
 .../uboot-mkimage-2011.03-drop-configh.patch       |    0
 package/uboot-mkimage/uboot-mkimage.mk             |   16 ++
 18 files changed, 387 insertions(+), 595 deletions(-)
 create mode 100644 boot/grub/grub.500-build-fix.patch
 delete mode 100644 boot/grub2/Config.in
 delete mode 100644 boot/grub2/grub2.mk
 rename boot/u-boot/u-boot-2011.03-drop-configh.patch => package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch (100%)
 create mode 100644 package/uboot-mkimage/uboot-mkimage.mk

Thanks,
-- 
Thomas Petazzoni
