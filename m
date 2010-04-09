From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:38 +0200
Subject: [Buildroot] [pull request] Pull request for branch fs-cleanup
Message-ID: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset implements a major rework of the code that generates the
root filesystem generation. It is part of a more general work that
aims at cleaning up the contents of the target/ directory.

Each patch has a description detailing its changes but here is the
list of the major steps that this patch set goes through :

 * First, I introduce new packages, or new host packages. The idea is
   to remove the code in target/*/*.mk that was building tools such as
   genromfs, squashfs-tools, mkcramfs to package/ so that 1. we can
   leverage the package infrastructure and 2. these packages can also
   be made available on the target if needed.

   - New genromfs package, supported for both target and host
   - New genext2fs package, supported for both target and host
   - New cramfs package, supported for both target and host
   - New squashfs package, supported for both target and host
     note that I removed support for SquashFS 3.x
   - New libcap package, supported for both target and host
     it is a dependency of cdrkit
   - Convert bzip2 to autools + add host package
   - New cmake package, supported for the host only.
     it is a build dependency of cdrkit
   - New cdrkit package, supported for both target and host
     it is the new generation of cdrecord/mkisofs tools
   - Add host support to e2fsprogs so that libuuid can be built for the
     host. Needed to build mtd-utils for the host
   - Package mtd-utils converted to gentargets and added host support
     so that we can get mkfs.jffs2 and mkfs.ubifs for the host
   - New package cloop, supported for the host only
     stupid build system, didn't want to fix for cross-build
   - Convert lzma to the autotargets infrastructure for the host

 * Once this was done, I removed all the host utils generation code
   from target/* (where * is a filesystem)

   - cloop, which was also converted to use fakeroot instead of sudo
   - cpio
   - cramfs
   - ext2
   - iso9660. converted to use genisoimage instead of mkisofs. Same
     utility, but genisoimage is the one of cdrkit
   - jffs2
   - romfs
   - squashfs
   - tar
   - ubifs. and remove the BROKEN mark.

 * Sanity work around fakeroot: conversion to autotools for the host
   and removal of BR2_HOST_FAKEROOT, since we never use configuration
   options for host packages.

 * Remove the BR2_TARGET_ROOTFS_xxxx_COPYTO options, designed to copy
   the root filesystem image to a custom location after build. Just use
   "cp" after using Buildroot.

 * Addition of a filesystem generation infrastructure, to factorize the
   code to generate the root filesystem images. It is loosely modeled
   after our packages infrastructures.

   A ROOTFS_TARGET macro does all the work of creating the fakeroot
   script. The only thing the filesystem-specific code has to specify
   is: 1. list of host dependencies and 2. command to execute to
   generate the filesystem image.

 * Conversion of most filesystems to the ROOTFS_TARGET infrastructure

   - cloop
   - cpio
   - cramfs
   - romfs
   - tar
   - squashfs
   - ext2
   - jffs2
   - ubifs
   - initramfs

   Note: iso9660 has to be kept as a manual thing, since its generation
   procedure is very very different from the others.

 * Removal of the IMAGE internal variable, that was the name of the
   generated rootfilesystem (which could be tweaked through
   configuration options for a prefix and suffix). Instead, just
   hardcode the generation of rootfs.XXXX where XXXX is the filesystem
   type.

 * Move everything all filesystem generation code in a new top-level
   directory "fs/". A new configuration category is created for
   Bootloaders, so that they are not mixed with filesystems.

The following changes since commit 6cbdb507c37124d06bdac6a82c81aa5c16e164f9:
  Peter Korsgaard (1):
        CHANGES: add libaio

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fs-cleanup

Thomas Petazzoni (44):
      genromfs: add new package
      genext2fs: new package
      cramfs: new package
      squashfs: new package
      libcap: new package
      bzip2: convert to gentargets, add host package, bump version
      cmake: new package
      cdrkit: new package
      e2fsprogs: add support for host package
      mtd: convert to gentargets, add host package
      cloop: new package
      lzma: convert the host package to the autotools infrastructure
      target/cloop: cleanup
      target/cpio: cleanup
      target/cramfs: cleanup
      target/ext2: cleanup
      target/iso9660: cleanup
      target/jffs2: cleanup
      target/romfs: cleanup
      target/squashfs: cleanup, remove support for 3.x
      target/tar: cleanup
      target/ubifs: cleanup, unbroken
      fakeroot: convert to the autotools infrastructure
      fakeroot: remove all references to BR2_HOST_FAKEROOT
      target/: remove the COPYTO mess
      target: Add new infrastructure for filesystem generation
      cloop: convert to ROOTFS_TARGET infrastructure
      cpio: convert to ROOTFS_TARGET infrastructure
      cramfs: convert to ROOTFS_TARGET infrastructure
      romfs: convert to ROOTFS_TARGET infrastructure
      tar: convert to ROOTFS_TARGET infrastructure
      squashfs: convert to ROOTFS_TARGET infrastructure
      ext2: convert to ROOTFS_TARGET infrastructure
      jffs2: convert to ROOTFS_TARGET infrastructure
      ubifs: convert to ROOTFS_TARGET infrastructure
      initramfs: convert to ROOTFS_TARGET infrastructure
      busybox initramfs: do not use the IMAGE variable
      target/common: do not use IMAGE
      iso9660: rework in a similar way to ROOTFS_TARGET
      Remove IMAGE and related configuration options
      Move all filesystem generation code to fs/
      Coherent naming for .mk files in fs/
      Update defconfigs after fs cleanup
      fs/*/Config.in: remove useless configuration comments

 Config.in                                          |    2 +
 Makefile                                           |    2 +
 configs/at91rm9200df_defconfig                     |    9 +-
 configs/at91rm9200df_ext_defconfig                 |    9 +-
 configs/at91sam9260dfc_defconfig                   |    9 +-
 configs/at91sam9260dfc_ext_defconfig               |    9 +-
 configs/at91sam9260pf_defconfig                    |    5 +-
 configs/at91sam9261ek_defconfig                    |    9 +-
 configs/at91sam9261ek_ext_defconfig                |    9 +-
 configs/at91sam9263ek_defconfig                    |    9 +-
 configs/at91sam9263ek_ext_defconfig                |    9 +-
 configs/at91sam9g20dfc_defconfig                   |    9 +-
 configs/at91sam9g20dfc_ext_defconfig               |    9 +-
 configs/atngw100-base_defconfig                    |    7 +-
 configs/atngw100_defconfig                         |    7 +-
 configs/atstk1005_defconfig                        |    7 +-
 configs/atstk100x_defconfig                        |    7 +-
 configs/i386_defconfig                             |    5 +-
 configs/i686_defconfig                             |    5 +-
 configs/integrator926_defconfig                    |    7 +-
 configs/integrator926_huge_defconfig               |    7 +-
 configs/kb9202_defconfig                           |    3 +-
 configs/v100sc2_defconfig                          |    3 +-
 fs/Config.in                                       |   30 ++++
 {target => fs}/cloop/Config.in                     |    0
 fs/cloop/cloop.mk                                  |   13 ++
 fs/common.mk                                       |   70 ++++++++++
 fs/cpio/Config.in                                  |   34 +++++
 fs/cpio/cpio.mk                                    |   18 +++
 {target => fs}/cramfs/Config.in                    |    1 -
 fs/cramfs/cramfs.mk                                |   22 +++
 fs/ext2/Config.in                                  |   55 ++++++++
 fs/ext2/ext2.mk                                    |   40 ++++++
 {target => fs}/initramfs/Config.in                 |    0
 {target => fs}/initramfs/gen_initramfs_list.sh     |    0
 fs/initramfs/initramfs.mk                          |   18 +++
 {target => fs}/iso9660/Config.in                   |    6 -
 fs/iso9660/iso9660.mk                              |   49 +++++++
 {target => fs}/iso9660/menu.lst                    |    0
 {target => fs}/jffs2/Config.in                     |   11 --
 fs/jffs2/jffs2.mk                                  |   61 ++++++++
 {target => fs}/romfs/Config.in                     |    1 -
 fs/romfs/romfs.mk                                  |   15 ++
 fs/squashfs/Config.in                              |    4 +
 fs/squashfs/squashfs.mk                            |   13 ++
 fs/tar/Config.in                                   |   41 ++++++
 fs/tar/tar.mk                                      |   13 ++
 fs/ubifs/Config.in                                 |   79 +++++++++++
 fs/ubifs/ubifs.mk                                  |   25 ++++
 package/Config.in                                  |    6 +
 package/Makefile.in                                |    4 -
 package/busybox/initramfs.mk                       |    2 +-
 package/bzip2/bzip2.mk                             |  140 ++++++++-----------
 package/cdrkit/Config.in                           |   11 ++
 package/cdrkit/cdrkit.mk                           |   63 +++++++++
 package/cloop/cloop.mk                             |   18 +++
 package/cmake/cmake.mk                             |   20 +++
 package/cramfs/Config.in                           |    7 +
 .../cramfs/cramfs-01-devtable.patch                |    0
 {target => package}/cramfs/cramfs-02-endian.patch  |    0
 .../cramfs/cramfs-03-cygwin_IO.patch               |    0
 package/cramfs/cramfs.mk                           |   33 +++++
 package/e2fsprogs/e2fsprogs.mk                     |    5 +
 package/fakeroot/Config.in                         |    4 -
 package/fakeroot/fakeroot.mk                       |  126 ++---------------
 package/genext2fs/Config.in                        |    9 ++
 .../genext2fs}/genext2fs-1.4-nosquash.patch        |    0
 .../genext2fs-1.4-remove_ugly_warnings.patch       |    0
 package/genext2fs/genext2fs.mk                     |   12 ++
 package/genromfs/Config.in                         |    6 +
 package/genromfs/genromfs-0.5.2-build-system.patch |   26 ++++
 package/genromfs/genromfs.mk                       |   31 ++++
 package/libcap/Config.in                           |   10 ++
 package/libcap/libcap-2.19-build-system.patch      |   55 ++++++++
 package/libcap/libcap.mk                           |   27 ++++
 package/lzma/lzma.mk                               |   65 +---------
 package/mtd/mtd.mk                                 |  144 ++++++-------------
 package/squashfs/Config.in                         |    6 +
 .../squashfs/squashfs-4.0-build-system-fix.patch   |   11 +-
 ...quashfs-4.0-mksquashfs-race-condition-fix.patch |    0
 package/squashfs/squashfs.mk                       |   30 ++++
 scripts/test/Config.in.test.buildall               |    1 -
 target/Config.in                                   |   45 +------
 target/Makefile.in                                 |    1 -
 target/cloop/Makefile.in                           |    3 -
 target/cloop/cloop.mk                              |  108 ---------------
 target/cpio/Config.in                              |   50 -------
 target/cpio/cpioroot.mk                            |   87 ------------
 target/cramfs/cramfs.mk                            |   86 ------------
 target/ext2/Config.in                              |   75 ----------
 target/ext2/ext2root.mk                            |  146 --------------------
 target/initramfs/initramfs.mk                      |   43 ------
 target/iso9660/iso9660.mk                          |   95 -------------
 target/jffs2/jffs2root.mk                          |   99 -------------
 target/romfs/romfs.mk                              |   71 ----------
 target/squashfs/Config.in                          |   32 -----
 .../squashfs/squashfs-3.4-build-system-fix.patch   |   28 ----
 target/squashfs/squashfsroot.mk                    |   85 ------------
 target/tar/Config.in                               |   59 --------
 target/tar/tarroot.mk                              |   64 ---------
 target/ubifs/Config.in                             |  103 --------------
 target/ubifs/ubifsroot.mk                          |  125 -----------------
 target/xtensa/defconfig                            |    1 -
 toolchain/dependencies/dependencies.sh             |    2 +-
 104 files changed, 1172 insertions(+), 1884 deletions(-)
 create mode 100644 fs/Config.in
 rename {target => fs}/cloop/Config.in (100%)
 create mode 100644 fs/cloop/cloop.mk
 create mode 100644 fs/common.mk
 create mode 100644 fs/cpio/Config.in
 create mode 100644 fs/cpio/cpio.mk
 rename {target => fs}/cramfs/Config.in (84%)
 create mode 100644 fs/cramfs/cramfs.mk
 create mode 100644 fs/ext2/Config.in
 create mode 100644 fs/ext2/ext2.mk
 rename {target => fs}/initramfs/Config.in (100%)
 rename {target => fs}/initramfs/gen_initramfs_list.sh (100%)
 create mode 100644 fs/initramfs/initramfs.mk
 rename {target => fs}/iso9660/Config.in (74%)
 create mode 100644 fs/iso9660/iso9660.mk
 rename {target => fs}/iso9660/menu.lst (100%)
 rename {target => fs}/jffs2/Config.in (93%)
 create mode 100644 fs/jffs2/jffs2.mk
 rename {target => fs}/romfs/Config.in (81%)
 create mode 100644 fs/romfs/romfs.mk
 create mode 100644 fs/squashfs/Config.in
 create mode 100644 fs/squashfs/squashfs.mk
 create mode 100644 fs/tar/Config.in
 create mode 100644 fs/tar/tar.mk
 create mode 100644 fs/ubifs/Config.in
 create mode 100644 fs/ubifs/ubifs.mk
 create mode 100644 package/cdrkit/Config.in
 create mode 100644 package/cdrkit/cdrkit.mk
 create mode 100644 package/cloop/cloop.mk
 create mode 100644 package/cmake/cmake.mk
 create mode 100644 package/cramfs/Config.in
 rename {target => package}/cramfs/cramfs-01-devtable.patch (100%)
 rename {target => package}/cramfs/cramfs-02-endian.patch (100%)
 rename {target => package}/cramfs/cramfs-03-cygwin_IO.patch (100%)
 create mode 100644 package/cramfs/cramfs.mk
 create mode 100644 package/genext2fs/Config.in
 rename {target/ext2 => package/genext2fs}/genext2fs-1.4-nosquash.patch (100%)
 rename {target/ext2 => package/genext2fs}/genext2fs-1.4-remove_ugly_warnings.patch (100%)
 create mode 100644 package/genext2fs/genext2fs.mk
 create mode 100644 package/genromfs/Config.in
 create mode 100644 package/genromfs/genromfs-0.5.2-build-system.patch
 create mode 100644 package/genromfs/genromfs.mk
 create mode 100644 package/libcap/Config.in
 create mode 100644 package/libcap/libcap-2.19-build-system.patch
 create mode 100644 package/libcap/libcap.mk
 create mode 100644 package/squashfs/Config.in
 rename {target => package}/squashfs/squashfs-4.0-build-system-fix.patch (88%)
 rename {target => package}/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch (100%)
 create mode 100644 package/squashfs/squashfs.mk
 delete mode 100644 target/cloop/Makefile.in
 delete mode 100644 target/cloop/cloop.mk
 delete mode 100644 target/cpio/Config.in
 delete mode 100644 target/cpio/cpioroot.mk
 delete mode 100644 target/cramfs/cramfs.mk
 delete mode 100644 target/ext2/Config.in
 delete mode 100644 target/ext2/ext2root.mk
 delete mode 100644 target/initramfs/initramfs.mk
 delete mode 100644 target/iso9660/iso9660.mk
 delete mode 100644 target/jffs2/jffs2root.mk
 delete mode 100644 target/romfs/romfs.mk
 delete mode 100644 target/squashfs/Config.in
 delete mode 100644 target/squashfs/squashfs-3.4-build-system-fix.patch
 delete mode 100644 target/squashfs/squashfsroot.mk
 delete mode 100644 target/tar/Config.in
 delete mode 100644 target/tar/tarroot.mk
 delete mode 100644 target/ubifs/Config.in
 delete mode 100644 target/ubifs/ubifsroot.mk

Thanks,
-- 
Thomas Petazzoni
