From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 7 Dec 2013 21:43:48 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <20131206111133.35432ab1@skate>
References: <20131206002526.58d095e8@skate> <20131205234122.GH3405@free.fr>
 <CAAXf6LVnoGgnwYNS+iqGdqpwdB+XoDC2Z0iCTKz2wxuKZbSYWA@mail.gmail.com>
 <874n6mfjsp.fsf@dell.be.48ers.dk> <20131206095043.361b3fc4@skate>
 <CAAXf6LWmaYb0cohOcbt5CdkXjMmeOFOLgbWN5eKQBqd66MCX5w@mail.gmail.com>
 <20131206111133.35432ab1@skate>
Message-ID: <CAAXf6LVz-9BtT+_E7V6mOXAmFdZX+5P_V30HqUhUAQxWDpxh1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, Dec 6, 2013 at 11:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 6 Dec 2013 10:57:42 +0100, Thomas De Schampheleire wrote:
>
>> This is something to be decided (if we go this route).
>> The simplest one is to automatically take every patch that appears in
>> patchwork, and run it through the test system.
>
> How do you know on which commit a given patch does apply?

One would need to assume that it still applies on the current master
(which is often true, but not always). Obviously the test could not
continue if there is a conflict applying the patch.

>
>> The disadvantage is
>> that you may be testing crap patches that would easily be spotted
>> during review, and thus you are investing the limited build capacity
>> in the wrong builds. This may be ok though, if we can add some extra
>> servers to the build capacity, and this also greatly depends on the
>> amount of tests that we run.
>
> Another problem with this is that someone will propose a patch that
> does:
>
> +define FOO_BUILD_CMDS
> +       rm -rf /
> +endef
>
> Even if you don't run your autobuilds as root, it's going to cause
> quite some troubles to the build infrastructure itself, unless you
> start each build in a separate container or something like that. It's
> possible, but I'm just showing that things are not as easy as one might
> think.

Point taken.

>
>> What to test: it doesn't need to be every imaginable configuration,
>> but it would be nice to have one or more standard builds, a blackfin
>> (no-mmu) build, a uclibc configuration, a full versus basic
>> configuration, ... We could have a set of, say, 15 combinations, and
>> we pick, say, 5 of them for each patch to test. For example, you have:
>> powerpc, buildroot basic uclibc toolchain
>> powerpc, buildroot basic glibc toolchain
>> powerpc, buildroot full uclibc toolchain
>> powerpc, buildroot full glibc toolchain
>> powerpc, external sourcery (full) toolchain
>> (more or less the same for the other archs)
>
> And who would provide the appropriate configuration to test a package?
> For example, I've just tested the ModemManager package, which is only
> available if udev is used as the /dev management method.
>
> What I mean is that automating all the choices that a human being is
> doing when testing patches is going to be really tricky.

Point taken.

>
>> > On my side, I'm really skeptical about that one: I think we should
>> > rather merge patches faster, so that we simply rely on the existing
>> > autobuilder infrastructure, which works well.
>>
>> I'm not saying we should keep patches in this test queue for a long
>> time. I'm also not saying that Peter is not free to apply a patch even
>> if it was not tested in this system.
>> However, we are having quite a number of failures on basic things like
>> thread support, mmu support, ...
>
> Does it matter? We simply fix them, and that's it.
>
> I really think we're trying to avoid a problem that doesn't exist. The
> autobuilders have been put in place precisely to test all those things,
> so why do you want to put in place additional barriers to get patches
> merged, while we already have the testing infrastructure once things
> are committed to catch those problems?
>
> You have as goal to have fully green autobuilder results 100% of the
> time. I think this goal is wrong, because the autobuilders are
> precisely here to lower the barrier to merge patches, by having this
> "safety net". I do agree we should aim at 100% green results between
> -rc1 and the final release, but not during the development cycle.
>
> We should be looking at _lowering_ the barrier for merging patches, not
> adding additional barriers.

My goal is indeed to have autobuilder results being 'green' as much as
possible, all the time. Obviously it's unrealistic to have 100%
success all the time: there are many tricky issues one can not
reasonably expect to be right the first time a patch is submitted.

However, many autobuild failures are trivial: thread support required,
mmu support required, missing required dependency, not building with
uClibc toolchains, ... This is the type of failures one could expect
to detect beforehand, not after.

One of the reasons I'd prefer close to 100% green autobuilds is that a
failure will be noticed much more. Attention will be drawn to the fact
that there is a problem. Until now, the amount of autobuild failures
was relatively high, and the amount of patches actually fixing these
problems was relatively low (compared to the total amount of patch
submissions). Each day there'd be a mail with the build results, and
one would see yet another 20 something packages being broken. To dive
in and look at this is not very appealing for the average developer;
fixing one package seems like a drop on a hot plate.
In november, we were able to reach much better figures in autobuild,
thanks to the increased attention and the collaborative efforts of
analysing the problems. Gradually, the amount of remaining failures
dropped and this was very visible too. Developers are then even more
attracted to fix the problems.

Note that I agree that the barrier to submit patches should be low. At
this moment I think it is low: the community is very open and
welcoming towards new developers, patches are generally reviewed well
(certainly for the last few releases) and the documentation about the
expected patch and package format is in good shape. Above all this, it
looks like many new developers do actually read this documentation (!)
and many patches from 'newcomers' are very qualitative already.
In my opinion, having a test system as sketched above does not raise
the barrier for patch submitters. They still have to submit their
patch as before. But, between submission and acceptance some tests are
run (semi-)automatically. If this fails, the author is requested to
look into this problem and fix it, just as other feedback is given
based on code review alone.
In fact, strictly speaking, the alternative proposal below where
developers are asked to run some tests themselves (even though
optional) adds more barrier than the tests between submission and
acceptance.

Regardless, you raised some valid points about the difficulty in
implementing this from a practical perspective, so I agree that the
alternative proposal below may be more worth looking into...

>
>> The idea of providing a list of reference configurations that
>> developers should test their new packages on may be sufficient too,
>
> Yes, this seems like a *much* better idea. Provide a list of
> configurations that are interesting to test, with pre-built toolchains,
> so that submitters can very quickly run a test build on various
> architectures and in various situations. Don't make it an absolute
> prerequisite, but document it in the manual, and explains what each
> toolchain/architecture configuration is exercising.
>
>> Providing this list of configurations is not that hard, we already
>> have a bunch of toolchains on the autobuilders. A script to run the
>> selected configurations in turn would be nice.
>
> A script will not work easily, IMO. If you've already added depends on
> BR2_USE_MMU on your package, does it make sense to test Blackfin
> toolchains? No. If you've already added the thread dependency on your
> package, does it make sense to test the no-thread toolchains? No.

Say you have 5 reference configurations. A developer wishing to submit
a patch would need to either clone 5 repositories with his patch and
run a build in each one of them, or handle one configuration at a time
and clean the repository each time. The amount of commands to run (and
the time to do this) is sufficiently large to talk about a barrier
IMO.
I agree that not all reference configurations may be applicable for
each package, and again it may be difficult to automatically set a
valid, sane configuration for the package to test, but if in any way
it is possible to have some automation, I think it would be
appreciated by developers.

That said, we could already start with the pure manual way and see how
this works out, rather than trying to do too much from the start.

Best regards,
Thomas
