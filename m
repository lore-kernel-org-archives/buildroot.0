From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 00:13:12 +0200
Subject: [Buildroot] [PATCH 1/1] Fix rasberry Pi 64bit firmware overlay
 inclusion
In-Reply-To: <20190413210620.GP2539@scaer>
References: <20190103110036.14604-1-flatmax@flatmax.org>
 <20190413210620.GP2539@scaer>
Message-ID: <6de3ad34-84b1-842f-07e3-6c34734bd1b3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2019 23:06, Yann E. MORIN wrote:
> Matt, All,
> 
> On 2019-01-03 22:00 +1100, Matt Flax spake thusly:
>> This patch enables the inclusion of the Pi's overlays. Previously
>> the overlays were not included in the genimage configuration.
>> This patch ensures overlays are included in the sdcard (when
>> enabled) by defaulting to the inclusion of an empty
>> output/images/rpi-firmware/overlays directory in genimage cfg.
>>
>> The Pi's overlays are built with the following config
>> variables:
>> BR2_PACKAGE_RPI_FIRMWARE=y
>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
>> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> BR2_LINUX_KERNEL_IMAGE_NAME="Image"
>> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image modules dtbs"
>>
>> After building, the dtbo files are present in the
>> output/images/rpi-firmware/overlays directory but not added
>> to the sdcard because they are missing from the genimage cfg
>> file.
>>
>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> 
> After a quick discussion on IRC woth Thomas, we find that this patch is
> indeed acceptable.
> 
> However, I have a minor comment about it, see below...
> 
>> ---
>>  board/raspberrypi/genimage-raspberrypi3-64.cfg | 1 +
>>  package/rpi-firmware/rpi-firmware.mk           | 4 ++++
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
>> index 0d0ca750a7..af1d17cde7 100644
>> --- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
>> +++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
>> @@ -9,6 +9,7 @@ image boot.vfat {
>>        "rpi-firmware/config.txt",
>>        "rpi-firmware/fixup.dat",
>>        "rpi-firmware/start.elf",
>> +      "rpi-firmware/overlays",
>>        "Image"
>>      }
>>    }
>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
>> index bb54904ae6..0df7b17cbd 100644
>> --- a/package/rpi-firmware/rpi-firmware.mk
>> +++ b/package/rpi-firmware/rpi-firmware.mk
>> @@ -24,6 +24,10 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>>  		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
>>  	done
>>  endef
>> +else
>> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>> +		$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays || exit 1;
> 
> No need for the '|| exit 1' part in this case.

 Also it was indented too much, and the trailing semicolon was not needed.

 Also, I've added a brief comment explaining why we create this empty directory.

 Peter, we discussed this on IRC and we feel that one empty directory doesn't
violate the minimalistic principle too much, because it does make life a lot
easier when you start from the existing defconfig.

 So, I've applied to master with the changes mentioned above.

 Regards,
 Arnout

> 
> It is important to use it ion the loop, above, because it is a shell
> loop, so an error in the commands would not be noticed. Here however,
> this is a single command, so it will return in error if it fils and make
> will notice.
> 
> Barring that, which can be fixed when applying:
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>> +endef
>>  endif
>>  
>>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
>> -- 
>> 2.19.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
