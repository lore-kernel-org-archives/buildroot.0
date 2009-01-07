From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 08 Jan 2009 00:28:53 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87zli2kiwr.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
	<1231274947.32308.260.camel@elrond.atmel.com>
	<87ljtnl5g9.fsf@macbook.be.48ers.dk>
	<1231331663.32308.358.camel@elrond.atmel.com>
	<20090107180208.GA14648@zelow.no>
	<1231355624.32308.410.camel@elrond.atmel.com>
	<87zli2kiwr.fsf@macbook.be.48ers.dk>
Message-ID: <1231370933.32308.594.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 20:36 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> That's what tags, branches and releases are for. 
>  >> Having separate makefiles sounds messy.
> 
>  Ulf> I am not an expert in Source Code Management,
>  Ulf> but do you have this capability in Subversion?
>  Ulf> I know you have it in git, but using git
>  Ulf> is apparently not an option.
> 
> Yes, ofcourse you can do it in svn, and as I said, git is coming.
> 
>  Ulf> I do not see it as too messy to use directories.
> 
> I do - But more importantly, it would just keep on growing, making it
> harder and harder to test everything.

That is not my intention.
Let me provide an example:

assume we work with the dbus package.

dbus
	1.1.1
		strace.mk
		Config.in

the file ".distribution" contains
DBUS_VERSION=1.1.1

-------
Ok, so I want to update to dbus-1.1.2
I copy the directory 1.1.1 to 1.1.2-arm and add a patch

?dbus
	1.1.1
		dbus.mk
		Config.in
	1.1.2-arm
		dbus.mk
		Config.in
		dbus-xx.patch


?the file ".distribution-1.0" still contains
DBUS_VERSION=1.1.1
	
but I add 
?DBUS_VERSION=1.1.2-arm
in ".distribution.local"

so now whenever I build, I will use my own version,
and if someone adds a powerpc version with another fix
and we get.

?dbus
	1.1.1
		dbus.mk
		Config.in
	1.1.2-arm
		dbus.mk
		Config.in
		dbus-xx.patch
	?1.1.2-powerpc
		dbus.mk
		Config.in
		?dbus-yy.patch

?When we enter the test phase we create a merged testing directory
dbus
	1.1.1
		dbus.mk
		Config.in
	1.1.2-arm
		dbus.mk
		Config.in
		dbus-xx.patch
	?1.1.2-powerpc
		dbus-modified.mk
		Config.in
		?dbus-yy.patch
	?1.1.2-testing
		dbus-modified.mk
		Config.in
		dbus-xx.patch
		dbus-yy.patch


??DBUS_VERSION=1.1.2-testing
is added to ".distribution-2.0.testing"

Once all the packages selected by the merge of
".distribution-1.0" and ".distribution-2.0-testing"
can be built with the ARM architecture
you can commit the following addition to the 
"distributions/2.0/Config.in.arm"

config	BR2_DISTRIBUTION_2_0_ARM
	...
	select	BR2_PACKAGE_SELECT

You then prune the directory structure to get:

?dbus
	1.1.1
		dbus.mk
		Config.in
	?1.1.2
		dbus-modified.mk
		Config.in
		dbus-xx.patch
		dbus-yy.patch

At that point you also freeze "1.1.1"
No more changes are allowed so there will be 
little and no more support.
This is a VERY important thing, because 
otherwise we end up in the support nightmare
that you rightfully are scared of.

Assume that we do 5 distribution and one
poor package gets a new version every time
so you have 5 version directories

I do not suggest that we use KConfig to
allow the user to select which of the 5
versions he/she  wants to use.
Again that will end up in a support nightmare
since packages mightr depend on that other packages
have a certain version.

The user will only use Kconfig to select
which *package* and not which *version*.

Either the user selects a distribution
and then he will be limited by which
packages are tested for that distribution
and might also be limited by the architecture.

Or he disables the distribution system
and can build anything he wants, but
then this is not a supported activity.
He STILL cannot select the version with Kconfig.

If the move from dbus-1.1.1 would break the powerpc
architecture, you would be able
to have ".distribution-2.0-powerpc"
which defines 

DBUS_VERSION=1.1.1

This file might be created at the release of distribution-2.0
but can be overridden by a new
?
DBUS_VERSION=1.1.2-powerpc

in local files by developers so they can continue
working on the powerpc versions all the time
and do not have to care about release cycles.

Eventually dbus-1.1.2 is working for the powerpc
and ".distribution-3.0" could contain.
?DBUS_VERSION=1.1.2

and ?".distribution-3.0-powerpc" could be empty.

If the distribution does not change package versions
then of course there will be no added directory.

If you want to test if a certain distribution works
for an architecture, you will only have one version
of each package to test.

If you are doing development for a new distribution
you again will only have one package version to test.

Even if we eventually end up with multiple versions
for each and every package, the distribution mechanism
will only support one version per package per 
distribution/architecture.

I do not think that it is a good idea to check
in two or more versions when we create a new distribution
The distribution will allow max one added version per package
but it should be OK to allow an architecture to keep
an old revision of a package, if the new version breaks,
but the old CAN NOT be modified, even for bug fixes.


A developer avoiding or overridign the distribution
mechanism can using override files use each an any
apcakage in whatever version they want,
including test versions, but we need to prune
aggressively after a new release.

We should document the last revision before pruning begins
so that people can retrieve the work on a non-completed
package which did not make it into the new distribution
and create new testing directories preparing for
the next distribution.

I really think this would work
and would be better than just tarballing
the tree and then put it on a webpage.

If we can achieve the same functionality
with a SCM, then I am fine with this.

I am not convinced yet though.
Parts can be done with the SCM, I am sure,
but can you get the flexibility?

Automatically adding/creating the config enables
and the distribition files would be good.

Best Regards
Ulf Samuelsson
