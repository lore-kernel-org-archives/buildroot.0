From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 17:36:42 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <552D65C3.6010106@mind.be>
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>
 <552CF0E1.5090205@mind.be>
 <20150414135424.3b1ab04a@free-electrons.com>
 <552D65C3.6010106@mind.be>
Message-ID: <20150417173642.5fa56833@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 Apr 2015 21:08:51 +0200, Arnout Vandecappelle wrote:

> >  1) In the fs infrastructure, separate package dependencies from
> >     filesystem dependencies, like ROOTFS_UBI_FS_DEPENDENCIES =
> >     rootfs-ubifs, and ROOTFS_UBIFS_PACKAGE_DEPENDENCIES = host-mtd.
> >     This is probably the easiest solution, maybe not the prettiest one.
> 
>  I'm not fond of this since it looks pretty complicated.

Complicated is maybe a bit too strong for just splitting things in two
variables. But yes, it's yet another new variable with a very subtle
associated use case.

> >  2) Simply filter out from $$(ROOTFS_$(2)_DEPENDENCIES) the targets
> >     that start with 'rootfs-' when adding them to the PACKAGES variable.
> >     Maybe not that pretty either, but very simple to do.
> 
>  Sounds acceptable, though not ideal.

Not ideal, but very minimal in its impact.

> >  3) Adjust the fs infrastructure so that the rootfs-<foo> targets will
> >     also have rootfs-<foo>-legal-info, rootfs-<foo>-source,
> >     rootfs-<foo>-source-check and so on, a bit like we already
> >     implement rootfs-<foo>-show-depends.
> 
>  Then you can just as well go for 4). And anyway that's not enough because I
> think you have a circular dependency due to target-finalize.

I'm not sure to get your point here. Indeed (3) is just a way of
avoiding all the work to do (4). I'm however, not sure to understand
the circular dependency issue you're talking about.

> >  4) Make the filesystem image stuff real packages. After all, they
> >     install something to $(BINARIES_DIR) and some other packages do it.
> >     Of course, the big difference is that they should have a special
> >     type so that they get built only after all other packages have been
> >     built/installed, the post-build scripts, overlay and so on have
> >     been handled.
> 
>  This sounds more attractive to me, but as you say it's a lot of work.

Yes, it is.

>  I think to make this possible we first have to converge to the solution where
> every package has a selected kconfig symbol, so PACKAGES can just be the list of
> selected target packages instead of relying on the contents of _DEPENDENCIES.

Is this something we want to get to? In practice, I believe most if not
all of the target packages have a selected kconfig symbol. So the
biggest change needed to get to this point would be the need to have
selected kconfig symbols for all the host packages. Do we want to do
that?

I remember I did a proposal with this a long time ago, which allowed to
only include the package .mk files that were actually needed in the
build and therefore reducing the parsing time. However, the general
feedback at the time was that the parsing time is not significant
enough today to justify such a heavy modification.

>  So for now, I'd go for option 2. I've checked and it looks like rootfs-* are
> the only non-package dependencies that appear anywhere (I can't be 100% sure
> though).

Ok, I'll go ahead and implement this. Thanks again for all the in-depth
review, testing, and useful feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
