From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Apr 2010 17:30:35 +0200
Subject: [Buildroot] target/ cleanup status
Message-ID: <20100404173035.44e611d0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've made some progress in the cleanup of the target/ directory. Not
everything is completed, but I thought it might be good to try to merge
what's already been done before going on with the remaining work. I
already have 83 patches and I don't think it's good to keep more
patches unmerged.

So far, what I've done is :

 * Cleanup all the root filesystem generation code
   ===============================================

   All the details have been given in
   http://lists.busybox.net/pipermail/buildroot/2010-March/032841.html.
   No major change has been made here, except a few minor fixes here
   and there. The latest version is available at
   http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=fs-cleanup.

 * Cleanup all the bootloader compilation code
   ===========================================

   The code is available at
   http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=bootloaders-cleanup.
   This branch is based on the previous fs-cleanup branch.

    - Instead of spreading all bootloader's code in various directories
      in target/, it is now gathered in a boot/ directory

    - In terms of configuration, a new top-level configuration item is
      available to configure bootloaders, instead of hiding them in
      "Target filesystem support"

    - Support for yaboot has been removed.

    - Support for U-Boot has been considerably simplified, with much
      fewer configuration options. I'd appreciate if people using the
      removed options could tell us why they are useful in their
      projects.

    - Support for grub, grub2 and syslinux has been slightly
      cleaned-up. More work is needed on grub2 to make it really useful.

 * Cleanup the makedevs compilation code
   =====================================

   The code is available at
   http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=makedevs-cleanup.
   This branch is based on the previous bootloaders-cleanup branch.

   This tool was compiled in target/makedevs/, it is now moved to
   package/makedevs/. Unfortunately, since the source is directly
   included into Buildroot, we cannot use the generic package
   infrastructure, so we still rely on a manual Makefile.

 * Cleanup the Linux kernel building code
   ======================================

   The code is available at
   http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=linux-cleanup.
   This branch is based on the previous makedevs-cleanup branch.

   We introduce a totally new and very simplified infrastructure for
   building the Linux kernel. We just allow configuration for:

    - kernel version : either latest stable, custom stable or custom
      tarball URL
    - kernel patch : location of local patch file, local patch
      directory or remote (http/ftp) patch file
    - kernel configuration : either a defconfig, or a custom .config
    - kernel image: either uImage, zImage, bzImage or vmlinux

There are for sure many remaining issues, but I can't test all cases
and I don't know which configurations are being used today by users.
Considering the fact that we are two months from the release (leaving
some time to fix issues), I'd like these patches to be considered for
inclusion. If so, I'll gladly send an official pull request, with all
patches sent to the list.

I'm of course ready to rework the patch set with your comments,
feedback and bug reports.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
