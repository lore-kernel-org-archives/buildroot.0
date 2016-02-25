From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 25 Feb 2016 13:14:36 -0800
Subject: [Buildroot] user question about ubi nand
In-Reply-To: <56CE3628.7000903@mind.be>
References: <CAJJ6jxu+5mSnNq6hmnCS1nB5cx8qmyip5qoRONjtw1WHUqox5A@mail.gmail.com>
 <56CE3628.7000903@mind.be>
Message-ID: <CAJJ6jxvynFore7-FZNbtXj_LXUDjH4-Kt--2=BpuytjEefuy0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Feb 24, 2016 at 3:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/24/16 04:34, Steve Calfee wrote:
>> Ubi seems very well supported in buildroot and linux. The problem is
>> figuring out how to use it.
>>
>> I have created two nand partitions, one rootfs and one data.
>
>  That's already a bad start, because this way you reduce the wear levelling
> opportunities. The best way to use UBI is to put everything in a single
> partition, and create several UBI volumes within that partition.

Hmm, part the the reason to partition flash is so failures in one will
not mess up other partitions. I agree that r/w parts should be in one
ubi partition. I guess everything in one might work, if ubi is very
careful with updates.

 The canonical
> flash layout is:
>
> 4   EB SPL (=pre-bootloader)
> 16  EB bootloader
> 8   EB bootloader environment (only relevant for U-Boot I guess)
> the rest UBI
>   2 volumes kernel
>   2 volumes DTB
>   2 volumes rootfs
>   1 volume  rwdata
>  (1 volume  per-device ro data is also often needed)

Yes I have seen layouts like that. This is for a personal project, and
I don't have enough flash. If I have a problem I can always go back to
uboot and nfs boot the system for updates.

>
> kernel, DTB and rootfs have two copies for upgrade, i.e. you write to a new
> volume while keeping the currently running version alive.
>
>
>> I would
>> like the rootfs to be readonly and data to be r/w. After tons of
>> searches I have configured the rootfs and stored the buildroot built
>> image in it.
>>
>> My question is how do I move r/w areas from rootfs into the r/w
>> partition. Examples are /etc/ files /run files which start as /var/run
>> and finally application files like mysql databases which are in
>> /usr/share/.
>
>  For this, there is no standard way because there are several ways to do it.
>
> - Use some kind of overlayfs so that your readonly rootfs acts as if it's wriitable.
>
> - Move the files that should be writeable to the rw partition and create
> symlinks for them.
>
> - Move the files that should be writeable to tmpfs and generate them at boot time.
>
> - Configure packages to search for the writable files in the rw partition
> instead of their usual location.
>

The fstab idea and making a rw partition empty by default - inited by
programs that need it sounds good to me.

>
>> I assume the post scripts can be used, but I cannot find
>> examples. In post scripts how do I set permissions/user/group fields.
>
>  For ownership and permissions, there is BR2_ROOTFS_DEVICE_TABLE. post-build
> script doesn't help because you have to do that as root, and the post-build
> script is executed as an ordinary user.
>

Thanks, I will look into that, These options built into buildroot are
really great, but sometimes their existence and how to use them are
not clear to me.

>> How do I link to a mounted partition.
>>
>> http://free-electrons.com/blog/creating-flashing-ubi-ubifs-images/ has
>> lots of info. But say I want a custom ubi.cfg file, where do I put it
>> or how do i menuconfig it?
>
> BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
>

Thanks, that config was hidden behind another one, and a little tricky
to find, but once I knew what I wanted it worked great.

>> Say I want 2 partitions, one ro and one rw
>> I assume I need a special cfg file.
>
>  Buildroot will not help you to create the rw partition. In many systems, it is
> created at boot time if it doesn't exist yet. That's also a simple way to do a
> factory reset: just remove the rw volume. But you can also create it at build
> time (using mkubifs) in the post-build script, and specify it in the custom ubi.cfg.
>
>
>> Ubi asks for lots of magic
>> numbers, how do I get them - such as erasesize, subpagesize, offsets
>
>  On the device, you can use mtdinfo to get these. But unless you're using an
> off-the-shelf board, you already had to specify these values in the device tree.
>
>> etc? I assume defaults are good, but how can I know. Typical Linux
>> stuff, however these thing are knowable, how do I find it out (via web
>> searches etc).
>

Yes it must be built into my device tree or something. I just wondered
how to find this info.

>
>> How do I do set the config file in BR2_EXTERNAL?
>
>  I don't see how this is related to ubi... Actually I don't understand the
> question even.
>

I was asking about the ubi configuration, I set the ubi custom config
to $(BR2_EXTERNAL)/myboard/myubi.cfg


>>
>> All info I find is schizophrenic. Net searches say how to do things
>> like this in uboot and linux. Sometimes in the same doc paragraph. It
>> is never clear which instruction matches which of uboot and linux. For
>> buildroot the best is stuff mainly done in the build, but something
>> must be done on the target. What is the recommended procedure for mass
>> building systems?
>
>  You almost always need to do something at first boot, some kind of provisioning
> e.g. to set MAC addresses. What I often see is that you build a specific
> production image, flash that one in the factory (or put it on an SD card and
> boot from that). This production image does some hardware tests, does
> provisioning, and downloads the up-to-date application image to write to flash.
> So it has a completely different configuration than the application image.
>
>>
>> What if the nand and rootfs is bigger than ram? How do you update it in uboot?
>
>  You don't want to do updates from the bootloader. You want to use swupdate,
> though I'm not sure if it supports streaming upgrade. You also want to use a
> recent kernel that support atomic volume rename, then you don't need any
> involvement of the bootloader to do upgrades.
>

Good tips, but my production volume will probably be 2 small systems.

>  Oh, and you probably want to hire someone like to figure all this out for you :-)
>
That's no fun. I am doing this on a personal project. I have worked on
NOR flash systems, so this time I am trying to work with nand and the
ubi layer. It's very educational to actually bring up a new system.

Thanks for the tips, Steve
