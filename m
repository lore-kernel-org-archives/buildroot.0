From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 13 Sep 2016 06:15:43 +0200
Subject: [Buildroot] [PATCH 0/5] grub2: add support for arm and aarch64
Message-ID: <20160913041548.10290-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series enables Grub 2 to be built for arm and aarch64.

The patch series itself is not very complex, the most significant effort
put into this series was in testing that it actually works.
Unfortunately, not a lot of documentation or examples are available on
the subject, so some experimentation was required and testing was done
in a few different environments to ensure that enabling these in
Buildroot make sense at this moment.
Initial encouragement that this might be possible with Buildroot targets
came from [1].

Grub 2 for arm/aarch64 can be used either in a uboot platform or efi
platform.

As a uboot platform, Grub 2 image gets built as a u-boot image (i.e.
u-boot mkimage) and is loaded from u-boot through a regular "bootm". The
only requirement from u-boot side in order to allow this is that u-boot
is built with CONFIG_API enabled. CONFIG_API seems to not be enabled by
default in most in-tree configurations, however, it seems to be
available for quite some time now. So it might be possible to use this
even on older u-boot versions. This is available only for arm (32-bit).

As an efi platform, Grub 2 gets built as an EFI executable. This allows
EFI firmware to find and load it similarly as it can be done for x86_64.
It is possible to run aarch64 EFI firmware in qemu [2] and load Grub 2
to test it this way (I have actually used the aarch64 firmware
distributed with edk2-aarch64 from Fedora).
Also, there is a very cool recent u-boot feature which allows u-boot to
load and boot an EFI executable - bootefi [3] - so the Grub 2 efi
platform can also be used from u-boot in recent versions. This has been
released only in u-boot v2016.05 and is enabled (mostly) by default for
ARM u-boot.
efi platform is available for both arm and aarch64.

After enabling support for these Grub 2 platform in Buildroot, I have
tested them (and found to work) in the following environments:

arm-uboot:
- qemu arm vexpress, loaded through u-boot bootm as in [1], no patches
necessary.
- BeagleBone, loaded through u-boot bootm (worked after a small patch I
crafted for Grub 2 which I hope to sort out with upstream, possibly
platform specific).

arm-efi:
- BeagleBone, with u-boot v2016.05, loaded through u-boot bootefi as in
[3], no patches necessary.

aarch64-efi:
- qemu aarch64 virt, using EDK II firmware for aarch64, Grub 2 loaded
through usual UEFI path, no patches necessary.
- Odroid-C2, aarch64, using a patched together u-boot v2016.05 (since
upstream support for this board is not totally done yet), loaded through
u-boot bootefi as in [3].

I have also verified that pc_x86_64_bios_defconfig and
pc_x86_64_efi_defconfig build and boot correctly with Grub 2 without
modifications after applying this patch series.


During development, I split the grub2 package into (host-)grub2-tools
and grub2. I was having trouble in trying to make the existing grub2
package work for arm, getting some weird relocation errors when trying
to execute it on the target, despite it working as expected while
following [1] with recent grub2 and u-boot versions. I tracked it down
as much as to be something related to the use of $(HOST_CONFIGURE_OPTS)
in GRUB2_CONF_ENV, but didn't find the exact cause.
By spliting the packages into a host and target version, I didn't see
any of those errors anymore, it also made the grub2 recipe clearer (less
confusion about mixed host/target build variables) and we also get the
added benefit of enabling grub2-tools to be built for the target.
So I'm also proposing this change as part of the series.


I'm sure this can still be improved, so feedback on the series is very
welcome. For example I'm not sure on what to do with the grub2
documentation on boot/grub2/Config.in; it could start growing very big
for a Config.in documentation if I add more fully detailed instructions
for ARM.
We also now have defconfig examples which include grub2 for x86_64,
maybe the best would be to provide a defconfig instead of extending that
documentation (and possibly also removing all that from Config.in)?

[1] https://www.hellion.org.uk/blog/posts/grub-on-uboot-on-qemu/
[2] https://sourceforge.net/projects/edk2/files/ARM/
[3] https://www.youtube.com/watch?v=bNL1pd-rwCU

Erico Nunes (5):
  grub2: bump up version
  grub2-tools: new package
  grub2: use grub2-tools as a host package
  grub2: enable support for arm and aarch64 targets
  grub2: introduce BR2_TARGET_GRUB2_CFG

 boot/grub2/0001-remove-gets.patch                  | 21 -------
 ...ettext-gettext.c-main_context-secondary_c.patch | 39 -------------
 boot/grub2/Config.in                               | 55 +++++++++++++++---
 boot/grub2/grub2.hash                              |  4 +-
 boot/grub2/grub2.mk                                | 67 ++++++++++++++--------
 package/Config.in                                  |  1 +
 package/grub2-tools/Config.in                      |  6 ++
 package/grub2-tools/grub2-tools.hash               |  2 +
 package/grub2-tools/grub2-tools.mk                 | 45 +++++++++++++++
 9 files changed, 144 insertions(+), 96 deletions(-)
 delete mode 100644 boot/grub2/0001-remove-gets.patch
 delete mode 100644 boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
 create mode 100644 package/grub2-tools/Config.in
 create mode 100644 package/grub2-tools/grub2-tools.hash
 create mode 100644 package/grub2-tools/grub2-tools.mk

-- 
2.9.3
