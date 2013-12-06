From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 10:57:42 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <20131206095043.361b3fc4@skate>
References: <20131206002526.58d095e8@skate> <20131205234122.GH3405@free.fr>
 <CAAXf6LVnoGgnwYNS+iqGdqpwdB+XoDC2Z0iCTKz2wxuKZbSYWA@mail.gmail.com>
 <874n6mfjsp.fsf@dell.be.48ers.dk> <20131206095043.361b3fc4@skate>
Message-ID: <CAAXf6LWmaYb0cohOcbt5CdkXjMmeOFOLgbWN5eKQBqd66MCX5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Fri, Dec 6, 2013 at 9:50 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Fri, 06 Dec 2013 09:47:02 +0100, Peter Korsgaard wrote:
>
>>  > 1. During the time -next is opened (until release) we also make test
>>  > builds on that branch (but keep the results separate from the master
>>  > results, of course).
>>  > Pros:
>>  >   - better visibility on the quality of -next, before it is being
>>  > merged, and a chance to fix the problem beforehand
>>  > Cons:
>>  >   - attention of developers is diverted away from stabilizing the
>>  > upcoming release
>>  >   - autobuild computing capacity is diverted away too
>>
>> Yeah, I'm not quite sure if this is a good idea.
>
> It would however be the easiest thing to do.
>
>>  > 2. Similar, in a way: when patches are posted to the list (not only
>>  > during the stabilization month), run them through some autobuild
>>  > configurations 'automatically' to try catching common problems (for
>>  > example thread support, mmu support, uclibc problems, ...) and post
>>  > the results somewhere. This generates a kind of 'staging moment' for
>>  > patches before they get applied, to check their quality.
>>  > Whether this should be done for all patches (even at their initial
>>  > send) or only makes sense for patches that have been reviewed first
>>  > (to make sure the computing power is used usefully) is something that
>>  > can be discussed. In the latter case, we'd need to have a trigger to
>>  > request the test builds.
>>
>> This one I like! Seems like a nice little weekend task to
>> implement. I'll try to find time for it (but others are certainly
>> welcome to work on it as well)
>
> I'm not sure to understand how this will work. Which patches will be
> run through this testing? Who will decide which patches will go? You?
> The patch submitter?

This is something to be decided (if we go this route).
The simplest one is to automatically take every patch that appears in
patchwork, and run it through the test system. The disadvantage is
that you may be testing crap patches that would easily be spotted
during review, and thus you are investing the limited build capacity
in the wrong builds. This may be ok though, if we can add some extra
servers to the build capacity, and this also greatly depends on the
amount of tests that we run.

Another way is to only test 'requested' patches. One could envision a
way to request a test of a given patch, but this does not need to be
limited to one person. Either you can have a group of admins (for
example the current patchwork admins) or you can keep it open and have
a fair-use-policy that avoids requesting builds too early.


What to test: it doesn't need to be every imaginable configuration,
but it would be nice to have one or more standard builds, a blackfin
(no-mmu) build, a uclibc configuration, a full versus basic
configuration, ... We could have a set of, say, 15 combinations, and
we pick, say, 5 of them for each patch to test. For example, you have:
powerpc, buildroot basic uclibc toolchain
powerpc, buildroot basic glibc toolchain
powerpc, buildroot full uclibc toolchain
powerpc, buildroot full glibc toolchain
powerpc, external sourcery (full) toolchain
(more or less the same for the other archs)

and you pick from all this one buildroot basic toolchain (any arch),
one buildroot full toolchain, one external sourcery toolchain, one
explicit blackfin build, one explicit uclibc build (full or basic).
The rest of the configuration can be random just as in the normal
autobuilders.

The above is mostly relevant for new packages.
If the patch is fixing an autobuild problem, we really should be
repeating that autobuild configuration instead (but that could be done
manually by someone).
If the patch is adding/changing an init script, it doesn't make sense
to build it.

>
> On my side, I'm really skeptical about that one: I think we should
> rather merge patches faster, so that we simply rely on the existing
> autobuilder infrastructure, which works well.

I'm not saying we should keep patches in this test queue for a long
time. I'm also not saying that Peter is not free to apply a patch even
if it was not tested in this system.
However, we are having quite a number of failures on basic things like
thread support, mmu support, ... Ideally this would have been checked
by the submitter (and we could help this by providing a list of
reference configurations that people should test on), but as a
fallback we could also implement an automatic test system.

The idea of providing a list of reference configurations that
developers should test their new packages on may be sufficient too,
and then the more complicated test infrastructure as described above
is not needed. As reviewer, we can ask if the submitter did these
tests and trust that answer. The autobuilders can then catch the other
errors.
Providing this list of configurations is not that hard, we already
have a bunch of toolchains on the autobuilders. A script to run the
selected configurations in turn would be nice.

Best regards,
Thomas
