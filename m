From: Joris Offouga <offougajoris@gmail.com>
Date: Tue, 9 Jul 2019 20:44:41 +0200
Subject: [Buildroot] [PATCH 1/2] board/freescale: Introduce UBOOTBIN in
 spl template
In-Reply-To: <9df66dc8-c322-5527-10bd-e93b351c0b53@mind.be>
References: <20190709095703.24229-1-offougajoris@gmail.com>
 <9df66dc8-c322-5527-10bd-e93b351c0b53@mind.be>
Message-ID: <e98b793e-7a94-c4cd-37ac-97b798d4b60b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Le 09/07/2019 ? 20:06, Arnout Vandecappelle a ?crit?:
>
> On 09/07/2019 11:57, Joris Offouga wrote:
>> For board like imx7d-pico u-boot.img change to u-boot-dtb.img in U-Boot v2019.07
>> so replace hard code u-boot.img with variable
>>
>> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
>> ---
>>   .../common/imx/genimage.cfg.template_no_boot_part_spl         | 4 ++--
>>   board/freescale/common/imx/genimage.cfg.template_spl          | 4 ++--
>>   board/freescale/common/imx/post-image.sh                      | 4 ++++
>>   3 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
>> index 9cdecc6ce0..c29032572a 100644
>> --- a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
>> +++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
>> @@ -17,9 +17,9 @@ image sdcard.img {
>>       offset = 1024
>>     }
>>   
>> -  partition u-boot-img {
>> +  partition u-boot {
>>       in-partition-table = "no"
>> -    image = "u-boot.img"
>> +    image = "%UBOOTBIN%"
>>       offset = 69K
>>     }
>>   
>> diff --git a/board/freescale/common/imx/genimage.cfg.template_spl b/board/freescale/common/imx/genimage.cfg.template_spl
>> index 0b6e22864b..d2d810777b 100644
>> --- a/board/freescale/common/imx/genimage.cfg.template_spl
>> +++ b/board/freescale/common/imx/genimage.cfg.template_spl
>> @@ -26,9 +26,9 @@ image sdcard.img {
>>       offset = 1024
>>     }
>>   
>> -  partition u-boot-img {
>> +  partition u-boot {
>>       in-partition-table = "no"
>> -    image = "u-boot.img"
>> +    image = "%UBOOTBIN%"
>>       offset = 69K
>>     }
>>   
>> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
>> index 12756c63d5..ab51dc2098 100755
>> --- a/board/freescale/common/imx/post-image.sh
>> +++ b/board/freescale/common/imx/post-image.sh
>> @@ -66,6 +66,10 @@ uboot_image()
>>   		echo "u-boot-dtb.imx"
>>   	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
>>   		echo "u-boot.imx"
>> +	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
>> +	    echo "u-boot-dtb.img"
>> +	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
>   This should have been BR2_TARGET_UBOOT_FORMAT_IMG.

Indeed, i use wrong config, i send new patch for fix this:

https://github.com/buildroot/buildroot/commit/4f9f3a0e9695e670c707d938096ec620c612b694#diff-704e3d7e4d3563826a5c0db0ca5b696eR71

Also for U-Boot 2019.07, it is necessary to apply the series of Pierre-Jean

Best Regards,

Joris Offouga

>
>   Applied to master with that fixed, and with a heavily reworked commit log, thanks.
>
>   Regards,
>   Arnout
>
>> +	    echo "u-boot.img"
>>   	fi
>>   }
>>   
>>
