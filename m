From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 5 Jan 2013 17:16:36 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <201301051636.51883.yann.morin.1998@free.fr>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <201301051636.51883.yann.morin.1998@free.fr>
Message-ID: <CAGduivx7RXE1HUOvBV3Gr3sSsMQhohsG7BxRposDTyt-Jdb3OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 5, 2013 at 4:36 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On Saturday 05 January 2013 Maxime Hadjinlian wrote:
>> Introducing a package to install pre-built binaries for the bootloader and the
>> GPU firmware for the RaspberryPi board.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  package/Config.in          |    1 +
>>  package/rpi-fw/Config.in   |    9 +++++++++
>>  package/rpi-fw/cmdline.txt |    1 +
>>  package/rpi-fw/config.txt  |    7 +++++++
>>  package/rpi-fw/rpi-fw.mk   |   22 ++++++++++++++++++++++
>>  5 files changed, 40 insertions(+)
>>  create mode 100644 package/rpi-fw/Config.in
>>  create mode 100644 package/rpi-fw/cmdline.txt
>>  create mode 100644 package/rpi-fw/config.txt
>>  create mode 100644 package/rpi-fw/rpi-fw.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 604ed1b..e21045f 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -253,6 +253,7 @@ source "package/owl-linux/Config.in"
>>  source "package/parted/Config.in"
>>  source "package/pciutils/Config.in"
>>  source "package/picocom/Config.in"
>> +source "package/rpi-fw/Config.in"
>
> We now have a menu dedicated to storing firmware-related packages:
>     Hardware handling --> Misc firmwares
I'll move it to that section.
>
>>  source "package/read-edid/Config.in"
>>  source "package/rng-tools/Config.in"
>>  source "package/sane-backends/Config.in"
>> diff --git a/package/rpi-fw/Config.in b/package/rpi-fw/Config.in
>> new file mode 100644
>> index 0000000..4b5a1e8
>> --- /dev/null
>> +++ b/package/rpi-fw/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_RPI_FW
>> +     bool "RaspberryPi Firmware"
>
> Today, this package is only used fior the RPI. But that GPU is not specific
> to the RPI, so what about calling that package "VideoCore bootloader" ?
As this package is pre compiled binary, I prefer to have the
specificity, nothing say that this would work on another board.
>
> [--SNIP--]
>> diff --git a/package/rpi-fw/cmdline.txt b/package/rpi-fw/cmdline.txt
>> new file mode 100644
>> index 0000000..010ee3f
>> --- /dev/null
>> +++ b/package/rpi-fw/cmdline.txt
>> @@ -0,0 +1 @@
>> +dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
>
> This is typically a reason why I'd like to have a generic way to expressing
> the different filesystems tht form a sinlge firmware. Here, my root partition
> is *not* mmcblk0p2, it's p3. And the rootfstype is *not* ext4, it's ext2.
>
> But, I guess we'll have to live with that commandline for now... :-/
>
> Maybe you could just omit the root settings (or replace them with place-
> holders: root=/dev/XXXX rootfstype=XXXX). Of course, that will depend on
> the maintainer's opinion. ;-)
I agree that it's really not a perfect solution. I'm not sure about
place-holders as it would require the user to fix the cmdline to have
a working rootfs but we already know that a user will have to since
there is a "mandatory" multiple partition.
>
>> diff --git a/package/rpi-fw/config.txt b/package/rpi-fw/config.txt
>> new file mode 100644
>> index 0000000..ab9f7ff
>> --- /dev/null
>> +++ b/package/rpi-fw/config.txt
>> @@ -0,0 +1,7 @@
>> +arm_freq=700
>> +core_freq=250
>> +disable_overscan=1
>> +gpu_mem_256=100
>> +gpu_mem_512=100
>> +sdram_freq=400
>> +over_voltage=0
>> diff --git a/package/rpi-fw/rpi-fw.mk b/package/rpi-fw/rpi-fw.mk
>> new file mode 100644
>> index 0000000..e7b8674
>> --- /dev/null
>> +++ b/package/rpi-fw/rpi-fw.mk
>> @@ -0,0 +1,22 @@
>> +#############################################################
>> +#
>> +# rpi-fw
>> +#
>> +#############################################################
>> +RPI_FW_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
>> +RPI_FW_SITE = http://github.com/raspberrypi/firmware/tarball/master
>> +RPI_FW_LICENSE = FOSS
>
> It's a BSD-3c.
>
>> +RPI_FW_LICENSE_FILE = LICENCE.broadcom
>
> It's in boot/LICENCE.broadcom
>
>> +RPI_FW_INSTALL_STAGING = NO
>
> Not needed, that's the default.
>
>> +define RPI_FW_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(TARGET_DIR)/boot/
>> +     $(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(TARGET_DIR)/boot/
>> +     $(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(TARGET_DIR)/boot/
>
> Is it necessary to have both the normal (start.elf) and the cut-down
> (start_cd.elf) versions at the same time? I can't find a reason to have
> both.
>
>> +     $(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(TARGET_DIR)/boot/
>> +     $(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(TARGET_DIR)/boot/
>> +     $(INSTALL) -D -m 0644 package/rpi-fw/cmdline.txt $(TARGET_DIR)/boot/
>> +     $(INSTALL) -D -m 0644 package/rpi-fw/config.txt $(TARGET_DIR)/boot/
>> +endef
>> +
>> +$(eval $(generic-package))
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
