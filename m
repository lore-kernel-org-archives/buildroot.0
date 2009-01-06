From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 13:02:56 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87prj1v4dy.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
Message-ID: <1231243376.32308.52.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-05 klockan 22:18 +0100 skrev Peter Korsgaard:
> Hi, and happy new year everyone,
> 
> The end of the year is a moment to take a step back and take a bigger
> look at the situation. I have done that for buildroot, and as I see it
> the two biggest problems we have are:
> 
>  - Lack of an active maintainer. No hard feelings, but lets face it -
>    Erik hasn't really been active in buildroot development for quite
>    some time. This isn't a big deal for day to day development, but it
>    means that there's no one doing stuff like keeping the website
>    up to date, a central contact point for infrastruture issues (like
>    the recent break in), make decissions when there is disagreements
>    among developers (we already lost Bernhard because of that), and:
>  - Lack of releases. It has often been discussed, but nothing has come
>    of it.
> 
> I offer to do something about both: Take over maintainership and get
> atual stable releases out the door (if Erik and the other developers
> agree).
> 
> What is the plan? Getting the first release out is always the hardest,
> so I would on purpose aim low for the first release and get it out
> soon (February). The target is to get all architectures to build (and
> run where hw is available for test) using the default toolchain config
> and busybox, anything else is just a bonus. I will put out the first
> release candidate early next week, so from then on please don't add
> anything else than bugfixes until the release it out. I believe in
> time based releases, so any architectures that we cannot fix in time
> will simply be disabled in kconfig (E.G. depend on BROKEN).

This is a little bit too loose.
What is the "default toolchain config?".
I can see that this would affect the AVR32 where
the patches are still to be introduced into gcc and binutils.
(They are there in uClibc right now).

You have complained about size of patches, and 
that is why there is a prepatched toolchain for AVR32.
If that is not considered to be OK, then the several
MBytes of patches has to be introduced into the trunk.

If you by default toolchain config, means that each architecture
has its own toolchain versions, but the parameters like 
enabling WCHAR etc are standardized, then this is fine with me.

As I pointed out before, it is a source of problems
that the toolchain and the rootfs is build in a single make.
I think they should be separated.

I believe a distribution needs use a single version
of each package and we should focusing to get that to work for
as many architectures as possible.


The implementation needs to be discussed.
Instead of having a common "BROKEN" dependency, I think 
it would be good if each package depend on an <package>_ENABLE. 

This means that you can for a specific distribution
enable packages by architecture.

config	BR2_PACKAGES_arm
	bool
	depends on BR2_arm
	depends on BR2_VERSION_1_0
	default y
	?select BUSYBOX_ENABLE
	?select <package-1>_ENABLE if !BR2_MINIMAL_SYSTEM
	?select <package-2>_ENABLE? if !BR2_MINIMAL_SYSTEM
	
	...
	
	?select <package-1>_ENABLE? if !BR2_MINIMAL_SYSTEM


You would also want to enable everything,
if you do not have a distribution.
?config BR2_PACKAGES_ALL
	depends on !?BR2_VERSION_1_0
	default y
	select BUSYBOX_ENABLE
	select <package-1>_ENABLE if !BR2_MINIMAL_SYSTEM
	select <package-2>_ENABLE? if !BR2_MINIMAL_SYSTEM

	...

	select <package-1>_ENABLE? if !BR2_MINIMAL_SYSTEM

?If a user chooses to not use a distribution,
then Buildroot will be as free as it is now, to
build whatever

With this method we need to support a user file which 
allows users to extend the enables for testing purposes.

For Linux, there are two different ways of building it.
The simple and the advanced configuration.
I am fine with restricting kernel choices for the
simple configuration and to use that as a default.

The goal of the advanced linux configuration is to give 
freedom of selection to the user,so this should not contain
any restrictions on kernel versions/patches.

For this to work ; i think we need to support having
multiple makefiles for each package.
There needs to be a stable makefile for the distribution
but there needs to be a way to provide fixes that
is available to other developers as well.
If an ARCH is broken in the stable directory,
then it should be possible to commit changes 
to a separate directory for testing by others
on different architectures

I showed in a previous mail, how this can be done.

The distribution concept will not work, unless we mirror
packages on a server to avoid the build beeing broken
by disappearing packages.

> 
> After that I would like us to move to a regular release schedule every
> 3 months with 2 months of development and 1 month of stabilization.
> 
> The big issue with buildroot quality control is the mindblowing number
> of configuration combinations and specialized hardware needed to
> test. I am therefore convinced we need to leverage qemu and
> agressively deprecate legacy versions / packages + actively work with
> upstream to keep the number of patches low. I think our users would
> also be happier with a less ambitious project that wouldn't break left
> and right, instead of the current situation.

With the above method, you have fine-grained control
over what packages are buildable and what packages are not.



> Let me know what you think.
> 

I think we need to discuss the architecture on how things are to be done

BR
Ulf Samuelsson
