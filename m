From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 18:58:04 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <20150417184658.3b910231@free-electrons.com>
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>	<552CF0E1.5090205@mind.be>	<20150414135424.3b1ab04a@free-electrons.com>	<552D65C3.6010106@mind.be>	<20150417173642.5fa56833@free-electrons.com>	<55313020.7050203@mind.be>
 <20150417184658.3b910231@free-electrons.com>
Message-ID: <55313B9C.3000008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 18:46, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Fri, 17 Apr 2015 18:09:04 +0200, Arnout Vandecappelle wrote:

[snip]

>>> Is this something we want to get to? In practice, I believe most if not
>>> all of the target packages have a selected kconfig symbol. So the
>>> biggest change needed to get to this point would be the need to have
>>> selected kconfig symbols for all the host packages. Do we want to do
>>> that?
>>
>>  Yes I do. Not just for the thing below, but also because it makes
>> infrastructure like legal-info and external-deps easier to understand if you
>> don't have to mess with the dependencies but can just rely on a list of packages.
> 
> I don't quite agree here. To me, traveling recursively through the
> dependencies is just the normal, 'make' way of doing things. It's not
> complicated, it's really natural.

 For dependencies, yes. But the legal-info of package foo really has nothing to
do with the legal-info of host package bar even if foo depends on bar. IMHO of
course.

 But what I really mean is that something like this for external-deps would be
quite simpler:

external-deps:
	echo $(foreach pkg,$(PACKAGES),$($(pkg)_ALL_DOWNLOADS)))

> 
> But maybe it's just a matter of perspective.
> 
>>> I remember I did a proposal with this a long time ago, which allowed to
>>> only include the package .mk files that were actually needed in the
>>> build and therefore reducing the parsing time. However, the general
>>> feedback at the time was that the parsing time is not significant
>>> enough today to justify such a heavy modification.
>>
>>  As I remember it, the general feedback (at least my feedback) was that the fact
>> that it makes tab-completion usable is a huge gain so certainly worth it, but
>> that it was not actually working because of the missing host Kconfig symbols.
> 
> I'm not entirely sure to understand what sort of tab completion now
> works? Doing make fo<tab> becoming usable because the overall parsing
> time is more reasonable?

 Indeed. 'make -qnp' takes 3.5s on my laptop with a hot cache, full completion
about 5 seconds. With a cold cache it's over 20 seconds. But I guess I should
get an SSD.

> However, one down side of not including all .mk files is that you will
> no longer be able to do 'make <pkg>-<something>' for a package that
> isn't enabled. And it is something I do everyday when doing BR
> development, especially 'make <pkg>-extract' and 'make <pkg>-patch',
> because that the easiest way to quickly get the source code of a given
> package extracted somewhere. And I can do this without having to go in
> menuconfig enable the package.

 I do that as well, but we could add a make variable to read all .mk files.
Which was also one of the feedbacks on your patch series IIRC.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
