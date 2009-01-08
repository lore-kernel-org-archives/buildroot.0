From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 8 Jan 2009 22:05:22 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901081850.39916.markus.heidelberg@web.de>
	<007901c971bf$6b6e9030$dfc4af0a@Glamdring>
	<200901082128.59939.markus.heidelberg@web.de>
Message-ID: <00b501c971d5$4db0e0a0$dfc4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Ulf Samuelsson, 08.01.2009:
>
> Thiago A. Corr?a, 07.01.2009:
> > On Wed, Jan 7, 2009 at 10:19 AM, Markus Heidelberg
> > <markus.heidelberg@web.de> wrote:
> > > Peter Korsgaard, 07.01.2009:
> > >> Markus Heidelberg writes:
> > >
> > >> Right now things are kind of a mess as avr32 is lacking from most
> > >> upstream projects, so there's lots of big patches involved. As things
> > >> are now, I don't see missing avr32 as a showstopper for a first
> > >> release.
> > >
> > > Absolutely agreed. Especially given that there is this well-supported
> > > AVR32 fork (which isn't really a fork I think, it rather sits on top 
> > > of
> > > uclibc-buildroot).
>
> Yes, HCE regularily downloads the svn, adds his stuff on top.
> and tests with one or more rc versions before release.
>
> Therefore it makes sense to propagate any fixes to mainstream
> because then the diff will be smaller and his job easier
> and it contributes to mainstream with both generic
> and AVR32 stuff.

> Pushing stuff into mainstream is always desirable.
> I don't mean to have AVR32 specific things out of uclibc-buildroot. Of
> course it should be supported there as well. But mplayer is just a good
> example, where support for it is wrong and is a good reason for a
> separate AVR32 repo, especially given that it's well supported by Atmel.

> But when you already put so much stuff into uclibc-buildroot to fully
> support AVR32, what's then remaining in HCE's tree and for what reason
> this is not put into upstream? With your arguments, HCE doesn't need to
> commit to his own repository at all, he could just commit everything
> to upstream. The only purpose of his tree then would be having stable
> and tested AVR32 releases for the customers.

That is a very important reason for it to exist.


>> One of the key issues for an AVR32 developer is that they cannot
>> commit additions to the Atmel version, so every time

> What's wrong with that? What would they want to commit?

X-Windows for a start...
That was committed to Buildroot by John Voltz so he
could run X on his AVR32 board.
There are plenty of examples.

Since AVR32 is a fairly new architecture, support for it does not exist
in many packages, and maybe some developers want to put their
own effort into bringing more packages online with AVR32 support.

> You also cannot commit directly to Haavards avr32-linux repo.
> Do you then ask Linus for
> push access because of that? Is this also the reason why you put all the
> U-Boot patches into buildroot, because you don't have commit access to
> the u-boot repo but to uclibc-buildroot?

No, because noone basically got any patches committed for a long time
to the U-Boot project so the AT91 team did their own thing based on
U-Boot-1.1.5 and remained with U-Boot-1.1.5 for a long time.
I have updated the patches to newer versions until 1.2.0
and a prepatched U-Boot was added to buildroot some time ago
in target/device/Atmel/u-boot, maybe a year later someone
added the generic u-boot to target.
There has been some comments about having two ways of building
U-Boot, so I decided to merge, but that does not mean  that
I want to lost the extra functionality.
Everything I added to U-boot, except the sam9g20 support has been
there for 18 months minimum, just in a different way.
Before I added this, people could build u-boot-1.3.4.
They still can build 1.3.4 without any patches.
If you want to use 2009.01-rc-1, then I made that possible.



> I think if you have AVR32 changes, that shouln't go into
> uclibc-buildroot, then you could always send a patch to the
> avr32-buildroot mailing list or HCE.

I do not know of any AVR32 changes which I do not think
should go into uclibc-buildroot.

> a new version is released, they have to port their stuff to the
> Atmel version.

> I don't get it. You can use the HCE's git repo and just pull the updates
> or rebase against it. What has this to do with the fact that you cannot
> commit to the public repo?
> > Given that there are numerous issues, can you at least show me a few of
> > them? I'm interested. Everybody is calling for stable releases, HCE
> > offers such for AVR32, but nobody is using them!?
>
> Why do you think that noone is using them, there are thousands
> of AVR32 boards sold every year, and if the Atmel buildroot
> is the recommended way of providing the Linux, that is the route
> many will follow.

> No, I don't think nobody is using them, that was just expressed
> unluckily. But it seems as if the AVR32 users that are subscribed to
> buildroot at uclibc.org aren't using it. At least I got that feeling while
> following this mailing list.

I work with both.

> > The point is, when you have to be stable for delivered products, you
> > won't update any package without a reason, let alone u-boot or the
> > toolchain. During development you can update whenever you want to. So if
> > you really need some new versions, you can cherry-pick them from the
> > latest buildroot into your stable-branch. No need for multiple version
> > inside buildroot itself.
>
> My idea is based on that if buildroot works, then noone
> should need to have a personal stable branch because
> buildroot will contain the personal stable branch
> without much addition.
>
> [...]
>
> My proposal means that the test effort will only use ONE VERSION of each
> package.
> The release will only support one version of each package.
> It is in the development phase, where you get more versions,
> and when you move to a new package version in a new distribution
> you FREEZE the old versions, but you do not remove them
> and you do not allow the casual user to select them through Kconfig.

> When I'm on stable, I definetly want to be on stable and only update/fix
> packages that caused bugs. Consider a package that doesn't update its
> version in buildroot (and also upstream maybe) during several months. It
> will never FREEZE and always stay in development phase, because it's the
> latest version, and it will probably get more patches.

And in my point of view you do NOT commit a patch to the
distribution directory, because you risk fixing a minor issue
for one architecture, while potentially break the BUILD of ALL the others.

This behaviour should not be legal.
Instead you create a new directory, add your patch to that directory
and use that directory for your build.
Other people using other architectures can test your directory as
well, once buildroot enters a testing phase.
Once enough people has tested the new directory and found it good,
then it can be used in a new minor release of the distibution
and will replace the earlier directory (using the same source version)

Your approach (which is the current approach for most things)
is IMHO one of the major causes for problems in Buildroot.


> So when merging the latest buildroot updates into my personal buildroot
> repo for a board in development, I'd get changes behind my back also for
> a released board in support phase.

> So I will keep using branches in git instead of relying on buildroot to
> include half a VCS functionality.
> Markus

Best Regards
Ulf Samuelsson 
