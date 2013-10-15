From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Oct 2013 21:27:23 +0200
Subject: [Buildroot] [PATCHv3] beaglebone: add BeagleBone Black support
In-Reply-To: <CA+T6QPmZ+yHux9soJg+GaaZciac=9vp7OwAwhwJeRK+NNsFafQ@mail.gmail.com>
References: <1381522187-16334-1-git-send-email-jkridner@beagleboard.org>
 <525C728A.6030808@mind.be>
 <CA+T6QPmZ+yHux9soJg+GaaZciac=9vp7OwAwhwJeRK+NNsFafQ@mail.gmail.com>
Message-ID: <525D971B.1010302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Peter in CC to answer the question which kernel config is preferred]


On 15/10/13 03:57, Jason Kridner wrote:
> On Mon, Oct 14, 2013 at 6:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>   Hi Jason,
>>
>>
>> On 11/10/13 22:09, Jason Kridner wrote:
[snip]
>>   However, using ext2 for a ramdisk image is horribly inefficient. You'd
>> normally use a cpio image. Also, lzma (smaller size) or lzop (larger but
>> faster uncompression) are better choices than gzip.
>
> I thought I had pushback on using initramfs, which is what I'd prefer
> to have as the default. I'm simply trying to minimize the patch to get
> Black in there in the defaults.

  Fair enough. Switching to cpio (and lzma or lzop) can be done later.

  Actually, I'm not sure what "pushback" means. Does that mean you got 
approval or opposition?

  Looking back at the earlier conversation (which I didn't really 
follow), you wrote about initramfs:

> Just enabling rapid testing. This can boot off of a FAT formatted SD
> card, over USB, over serial or over Ethernet without passing a
> separate ramdisk. The ext2 required a separate download or special
> formatting of the card and wasted memory if used as a ramdisk.
> Nothing too special here, but it simplifies use as a recovery system,
> validation system or bootloader.

  The cpio image will achieve exactly the same, but more efficiently - 
you just need the additional mkimage step and the uEnv.txt to load it. 
Maybe that's what you really want to avoid with the initramfs?

>
>>
>>
>>>    # mkimage -A arm -O linux -T ramdisk -C gzip -a 0x81000000 -d
>>> rootfs.ext2.gz ramdisk.gz
>>
>>
>>   Ideally, you should make a post-image script (BR2_ROOTFS_POST_IMAGE_SCRIPT)
>> in the board/beaglebone directory that does these steps automatically. And
>> since this script uses mkimage, I'd also explicitly enable
>> BR2_PACKAGE_HOST_UBOOT_TOOLS (even though it is implicitly build for the
>> kernel uImage).
>
> Thanks for pointing this out and I'll certainly make personal use of
> it. I'm doubtful if including it would help get my patch accepted.

  We're moving in the direction that the board configs should produce 
something that can be copied easily on an SD card to boot the board. So 
yes, it would help. But as mentioned before, it may help even more if 
it's in a follow-up patch.

>
>>
>>
>>>    # The URL is where I stored the ouptut of 'make beaglebone_defconfig;
>>> make'
>>>    $ wget -r
>>> https://s3.amazonaws.com/beagle/buildroot/2013-10-11-16%3A52%3A21/index.html
>>>    $ cd s3.amazonaws.com/beagle/buildroot/2013-10-11-16:52:21
>>>    $ cat >uEnv.txt <<EOF
>>>    bootpart=0:1
>>>    bootdir=
>>>    uenvcmd=run loaduimage;run loadramdisk;run findfdt;run loadfdt;run
>>> ramboot
>>>    EOF
>>
>>
>>   You can add uEnv.txt to board/beaglebone and copy it to images/ in the
>> post-image script.
>
> k, but again, I'm not sure if it is desired upstream. If I add it to
> v4, will it get accepted?

  I think so, yes. Note that this step is only relevant if you also 
create the ramdisk image. So again, maybe better for a follow-up patch.

>
>>
>>
>>>    # With /mnt being a FAT formatted uSD card with partition marked as
>>> bootable
>>>    $ cp MLO u-boot.img uImage ramdisk.gz uEnv.txt *.dtb /mnt
>>>    # eject /mnt
>>>    # Insert uSD card into BeagleBone Black
>>>    # Hold "BOOT" button
>>>    # Apply power and release "BOOT" button
>>>    # Serial log at screenlog.0
>>
>>
>>   With the post-image script, the readme can be limited to these 7 lines :-)
>>
>>
>>>
>>> Ideally for me, I'd switch to an initramfs and patch u-boot to avoid
>>> uEnv.txt,
>>> but I'll do that separately.
>>
>>
>>   I'm not a fan of initramfs because every rootfs change requires a slow
>> re-link of the kernel... And I don't see the harm in uEnv.txt.
>
> k, but you want a cpio image instead of a ramdisk? I guess I'll take a
> look at how to use a cpio image as an initrd.

  It's used exactly the same. The difference is that you don't have ext2 
filesystem overhead - the cpio image is copied into a tmpfs, and then 
removed.


> What I'd like to know is what will be accepted upstream. I feel like I
> am wasting my time right switching approaches that don't have that
> much to do with BeagleBone Black when what I most fundamentally want
> to introduce is a pointer to a different kernel and the combination of
> .dtb files for BeagleBone and BeagleBone Black.

  Good point.

[snip]
>>> ---
>>>    board/beaglebone/linux-3.8.config | 1035
>>> ++++++++++++++++++++++++++++++++++---
>>>    configs/beaglebone_defconfig      |   13 +-
>>>    2 files changed, 975 insertions(+), 73 deletions(-)
>>>
>>> diff --git a/board/beaglebone/linux-3.8.config
>>> b/board/beaglebone/linux-3.8.config
>>> index 4242771..08ab221 100644
>>> --- a/board/beaglebone/linux-3.8.config
>>> +++ b/board/beaglebone/linux-3.8.config
>>> @@ -1,103 +1,409 @@
>>>    CONFIG_EXPERIMENTAL=y
>>> -CONFIG_DEFAULT_HOSTNAME="beaglebone"
>>> +CONFIG_KERNEL_LZO=y
>>>    CONFIG_SYSVIPC=y
>>>    CONFIG_POSIX_MQUEUE=y
>>>    CONFIG_NO_HZ=y
>>>    CONFIG_HIGH_RES_TIMERS=y
>>>    CONFIG_BSD_PROCESS_ACCT=y
>>> +CONFIG_BSD_PROCESS_ACCT_V3=y
>>> +CONFIG_TASKSTATS=y
>>> +CONFIG_TASK_DELAY_ACCT=y
>>> +CONFIG_TASK_XACCT=y
>>> +CONFIG_TASK_IO_ACCOUNTING=y
>>
>>
>>   You're adding a lot of kernel features here that were not enabled before.
>> We generally prefer the kernel configs to be pretty minimal (except that all
>> drivers for hardware that is present on the board should be included, of
>> course. What's the history of this kernel config? You don't mention it at
>> all in the commit message.
>
> This comes from the kernel config we use in the demo image shipped
> with the boards.
>
> https://github.com/beagleboard/kernel/commits/3.8/configs/beaglebone
>
> Should I include a link like this?
>
> I can use something more minimal, but the idea was to try to provide
> something that showed off as much capability as possible. I'll see
> what I can cut out.

  If it's an upstream defconfig, I think it's OK as it is.

  It looks like you have commit access to the beagleboard linux tree on 
github; perhaps you can add the beaglebone defconfig to arch/arm/configs, 
where it belongs? Then you can use BR2_LINUX_KERNEL_USE_DEFCONFIG.

  I think we would prefer that approach rather than a buildroot-specific 
defconfig, because it makes bumping the kernel version easier. Peter, can 
you confirm that an upstream defconfig is preferred even if it is not 
minimal?

  If an in-kernel defconfig is not possible for whatever reason, you can 
leave the defconfig as it is and mention in the readme and/or the commit 
message where it comes from.


[snip]
>>> +CONFIG_MTD=y
>>
>>
>>   Beaglebones don't even have any flash, right?
>
> They have eMMC, which isn't the same as MTD, so, right, there isn't
> any MTD flash built-in. However, with add-on board it is possible to
> add it. Many of the things added are for being able to support add-on
> boards.

  Ah of course. But I guess only EEPROM is relevant then - or is the GPMC 
bus exported on the cape connector?


[snip]
>>> -BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
>>>
>>> -BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="935f6c2f82056d538b528272e2bdbb5c08d69a58"
>>>
>>> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/beagleboard/linux.git"
>>>
>>> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="ddd36e546e53d3c493075bbebd6188ee843208f9"

  Didn't notice before, but: on github you can download it as a tarball. 
That's factors faster than cloning a git repository.

  Regards,
  Arnout


>>>    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>>    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.8.config"
>>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone"
>>> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
>>>
>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
