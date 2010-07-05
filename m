From: Ossy <ossy1980@gmx.net>
Date: Mon, 05 Jul 2010 22:47:27 +0200
Subject: [Buildroot] make u-boot does not apply custom patches
Message-ID: <4C3244DF.6010009@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildroot mailinglist,

I tried to make u-boot (new version 2010.06) with custom patches.
The patches are not applied.
Configuration: ...\u-boot-patches\u-boot-2010.06-description.patch

I figured out, that boot/u-boot/u-boot.mk includes an unset variable 
U_BOOT_CUSTOM_PATCH_DIR - this should be BR_TARGET_UBOOT_CUSTOM_PATCH_DIR.

Furthermore I modified the u-boot.mk in the following way:
...
$(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
         @echo "DEBUG: About to patch u-boot with default patches ..."
         @echo "DEBUG: CUSTOM PATCH DIR: 
$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)"
         toolchain/patch-kernel.sh $(U_BOOT_DIR) boot/u-boot \
                 u-boot-$(U_BOOT_VERSION)-\*.patch \
                 u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
ifneq ($(qstrip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
         @echo "DEBUG: About to patch with user defined patches from 
DIR: $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)"
         toolchain/patch-kernel.sh $(U_BOOT_DIR) 
$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
endif
...

After the "make u-boot" call I never see the output "...About to patch 
with user defined ..." The variable BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR is 
definitly set (verified with second DEBUG line).
Maybe it works as designed (do not apply patches if default patches set 
the .patched stamp?). But in fact, the user defined patches are not 
applied - so is there an error in the test line? The test says: call 
kernel-patch.sh if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR is not empty. But, 
why I can't see the 3rd DEBUG line?


Output of "make u-boot":
mkdir -p /home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.06
bzcat /home/ossy/buildroot/buildroot-dev/dl/u-boot-2010.06.tar.bz2 \
                 | tar --strip-components=1 -C 
/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.06  -xf -
touch 
/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.06/.unpacked
DEBUG: About to patch u-boot with default patches ...
DEBUG: CUSTOM PATCH DIR: 
target/device/sheevaplug/SeagateDockStar/u-boot-patches
toolchain/patch-kernel.sh 
/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.06 boot/u-boot \
                 u-boot-2010.06-\*.patch \
                 u-boot-2010.06-\*.patch.arm
touch 
/home/ossy/buildroot/buildroot-dev/output/build/u-boot-2010.06/.patched
PATH="/home/ossy/buildroot/buildroot-dev/output/toolchain/bin:/home/ossy/buildroot/buildroot-dev/output/host/bin:/home/ossy/buildroot/buildr
oot-dev/output/host/usr/bin:/home/ossy/buildroot/buildroot-dev/output/host/usr/sbin/:/home/ossy/buildroot/buildroot-dev/output/staging/bin:/
...

No typos in paths:
ossy at debian-virtual:~/buildroot/buildroot-dev$ ll 
target/device/sheevaplug/SeagateDockStar/u-boot-patches/
insgesamt 20
-rw-r--r-- 1 ossy ossy 1528 17. Feb 14:06 
u-boot-2010.06-0001-DockStar-Change-RAM-definitions-to-one-bank-128-MB.patch
-rw-r--r-- 1 ossy ossy  835 17. Feb 14:06 
u-boot-2010.06-0002-DockStar-environment-is-at-0xa0000.patch
-rw-r--r-- 1 ossy ossy  917 17. Feb 14:06 
u-boot-2010.06-0003-DockStar-MTD-partitions.patch
-rw-r--r-- 1 ossy ossy 1225 17. Feb 14:06 
u-boot-2010.06-0004-DockStar-Change-prompt-and-ident-string.patch
-rw-r--r-- 1 ossy ossy  647 17. Feb 14:06 
u-boot-2010.06-0007-DockStar-Include-long-help-messages.patch
ossy at debian-virtual:~/buildroot/buildroot-dev$

Thanks for the help,
Marcus
