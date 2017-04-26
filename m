From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:45 +0200
Subject: [Buildroot] [PATCH v2 0/8] grub2: bump and add support for arm and
	aarch64
Message-ID: <20170426213953.14904-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps Grub 2 to the latest and recent release
(finally) and performs some changes to the package (notably the split
into grub2 and grub2-tools) to enable arm and aarch64 support in it.

Some significant effort was put into figuring how to make this all work.
Unfortunately, not a lot of documentation or examples are available on
the subject.
Initial encouragement that this might be possible with Buildroot targets
came from [1].

Grub 2 for arm/aarch64 can be used either in a uboot platform or efi
platform.

As a uboot platform, Grub 2 image gets built as a u-boot image (i.e. output
from u-boot mkimage) and is booted in u-boot through a regular "bootm". The
only requirement from u-boot side in order to allow this is that u-boot is
built with CONFIG_API enabled. CONFIG_API is not enabled by default in most
in-tree configurations, however, it is available for quite some time now. So it
may be possible to use this even on older u-boot versions.
This is available only for arm (32-bit).

As an efi platform, Grub 2 gets built as an EFI executable. This allows
EFI firmware to find and load it similarly as it can be done for x86_64.
It is possible to run aarch64 EFI firmware in qemu [2] and load Grub 2
to test it this way (I have actually used the aarch64 firmware
distributed with edk2-aarch64 from Fedora).
Also, there is a very cool recent u-boot feature which allows u-boot to
load and boot an EFI executable - bootefi [3] - so the Grub 2 efi
platform can also be used from u-boot in recent versions. This has been
released only in u-boot v2016.05 and is enabled (mostly) by default for
arm u-boot.
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
- Odroid-C2, aarch64, using an upstream u-boot and upstream v4.11-rc8
kernel, with Grub 2 loaded through u-boot bootefi as in [3].

I have also verified that pc_x86_64_bios_defconfig and
pc_x86_64_efi_defconfig build and boot correctly with Grub 2 without
modifications after applying this patch series.


During development, I split the grub2 package into (host-)grub2-tools
and grub2. Since v1 I was having trouble in trying to make the existing
grub2 package work for arm, getting some weird relocation errors when
executing it on the target, despite it working as expected by manually
following [1] with recent grub2 and u-boot versions. I tracked it down
as much as to be something related to the use of $(HOST_CONFIGURE_OPTS)
in GRUB2_CONF_ENV, but didn't find the exact cause.
By spliting the packages into a host and target version, the errors
ceased, it also made the grub2 recipe clearer (less confusion about
mixed host/target build variables) and we also get the added benefit of
enabling grub2-tools to be built for the target. It is interesting to
have it in the target for tools such as grub2-reboot.
(I didn't actually spend more time on this for v2 as the split seems to
 make much more sense anyway).


Changes v1 -> v2:
  - Update to the 2.02 release, this settles the questions about using
  git master or a beta release, as it is now an official release.
  - Moved the grub2 additional documentation from its Config.in to a
  readme.txt in the package directory as it was discussed in v1.
  - Added grub2 extra documentation for arm and aarch64.
  - Fixed small bugs such as the lack of depends on wchar.
  - Re-tested everything, including pc_* defconfigs, except BeagleBone
  (lots of extra work, not my primary target, and nothing changed on the
   arm-efi part).
  Odroid-C2 works much more nicely with u-boot bootefi + grub2
  aarch64-efi now that it has better u-boot/kernel upstream support.
  - The Image.gz format for linux aarch64.

[1] https://www.hellion.org.uk/blog/posts/grub-on-uboot-on-qemu/
[2] https://www.kraxel.org/repos/jenkins/edk2/
[3] https://www.youtube.com/watch?v=bNL1pd-rwCU

Erico Nunes (8):
  grub2: bump up version
  grub2-tools: new package
  grub2: use grub2-tools as a host package
  grub2: enable support for arm and aarch64 targets
  grub2: introduce BR2_TARGET_GRUB2_CFG
  grub2: move usage notes to package readme.txt
  grub2: add usage notes for Grub 2 ARM and aarch64
  linux: new Image.gz format for aarch64

 DEVELOPERS                                         |   1 +
 boot/grub2/0001-remove-gets.patch                  |  21 --
 ...ettext-gettext.c-main_context-secondary_c.patch |  39 ----
 boot/grub2/Config.in                               | 152 +++++---------
 boot/grub2/grub2.hash                              |   4 +-
 boot/grub2/grub2.mk                                |  62 +++---
 boot/grub2/readme.txt                              | 231 +++++++++++++++++++++
 linux/Config.in                                    |   4 +
 linux/linux.mk                                     |   2 +
 package/Config.in                                  |   1 +
 package/grub2-tools/Config.in                      |  10 +
 package/grub2-tools/grub2-tools.hash               |   2 +
 package/grub2-tools/grub2-tools.mk                 |  39 ++++
 13 files changed, 378 insertions(+), 190 deletions(-)
 delete mode 100644 boot/grub2/0001-remove-gets.patch
 delete mode 100644 boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
 create mode 100644 boot/grub2/readme.txt
 create mode 100644 package/grub2-tools/Config.in
 create mode 100644 package/grub2-tools/grub2-tools.hash
 create mode 100644 package/grub2-tools/grub2-tools.mk

-- 
2.9.3
