From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 2 Sep 2013 15:18:09 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <20130902105337.7dedb880@skate>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
 <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
 <20130902105337.7dedb880@skate>
Message-ID: <CAAXf6LUdJgRVK-BJJdJeH9QyutP_daHktchXMkTQ8M=R3U95mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Sep 2, 2013 at 10:53 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 2 Sep 2013 10:44:17 +0200, Thomas De Schampheleire wrote:
>
>> > I agree with this. Thomas, I'm not sure that what you say what a
>> > conclusion of a developer day. I believe we always said that it is
>> > hardly possible to guarantee that a package .mk file will contain *all*
>> > the possible dependencies of the package. Whenever someone bumps a
>> > package, we rarely look in detail at whether the software has gained
>> > some optional dependencies, and make sure they are handled in the
>> > corresponding package .mk file.
>> >
>> > Having the packages always built in the same order guarantees that, in
>> > the absence of expressed dependencies, the build result will be
>> > reproducible.
>>
>> I may be wrong about the conclusion.
>> Regardless: it's true that it's hard to guarantee that all
>> dependencies are expressed properly in the .mk files. However, by
>> 'fixing' the wildcard behavior into a sorted one such as with previous
>> versions of make, we just hide the problem. We will never notice that
>> some dependencies are missing, as long as the dependency comes before
>> the dependant (or whichever word) in alphabetical order.
>> With the random behavior of wildcards in newer versions of make, we
>> would still see issues in autobuilds, and get the opportunity to fix
>> them. It may take time, and may be a never-ending story as packages
>> are bumped and new packages are added, but at least there can be
>> improvement.
>> So, my viewpoint is to keep the current behavior and instead focus on
>> fixing any missing dependency when we spot it.
>
> I obviously disagree, because in the mean time, our users are having
> non-reproducible builds. An user within a company uses Buildroot to
> create a system, adds some packages, creates a configuration for his
> project. Then he passes this Buildroot to another colleague: the
> date/times of the various Buildroot files will be different, maybe
> affecting the order in which the wildcards are resolved by make 3.82.
> This colleague will attempt the build, and maybe get a failure, or a
> different build result than the first colleague who has created the
> Buildroot configuration. This is really damaging for Buildroot's
> reputation and the user experience. We clearly to not want this to
> happen.

Ok, fair enough, I can follow this argument.

>
> Of course, if within the Buildroot project we are interested in fixing
> such missing dependencies, then we can find a way of adding randomness
> into the build order in our autobuilders. But clearly, we do want to
> expose this randomness to our users.

I think indeed we should try to set the dependencies right some way or another.

If we assume that a package does not have any configurable options
that would change its dependencies, a simple way to check if all
dependencies are properly expressed is through:
make clean toolchain foo

Correct? Although it would take many more builds, each of them would
be relatively short. If we even can find a way to
'clean-all-but-the-toolchain', the cleaning time will be much shorter.
For this type of simple package test, only one toolchain needs to be
used because the dependencies should not depend on the toolchain.
Also, it's not necessary that each package gets build every night:
once the dependencies are correct, they will stay correct until a
version bump. This means we can spread out the execution of this type
of tests over time, interleaving them with the already existing
autobuilds with random configurations.

Of course, when a package is more complex and the its Config.in file
allows to enable/disable certain options which are based on another
library that would need to be added to the dependencies, then we'd
still need a way to test the different configurations. This could be
achieved with the regular autobuilds, but disabling the wildcard
sorting, which brings us to...

>
> In fact, I had already thought about adding such randomness in the
> autobuilders. But I've refrained from doing so because it also means
> that the builds that the autobuilders are doing cannot be reproduced.
> So when you'll get an autobuilder failure that you can't reproduce
> locally, you'll never know if it's due to the random order of package
> building, or due to some difference in the build environment.

The make targets of buildroot itself are executed sequentially.
Suppose that we keep a list of all targets executed, something like:
python-source
python-extract
python-patch
python-configure
python-build
python-install-target
pyfoo-source
pyfoo-extract
pyfoo-build
...

To reproduce a build, we can explicitly pass this list on the make
command-line, roughly like:
cat <target-list> | xargs make clean toolchain


Regardless of this possibility (or not, I may be overlooking
something), not all autobuilds need to be randomized. We could
randomize some, and clearly indicate on the autobuild page that this
was the case. A full build log would be useful in this case.

Best regards,
Thomas
