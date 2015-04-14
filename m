From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Apr 2015 23:46:30 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <552D65C3.6010106@mind.be>
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>
 <552CF0E1.5090205@mind.be>
 <20150414135424.3b1ab04a@free-electrons.com>
 <552D65C3.6010106@mind.be>
Message-ID: <20150414214630.GC4053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On 2015-04-14 21:08 +0200, Arnout Vandecappelle spake thusly:
> On 14/04/15 13:54, Thomas Petazzoni wrote:
> > On Tue, 14 Apr 2015 12:50:09 +0200, Arnout Vandecappelle wrote:
> >>> diff --git a/fs/common.mk b/fs/common.mk
> >>> index cac127f..41ee86d 100644
> >>> --- a/fs/common.mk
> >>> +++ b/fs/common.mk
> >>> @@ -106,6 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
> >>>  
> >>>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
> >>>  TARGETS_ROOTFS += rootfs-$(1)
> >>> +PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
> >>  This will break the rest of your series for filesystems like ubi and initramfs
> >> that depend on another filesystem, because filesystems are not really packages
> >> so they shouldn't be in PACKAGES.

Damn, I tried a few FS, but not those taht depend on another one...

> > I can see several solutions here:
> > 
> >  1) In the fs infrastructure, separate package dependencies from
> >     filesystem dependencies, like ROOTFS_UBI_FS_DEPENDENCIES =
> >     rootfs-ubifs, and ROOTFS_UBIFS_PACKAGE_DEPENDENCIES = host-mtd.
> >     This is probably the easiest solution, maybe not the prettiest one.
>  I'm not fond of this since it looks pretty complicated.

Agreed.

> >  2) Simply filter out from $$(ROOTFS_$(2)_DEPENDENCIES) the targets
> >     that start with 'rootfs-' when adding them to the PACKAGES variable.
> >     Maybe not that pretty either, but very simple to do.
>  Sounds acceptable, though not ideal.

This has the merit of being very simple and easy to do, so I'm OK with
that, too.

> >  3) Adjust the fs infrastructure so that the rootfs-<foo> targets will
> >     also have rootfs-<foo>-legal-info, rootfs-<foo>-source,
> >     rootfs-<foo>-source-check and so on, a bit like we already
> >     implement rootfs-<foo>-show-depends.
> 
>  Then you can just as well go for 4). And anyway that's not enough because I
> think you have a circular dependency due to target-finalize.

Like Arnout, I don't think there's much point in duplicating the
pkg-infra.

It might sound liek a good idea to implement those rules, but then it
would make even more sense to go for 4.

> >  4) Make the filesystem image stuff real packages. After all, they
> >     install something to $(BINARIES_DIR) and some other packages do it.
> >     Of course, the big difference is that they should have a special
> >     type so that they get built only after all other packages have been
> >     built/installed, the post-build scripts, overlay and so on have
> >     been handled.
> 
>  This sounds more attractive to me, but as you say it's a lot of work.
> 
>  I think to make this possible we first have to converge to the solution where
> every package has a selected kconfig symbol, so PACKAGES can just be the list of
> selected target packages instead of relying on the contents of _DEPENDENCIES.
> 
>  So for now, I'd go for option 2. I've checked and it looks like rootfs-* are
> the only non-package dependencies that appear anywhere (I can't be 100% sure
> though).

Yeah, solution 2 is the best stop-gap measure for now.

When things have calmed and dust has settled down a little, we can
revisit this and go for 4.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
