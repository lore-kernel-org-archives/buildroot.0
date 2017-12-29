From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 10:38:18 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171229055921.abdwvjddkvcuncyr@tarshish>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
Message-ID: <20171229093818.GA3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-12-29 07:59 +0200, Baruch Siach spake thusly:
> On Thu, Dec 28, 2017 at 11:56:39PM +0100, Yann E. MORIN wrote:
> > On 2017-12-28 17:23 +0100, Yann E. MORIN spake thusly:
> > > On 2017-12-14 08:58 +0200, Baruch Siach spake thusly:
> > [--SNIP--]
> > > > Quoting busybox.mk:
> > > > 
> > > > # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
> > > > # full-blown versions of apps installed by other packages with sym/hard links.
> > > > 
> > > > Unfortunately, the noclobber implementation is racy.
> > > 
> > > How is it racy?
> > > 
> > > At the moment we're gonna call it, no other package will be installing
> > > at the same time (in the location seen by busybox at least), so there
> > > should be no race.
> > 
> > Yet there were some issues with that part, so I've sent a small
> > patch-series to busybox to fix the noclobber stuff:
> >     http://lists.busybox.net/pipermail/busybox/2017-December/086039.html
> > 
> > So, with this, we should be able to:
> > 
> >   - invert the dependency chain, so thatr busybox now depends on all
> >     otehr packages that it may install applets of;
> 
> Why would we need a dependency at all? Either busybox builds before that other 
> package (like we do today) in which case the other package overwrites the 
> busybox symlink, or that other package builds before busybox, and then the  
> noclobber option does the right thing.

As was discussed during the DevDays in Pragues about top-level parallel
build, we've concluded that we could not have two packages that touch
the same file.

When we are doing top-level parallel build, we no longer have any
guarantee of the ordering, especially the order packages install in
target/, so we loose the reproducibility that sequentiallity currently
provides.

So we have to ensure proper install ordering, so that we guarantee what
files are in target/.

So we either go with the current dependencies, added to all packages to
ensure they get installed after busybox, or we add them to busybox so it
gets installed after all the packages for which it may provide applets.

I prefer the second option, because it concentrates the dependency chain
in a single package, and it becomes very easy to write:

    BUSYBOX_DEPENDENCIES = \
        $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
        $(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
    [...]

Rather than duplicate the optional dependency on Busybox in all the
packages (and as Thomas demonstrated, there are quite a few of them).

I may even go further: we could even make busybox depend on *all*
packages, irrespective on whether it provides applets for them or not,
since busybiox is pretty fast to build and does build in parallel quite
nicely anyway. That would nicely solve the issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
