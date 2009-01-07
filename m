From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 12:13:52 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <200901070409.42558.markus.heidelberg@web.de>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
Message-ID: <1231326832.32308.320.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 04:09 +0100 skrev Markus Heidelberg:
> CC-ing Hans-Christian Egtvedt
> 
> Peter Korsgaard, 06.01.2009:
> > >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> >  Ulf> I can see that this would affect the AVR32 where
> >  Ulf> the patches are still to be introduced into gcc and binutils.
> >  Ulf> (They are there in uClibc right now).
> > 
> > Sorry, I don't know anything about avr32. It's my opinion that we have
> > too much special case handling for avr32/at91 in buildroot, and that
> > it's causing problems for the users + friction between developers
> > (E.G. see the recent openssl breakage)
> > 
> > But ok, that's the situation as it is today. My understanding is that
> > most of those patches are (slowly) progressing upstream.
> > 
> > Are you saying that the default config for avr32 doesn't build?

I managed to build the ngw100 yesterday,
but I had to disable SAMBA and STRACE and change to uCLibc-0.9.30
since 0.9.29 does not compile for anything I tried.

I giess a new version of STRACE has probably been introduced
and this broke the socat.XXX.patch.avr32 patches.
HCE has a new AVR32 patchset in the Atmel fork, which 
I hope to introduce soon.
With a new config, then the atngw100 should build again.

> > 
> > >>From talking with HcE on IRC, it seems like the Atmel fork of
> > buildroot is the recommended solution for avr32 users anyway.
> 
> I wonder, why many of the patches are also included in uClibc's
> Buildroot then. Don't the avr32 users use Atmel's Buildroot? I'm an
> avr32 user myself and only use Atmel's Buildroot for development. One
> drawback is that I'm not up-to-date with uClibc, because these changes
> are only seldom merged into the Atmel branches, only short before their
> release candidates. So I end up working on another file base, which
> doesn't ease integration of changes into uClibc's Buildroot. I could
> merge myself, a branch "upstream" is available and is updated often, but
> that doesn't make sense somehow. I haven't yet tried it, so I don't know
> whether it will cause some hassle or not.

I think it is desirable to have more people contributing
with testing and patches.


> 
> I haven't yet asked why this merge happens so rarely. Maybe lack of
> time? OK, I'm already getting avr32-buildroot specific, but I think
> updating the "devel" branch would be nice, even without testing
> anything.  Currently the three branches "devel", "master" and
> "atmel-2.3" are the same, pointing to the latest release.

Lack of time is the answer.
The way it works is that HCE is doing the Atmel Branch
and I am working on the main svn (even if HCE is providing
patches from time to time).

From time to time I am taking HCEs additions
from the Atmel branch and update the devel branch,
but I did really not have time to do anything
during most of the autumn.


> 
> >  Ulf> You have complained about size of patches, and 
> >  Ulf> that is why there is a prepatched toolchain for AVR32.
> >  Ulf> If that is not considered to be OK, then the several
> >  Ulf> MBytes of patches has to be introduced into the trunk.
> > 
> > It's not the size in bytes as such, it's the special casing and
> > (effectively) black box patches. Even when you test your changes on
> > multiple archs there's a fairly big change that you break stuff for
> > avr32/at91, or that you guys break it for the other archs. The same
> > with moving packages to new versions or removing old versions, you
> > cannot expect other people to forward port those arch specific
> > patches.

That is why other systems like OpenEmbedded allow having more
than one version of a package.
A system that only allows a single version is really not useful.
If new versions are introduced not because they are needed
or are tested, but because the tarball of the old version 
have disappeared, then we are going to have a mess.

A good system will allow buildroot to move to a 
newer version for some architectures, while not
breaking the build for other architectures.

* packages should depend on an enable variable
* This is set in a distribution file included by Kconfig
	which for each architecture defines 
	what is supported.
* Another distribution file ?can be included by Kconfig
	Contains enables for packages 
	which are *candidates* to be included
	in the distribution.
	This is not included for a stable build
?* Another distribution file is included, 
	This is empty, but the user can 
	put his own enables there if he wants
	to test other packages.
* Optional include of a file enabling ALL packages.

You have a similar set of files defining which versions
to be used for each package.
This is included inthe Makefile

You include a similar file for each architecture.
that can be used to override the value of the
first file.

An empty file is included, allowing the user to set 
his/her own value.

Each package has package/<package>/$(<package>_VERSION)
directories.
The distribution system includes a mechanism
that ensures that only the package with the
correct version is used,
We should probably support overriding
?package/<package>/$(<package>_VERSION)
with ?package/<package>/$(<package>_VERSION)-$(ARCH)
if available.

This approach will allow things to migrate 
from development to testing to stable without
upsetting a lot of users.
It will allow having multiple testing branches
and allow people to work on a single architecture without
having to test on other architectures,
but it will also allow to easily run a test
with a new version on a multitude of other 
architectures, once it is time to try
to get a new revision into the stable branch.

It will also allow us to freeze a distribution
allowing people to use buildroot for projects
which have a long lifetime.

I'd really like to get some feedback on this.


> Yes, mplayer for example is more than 2 years old and includes a huge
> avr32 patch.
> 
> Markus
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
