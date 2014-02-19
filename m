From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 20:10:17 +0100
Subject: [Buildroot] [PATCH v3 0/5] Various x86 bootloaders and board support
Message-ID: <1392837022-15771-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the v3 of the patch series that adds Grub 2 and Gummiboot
bootloaders, as well as defconfig for two popular x86 development
boards.

Changes v2 -> v3:

 * Install gnu-efi only in the staging directory, and not in the
   target, since it contains only libraries to be linked into
   standalone EFI applications, not Linux userspace
   applications. Suggested by Yann E. Morin.

Changes v1 -> v2:

 * Dropped all patches that have been merged.

 * Confirmed that grub2 can be built with a pure target 64 bits
   compiler, for both the 64 bits Grub2 and the 32 bits Grub2. This
   answers Peter's question at
   http://lists.busybox.net/pipermail/buildroot/2013-December/083682.html.

 * Integrated the changes made by Christophe Vu Brugier on gummiboot
   and gnu-efi.

 * Added dependency on wchar and largefile for gummiboot, since
   gummiboot selects util-linux.

 * Adjust the two boards defconfig to lock down the kernel headers
   version to 3.8, since the kernel being built is derived from 3.8.

Thomas


Thomas Petazzoni (5):
  grub2: add new package
  gnu-efi: new package
  gummiboot: new package
  board: add support for the MinnowBoard
  board: add support for the Fri2 board

 board/fri2/grub.cfg                                |   6 +
 board/fri2/linux-3.8.config                        | 336 +++++++++++++++++++++
 board/fri2/post-build.sh                           |   2 +
 board/fri2/readme.txt                              |  40 +++
 board/minnowboard/grub.cfg                         |   6 +
 board/minnowboard/linux-3.8.config                 | 172 +++++++++++
 board/minnowboard/post-build.sh                    |   2 +
 board/minnowboard/readme.txt                       |  40 +++
 boot/Config.in                                     |   2 +
 boot/grub2/Config.in                               | 120 ++++++++
 boot/grub2/grub.cfg                                |   6 +
 boot/grub2/grub2-remove-gets.patch                 |  21 ++
 boot/grub2/grub2.mk                                |  88 ++++++
 boot/gummiboot/Config.in                           |  28 ++
 boot/gummiboot/buildroot.conf                      |   4 +
 boot/gummiboot/gummiboot.mk                        |  42 +++
 boot/gummiboot/loader.conf                         |   2 +
 configs/fri2_defconfig                             |  23 ++
 configs/minnowboard_defconfig                      |  23 ++
 package/Config.in                                  |   1 +
 package/gnu-efi/Config.in                          |   9 +
 .../gnu-efi/gnu-efi-01-use-override-cflags.patch   |  53 ++++
 .../gnu-efi-02-parallel-make-archives.patch        |  48 +++
 package/gnu-efi/gnu-efi-03-parallel-make.patch     |  22 ++
 package/gnu-efi/gnu-efi.mk                         |  38 +++
 25 files changed, 1134 insertions(+)
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
 create mode 100644 package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
 create mode 100644 package/gnu-efi/gnu-efi-03-parallel-make.patch
 create mode 100644 package/gnu-efi/gnu-efi.mk

-- 
1.8.3.2
