From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:24 +0100
Subject: [Buildroot] [PATCH 00/15] Improvements to x86 bootloaders,
	and x86 boards support
Message-ID: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This commit brings a number of improvements into the world of x86
bootloaders, and adds support for two x86 boards.

In details:

 * It improves the existing 'grub' package by making sure that we can
   build a 32 bits Grub even if the selected target architecture is
   x86-64. This is done by using the host compiler. It also makes
   various other improvements to the 'grub', and especially adds a
   HOWTO in the Config.in help text to explain how to install Grub
   into a disk image, and test it under Qemu.

 * It adds support for the 'grub2' bootloader, with support for x86
   legacy BIOS, 32 bits EFI BIOS and 64 bits EFI BIOS, all have been
   tested in Qemu, and the 32 bits EFI has been tested on Minnow Board
   and Fri2. A fairly large HOWTO in the Config.in help text also
   explains how to install grub2, for both legacy BIOS and EFI BIOS
   cases. The 32 bits version of 'grub2' can be built just fine with
   the target x86-64 compiler, so there is no problem here.

 * It adds support for the 'gummiboot' bootloader, a simple bootloader
   for EFI BIOSes. However, we only support 32 bits version on x86 and
   the 64 bits version on x86-64, because handling the 32 bits version
   on x86-64 is a bit more complicated.

 * It adds minimal support for the x86 Minnow Board, and the x86
   Kontron Fri2 board.

I must say that the part I'm the most happy with are the little HOWTO
in the Config.in help text: how to install x86 bootloaders is a
question that has often been asked, and we didn't had a good
mini-HOWTO to explain how to install them.

Best regards,

Thomas

Thomas Petazzoni (15):
  core: add BR2_HOSTARCH_NEEDS_IA32_COMPILER option
  package: add objcopy and ranlib to HOST_CONFIGURE_OPTS
  grub: factorize BR2_TARGET_GRUB dependency in Config.in
  grub: support build on x86-64, and misc other improvements
  grub: replace splash screen with a nicer Buildroot splash screen
  grub: sample menu.lst file improvements
  grub: install the sample menu.lst into $(TARGET_DIR)/boot/grub
  grub: adjust splashimage in menu.lst depending on configuration
  grub: add option to configure the list of supported filesystems
  grub: improve help text with detailed instructions to install grub
  grub2: add new package
  gnu-efi: new package
  gummiboot: new package
  board: add support for the MinnowBoard
  board: add support for the Fri2 board

 Config.in                                          |   6 +
 Makefile                                           |   8 +
 board/fri2/grub.cfg                                |   6 +
 board/fri2/linux-3.8.config                        | 336 +++++++++++++++++++++
 board/fri2/post-build.sh                           |   2 +
 board/fri2/readme.txt                              |  40 +++
 board/minnowboard/grub.cfg                         |   6 +
 board/minnowboard/linux-3.8.config                 | 172 +++++++++++
 board/minnowboard/post-build.sh                    |   2 +
 board/minnowboard/readme.txt                       |  40 +++
 boot/Config.in                                     |   2 +
 boot/grub/Config.in                                |  66 ++--
 boot/grub/grub.mk                                  |  55 ++--
 boot/grub/menu.lst                                 |   4 +-
 boot/grub/splash.xpm.gz                            | Bin 45185 -> 16466 bytes
 boot/grub2/Config.in                               | 120 ++++++++
 boot/grub2/grub.cfg                                |   6 +
 boot/grub2/grub2-remove-gets.patch                 |  21 ++
 boot/grub2/grub2.mk                                |  88 ++++++
 boot/gummiboot/Config.in                           |  46 +++
 boot/gummiboot/buildroot.conf                      |   4 +
 boot/gummiboot/gummiboot.mk                        |  44 +++
 boot/gummiboot/loader.conf                         |   2 +
 configs/fri2_defconfig                             |  12 +
 configs/minnowboard_defconfig                      |  12 +
 package/Config.in                                  |   1 +
 package/Makefile.in                                |   2 +
 package/gnu-efi/Config.in                          |  21 ++
 .../gnu-efi/gnu-efi-01-use-override-cflags.patch   |  53 ++++
 package/gnu-efi/gnu-efi.mk                         |  44 +++
 support/dependencies/dependencies.sh               |   9 +
 31 files changed, 1185 insertions(+), 45 deletions(-)
 create mode 100644 board/fri2/grub.cfg
 create mode 100644 board/fri2/linux-3.8.config
 create mode 100755 board/fri2/post-build.sh
 create mode 100644 board/fri2/readme.txt
 create mode 100644 board/minnowboard/grub.cfg
 create mode 100644 board/minnowboard/linux-3.8.config
 create mode 100755 board/minnowboard/post-build.sh
 create mode 100644 board/minnowboard/readme.txt
 create mode 100644 boot/grub2/Config.in
 create mode 100644 boot/grub2/grub.cfg
 create mode 100644 boot/grub2/grub2-remove-gets.patch
 create mode 100644 boot/grub2/grub2.mk
 create mode 100644 boot/gummiboot/Config.in
 create mode 100644 boot/gummiboot/buildroot.conf
 create mode 100644 boot/gummiboot/gummiboot.mk
 create mode 100644 boot/gummiboot/loader.conf
 create mode 100644 configs/fri2_defconfig
 create mode 100644 configs/minnowboard_defconfig
 create mode 100644 package/gnu-efi/Config.in
 create mode 100644 package/gnu-efi/gnu-efi-01-use-override-cflags.patch
 create mode 100644 package/gnu-efi/gnu-efi.mk

-- 
1.8.1.2
