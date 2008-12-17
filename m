From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 17 Dec 2008 16:06:17 +0100
Subject: [Buildroot] Architecture specific patches for kernel-headers?
Message-ID: <00ee01c96059$0ab8aa40$ae3118ac@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to avoid cluttering the toolchain/kernel-headers directory
the target/device/Atmel/ directory contains two subdirs
for at91 and avr32 specific patches. "arch-at91" and "arch-avr32".

These patches are not applied when the kernel headers are built
and I discussed this with  Hans Christian Egtvedt
which has put the AVR32 specific patches in toolchain/kernel-headers.

I am worried that this directory will get cluttered with this approach.

I can see a couple of ways to handle this.

1) Create toolchain/kernel-headers/arch/arch-at91
    and toolchain/kernel-headers/arch/arch-avr32 etc.
    and patch from there.

2) Do the same as target/linux/Makefile.advanced
    and add a conditional patch to the kernel-headers Makefile based on 
    $(KERNEL_ARCH_PATCH_DIR)

3) Just put it in the toolchain/kernel directory risking
    that there will be several conflicting patches
    in the future.
    If someone updates the kernel-header version
    to a newer kernel, the patches will be ignored
    until someone updates them.

4) Set KERNEL_HEADERS_PATCH_DIR to
    KERNEL_ARCH_PATCH_DIR,

    We have to be careful, because the user might want
    to build a new kernel where the patches cannot be 
    applied to both the kernel header source and the
    kernel actually built

5) ?

In the arch-at91 and arch-avr32 you have to explicitly enable the patches.
The reasoning behind this is that a patch that applies
to 2.6.27.3 may not apply to 2.6.27.6 so you cannot 
just apply the patch and hope for the best, based on
the major number.
If you base yourself on the major/minor number 
combination, you are very restrictive.
A patch might work from 2.6.27.4 to 2.6.27.9 without problems
and there is no reason to restrict this more than neccessary.

The way it is done now, there are a number of patches
and if you have a supported major/minor version, then
you get this patchset as a default, but you can select
to use this patchset if you have another kernel version.

Would appreciate people's thinking here.

Best Regards
Ulf Samuelsson
