From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 9 Nov 2019 16:25:32 +0100
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157c_dk2: disable mkfs
 metadata_csum and dir_index options
In-Reply-To: <20191109152205.0bd1b924@windsurf>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <20191109152205.0bd1b924@windsurf>
Message-ID: <0a7b32f7-65bf-98dd-64cd-7a663518479a@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 09.11.2019 15:22, Thomas Petazzoni wrote:
> Hello Bartosz,
>
> On Sun,  3 Nov 2019 12:50:16 +0100
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> To solve issue with non-possibilities to mount rootfs partition we
>> should disable a new mkfs features such as metadata_csum and
>> dir_index because there is incompatibility with these options.
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> ---
>>   configs/stm32mp157c_dk2_defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
>> index a1e61d752d..ba044e5e55 100644
>> --- a/configs/stm32mp157c_dk2_defconfig
>> +++ b/configs/stm32mp157c_dk2_defconfig
>> @@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>   BR2_TARGET_ROOTFS_EXT2=y
>>   BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>> +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^64bit,^metadata_csum,^dir_index"
> Are you sure it is necessary to disable those three options?
>
> Indeed, U-Boot ext4 write support clearly excludes filesystems that
> have the metadata_csum option enabled:
>
>    https://gitlab.denx.de/u-boot/u-boot/blob/master/fs/ext4/ext4_write.c#L880
> However, there's nothing about the 64bit and dir_index options. How did
> you conclude that they were causing problems? Did you try with just -O
> ^metadata_csum ?

I was talking with the maintainer of that board on U-Boot mailing list 
[1] and he said that I should disable those 2 options (dir_index and 
metada_csum) to have U-Boot working properly. I'm not sure about 64bit 
because I saw that was set by default in buildroot. I didn't check that 
with metadata_csum option only but I'll do that and let you know if it 
works.

[1] https://lists.denx.de/pipermail/u-boot/2019-October/388618.html

Best
Bartek
>
> Thanks,
>
> Thomas
