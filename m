From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 23:50:27 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <201209172301.54610.yann.morin.1998@free.fr>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <201209172301.54610.yann.morin.1998@free.fr>
Message-ID: <201209172350.27316.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marek, All,

On Monday 17 September 2012 23:01:54 Yann E. MORIN wrote:
> On Monday 17 September 2012 22:34:17 Marek Belisko wrote:
> > Add support for raspberrypi bootloader and VideoCore.
[--SNIP--]
> I am not too fond of this hack... :-(
> 
> The issue with this 'package' is that it's two things:
>   - a package that installs the videocore library;
>   - a package that installs the bootloader files.

Ah, my bad, I should have paid more attention to the README. The bootloader
files are for the GPU, not the CPU. Well, that's another issue, then.

Still, I am not very fond of the 'select' hack. Why not do something like
the following (untested so far, will give it a spin shortly):

---8<--- Config.in --8<---
config BR2_PACKAGE_RASPBERRYPI_FIRMWARE
	bool "Raspberry Pi firmware blobs"
	depends on ARM    # (and even the proper CPU?)
	help
	  Install the firmware blobs for the GPU, and the userland
	  VideoCore library to use accelerated graphics on the
	  Raspberry Pi.

	  http://github/babla/...

if BR2_PACKAGE_RASPBERRYPI_FIRMWARE

choice
	bool "CPU/GPU memory split"
	default BR2_PACKAGE_RASPBERRYPI_FIRMWARE_ARM192

config BR2_PACKAGE_RASPBERRYPI_FIRMWARE_ARM128
	bool "128MiB/128MiB"

config BR2_PACKAGE_RASPBERRYPI_FIRMWARE_ARM192
	bool "192MiB/64MiB"

# And so on (your help entries are fine!)

enchoice

config BR2_PACKAGE_RASPBERRYPI_FIRMWARE_GPU_BOOT_FILE
	string
	default "arm128" if BR2_PACKAGE_RASPBERRYPI_FIRMWARE_ARM128
	default "arm192" if BR2_PACKAGE_RASPBERRYPI_FIRMWARE_ARM192
	...

endif
---8<--- Config.in --8<---

What would be the interest to install the GPU boot files, but not install
the VideoCore libraries? Or the other way around, what would be the intrest
to install the VidoeCore library without the GPU boot files?

So my proposal install both one GPU boot file and the VideoCore libraries,
or nothing@all.

---8<--- raspberrypi-firmware.mk --8<---
RASPBERRYPI_FIRMWARE_VERSION = d29291e
RASPBERRYPI_FIRMWARE_SOURCE = raspberrypi-firmware-$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz
RASPBERRYPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
RASPBERRYPI_FIRMWARE_INSTALL_STAGING = YES

define RASPBERRYPI_FIRMWARE_INSTALL_STAGING_CMDS
	cp -a $(@D)/hardfp/opt/vc/* $(STAGING_DIR)/usr
endef

define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/boot
	cp $(@D)/boot/$(qstrip $(BR2_PACKAGE_RASPBERRYPI_FIRMWARE_GPU_BOOT_FILE))_start.elf \
	        $(TARGET_DIR)/boot/start.elf
	cp $(@D)/boot/bootcode.bin $(TARGET_DIR)/boot/bootcode.bin
	cp $(@D)/boot/loader.bin $(TARGET_DIR)/boot/loader.bin
	cp -a $(@D)/hardfp/opt/vc/bin/* $(TARGET_DIR)/usr/bin
	cp -a $(@D)/hardfp/opt/vc/lib/* $(TARGET_DIR)/usr/lib
	cp -a $(@D)/hardfp/opt/vc/sbin/* $(TARGET_DIR)/usr/sbin
endef

$(eval $(generic-package))
---8<--- raspberrypi-firmware.mk --8<---


Also, to be noted in your original patch, you wrote:

---8<---
ifeq ($(BR2_PACKAGE_RASPBERRYPI_BOOTLOADER),y)
BOOT_FILE := #empty
ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM128),y)
BOOT_FILE += arm128_start.elf
else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM192),y)
BOOT_FILE += arm192_start.elf
else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM224),y)
BOOT_FILE += arm224_start.elf
else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM240),y)
BOOT_FILE += arm240_start.elf
endif
---8<---

But all the ARMxxx options are in a choice, so they are mutually exclusive.
In the proposal, above, I kept it as a choice, although it may make sense
to install more than one GPU bootloader.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
