From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 10:42:19 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171229093818.GA3176@scaer>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
 <20171229093818.GA3176@scaer>
Message-ID: <20171229104219.71c908e6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 10:38:18 +0100, Yann E. MORIN wrote:

> As was discussed during the DevDays in Pragues about top-level parallel
> build, we've concluded that we could not have two packages that touch
> the same file.
> 
> When we are doing top-level parallel build, we no longer have any
> guarantee of the ordering, especially the order packages install in
> target/, so we loose the reproducibility that sequentiallity currently
> provides.
> 
> So we have to ensure proper install ordering, so that we guarantee what
> files are in target/.
> 
> So we either go with the current dependencies, added to all packages to
> ensure they get installed after busybox, or we add them to busybox so it
> gets installed after all the packages for which it may provide applets.
> 
> I prefer the second option, because it concentrates the dependency chain
> in a single package, and it becomes very easy to write:
> 
>     BUSYBOX_DEPENDENCIES = \
>         $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
>     [...]
> 
> Rather than duplicate the optional dependency on Busybox in all the
> packages (and as Thomas demonstrated, there are quite a few of them).

Seems like a good idea to me.

> I may even go further: we could even make busybox depend on *all*
> packages, irrespective on whether it provides applets for them or not,
> since busybiox is pretty fast to build and does build in parallel quite
> nicely anyway. That would nicely solve the issue.

I don't really like this approach, I find it too brutal.

Since we have the testing logic to validate that no package overwrites
files from another package, I think the approach of having explicit
dependencies in Busybox is good enough.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
