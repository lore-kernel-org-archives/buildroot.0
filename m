From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 29 Dec 2017 21:50:17 +0000
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171229201806.GR3176@scaer>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish> <20171229093818.GA3176@scaer>
 <1514577289.26695.127.camel@impinj.com> <20171229201806.GR3176@scaer>
Message-ID: <1514584216.26695.149.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2017-12-29 at 21:18 +0100, Yann E. MORIN wrote:
> On 2017-12-29 19:54 +0000, Trent Piepho spake thusly:
> > On Fri, 2017-12-29 at 10:38 +0100, Yann E. MORIN wrote:
> > > 
> > > I prefer the second option, because it concentrates the dependency chain
> > > in a single package, and it becomes very easy to write:
> > > 
> > >     BUSYBOX_DEPENDENCIES = \
> > >         $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
> > >         $(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
> > >     [...]
> > 
> > Could one have a package variable specifically for install
> > dependencies, like:
> 
> I think you already suggested so on IRC a while back, right?

Yes LTIB did this.  LTIB was fancier about automatically taking into
account changes in configuration to minimize rebuilding (disks were
slower then!) and this helped.  I don't think it's important w.r.t.
what buildroot could do here.

Buildroot is different software of course and I don't think LTIB is
important w.r.t. what buildroot could do here. Rather, consider that at
one time buildroot could not build packages in parallel and now it
will.  Just because something does not appear useful now does not mean
it never will be.

> If we were to add support for install dependencies, we would want to
> treat them as the other dependencies and not do magical thigns like list
> all of them and defer to the infra to sort out those that are enabeld.
> 
> In fact, that would go contrary to what we currently do for the existing
> dependencies: if a package lists a dependency but it is not enabled, we
> explicitly fail.

But it seems like this the exact opposite of what is being done?!  If
one uses:
BUSYBOX_DEPENDENCIES += $(if $(BR2_PACKAGE_COREUTILS),coreutils)

Then make busybox-show-depends does NOT list coreutils, because I have
not enabled coreutils.  Same with graph-depends, coreutils-show-
rdepends, and so on.

But if one does:
BUSYBOX_INSTALL_DEPENDENCIES += coreutils

Then it's possible to choose another policy.  One could make show-
depends only show the dependency if coreutils is enabled, just like
now, but add a show-all-install-depends target that lists all possible
dependencies, whether enabled or not.  Maybe someone will want
that?graph-depends could use a different color for the lines.

But if the distinction is not made, then all these possibilities go
away.

It's not that complex either, one line in pkg-generic before setting
FINAL_DEPENDENCIES

$(2)_DEPENDENCIES += $$(foreach p,$$($(2)_INSTALL_DEPENDENCIES),$$(if $$(BR2_PACKAGE_$$(call UPPERCASE,$$(p))),$$(p)))
