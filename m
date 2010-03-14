From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Mar 2010 17:36:20 +0100
Subject: [Buildroot] Root filesystem generation cleanup
Message-ID: <20100314173620.52524c43@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm currently working on cleaning up the target/ directory. The first
step of my work was to cleanup the root filesystem generation code. The
result of my work (more testing needed, but the general idea is
implemented) is available in my fs-cleanup branch at :

 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=fs-cleanup

(beware, this branch is regularly rebased and repushed).

As I'm soon going to send a pull request for this, I'd like to get some
early review about the general idea.

Here is a summary of the changes :

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

What do you think about this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
