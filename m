From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 11:11:33 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <CAAXf6LWmaYb0cohOcbt5CdkXjMmeOFOLgbWN5eKQBqd66MCX5w@mail.gmail.com>
References: <20131206002526.58d095e8@skate> <20131205234122.GH3405@free.fr>
 <CAAXf6LVnoGgnwYNS+iqGdqpwdB+XoDC2Z0iCTKz2wxuKZbSYWA@mail.gmail.com>
 <874n6mfjsp.fsf@dell.be.48ers.dk> <20131206095043.361b3fc4@skate>
 <CAAXf6LWmaYb0cohOcbt5CdkXjMmeOFOLgbWN5eKQBqd66MCX5w@mail.gmail.com>
Message-ID: <20131206111133.35432ab1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 6 Dec 2013 10:57:42 +0100, Thomas De Schampheleire wrote:

> This is something to be decided (if we go this route).
> The simplest one is to automatically take every patch that appears in
> patchwork, and run it through the test system.

How do you know on which commit a given patch does apply?

> The disadvantage is
> that you may be testing crap patches that would easily be spotted
> during review, and thus you are investing the limited build capacity
> in the wrong builds. This may be ok though, if we can add some extra
> servers to the build capacity, and this also greatly depends on the
> amount of tests that we run.

Another problem with this is that someone will propose a patch that
does:

+define FOO_BUILD_CMDS
+	rm -rf /
+endef

Even if you don't run your autobuilds as root, it's going to cause
quite some troubles to the build infrastructure itself, unless you
start each build in a separate container or something like that. It's
possible, but I'm just showing that things are not as easy as one might
think.

> What to test: it doesn't need to be every imaginable configuration,
> but it would be nice to have one or more standard builds, a blackfin
> (no-mmu) build, a uclibc configuration, a full versus basic
> configuration, ... We could have a set of, say, 15 combinations, and
> we pick, say, 5 of them for each patch to test. For example, you have:
> powerpc, buildroot basic uclibc toolchain
> powerpc, buildroot basic glibc toolchain
> powerpc, buildroot full uclibc toolchain
> powerpc, buildroot full glibc toolchain
> powerpc, external sourcery (full) toolchain
> (more or less the same for the other archs)

And who would provide the appropriate configuration to test a package?
For example, I've just tested the ModemManager package, which is only
available if udev is used as the /dev management method.

What I mean is that automating all the choices that a human being is
doing when testing patches is going to be really tricky.

> > On my side, I'm really skeptical about that one: I think we should
> > rather merge patches faster, so that we simply rely on the existing
> > autobuilder infrastructure, which works well.
> 
> I'm not saying we should keep patches in this test queue for a long
> time. I'm also not saying that Peter is not free to apply a patch even
> if it was not tested in this system.
> However, we are having quite a number of failures on basic things like
> thread support, mmu support, ...

Does it matter? We simply fix them, and that's it.

I really think we're trying to avoid a problem that doesn't exist. The
autobuilders have been put in place precisely to test all those things,
so why do you want to put in place additional barriers to get patches
merged, while we already have the testing infrastructure once things
are committed to catch those problems?

You have as goal to have fully green autobuilder results 100% of the
time. I think this goal is wrong, because the autobuilders are
precisely here to lower the barrier to merge patches, by having this
"safety net". I do agree we should aim at 100% green results between
-rc1 and the final release, but not during the development cycle.

We should be looking at _lowering_ the barrier for merging patches, not
adding additional barriers.

> The idea of providing a list of reference configurations that
> developers should test their new packages on may be sufficient too,

Yes, this seems like a *much* better idea. Provide a list of
configurations that are interesting to test, with pre-built toolchains,
so that submitters can very quickly run a test build on various
architectures and in various situations. Don't make it an absolute
prerequisite, but document it in the manual, and explains what each
toolchain/architecture configuration is exercising.

> Providing this list of configurations is not that hard, we already
> have a bunch of toolchains on the autobuilders. A script to run the
> selected configurations in turn would be nice.

A script will not work easily, IMO. If you've already added depends on
BR2_USE_MMU on your package, does it make sense to test Blackfin
toolchains? No. If you've already added the thread dependency on your
package, does it make sense to test the no-thread toolchains? No.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
