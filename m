From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 09:41:48 -0300
Subject: [Buildroot] [PATCH POC 5/5] qemu/x86_64: add midori samples for
 wayland and x11r7
In-Reply-To: <56F7CA4D.8040102@mind.be>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
 <1459020911-20593-6-git-send-email-gustavo@zacarias.com.ar>
 <56F7CA4D.8040102@mind.be>
Message-ID: <56F9268C.5050000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/03/16 08:55, Arnout Vandecappelle wrote:

>   A demo defconfig! Great!
>
>   I have nothing major to comment on, just a few points.

Hi.
Let's see, it was mostly a proof-of-concept (POC) / RFC so adjustments 
are definitely welcome/needed.


>   I think it would be better to start the name with the base defconfig,
> so qemu_x86_64_midori_wayland_defconfig.
>
>   Oh, wait, is it actually a qemu defconfig? I guess not because it
> creates a full disk image...
>
>   Maybe it would be better then to first add a separate x86_64_defconfig
> that creates a simple disk image for x86_64, and in a second patch add
> the x86_64_midori_x11 and _wayland defconfigs. That would also make the
> patches much easier to review.

Yes, i already have a pc_bios_x86_64_defconfig, it just happens that 
this config can be used via qemu or real hardware.
The idea is indeed to have a base "pc" config to have the kernel config 
fragment with all the drivers, though it might be a little overkill for 
qemu since many will go unused just adding up size.

>   Oh, and you're also missing a readme.

Oh yes.

>   Maybe add a comment why this is needed.

I'm using this for the volatile/permanent storage logic, will expand on 
this below...

>   The meaning of this "Private" and "Permanent" is a bit vague.
> Actually, what does the grow_root mean?

s/Private/Volatile/
Or "just run don't store anything".

>   Why squashfs? Ext4 would be the more logical choice IMHO, you can make
> it writable as well.

The image is quite smaller than ext4, and also with ext4 and genimage 
you must know your target size or set it to some arbitrary number.
Previously i used +128 MB free space for the image size on ext4, 
resulting on a squashfs4 wayland a target image of roughly 100 MB, 
whereas for ext4 it was more around 450 MB.
The extra free space is needed for the browser to store temporary files, 
the worst offender being watching some html5 video that potentially 
needs the full size on disk at one given time (it will go away once you 
close it).
I decided that setting +128 MB wasn't nearly good enough - it would 
waste available space if the media is bigger (likely), or some people 
just don't want to store it altogether, or some $video wouldn't fit, so 
going to a "keep binaries RO and small" solution seemed better, with a 
boot option to select the mode. On volatile just throw a tmpfs for 
/root, if it's permanent (unimplemented yet, but not difficult) add an 
extra partition with an ext4 filesystem to store it. That's where rdev 
is needed, to find out the root filesystem device.
That's also the reason e2fsprogs & parted are in there.

>   Wouldn't it be better to enable everything that works on x86 as
> modules? This is a bit a random selection...

Yes, indeed.

>   Same here.

Ditto, it's not complete and we wouldn't want to complete with builtins.

>   If / is rw, this isn't needed.

Dual-strategy scenario above, without the permanent implemented yet.

>   Can't wayland autodetect the backend like X?

It has a default, but no, it doesn't autodetect.
There are only two of interest here though: drm or fbdev, with fbdev 
being the most foolproof of all.
We might throw this in a config file in /etc though.

>   Is it useful to have all these commented out lines?

They were there for testing/debugging, they can go.

>   post-build.sh would be a better name.

Yes, sure.

>   Couldn't it just be part of the overlay?

Probably, i didn't clean-up everything, it wasn't intended to be a final 
config, just to get the ball rolling to discuss.

>   Why mtools?

Leftover from testing with syslinux, no longer necessary.

A couple of extra comments from myself ("i'm not crazy!") ;-)

* We can add squashfs support directly to the grub2 default, size growth 
is minimal and we're talking about x86/x86_64 which normally aren't that 
strained in resources. Hence drop it in the defconfig.

* Fluxbox creates the menu config dynamically based on host 
installed/detected tools, it might be interesting changing this since 
you may miss a lot of entries, or have too many missing ones.
Even having a simple base menu config and disabling the automatic one 
might be desirable, while adding a comment to fluxbox's Config.in

Regards.
