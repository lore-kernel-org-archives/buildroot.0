From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 5 Jul 2018 10:31:28 +0300
Subject: [Buildroot] [PATCH]
 configs/olimex_a10_olinuxino_lime_defconfig: new board
In-Reply-To: <20180702222943.44eebe81@windsurf.home>
References: <1530543290-24202-1-git-send-email-leon.anavi@konsulko.com>
 <20180702222943.44eebe81@windsurf.home>
Message-ID: <696d88d3-d9d3-7ea0-ebbb-4323e3e3e602@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for the feedback. Following your recommendations I have update
my patch with the following changes:
- Added an entry at DEVELOPERS
- Removed boot-mali.cmd (it is not needed for building with mainline kernel)
- Removed the code snippet related to script.bin from post-build.sh
(script.bin is used in sunxi legacy kernels only, it is not needed for
building with mainline kernel)

I have already sent the new version of my patch for A10-OLinuXino-LIME:
http://lists.busybox.net/pipermail/buildroot/2018-July/225272.html

Best regards,
Leon

On 2.07.2018 23:29, Thomas Petazzoni wrote:
> Hello,
>
> On Mon,  2 Jul 2018 17:54:50 +0300, Leon Anavi wrote:
>> Add a defconfig for the Olimex A10-OLinuXino-LIME, reusing most
>> of the A20-OLinuXino-Lime and A13-OLinuXino files.
>>
>> The configurations for Olimex A10-OLinuXino-LIME feature:
>> - U-Boot 2018.03
>> - Mainline Linux kernel 4.14.26
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Thanks for this contribution!
>
>>  board/olimex/a10_olinuxino/boot-mali.cmd    |  5 +++
>>  board/olimex/a10_olinuxino/boot.cmd         |  5 +++
>>  board/olimex/a10_olinuxino/genimage.cfg     | 17 +++++++++
>>  board/olimex/a10_olinuxino/post-build.sh    |  8 ++++
>>  board/olimex/a10_olinuxino/readme.txt       | 57 +++++++++++++++++++++++++++++
>>  configs/olimex_a10_olinuxino_lime_defconfig | 48 ++++++++++++++++++++++++
> You should add an entry in the DEVELOPERS file for this board (both for
> the defconfig and the stuff in board/).
>
>> diff --git a/board/olimex/a10_olinuxino/boot-mali.cmd b/board/olimex/a10_olinuxino/boot-mali.cmd
>> new file mode 100644
>> index 0000000..9fa5d65
>> --- /dev/null
>> +++ b/board/olimex/a10_olinuxino/boot-mali.cmd
>> @@ -0,0 +1,5 @@
>> +setenv bootm_boot_mode sec
>> +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve=16 consoleblank=0 ${extra}
>> +ext4load mmc 0 0x43000000 /boot/script.bin
>> +ext4load mmc 0 0x48000000 /boot/zImage
>> +bootz 0x48000000
> Where is this file being used ?
>
>> diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
>> new file mode 100755
>> index 0000000..7a8a427
>> --- /dev/null
>> +++ b/board/olimex/a10_olinuxino/post-build.sh
>> @@ -0,0 +1,8 @@
>> +#!/bin/sh
>> +
>> +cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
>> +
>> +if [ -e $BINARIES_DIR/script.bin ]; then
>> +	# mali requires a legacy kernel
>> +	cp $BINARIES_DIR/script.bin $TARGET_DIR/boot/script.bin
> It's a bit mysterious what is happening here. Where does this
> script.bin file comes from ?
>
> Besides those questions, looks good to me.
>
> Thanks!
>
> Thomas

-- 
Leon Anavi
Software Engineer
konsulko.com
