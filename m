From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 13:44:50 +0100
Subject: [Buildroot] user question about ubi nand
In-Reply-To: <CAJJ6jxvynFore7-FZNbtXj_LXUDjH4-Kt--2=BpuytjEefuy0A@mail.gmail.com>
References: <CAJJ6jxu+5mSnNq6hmnCS1nB5cx8qmyip5qoRONjtw1WHUqox5A@mail.gmail.com>
 <56CE3628.7000903@mind.be>
 <CAJJ6jxvynFore7-FZNbtXj_LXUDjH4-Kt--2=BpuytjEefuy0A@mail.gmail.com>
Message-ID: <56D19A42.2000809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 22:14, Steve Calfee wrote:
> Hi Arnout,
> 
> On Wed, Feb 24, 2016 at 3:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 02/24/16 04:34, Steve Calfee wrote:
>>> Ubi seems very well supported in buildroot and linux. The problem is
>>> figuring out how to use it.
>>>
>>> I have created two nand partitions, one rootfs and one data.
>>
>>  That's already a bad start, because this way you reduce the wear levelling
>> opportunities. The best way to use UBI is to put everything in a single
>> partition, and create several UBI volumes within that partition.
> 
> Hmm, part the the reason to partition flash is so failures in one will
> not mess up other partitions. I agree that r/w parts should be in one
> ubi partition. I guess everything in one might work, if ubi is very
> careful with updates.

 Well, it depends on where you put your trust, and what lifetime you want from
your product. If your device is supposed to last for many years, then you are
guaranteed to get a lot of bad blocks, which are unpredictably spread over the
partitions. If you have many devices, some of them will have all the bad blocks
concentrated in a single partition. So each partition has to have enough spare
space to take all the bad blocks. This is going to be particularly painful for
the small partitions. I've had projects where the size of the kernel partitions
had to be doubled to take into account bad blocks.

 UBI gets extremely rigorous testing, including power cut testing. So I would
trust UBI more than the datasheet of an el-cheapo flash device :-)


> 
>  The canonical
>> flash layout is:
>>
>> 4   EB SPL (=pre-bootloader)
>> 16  EB bootloader
>> 8   EB bootloader environment (only relevant for U-Boot I guess)
>> the rest UBI
>>   2 volumes kernel
>>   2 volumes DTB
>>   2 volumes rootfs
>>   1 volume  rwdata
>>  (1 volume  per-device ro data is also often needed)
> 
> Yes I have seen layouts like that. This is for a personal project, and
> I don't have enough flash. If I have a problem I can always go back to
> uboot and nfs boot the system for updates.

 Well, in that case the reliability is not an issue either :-)

[snip]
>>> I assume the post scripts can be used, but I cannot find
>>> examples. In post scripts how do I set permissions/user/group fields.
>>
>>  For ownership and permissions, there is BR2_ROOTFS_DEVICE_TABLE. post-build
>> script doesn't help because you have to do that as root, and the post-build
>> script is executed as an ordinary user.
>>
> 
> Thanks, I will look into that, These options built into buildroot are
> really great, but sometimes their existence and how to use them are
> not clear to me.

 If you have ideas of how it could be documented better, that would be great. It
is documented in chapter 9.5.1 but that's perhaps a bit hidden away.


> 
>>> How do I link to a mounted partition.
>>>
>>> http://free-electrons.com/blog/creating-flashing-ubi-ubifs-images/ has
>>> lots of info. But say I want a custom ubi.cfg file, where do I put it
>>> or how do i menuconfig it?
>>
>> BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
>>
> 
> Thanks, that config was hidden behind another one, and a little tricky
> to find, but once I knew what I wanted it worked great.

 Ah yes, it makes sense from the perspective of the buildroot logic (buildroot
primarily builds a filesystem, and for ubifs you can optionally embed that into
a UBI image, and only in that case there is a config file possible). But from a
user it is not completel logical.

 We should perhaps restructure the filesystem creation a little into a part
about the actual filesystem and a part about making images out of the
filesystems. Because we now already have a few different ways of making images
that are not just filesystems (isohybrid, ubi). And in the defconfigs we use
genimage instead...

[snip]
>>> What if the nand and rootfs is bigger than ram? How do you update it in uboot?
>>
>>  You don't want to do updates from the bootloader. You want to use swupdate,
>> though I'm not sure if it supports streaming upgrade. You also want to use a
>> recent kernel that support atomic volume rename, then you don't need any
>> involvement of the bootloader to do upgrades.
>>
> 
> Good tips, but my production volume will probably be 2 small systems.

 Even so it's probably easiest to do nfsboot and flash from there. And even so,
using swupgrade is probably easier than writing your own flash script.


> 
>>  Oh, and you probably want to hire someone like to figure all this out for you :-)
>>
> That's no fun. I am doing this on a personal project. I have worked on
> NOR flash systems, so this time I am trying to work with nand and the
> ubi layer. It's very educational to actually bring up a new system.

 It is! But then you should consider it a challenge that it is difficult to find
information :-P


 Regards,
 Arnout

> 
> Thanks for the tips, Steve
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
