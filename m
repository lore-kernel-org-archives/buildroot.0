From: Leon Anavi <leon.anavi@konsulko.com>
Date: Sun, 1 Jul 2018 12:28:40 +0300
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <20180701092229.GE2381@scaer>
References: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
 <20180630174357.GI2384@scaer>
 <4ae4c99a-ec7b-925a-365a-47e0a79d466e@konsulko.com>
 <20180630191119.GJ2384@scaer> <20180701092229.GE2381@scaer>
Message-ID: <6113136f-de40-361e-659e-b49dc35db530@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

On 1.07.2018 12:22, Yann E. MORIN wrote:
> Leon, All,
>
> On 2018-06-30 21:11 +0200, Yann E. MORIN spake thusly:
>> On 2018-06-30 21:03 +0300, Leon Anavi spake thusly:
> [--SNIP--]
>>> Thank you for the feedback. I have experienced this issue while building
>>> branch master on Ubuntu 16.04. As discussed in the IRC channel on Friday
>>> the same issue has been reproduced in the CI, Job #78257653 triggered by
>>> Thomas Petazzoni: https://gitlab.com/buildroot.org/buildroot/-/jobs/78257653
> Could you please provide a bit more details on your buildsystem: what is
> the filesystem you use to build?

The filesystem of my build machine is ext4. More details about the
Ubuntu version:

Distributor ID:??? Ubuntu
Description:??? Ubuntu 16.04.4 LTS
Release:??? 16.04
Codename:??? xenial

Best regards,
Leon


>
> In the past, we had issues when the build was done on zfs for example,
> because it reports nvalid (POSIX-wise) results about the size for small
> files, which zfs entirely stores in the inode, thus reporting sero used
> blocks.
>
> I'm afraid something similar may be happening here...
>
> Regards,
> Yann E. MORIN.
>
>>> I have noticed that the same fix has been already applied to
>>> raspberrypi3_64_defconfig. I hope my patch will be merged to prevent
>>> this issue in future for raspberrypi3_defconfig.
>> The raspberrypi3_64_defconfig has always had the size set to 120MiB from
>> the onset, because it builds more kernel modules and thus takes more
>> place (at least, according to the commit log (commit 9bbea36e3e).
>>
>> I am not opposed to the change, BTW.
>>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> Regards,
>> Yann E. MORIN.
>>
>>> Thanks,
>>> Leon
>>>
>>>>     $ make raspberrypi3_defconfig
>>>>     $ make
>>>>     $ du -hs output/target/
>>>>     57M     output/target/
>>>>     $ ls -lsh output/images/
>>>>     total 159M
>>>>      24K -rw-r--r-- 1 ymorin ymorin  24K Jun 30 19:35 bcm2710-rpi-3-b.dtb
>>>>      28K -rw-r--r-- 1 ymorin ymorin  25K Jun 30 19:35 bcm2710-rpi-3-b-plus.dtb
>>>>      24K -rw-r--r-- 1 ymorin ymorin  23K Jun 30 19:35 bcm2710-rpi-cm3.dtb
>>>>     8.0M -rw-r--r-- 1 ymorin ymorin  32M Jun 30 19:35 boot.vfat
>>>>      54M -rw-r--r-- 1 ymorin ymorin  60M Jun 30 19:35 rootfs.ext2
>>>>        0 lrwxrwxrwx 1 ymorin ymorin   11 Jun 30 19:35 rootfs.ext4 -> rootfs.ext2
>>>>     4.0K drwxr-xr-x 3 ymorin ymorin 4.0K Jun 30 19:24 rpi-firmware
>>>>      93M -rw-r--r-- 1 ymorin ymorin  93M Jun 30 19:35 sdcard.img
>>>>     4.7M -rw-r--r-- 1 ymorin ymorin 4.7M Jun 30 19:35 zImage
>>>>
>>>> Regards,
>>>> Yann E. MORIN.
>>>>
>>>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>>>> ---
>>>>>  configs/raspberrypi3_defconfig | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
>>>>> index 856f321..0ef9afe 100644
>>>>> --- a/configs/raspberrypi3_defconfig
>>>>> +++ b/configs/raspberrypi3_defconfig
>>>>> @@ -28,6 +28,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
>>>>>  # Filesystem / image
>>>>>  BR2_TARGET_ROOTFS_EXT2=y
>>>>>  BR2_TARGET_ROOTFS_EXT2_4=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>>>>  # BR2_TARGET_ROOTFS_TAR is not set
>>>>>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>>>>>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
>>>>> -- 
>>>>> 2.7.4
>>>>>
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot at busybox.net
>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>> -- 
>>> Leon Anavi
>>> Software Engineer
>>> konsulko.com
>>>
>>>
>> -- 
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Leon Anavi
Software Engineer
konsulko.com
