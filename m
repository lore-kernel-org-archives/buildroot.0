From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 11 Jul 2020 14:33:19 +0200
Subject: [Buildroot] [PATCH v2] package/systemd: use current tool for
 generating HWDB
In-Reply-To: <20200711121209.GF2273@scaer>
References: <20200710222656.6885-1-nolange79@gmail.com>
 <20200711112731.GE2273@scaer>
 <CADYdroMdAVoxU406wekms08mrCvueeN1jqQ39cnY59S4J9Y0wQ@mail.gmail.com>
 <20200711121209.GF2273@scaer>
Message-ID: <CADYdroOW6LgRmYPcdWMaWQkAHrko61OrpMrZOOgjWe+aSx1D-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN <yann.morin.1998@free.fr> schrieb am Sa., 11. Juli 2020,
14:12:

> Norbert, All,
>
> On 2020-07-11 13:57 +0200, Norbert Lange spake thusly:
> > Yann E. MORIN < [1]yann.morin.1998@free.fr> schrieb am Sa., 11. Juli
> 2020, 13:27:
> >   On 2020-07-11 00:26 +0200, Norbert Lange spake thusly:
> [--SNIP--]
> >   > Also remove the config files from both paths
> >   > (rootfs overlay could add stuff) aswell as the service and tool
> >   > from the target fs.
> [--SNIP--]
> >   However, I'm against removing the service altogether, because in the
> >   past, some people have expressed the need to be able to update the hwdb
> >   on-target.
> >
> > That would be challenging, as the source files for the database were
> already removed before this patch.
> > If they had to re-add those, then a adding a tool and service from the
> target directory won't be too much to ask?
>
> Those people would indeed be responsible for downloading the source
> again, and re-run the update.
>
> > I mean buildroot pretty much doesn't support some sorta packet manager
> system by design.
> > Why the exception here?
>
> I don;t remember, but IIRC there was a rather-copnvioning argument in
> favour of it.
>

Yeah, but I guess that's a very specialised need, and I don't get why they
don't just manually run systemd-hwdb after transferring the source files.
Or even do everything on the host and copy over the final DB.

Further, the service does something different (systemd-hwdb without --usr)
compared to both old (udevadm) and proposed new (--usr) buildroot hook.
And as the files are now not within /etc, and the service is primed on
that, this could end up in further oddities.


> >   I would be OK with having a drop-in that disables the service by
> default
> >   when BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set, though.
> >
> > It will only run when /usr is newer than /etc AFAIR (not sure how this
> is determined),
>
> See commit bbe5c6dad4d (Makefile: Update mtime of $(TARGET_DIR)/usr in
> target-finalize) which goal was to adress this.


> > so disabling does very little.
> > BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW already has too many
> > surprising effects for me.
>
> I too am not very happy with BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
> because one can still select a squashfs filesystem at the same time.,
> and that does not make sense to remount R/W a sqsh, as it is R/O by
> nature.


Or pack /usr into separate filesystem, or use an overlay (which is my
pick). I'd be happy if there's some file at the end with paths that can be
removed if the distribution is "write once".

Could just remove those paths in a fake root script, or after a one-time
setup on the target.

But heck, I don't find it very logical that we can build more than one
> filesystem at the same time either (we should have a choice there),
> so...
>

Some more "meta" like a list of files to remove or copy could help in
various post-processing.

Norbert
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200711/37242ef8/attachment.html>
