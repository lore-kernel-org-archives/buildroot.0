From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 20 Jul 2020 12:26:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: pre-create directories
 for services
In-Reply-To: <CAFvCimXHxkL-nNO9EMuLZNJUKuLqbr7bW3r=NxCEOgRT=iAgfg@mail.gmail.com>
References: <20200717234235.17829-1-nolange79@gmail.com>
 <20200718211625.GR18825@scaer>
 <CAFvCimXHxkL-nNO9EMuLZNJUKuLqbr7bW3r=NxCEOgRT=iAgfg@mail.gmail.com>
Message-ID: <CADYdroPCxhi1vMUFkFg4nmt1+1L_fSrYzLotat5wVvhBusQY+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 20. Juli 2020 um 10:42 Uhr schrieb J?r?my ROSEN <
jeremy.rosen@smile.fr>:

> I am kinda philosophically torn on this one...
>
>
> According to man:file-hierarchy, /var MUST be writable (it MAY be a tmpfs
> if the system has no persistent, writable storage)
>

I'd not confuse the "distribution image" (the thing that buildroot creates)
with the running system.

To me, buildroot should do *everything that's possible* up-front.


> This means that daemons can assume that /var will be writable, and we
> might be starting a wild goose hunt to get them
> working in all cases.
>

Nope, definitely not the aim for buildroot. Personally I would aim at some
sort of base system still being accessible, even if /var is read-only
(might happen if the block-device has errors).
systemd actively tries to do this, v246 will have some fallbacks do
services can start if /var/tmp is read-only (albeit in obviously reduced
fashion).

The clean way to have a file go in /var (at least with systemd) is to put
> it in /usr/share/factory/var/ and systemd will copy it to
> /var on first boot (or every boot if it's a tmpfs)
>

No, no, no. the factory approach is one of the most fragile I have ever
seen., See [1] for a short list of issues,
[2] for a patch with conflicting use.
That's something requiring a "wild goose hunt" to get in shape.

A clean approach is to mount a overlayfs, ideally already in the initramfs,
or to separate /usr into a RO image. Both approaches are hindered with the
intransparent
logic hidden behind the innocent REMOUNT_ROOTFS_RW option.

The best in-image option would be to either:
- hook /sbin/init
- create a systemd-unit that is run after /var is mounted and before
tmpfilesd-create is run.

At one of these points, do either an overlayfs or copying over the contents
to a new tmpfs, then bindmounting it to /var.

I'd still do this as a separate option to REMOUNT_ROOTFS_RW, perhaps even
as its own package.

this has the added advantage that /var can be empty at install time, can be
> easily reset by reformatting/emptying
> without breaking the system.
>

Thats what tmpfilesd is for, ideally it doesn't require copying over the
old contents. Then it works with an empty /var whether you use the rw or ro
option in buildroot,
you just might need to add a tmpfs mount there.

I have no idea how factory is handled in sysV.
>
> If buildroot wants to support read-only /var, it's supporting a "buggy
> setup" according to various standards including FHS.
> And yeah... it's a buggy setup, but it's also a common setup :(
>

I'd call it a robust setup, if things still work in a reduced fashion.
But again I use buildroot as a "distribution image" generator, I do mount
an overlayfs over the whole fs in the initramfs,
something that seems official support as you cant mount a .tar file.


>
> So, I guess it's important to point that out but I don't really know what
> the correct answer is for buildroot..
>

For this patch, its just a question if the work (as in maintainance cost)
is acceptable to pre-create the directories,
I don't see any downsides, philosophically or pragmatically.

How RO-systems should be supported is another question, but in my
opionion a bind-mount script that works
on all init-systems (just maybe hooked-in differently) and doesnt causes a
host of side-effects would be alot better than the status quo.

I'll append a small example, how such a bind-mount script (with overlay)
would look like.

[1] - http://lists.busybox.net/pipermail/buildroot/2020-July/287016.html
[2] - http://lists.busybox.net/pipermail/buildroot/2020-July/287200.html

ROOTFSDIR=/tmp/rootfs
OVLDIR=/run/ovl

# create a separate filesystem for testing
mkdir $ROOTFSDIR
mount -t tmpfs tmpfs_root_to $ROOTFSDIR
mkdir $ROOTFSDIR/var
touch $ROOTFSDIR/var/upperfile
mount -o remount,ro $ROOTFSDIR

# real overlay script

mkdir $OVLDIR
mount -t tmpfs tmpfs_root_ovl $OVLDIR
mkdir $OVLDIR/lower $OVLDIR/upper $OVLDIR/work

mount --bind $ROOTFSDIR/var $OVLDIR/lower
mount -t overlay -o
lowerdir=$OVLDIR/lower,upperdir=$OVLDIR/upper,workdir=$OVLDIR/work
overlay_var $ROOTFSDIR/var
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200720/0ccdc4e3/attachment.html>
