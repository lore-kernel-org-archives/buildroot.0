From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 18:46:58 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <55313020.7050203@mind.be>
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>
 <552CF0E1.5090205@mind.be>
 <20150414135424.3b1ab04a@free-electrons.com>
 <552D65C3.6010106@mind.be>
 <20150417173642.5fa56833@free-electrons.com>
 <55313020.7050203@mind.be>
Message-ID: <20150417184658.3b910231@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 17 Apr 2015 18:09:04 +0200, Arnout Vandecappelle wrote:

>  The original piece of patch was snipped away:
> 
> PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
> 
> to which I replied that this is a problem for e.g. rootfs-ubifs in
> ROOTFS_UBI_DEPENDENCIES, because rootfs-ubifs is not a package and doesn't have
> all the package targets. So solution 3 that you propose is to add all the
> special targets to rootfs-*, so the rootfs'es actually do look like a package.
> Then we can safely do
> 
> PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
> 
> except for the following circular dependency:
> 
> ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
> PACKAGES += $(ROOTFS_UBI_DEPENDENCIES)
> rootfs-ubi: $(ROOTFS_UBI_DEPENDENCIES)
> rootfs-ubifs: target-finalize
> target-finalize: $(PACKAGES)
> 
> so
> 
> rootfs-ubi -> rootfs-ubifs -> target-finalize -> rootfs-ubifs -> ...

Ah, right. We would then also have to do something like (2), i.e
filtering rootfs-* targets as being special.

> > Is this something we want to get to? In practice, I believe most if not
> > all of the target packages have a selected kconfig symbol. So the
> > biggest change needed to get to this point would be the need to have
> > selected kconfig symbols for all the host packages. Do we want to do
> > that?
> 
>  Yes I do. Not just for the thing below, but also because it makes
> infrastructure like legal-info and external-deps easier to understand if you
> don't have to mess with the dependencies but can just rely on a list of packages.

I don't quite agree here. To me, traveling recursively through the
dependencies is just the normal, 'make' way of doing things. It's not
complicated, it's really natural.

But maybe it's just a matter of perspective.

> > I remember I did a proposal with this a long time ago, which allowed to
> > only include the package .mk files that were actually needed in the
> > build and therefore reducing the parsing time. However, the general
> > feedback at the time was that the parsing time is not significant
> > enough today to justify such a heavy modification.
> 
>  As I remember it, the general feedback (at least my feedback) was that the fact
> that it makes tab-completion usable is a huge gain so certainly worth it, but
> that it was not actually working because of the missing host Kconfig symbols.

I'm not entirely sure to understand what sort of tab completion now
works? Doing make fo<tab> becoming usable because the overall parsing
time is more reasonable?

However, one down side of not including all .mk files is that you will
no longer be able to do 'make <pkg>-<something>' for a package that
isn't enabled. And it is something I do everyday when doing BR
development, especially 'make <pkg>-extract' and 'make <pkg>-patch',
because that the easiest way to quickly get the source code of a given
package extracted somewhere. And I can do this without having to go in
menuconfig enable the package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
