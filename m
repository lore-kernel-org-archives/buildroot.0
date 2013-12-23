From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Mon, 23 Dec 2013 14:43:44 +0100
Subject: [Buildroot] [PATCH 1/1] Do not use an initrd in iso image when
 using initramfs
In-Reply-To: <20131215215001.GA3463@free.fr>
References: <1387140644-22545-1-git-send-email-thierry.bultel@wanadoo.fr>
 <20131215215001.GA3463@free.fr>
Message-ID: <52B83E10.2050109@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 15/12/2013 22:50, Yann E. MORIN a ?crit :
> Thierry, All,
>

Hi,

> On 2013-12-15 21:50 +0100, Thierry Bultel spake thusly:
>> When using initramfs, it is useless to put an initrd in the iso image.
>> This patch makes the image to only contain the kernel image, and
>> also removes the initrd line from menu.lst
>>
>> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
>> ---
>>   fs/iso9660/iso9660.mk |    4 ++++
>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
>> index 979a0b2..1f9c62e 100644
>> --- a/fs/iso9660/iso9660.mk
>> +++ b/fs/iso9660/iso9660.mk
>> @@ -17,7 +17,11 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
>>   	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
>>   	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
>>   	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
>> +ifneq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>
> We prefer positive logic, ie.:

I have re-posted the patch,
(http://patchwork.ozlabs.org/patch/301730/)
following your recommendation.

Do you see any issues that would make it not commitable ?

regards
Thierry

>
> ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>      sed blabla
> else
>      cp rootfs.cpio blabla
> endif
>
>>   	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
>> +else
>> +	sed -i -e '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
>> +endif
>>   	# Use fakeroot to pretend all target binaries are owned by root
>>   	rm -f $(FAKEROOT_SCRIPT)
>>   	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
>
> Regards,
> Yann E. MORIN.
>
