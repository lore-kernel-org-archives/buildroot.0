From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 21:18:06 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <1514577289.26695.127.camel@impinj.com>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
 <20171229093818.GA3176@scaer>
 <1514577289.26695.127.camel@impinj.com>
Message-ID: <20171229201806.GR3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2017-12-29 19:54 +0000, Trent Piepho spake thusly:
> On Fri, 2017-12-29 at 10:38 +0100, Yann E. MORIN wrote:
> > 
> > I prefer the second option, because it concentrates the dependency chain
> > in a single package, and it becomes very easy to write:
> > 
> >     BUSYBOX_DEPENDENCIES = \
> >         $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
> >         $(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
> >     [...]
> 
> Could one have a package variable specifically for install
> dependencies, like:

I think you already suggested so on IRC a while back, right?

In fact, I do see the reasoning behind this, but I don;t think there is
a big advantage for us, in Buildroot.

In any case, we will want those dependencies to be installed befiore the
package itself is installed, so we don't care that they were installed
before the package is built.

One case where that might be interesting is to test-build a package
without building its install dependencies. But except for busybox, it
would only be usefull for very few packages, because in the vast
majority of cases, dependencies are build dependencies.

So I don't think it warrants the extra complexity in the infra...

> BUSYBOX_INSTALL_DEPENDENCIES = coreutils util-linux ...

If we were to add support for install dependencies, we would want to
treat them as the other dependencies and not do magical thigns like list
all of them and defer to the infra to sort out those that are enabeld.

In fact, that would go contrary to what we currently do for the existing
dependencies: if a package lists a dependency but it is not enabled, we
explicitly fail.

So we'd want to have:

    BUSYBOX_INSTALL_DEPENDENCIES = \
        $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
        [...]

Adn then...

> It seems like the base pkg infra could automagically turn that into
> conditional dependencies, e.g. "coreutils" -> "(if
> $(BR2_PACKAGE_COREUTILS), coreutils)".  And then append those to the
> package dependencies.
> 
> So less boilerplate to write in the package file.

... that would not diminish the "boilerplate" in the package's .mk file.

But know that this is specifically just for busybox (and maybe a very
few other packages), so that really does not warrant extra support in
the infra, IMHO...

Regards,
Yann E. MORIN.

> But it would also allow the possibility to take advantage of knowing
> that coreutils is an install dependency rather than a build dependency.
>  So it's allowed to build busybox and coreutils at the same time in
> parallel.  The requirement is only that coreutils be installed to the
> target dir first.  Usually installing is much faster than building, so
> one gets more parallelism this way.
> 
> Of course this optimization is not necessary, but separating out the
> install deps now allows the possibility in the future, while being less
> boilerplate and more clear documentation now.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
