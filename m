From: David Picard <dplamp@gmx.com>
Date: Tue, 8 Jan 2019 14:17:24 +0100
Subject: [Buildroot] linux-firmware package : files not copied to
 TARGET_DIR
In-Reply-To: <20190108134921.26e793a6@windsurf>
References: <c5319275-53e0-f7df-3fdb-a9699160bd1f@gmx.com>
 <20190108134921.26e793a6@windsurf>
Message-ID: <6de3a002-7c43-9658-507b-5a44f57386d0@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I attached the build log.

I am using the CONFIG_E100 kernel driver, which needs 
e100/d102e_ucode.bin from package linux-firmware for chipset Intel 
82551IT Fast Ethernet Controller.
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/e100

I selected BR2_PACKAGE_LINUX_FIRMWARE in Buildroot, but none of the 
options in the submenu. The file I need is actually present in the 
package build directory, but is not installed.

I don't know if LINUX_FIRMWARE_FILES has a value before 
linux-firmware.mk is invoked. If it's empty at the beginning, then it's 
empty at the end, because none of the 'if' clauses match my case.

I was thinking of making a custom patch for linux-firmware.mk to copy 
just the one file I need. What do you think ?

- David

Le 08/01/2019 ? 13:49, Thomas Petazzoni a ?crit?:
> Hello David,
>
> On Tue, 8 Jan 2019 10:43:05 +0100, David Picard wrote:
>
>> The linux-firmware package builds OK. But I have to manually copy the
>> binary blob required by the driver to $TARGET/lib/firmware.
> The linux-firmware package is definitely installing files to
> $(TARGET_DIR):
>
> ifneq ($(LINUX_FIRMWARE_FILES),)
> define LINUX_FIRMWARE_INSTALL_FILES
>          cd $(@D) && \
>                  $(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
>                  $(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
> endef
> endif
>
> ifneq ($(LINUX_FIRMWARE_DIRS),)
> # We need to rm-rf the destination directory to avoid copying
> # into it in itself, should we re-install the package.
> define LINUX_FIRMWARE_INSTALL_DIRS
>          $(foreach d,$(LINUX_FIRMWARE_DIRS), \
>                  rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
>                  mkdir -p $(dir $(TARGET_DIR)/lib/firmware/$(d)); \
>                  cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
> endef
> endif
>
> Could you describe in more details what you are seeing ? Which
> configuration are you using ? Could you post the build log of the
> linux-firmware package in your situation ?
>
> Best regards,
>
> Thomas

-------------- next part --------------
picard at portpicard33:otb_scanotron$ make linux-firmware-reconfigure
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_staging_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_target_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_images_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_host_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_built
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_configured
>>> linux-firmware 44d4fca9922a252a0bd81f6307bcc072a78da54a Configuring
>>> linux-firmware 44d4fca9922a252a0bd81f6307bcc072a78da54a Building
>>> linux-firmware 44d4fca9922a252a0bd81f6307bcc072a78da54a Installing to target
mkdir -p /home/picard/lemb/otb_scanotron/target/lib/firmware
picard at portpicard33:otb_scanotron$ make V=1 linux-firmware-reconfigure
umask 0022 && make -C /home/picard/lemb/buildroot O=/home/picard/lemb/otb_scanotron/. linux-firmware-reconfigure
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_staging_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_target_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_images_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_host_installed
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_built
rm -f /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_configured
>>> linux-firmware 44d4fca9922a252a0bd81f6307bcc072a78da54a Configuring
touch /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_configured
>>> linux-firmware 44d4fca9922a252a0bd81f6307bcc072a78da54a Building
touch /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_built
>>> linux-firmware 44d4fca9922a252a0bd81f6307bcc072a78da54a Installing to target
mkdir -p /home/picard/lemb/otb_scanotron/target/lib/firmware
if test -n "" ; then \
	rm -f -f  ; \
fi
touch /home/picard/lemb/otb_scanotron/build/linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a/.stamp_target_installed
