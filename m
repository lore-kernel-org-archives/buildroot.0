From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jul 2013 18:13:48 +0200
Subject: [Buildroot] Raspberry Pi and recent commit
In-Reply-To: <20130704233617.GA10505@enterprise.localdomain>
References: <20130704233617.GA10505@enterprise.localdomain>
Message-ID: <20130705161348.GB3596@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillermo, All,

On 2013-07-04 16:36 -0700, Guillermo Amaral spake thusly:
> I noticed that in a recent commit (3d2c99565856fa96320019dfb7b81fd18e66311f)
> the rootfstype was removed from the rpi config.txt file.

This change was on-purpose, and I believe it is correct.

The rationale behind this change is we do not want to force the user to
use ext4 for the rootfs.

There are two options here:
  - either we restore the previous 'rootfstype=ext4' on the command
    line, and users that want another rootfs type will have to provide
    either a post-build or post-image script to change this
  - we keep config.txt as-is without a rootfstype, and all users have to
    provide a post-build or post-image if they want to force the kernel
    to use a specific rootfstype (instead of auto-detection).

So, we switched to the second option, which is a systematic option.

> I had played with
> removing it before in rpi-buildroot and I ran into a few issues.
> 
> One being that the kernel would fail to mount the ext4 fs if you had ext2
> and/or ext3 enabled in the kernel, since it tries to mount ext2,
> ext3 then ext4. It can even mount it as ext3, ignoring the journal.

The order in which the kernel tries filesystems is:
  - ext3
  - ext2
  - ext4

If you have an ext4 rootfs, it should not be possible to mount it with
either ext3 or ext2, so the kernel should gracefully fallback to ext4,
since ext4 has features not supported by either ext2 or ext3.

How did you generate your ext4 filesystem?

> Just wanted to warn you guys, maybe it was fixed or something, I haven't had
> time to test out master.

We believe this is the correct behaviour of Buildroot.

> Also, I always wanted to ask, is there any reason you guys didn't place the
> rpi firmware under boot? That's where I put it, seemed like the logical place:
> 
>     https://github.com/gamaral/rpi-buildroot/tree/rpi/boot/rpi

It would be nice if the RPi people, instead of forking the whole world,
would contribute their changes to upstream projects. :-/

Also, I'd suggest you have a look at my 'buildroot.config' repository.
Instead of being yet-another-fork of Buildroot, it is just a set of
defconfig files and scripts, which (is meant to) use the main upstream
Buildroot tree:
    http://ymorin.is-a-geek.org/git/buildroot.config/

It even goes further than gamaral/rpi-buildroot, in that it even builds an
SDcard image (complete with MBR, part table, VFAT and rootfs partitions),
ready to be dumped to the device.

Note: it is still a WIP, and for now relies on an external toolchain
that I built with crosstool-NG (and for which I can share the .config if
needed, and will add to the tree later).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
