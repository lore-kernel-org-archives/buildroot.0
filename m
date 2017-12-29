From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 29 Dec 2017 19:54:49 +0000
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171229093818.GA3176@scaer>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish> <20171229093818.GA3176@scaer>
Message-ID: <1514577289.26695.127.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2017-12-29 at 10:38 +0100, Yann E. MORIN wrote:
> 
> I prefer the second option, because it concentrates the dependency chain
> in a single package, and it becomes very easy to write:
> 
>     BUSYBOX_DEPENDENCIES = \
>         $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
>     [...]

Could one have a package variable specifically for install
dependencies, like:

BUSYBOX_INSTALL_DEPENDENCIES = coreutils util-linux ...

It seems like the base pkg infra could automagically turn that into
conditional dependencies, e.g. "coreutils" -> "(if
$(BR2_PACKAGE_COREUTILS), coreutils)".  And then append those to the
package dependencies.

So less boilerplate to write in the package file.

But it would also allow the possibility to take advantage of knowing
that coreutils is an install dependency rather than a build dependency.
 So it's allowed to build busybox and coreutils at the same time in
parallel.  The requirement is only that coreutils be installed to the
target dir first.  Usually installing is much faster than building, so
one gets more parallelism this way.

Of course this optimization is not necessary, but separating out the
install deps now allows the possibility in the future, while being less
boilerplate and more clear documentation now.
