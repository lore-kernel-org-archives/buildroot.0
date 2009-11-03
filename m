From: Will Newton <will.newton@gmail.com>
Date: Tue, 3 Nov 2009 10:20:58 +0000
Subject: [Buildroot] [PATCH] Introduce support for using either
	e2fsimage of genext2fs
In-Reply-To: <6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com>
References: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
	<6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com>
Message-ID: <87a5b0800911030220o383c9897xaa3838fad0510970@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 3, 2009 at 2:08 AM, Dan Christensen <opello@opello.org> wrote:

Hi Dan,

I don't personally use ext2 filesystems myself, so I can't really
comment on one tool versus the other, but on the whole your patch
looks like it makes sense.

> I was hoping to get some feedback on this, and had some further ideas.
> ?But I didn't see anyone reply.
>
> I reworked this patch to be from the latest git as of a few minutes
> ago. ?I hope this allows someone to examine it more easily, and
> comment on it.
>
> I did end up with a few questions about how e2fsimage's dependencies
> should be met. ?It depends on e2fslibs-dev (debian package name), and
> I see that e2fsprogs is already a package built for the target. ?I was
> wondering if this could be build for the host as well, similar to how
> fakeroot has both a 'target' and a 'host' configuration. ?I wasn't
> sure how this would work with the new Makefile.autotools.in changes in
> e2fsprogs.mk.
> The way I solved this for myself was adding support to build it to my
> own e2fsprogs.mk (not included in this patch as it doesn't seem the
> correct way to manage the dependency).

I think the buildroot way is to try and minimize the dependencies
required on the host system, so we build host dependencies where
possible. The autotools infrastructure is not currently capable of
building host packages, although I think Thomas's upcoming changes
will likely fix that.

> The other significant question I had was the CFLAGS that should be
> used for e2fsimage. ?I simply copied the ones used for genext2fs
> (-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64) and it seemed to work.

Do we need to set CFLAGS at all? Won't configure take care of setting
some appropriate flags for us?
