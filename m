From: Andreas Naumann <dev@andin.de>
Date: Thu, 10 Apr 2014 15:53:53 +0200
Subject: [Buildroot] [PATCH 2/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <20140409170917.GA3444@free.fr>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <cfbdbd2e5437db8f56cf1db9944cc072897fbe1a.1388768519.git.yann.morin.1998@free.fr>
 <53454B15.7060409@andin.de> <20140409170917.GA3444@free.fr>
Message-ID: <5346A271.8010307@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
thanks a lot for the explanations!

Am 09.04.2014 19:09, schrieb Yann E. MORIN:

>> into master yet. What is the current state?
>
> This has been somewhat refused: we do not want to add new tools in
> Buildroot, and this 'genimages' stuff is seen as a new tool, rather than
> as infrastructure.
>
> However, it has been suggested that we:
>
>    - transform this genimages into a separate project which provides a
>      new filesystem generator, and which Buildroot could use like it is
>      currently using the other filesystem generators;
>
>    - look at Pengutronix' genimage  (without a trailing 's') to see if it
>      would fit our needs.

I had a very quick look at your buildroot.config as well as Pengutronix 
genimage. You seem to do much more than what genimage does, but actually 
creating a bunch of ubi images is sufficient for me. Well I have to try 
it out, needs usually appear when doing things. Right now I dont find 
the time but hopefully in a couple of weeks I should be able to post my 
experience.


regards
Andi




>
> I haven't had time to properly look at Pengutronix' genimage, but last I
> looked, it seemd a bit different than my genimages. I am not too fond of
> genimage, but that's mostly a personal feeling, and is not really
> founded on technical merits. I prefer my genimages implementation, which
> I know how to deal with.
>
> As for my genimages: I am still working on it, and it so far fits all my
> personal needs. I still have some feature that are missing for now, that
> are really needed before it can be widely deployed:
>
>    - mixed filesystem hierarchies split between an initramfs and partitions
>      on a real device;
>
>    - partitions to be mounted that are not to be written (eg. when you
>      upgrade, you do not want to overwrite a config partition, but you
>      still want to have an fstab entry for it).
>
> That's being hamerred out, but it takes a bit of time...
>
>>> The basis behind this is a .ini-like description of the layout of the
>>> final target storage:
>>>    - the list of device(s)
>>>    - per-device, the list of partition(s)
>>>    - per-partition, the content
>>>
>>> It is possible to create MBR- or GPT-based partitoining schemes. Adding
>>> new ones should be relatively easy (but would need adequate host tools).
>>>
>>> For now, the only content possible for partitions is a filesystem. It
>>> should be pretty easy to add new types (eg. un-formated, or raw blob).
>>>
>>> Also, only two filesystems are supported: ext{2,3,4} and vfat. Adding
>>> more will be relatively easy, provided we have the necessary host
>>> packages to deal with those filesystems.
>>
>> However, I'not sure if it actually is what I am looking for. Which is
>> dividing the target content into multiple partitions, which are then mounted
>> into the rootfs (like /data, /etc/somespecialconfig, /var/log).?
>
> Yes, that's exactly what genimages is supposed to cover: a filesystem
> hierarchy made of more than the / mountpoint.
>
>> Are there other ways to do that?
>
> Depends what you mean. I am using a 'wrapper' project arounf Buildroot,
> which genimages originates from. In this project, I'm using genimages as
> a post-image script that just extract the rootfs.tar and works from
> there to generate the multiple filesystem images for the different
> partitions.
>
> But it is not really usable outside of my project, since it is tightly
> coupled with the post-build script.
>
> Basically, if all you have are filesystem on reald decives (flash,
> HDD...), then genimages could world stand-alone.
>
> But if your setup involves an initramfs for the rootfs, plus one or more
> partitions on a real device, you have to fill entries for those
> partitions in etc/fstab, but doing so in post-image is too late, because
> the etc/fstab is in the initramfs, which is in the kernel image, which
> is assembled during the image phase. So we can't fill-in etc/fstab from
> a post-image script in this case. [*]
>
> However, it is always possible to fill-in etc/fstab from a post-build
> (aka pre-image) script, whether your rootfs is on a real device or an
> initramfs. And that's what my post-build script does (among many other
> things).
>
> So my genimages is tightly coupled to my rootfs-fixup post-build script,
> and I currently do not see a clean way to provide genimages as just
> another filesystem generator. If we wanted to truly have genimages in
> Buildroot, we'd need more than hooking after the rootfs.tar generator.
>
>
> [*] Well, it could be possible to call back to Buildroot to regenerate
> the kernel image with the initramfs once we tweaked etc/fstab, but
> that's pretty ugly, and prone to errors.)
>
>
> If you want to have a look, here's my "buildroot.config' project:
>      http://ymorin.is-a-geek.org/git/buildroot.config/
>
> There's currently pretty much no documentation, besides the one I wrote
> for inclusion in Buildroot (available in this thread). That's something
> I should really write... The README is a bit out-dated, so not completely
> accurate, but the idea is there.
>
> I have a tutorial on how to use it to build an XBMC for the RPi:
>      http://ymorin.is-a-geek.org/projects/rpi-xbmc
>
> Any suggestion/idea on how to progress on Buildroot is welcome, of
> course! ;-)
>
> Regards,
> Yann E. MORIN.
>
