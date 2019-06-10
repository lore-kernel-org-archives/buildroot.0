From: Joris Offouga <offougajoris@gmail.com>
Date: Mon, 10 Jun 2019 20:43:51 +0200
Subject: [Buildroot] [PATCH 2/3] boards/freescale/common: Introduce
 template_no_boot_part
In-Reply-To: <92e649a9-01cc-4d44-1dce-ddc6df982b5e@gmail.com>
References: <20190609145749.28766-1-offougajoris@gmail.com>
 <20190609145749.28766-2-offougajoris@gmail.com>
 <846ee132-b3e6-e60f-50a7-39cf34a9bb1b@mind.be>
 <92e649a9-01cc-4d44-1dce-ddc6df982b5e@gmail.com>
Message-ID: <a652eff1-90f4-a30c-8956-6b94d9f91888@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout*, sorry

Le 10/06/2019 ? 20:43, Joris Offouga a ?crit?:
>
> Hi Arnoud,
>
> Le 10/06/2019 ? 00:17, Arnout Vandecappelle a ?crit?:
>>   Okay, this explains a lot... I should have read this patch before looking at
>> the previous one.
>>
>>   So basically, patch 1 and 2 should be swapped.
> Yes, i fix to v2
>>   Note that I like this very much, I think it's silly that most of our defconfigs
>> still use a FAT partition.
>>
>> On 09/06/2019 16:57, Joris Offouga wrote:
>>> This includes the no_boot_part templates which use a /boot
>>> included in rootfs.
>>>
>>> Signed-off-by: Joris Offouga<offougajoris@gmail.com>
>>> Signed-off-by: Pierre-Jean Texier<pjtexier@koncepto.io>
>>> ---
>>>   .../imx/genimage.cfg.template_no_boot_part    | 23 +++++++++++++++
>>>   .../genimage.cfg.template_no_boot_part_spl    | 29 +++++++++++++++++++
>>>   board/freescale/common/imx/post-image.sh      |  6 ++++
>>>   3 files changed, 58 insertions(+)
>>>   create mode 100644 board/freescale/common/imx/genimage.cfg.template_no_boot_part
>>>   create mode 100644 board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
>>>
>>> diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
>>> new file mode 100644
>>> index 0000000000..9e19b4ee3e
>>> --- /dev/null
>>> +++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
>>> @@ -0,0 +1,23 @@
>>> +# Minimal SD card image for the Freescale boards Template
>>> +#
>>> +# We mimic the .sdcard Freescale's image format:
>>> +# * the SD card must have 1 kB free space at the beginning,
>>   Is this one going to be used by anything in practice? I expect that anything
>> that uses this kind of layout is *not* going to use the .imx format, since
>> that's considered kind of deprecated...
>
> It depends on the targets, imx7dpico has migrated to the SPL and so 
> its u-boot has gone from .imx to .img,
>
> Example of the warp7 on 2019.01 it's still .imx.
>
> so I think that should not be removed.
>
>>   So my suggestion would be to remove it (also from the post-image script).
>>
>>> +# * U-Boot is dumped as is,
>>> +# * a single root filesystem partition is required (ext2, ext3 or ext4)
>>> +#
>>> +
>>> +image sdcard.img {
>>> +  hdimage {
>>> +  }
>>> +
>>> +  partition u-boot {
>>> +    in-partition-table = "no"
>>> +    image = "%UBOOTBIN%"
>>> +    offset = 1024
>>> +  }
>>> +
>>> +  partition rootfs {
>>> +    partition-type = 0x83
>>> +    image = "rootfs.ext2"
>>> +  }
>>> +}
>>> diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
>>> new file mode 100644
>>> index 0000000000..6d3ae183e3
>>> --- /dev/null
>>> +++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
>>> @@ -0,0 +1,29 @@
>>> +# Minimal SD card image for the Freescale boards Template for SPL Boot
>>> +#
>>> +# We mimic the .sdcard Freescale's image format:
>>> +# * the SD card must have 1 kB free space at the beginning,
>>> +# * U-Boot is dumped as is,
>>   Mention SPL here. And mention that SPL is at the offset expected by ROM, while
>> U-Boot is at the offset expected by SPL.
> Yes, i add to v2
>>> +# * a single root filesystem partition is required (ext2, ext3 or ext4)
>>   Well, to be precise: the first partition is expected to be an ext2 and have a
>> /boot directory.
>
> and this
>
>
> Best regards,
>
> Joris
>
>>   Regards,
>>   Arnout
>>
>>> +#
>>> +
>>> +image sdcard.img {
>>> +  hdimage {
>>> +  }
>>> +
>>> +  partition spl {
>>> +    in-partition-table = "no"
>>> +    image = "SPL"
>>> +    offset = 1024
>>> +  }
>>> +
>>> +  partition u-boot-img {
>>> +    in-partition-table = "no"
>>> +    image = "u-boot.img"
>>> +    offset = 69K
>>> +  }
>>> +
>>> +  partition rootfs {
>>> +    partition-type = 0x83
>>> +    image = "rootfs.ext2"
>>> +  }
>>> +}
>>> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
>>> index 12a5bea73b..851ce97c57 100755
>>> --- a/board/freescale/common/imx/post-image.sh
>>> +++ b/board/freescale/common/imx/post-image.sh
>>> @@ -36,6 +36,12 @@ genimage_type()
>>>   		echo "genimage.cfg.template_imx8"
>>>   	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
>>>   		echo "genimage.cfg.template_imx8"
>>> +	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
>>> +		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>>> +		    echo "genimage.cfg.template_no_boot_part_spl"
>>> +		else
>>> +		    echo "genimage.cfg.template_no_boot_part"
>>> +		fi
>>>   	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>>>   		echo "genimage.cfg.template_spl"
>>>   	else
>>>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190610/93e36f66/attachment.html>
