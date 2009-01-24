From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 24 Jan 2009 11:47:04 +0100
Subject: [Buildroot] How handle broken or partly broken packages in
	the	distribution
In-Reply-To: <d6cda7730901231317q57e351dev9ef8b5f1dc24086f@mail.gmail.com>
References: <1232651253.5311.19.camel@elrond.atmel.com>
	<20090123095712.6878553d@hcegtvedt>
	<d6cda7730901230912g6851880fua908aad10de0192@mail.gmail.com>
	<1232732815.5311.88.camel@elrond.atmel.com>
	<d6cda7730901231317q57e351dev9ef8b5f1dc24086f@mail.gmail.com>
Message-ID: <1232794024.5311.120.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-23 klockan 19:17 -0200 skrev Thiago A. Corr?a:
> On Fri, Jan 23, 2009 at 3:46 PM, Ulf Samuelsson
> <ulf.samuelsson@atmel.com> wrote:
> >
> > Why on earth do you want to enable a thing which NEVER will work?
> >
> > If you want to update the package so it works,
> > then you can do that in the trunk which should not
> > have these limitations turned on by default
> 
> As I said, just remove the package from defconfig.

You do not get it.
It is not for MY purpose I want it removed in DISTRIBUTION.
I want to disable it in the DISTRIBUTION so that people
that download the DISTRIBUTION will not run into unneccessary trouble.

People downloading the TRUNK or a DAILY BUILD of the TRUNK
will not see these packages as disabled.

> If we start disabling stuff just because of some minor build problem,
> the chances that it will be fixed and enabled again are slim. How do
> you differentiate things that are just minor corrections from things
> that doesn't make sense at all to be enabled in that platform?

?
we are talking about packages which has NEVER worked because
the inherent support for the AVR32 is simply not there.
For other packages, we simply have to get consensus
if it makes sense or not to disable.

If it works when compiling on Ubuntu, but not on OpenSuSE
then this should be documented as a bug for OpenSuSE.
If noone can complete the build for anything, why allow is.

An example is Irda-utils. The irda-utils.mk is garbled.
Do you still think it makes sense to enable it in the
DISTRIBUTION (will be enabled in TRUNK)


> 
> We would of course want to disable PCI Utils in AVR32 since there is
> no PCI bus there. But not linux-fusion stuff that doesn't build right
> now but it did a while back.

Pls distinguish between DISTRIBUTION and TRUNK.

> Usually a release is a trunk revision at some point. Going thru
> several packages disabling them just for releases isn't much
> practical.

I disagree, the amount of work to do this, is much less work
than the amount of works wasted because the function is not there.

You have one file which contains 
	
config	BR2_AVR32_DISABLE
	depends on BR2_avr32
	select BR2_PACKAGE_<XXX>_DISABLE
	select BR2_PACKAGE_<YYY>_DISABLE
	...
	select BR2_PACKAGE_<ZZZ>_DISABLE

This can be automatically generated from a file.

Each package needs

config	BR2_PACKAGE_XXX
	depends on !?BR2_PACKAGE_<XXX>_DISABLE

This is created once and for all.

> > The distibution, on the other hand, should be easy to use
> > and should IMO protect users against wasting their time.
> 
> They can read the help message for that. 

There will be more maintenace creating help messages for
each target than to create a file which deselects packages.
The latter can be easily automated, the former will be 
more difficult.

> A common pattern for users is
> to build the default config first, and that we should make sure to
> have working.
> 

I agree here but very few will be able to use the defconfig for their
own project, and will QUICKLY run into problems and will 
consider the project inmature/useless.

There is a lot of research into user interface, and people
do not like systems that cause them unneccessary hassle.
Buildroot is currently a PITA for new users.

A proper distribution with a mirror server could change that,
but I have yet to see any improvement in the methodology
to improve stability.

?I provided test results for ARM and AVR32.
Where are the tests for PowerPC, MIPS, x86 etc...
?I also do not see a list of tested boards anywhere.

The test results should be documented and provided 
as part of the distribution.

Until that happens I am not confident that 
we are ready to release the distribution.

> 
> Kind Regards,
>     Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
