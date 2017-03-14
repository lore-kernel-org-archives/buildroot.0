From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:29 -0700
Subject: [Buildroot] [PATCH 00/23] xtensa overlay application rework
Message-ID: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series cleans up xtensa overlay application code, making
it uniform across its users in the toolchain, reducing the number of
configuration variables and making it possible to use compressed
overlays and download overlays from network.
This is a subset of a series initially submitted by Yann E. MORIN
in 2015, I've forward-ported the original submission, addressed the
posted comments and added overlay application to linux and U-Boot.

Max Filippov (3):
  linux: apply xtensa overlay
  uboot: apply xtensa overlay
  linux: enable uBoot image type for xtensa kernel

Yann E. MORIN (20):
  core: include arch-specific definitions
  arch/xtensa: add definitions for the Xtensa overlay
  package/binutils: use the Xtensa variables
  package/gdb: use the Xtensa variables
  package/gcc: use the Xtensa variables
  arch/xtensa: add macro to extract the overlay
  package/binutils: use macro to extract Xtensa overlay
  package/gdb: use macro to extract Xtensa overlay
  package/gcc: use macro to extract Xtensa overlay
  package/binutils: extract Xtensa overlay as post-extract hook
  package/gdb: extract Xtensa overlay as post-extract hook
  arch/xtensa: add macros to generate hooks
  package/binutils: use the Xtensa macro generators
  package/gdb: use the Xtensa macro generators
  package/gcc: use the Xtensa macro generators
  arch/xtensa: get rid of an intermediate blind kconfig option
  arch/xtensa: allow specifying path to tarball file
  arch/xtensa: accept the overlay to be compressed
  arch/xtensa: accept the overlay to be an URL
  configs/qemu-xtensa: use overlay from the github repository

 Config.in.legacy                         |  23 ++++++++++
 Makefile                                 |   3 ++
 arch/Config.in.xtensa                    |  27 +++++-------
 arch/arch.mk.xtensa                      |  71 +++++++++++++++++++++++++++++++
 board/qemu/xtensa-lx60/xtensa_dc233c.tar | Bin 808960 -> 0 bytes
 boot/uboot/uboot.mk                      |   3 ++
 configs/qemu_xtensa_lx60_defconfig       |   4 +-
 configs/qemu_xtensa_lx60_nommu_defconfig |   4 +-
 linux/Config.in                          |   2 +-
 linux/linux.mk                           |   3 ++
 package/binutils/binutils.mk             |  13 ++----
 package/gcc/gcc-final/gcc-final.mk       |   5 +--
 package/gcc/gcc-initial/gcc-initial.mk   |   5 +--
 package/gcc/gcc.mk                       |  12 +-----
 package/gdb/gdb.mk                       |  14 ++----
 15 files changed, 129 insertions(+), 60 deletions(-)
 create mode 100644 arch/arch.mk.xtensa
 delete mode 100644 board/qemu/xtensa-lx60/xtensa_dc233c.tar

-- 
2.1.4
