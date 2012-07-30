From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 30 Jul 2012 14:32:43 +0200
Subject: [Buildroot] [PATCHv4 0/6] Add some support for device tree kernels
Message-ID: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

This is a refactoring of the previous basic device tree
options available for microblaze.

The previous option only made it possible for microblaze targets
to give a path to an external device tree, and build a simpleImage
with it. This involved using a custom target name as simpleImages
are built with the simpleImage.dt_name.
This is also the case on powerpc with cuImages.

This patchset replaces the existing mechanism with a more generic one.
First, it allows to build device tree sources to blobs, both taking
dts present in the kernel sources and external ones, using a path.

Then, it adds support for kernel images with appended device tree blobs.
This option is only for ARM because it is the only architecture I can
think of that has such feature.

Finally, it adds the simpleImage and cuImage as regular image variants,
with the necessary logic to append the device tree name to use, while
doing a bit of code factorisation for u-boot images along the way.

Thanks,
Maxime

Changes since v3:
  * Removed the ugly calls to sed and mkimage, that were relying on
    an undefined variable (MKIMAGE) and now use the kernel build
    system instead
  * Changed the location of the DTS options in the configuration edition
    tools
  * Moved the declaration of BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT from
    patch 2 to patch 4, where it belongs.

Maxime Ripard (6):
  Revert "Microblaze: build kernel with device tree"
  Rework support for the device tree
  Factorize the u-boot images code
  Add support for appended device tree blobs for arm
  Add cuImage(powerpc) and simpleImage(microblaze) as Linux kernel
    images variants
  Update s6lx9 microblaze default configuration

 configs/s6lx9_microboard_defconfig |   12 +----
 linux/Config.in                    |  101 +++++++++++++++++++++++++++++++++---
 linux/linux.mk                     |   79 ++++++++++++++++++++++------
 3 files changed, 158 insertions(+), 34 deletions(-)

-- 
1.7.9.5
