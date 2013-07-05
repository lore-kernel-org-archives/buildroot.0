From: Guillermo Amaral <g@maral.me>
Date: Fri, 5 Jul 2013 10:30:33 -0700
Subject: [Buildroot] Raspberry Pi and recent commit
In-Reply-To: <20130705161348.GB3596@free.fr>
References: <20130704233617.GA10505@enterprise.localdomain>
 <20130705161348.GB3596@free.fr>
Message-ID: <20130705173033.GA20957@enterprise.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 05, 2013 at 06:13:48PM +0200, Yann E. MORIN wrote:
> tatus: O
> Content-Length: 3192
> Lines: 76
> 
> Guillermo, All,
> 
> On 2013-07-04 16:36 -0700, Guillermo Amaral spake thusly:
> > I noticed that in a recent commit (3d2c99565856fa96320019dfb7b81fd18e66311f)
> > the rootfstype was removed from the rpi config.txt file.
> 
> This change was on-purpose, and I believe it is correct.
> 
> The rationale behind this change is we do not want to force the user to
> use ext4 for the rootfs.
> 
> There are two options here:
>   - either we restore the previous 'rootfstype=ext4' on the command
>     line, and users that want another rootfs type will have to provide
>     either a post-build or post-image script to change this
>   - we keep config.txt as-is without a rootfstype, and all users have to
>     provide a post-build or post-image if they want to force the kernel
>     to use a specific rootfstype (instead of auto-detection).
> 
> So, we switched to the second option, which is a systematic option.
> 
> > I had played with
> > removing it before in rpi-buildroot and I ran into a few issues.
> > 
> > One being that the kernel would fail to mount the ext4 fs if you had ext2
> > and/or ext3 enabled in the kernel, since it tries to mount ext2,
> > ext3 then ext4. It can even mount it as ext3, ignoring the journal.
> 
> The order in which the kernel tries filesystems is:
>   - ext3
>   - ext2
>   - ext4
> 
> If you have an ext4 rootfs, it should not be possible to mount it with
> either ext3 or ext2, so the kernel should gracefully fallback to ext4,
> since ext4 has features not supported by either ext2 or ext3.
> 
> How did you generate your ext4 filesystem?
> 
> > Just wanted to warn you guys, maybe it was fixed or something, I haven't had
> > time to test out master.
> 
> We believe this is the correct behaviour of Buildroot.

Fair enough, I was just wondering if you guys got the same issues, guess not.

> > Also, I always wanted to ask, is there any reason you guys didn't place the
> > rpi firmware under boot? That's where I put it, seemed like the logical place:
> > 
> >     https://github.com/gamaral/rpi-buildroot/tree/rpi/boot/rpi
> 
> It would be nice if the RPi people, instead of forking the whole world,
> would contribute their changes to upstream projects. :-/
> 
> Also, I'd suggest you have a look at my 'buildroot.config' repository.
> Instead of being yet-another-fork of Buildroot, it is just a set of
> defconfig files and scripts, which (is meant to) use the main upstream
> Buildroot tree:
>     http://ymorin.is-a-geek.org/git/buildroot.config/
> 
> It even goes further than gamaral/rpi-buildroot, in that it even builds an
> SDcard image (complete with MBR, part table, VFAT and rootfs partitions),
> ready to be dumped to the device.

Lack of free time would be the main reason, at least for me. I had a separate
overlay you could CPIO onto buildroot for my game console, somewhat similar to
what you have there but when buildroot started adding RPi support it made it
too much work to keep up so I opted to clone and keep track of it like that.

That said, I can submit some of my changes, but they are tied to my
repositories. This is due to the the RPi repositories having no real stable
branch or version tagging yet (and also, I like to shallow clone).

If that's not a deal breaker, I can submit some patches,
G

P.S. I made a bash script that flashes any size SD card directly, it can also
create image files, dunno if that's of any interest to you.

-- 
gamaral http://about.me/gamaral
