From: Dan Christensen <opello@opello.org>
Date: Mon, 2 Nov 2009 20:08:45 -0600
Subject: [Buildroot] [PATCH] Introduce support for using either
	e2fsimage of genext2fs
In-Reply-To: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
References: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
Message-ID: <6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

On Wed, Oct 21, 2009 at 7:16 PM, Dan Christensen <opello@opello.org> wrote:
> I recently started using buildroot-2009.08 for a project using an AT91
> series ARM CPU and wanted to boot off of an SD card. ?This was going
> quite well until I ran into a few problems with U-Boot booting the
> image I'd written to the SD card. ?It would boot fine off of FAT, and
> an ext2 filesystem I'd created with mkfs.ext2, but not the filesystem
> I copied to the card with dd.
>
> So I started investigating the differences between the two images I
> had with tune2fs, and it seems as though genext2fs makes a much
> "simpler" ext2 filesystem than mkfs.ext2 does today. ?I'm not sure
> about the history or if there is particular significance behind the
> way it generates the filesystem, if there is any at all. ?This led me
> to another tool called e2fsimage. ?e2fsimage seems to generate a
> filesystem more like today's mkfs.ext2 generates.
>
> The task of incorporating this additional tool into buildroot seemed
> straight forward, but ultimately led to reorganizing the target/ext2/
> directory quite a bit. ?I tried to follow the conventions that I'd
> seen elsewhere, but wasn't sure what guidelines I should be following.
>
> That being said, I would appreciate it if the following patch could be
> reviewed for correctness. ?It worked for me (I could toggle between
> genext2fs and e2fsimage) but I reworked quite a bit of the logic in
> the makefiles and wouldn't be surprised if there were some bugs I
> hadn't noticed.

I was hoping to get some feedback on this, and had some further ideas.
 But I didn't see anyone reply.

I reworked this patch to be from the latest git as of a few minutes
ago.  I hope this allows someone to examine it more easily, and
comment on it.

I did end up with a few questions about how e2fsimage's dependencies
should be met.  It depends on e2fslibs-dev (debian package name), and
I see that e2fsprogs is already a package built for the target.  I was
wondering if this could be build for the host as well, similar to how
fakeroot has both a 'target' and a 'host' configuration.  I wasn't
sure how this would work with the new Makefile.autotools.in changes in
e2fsprogs.mk.
The way I solved this for myself was adding support to build it to my
own e2fsprogs.mk (not included in this patch as it doesn't seem the
correct way to manage the dependency).

The other significant question I had was the CFLAGS that should be
used for e2fsimage.  I simply copied the ones used for genext2fs
(-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64) and it seemed to work.

Thanks for your time.
Dan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ext2-reorganize-and-add-support-for-e2fsimage.patch
Type: application/octet-stream
Size: 17062 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091102/9f3b66a1/attachment-0001.obj>
