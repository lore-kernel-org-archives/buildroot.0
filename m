From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 13:44:55 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231243376.32308.52.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 13\:02\:56 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
Message-ID: <87vdsssiwo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> What is the plan? Getting the first release out is always the hardest,
 >> so I would on purpose aim low for the first release and get it out
 >> soon (February). The target is to get all architectures to build (and
 >> run where hw is available for test) using the default toolchain config
 >> and busybox, anything else is just a bonus. I will put out the first
 >> release candidate early next week, so from then on please don't add
 >> anything else than bugfixes until the release it out. I believe in
 >> time based releases, so any architectures that we cannot fix in time
 >> will simply be disabled in kconfig (E.G. depend on BROKEN).

 Ulf> This is a little bit too loose.
 Ulf> What is the "default toolchain config?".

The default one - E.G.:

rm .config; make menuconfig, select arch, save config, make

 Ulf> I can see that this would affect the AVR32 where
 Ulf> the patches are still to be introduced into gcc and binutils.
 Ulf> (They are there in uClibc right now).

Sorry, I don't know anything about avr32. It's my opinion that we have
too much special case handling for avr32/at91 in buildroot, and that
it's causing problems for the users + friction between developers
(E.G. see the recent openssl breakage)

But ok, that's the situation as it is today. My understanding is that
most of those patches are (slowly) progressing upstream.

Are you saying that the default config for avr32 doesn't build?

From talking with HcE on IRC, it seems like the Atmel fork of
buildroot is the recommended solution for avr32 users anyway.

 Ulf> You have complained about size of patches, and 
 Ulf> that is why there is a prepatched toolchain for AVR32.
 Ulf> If that is not considered to be OK, then the several
 Ulf> MBytes of patches has to be introduced into the trunk.

It's not the size in bytes as such, it's the special casing and
(effectively) black box patches. Even when you test your changes on
multiple archs there's a fairly big change that you break stuff for
avr32/at91, or that you guys break it for the other archs. The same
with moving packages to new versions or removing old versions, you
cannot expect other people to forward port those arch specific
patches.

 Ulf> If you by default toolchain config, means that each architecture
 Ulf> has its own toolchain versions, but the parameters like 
 Ulf> enabling WCHAR etc are standardized, then this is fine with me.

Whatever kconfig selects as default (which is Linux 2.6.28 / uclibc
0.9.30 / binutils 2.19 / gcc 4.2.4) for everything else than avr32 and
nios.

We should probably make gcc 4.3.2 default before the release.

 Ulf> As I pointed out before, it is a source of problems
 Ulf> that the toolchain and the rootfs is build in a single make.
 Ulf> I think they should be separated.

Ok, there's already some support for that - But that should NOT be a
showstopper for a release. We tried it before, if we go down that hole
then there won't be a release in the forseeable future.

 Ulf> I believe a distribution needs use a single version
 Ulf> of each package and we should focusing to get that to work for
 Ulf> as many architectures as possible.

Agree.

 Ulf> The implementation needs to be discussed.
 Ulf> Instead of having a common "BROKEN" dependency, I think 
 Ulf> it would be good if each package depend on an <package>_ENABLE. 

But why? That still leads to way too many combinations. Why not just
use the same package version for all archs?

 Ulf> For Linux, there are two different ways of building it.
 Ulf> The simple and the advanced configuration.
 Ulf> I am fine with restricting kernel choices for the
 Ulf> simple configuration and to use that as a default.

I'll leave all this discussion about distributions for after the
release, then we can bring it up again - OK?

 Ulf> The distribution concept will not work, unless we mirror
 Ulf> packages on a server to avoid the build beeing broken
 Ulf> by disappearing packages.

Yes, that's also on my todo list.

 >> Let me know what you think.
 >> 

 Ulf> I think we need to discuss the architecture on how things are to
 Ulf> be done

Sure, but after the release please.

-- 
Bye, Peter Korsgaard
