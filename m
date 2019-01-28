From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jan 2019 17:25:11 +0100
Subject: [Buildroot] Linux extension from a BR2_EXTERNAL tree
Message-ID: <20190128172511.754500e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to implement a Linux extension, which applies a bunch of
patches to the Linux kernel tree, as a package in a BR2_EXTERNAL tree.
So, I have a package in my BR2_EXTERNAL that does this:

ifeq ($(BR2_PACKAGE_MUSDK_MARVELL_KERNEL_PATCHES_APPLY),y)
LINUX_EXTENSIONS += musdk-marvell

ifeq ($(BR2_PACKAGE_MUSDK_MARVELL_KERNEL_PATCHES_LINUX),y)
MUSDK_MARVELL_KERNEL_PATCH_SERIES = linux
else ifeq ($(BR2_PACKAGE_MUSDK_MARVELL_KERNEL_PATCHES_LINUX_4_14),y)
MUSDK_MARVELL_KERNEL_PATCH_SERIES = linux-4.14
endif

define MUSDK_MARVELL_PREPARE_KERNEL
        $(APPLY_PATCHES) $(@D) $(MUSDK_MARVELL_DIR)/patches/$(MUSDK_MARVELL_KERNEL_PATCH_SERIES) *.patch
endef
endif

My package is properly listed in LINUX_PATCH_DEPENDENCIES:

$ make printvars VARS=LINUX_PATCH_DEPENDENCIES
LINUX_PATCH_DEPENDENCIES=           musdk-marvell

And in LINUX_PRE_PATCH_HOOKS:

$ make printvars VARS=LINUX_PRE_PATCH_HOOKS
LINUX_PRE_PATCH_HOOKS=            MUSDK_MARVELL_PREPARE_KERNEL

When I build the kernel, it does run the MUSDK_MARVELL_PREPARE_KERNEL
command, but the musdk-marvell dependency was not prepared up to its
patching step (it was not even extracted at all), causing the
MUSDK_MARVELL_PREPARE_KERNEL hook to fail.

So it seems like adding an entry to the LINUX_EXTENSIONS variable
*after* linux/linux.mk has been processed works fine for the hook
registration, but not for the dependency addition. This looks odd to
me. The generic-package infrastructure does seem to have all the
necessary double-dollars to make sure the evaluation is delayed to the
time of use, but it seems to not be sufficient.

I am missing something obvious here ? I am not sure if I'm seeing
something that's easily fixable, or something that is just plain
impossible due to how make works.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
