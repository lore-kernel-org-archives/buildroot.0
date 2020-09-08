From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 8 Sep 2020 09:32:10 +0000
Subject: [Buildroot] [PATCH 5/5] Add support for Kendryte K210 based
 RISC-V boards
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
 <20200908051624.425573-6-damien.lemoal@wdc.com>
 <20200908091728.6351079d@windsurf.hq.k.grp>
 <CY4PR04MB3751463068ACC779C758B3CDE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200908110714.6979f5c8@windsurf.hq.k.grp>
Message-ID: <CY4PR04MB3751C631F1EEB24C27F7EC6FE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/08 18:07, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Tue, 8 Sep 2020 08:02:15 +0000
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>>> configs/qemu_arm_versatile_nommu_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>> configs/qemu_m68k_mcf5208_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>> configs/stm32f429_disco_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>> configs/stm32f469_disco_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>>
>>> Could you try to use this one ?  
>>
>> Yes, the minimal config work. but it gives me a rootfs cpio image  of 650KB
>> while the one I added is even smaller and results in a rootf of 350KB. 300KB
>> saved on a board with only 8MB of SRAM, that is not negligible...
> 
> Agreed. Perhaps we should change our busybox-minimal.config ? It would
> be nice to diff yours against busybox-minimal.config and see if we can
> get to a common conclusion.
> 
> As you can imagine, we're trying to avoid the situation where every
> single board would have its own custom Busybox configuration file, with
> a semi-random selection of tools.

OK. Let me check.

> 
>>>> +# Minimal device set before mounting devtpmfs
>>>> +/dev/null	c	666	0	0	1	3	0	0	-
>>>> +/dev/zero	c	666	0	0	1	5	0	0	-
>>>> +/dev/random	c	666	0	0	1	8	0	0	-
>>>> +/dev/urandom	c	666	0	0	1	9	0	0	-
>>>> +/dev/console	c	666	0	0	5	1	-	-	-
>>>> +/dev/tty	c	666	0	0	5	0	-	-	-
>>>> +/dev/tty0	c	666	0	0	4	0	0	0	-
>>>> +/dev/ttySIF0	c	666	0	0	4	64	0	0	-
>>>> +/dev/ptmx	c	666	0	0	5	2	-	-	-  
>>>
>>> I see in your /init script that you are mount devtmpfs, so a custom
>>> device table for static /dev should not be needed. Could you explain
>>> why this device table is necessary ?  
>>
>> The init process is just a shell. So if I do not create at least the console
>> files, I see errors "could not open console" when the init process is started by
>> the kernel as devtmpfs is not yet mounted. Will check again.
> 
> If you enable BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS, then
> Buildroot doesn't use any static device table, but since in the
> initramfs case devtmpfs is not mounted by the kernel, /dev/console is
> created anyway by Buildroot in the image. See fs/cpio/cpio.mk:
> 
> define ROOTFS_CPIO_ADD_INIT
>         if [ ! -e $(TARGET_DIR)/init ]; then \
>                 $(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
>         fi
>         mkdir -p $(TARGET_DIR)/dev
>         mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1
> endef
> 
> So, /dev/console should be there without having a custom device table.
> This should allow your /init script to run and mount devtmpfs.
> 
> BTW, you probably want your /init script to be modeled after
> fs/cpio/init, except for the last line where you would exec /bin/sh
> instead of exec /sbin/init of course.

I checked again and I do not need the device table at all. The error I was
seeing is not here. Might have got confused with something else.
Will revisit the init too to follow fs/cpio/init more closely.

> 
>>>> +rm -rf "$TARGET_DIR"/var/www > /dev/null 2>&1
>>>> +rm -rf "$TARGET_DIR"/media > /dev/null 2>&1  
>>>
>>> What is in /var/www and /media that takes so much space? In a default
>>> Buildroot configuration, those folders should be empty.  
>>
>> They are. Frankly, I could drop this. But as that is totally not needed,
>> removing them can save a block or so on the cpio image. Memory saving again, but
>> likely not much here.
> 
> OK, we could keep that I guess then. No need for the >/dev/null 2>&1 I
> guess, since rm -rf ignores errors.

I dropped this too. It was not making any difference on the final rootfs size.

>>>> diff --git a/board/kendryte/k210/patches/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/board/kendryte/k210/patches/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch  
>>>
>>> None of the uClibc patches here are board-specific, so  they should be
>>> added to package/uclibc/. In fact, I think the gcc10 patches would fix
>>> some build issues we have in our autobuilders:
>>>
>>>   http://autobuild.buildroot.net/?reason=uclibc-1.0.35  
>>
>> I could not get gcc10 builds to work. The static build is broken and uclibc seem
>> to imply as much. As I was afraid of the potential impact of these patches on
>> other builds, I put them as board specific for now. I intend to send them to
>> uclibc too. Thoughts ? Should I keep this as is for now ?
> 
> We need to look more closely at the patches, but having them
> board-specific is not ideal. Perhaps this is something that can be
> worked on with upstream uClibc?

I will send them upstream to uclibc too. I moved the patches under
package/uclibc for now.

>>> So with the normal Busybox init you don't have enough memory? Is this
>>> platform using XIP, or is the code loaded into SRAM ? Indeed, 8 MB of
>>> SRAM is quite a lot if you are running code from flash. But if indeed
>>> the entire kernel is loaded into SRAM because you don't have XIP
>>> support, the story is a bit different.  
>>
>> No XIP. Kernel + embedded initramfs and dtb all end up in memory. SD card is not
>> working yet, so this is really the only solution for now. Once I get the SD card
>> to work, the initramfs can go onto the SD card, which will improve things.
> 
> OK. But supporting the SD card will not improve the memory consumption,
> just give you more storage space.

It will improve memory consumption since only running processes will use memory.
Right now, the entire initramfs being in memory, memory is used even without
anything running. With the SD card, no initramfs is needed (no kernel module).

re-checking and testing everything now. Will send a V2 shortly.

Thanks !


-- 
Damien Le Moal
Western Digital Research
