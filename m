From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 10:44:33 +0200
Subject: [Buildroot] Patchwork cleanup #9: submitter notification
In-Reply-To: <CAAXf6LWRDv-B9Hijq6_xH_Q+t3zno2_QRTdx2Q57C1qeRcd27A@mail.gmail.com>
References: <CAAXf6LWRDv-B9Hijq6_xH_Q+t3zno2_QRTdx2Q57C1qeRcd27A@mail.gmail.com>
Message-ID: <20140609104433.56abda3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 8 Jun 2014 22:13:56 +0200, Thomas De Schampheleire wrote:

> [1/1] Option to copy Linaro gconv libs to target
> Stanislav Vasic <svlasic@gmail.com>
> http://patchwork.ozlabs.org/patch/288022
> 
> This patch has been marked as Superseded (by someone else, presumably
> Yann E. Morin), as a new patch covering the same problem has been
> introduced: http://patchwork.ozlabs.org/patch/357067/. The discussion
> is ongoing and hopefully we'll soon have a solution to the problem.

Correct, we discussed it with Yann on IRC yesterday, and it is indeed
superseded by a more generic solution proposed by Yann, and that I
commented yesterday.

> [RFC] core: Download all package sources
> Clayton Shotwell <clshotwe@rockwellcollins.com>
> http://patchwork.ozlabs.org/patch/288224
> 
> B. Rejected for now, as per feedback of Clayton.

ACK. Did you mark is as rejected?

> perf: libelf is required to compile perf
> Andi Shyti <andi@etezian.org>
> http://patchwork.ozlabs.org/patch/288534
> 
> B reject. Manually selecting libelf if you're using older kernel
> versions works fine.

ACK. Did you mark it as rejected?

> [1/1] add support for congatec conga-qmx6
> Fabien Lahoudere (ECASINTERS) <fabien.lahoudere@openwide.fr>
> http://patchwork.ozlabs.org/patch/288951
> 
> A accept (to be refreshed)

Be careful: there are some more recent versions of this patch available
in patchwork, submitted by other persons.

> gcc: use generic infrastructure for patches
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/289052
> 
> C unsure. In the 'triaging proposal' Arnout gave more feedback, also
> requesting feedback from ThomasP and Peter. No feedback received after
> that...

Need to have a look. I think I had some objections to the patch, which
I shared in the review process.

> [1/2] util-linux: nommu: Add patch to use vfork in nommu arch.
> Sonic Zhang <sonic.adi@gmail.com>
> http://patchwork.ozlabs.org/patch/290234
> 
> [v2,1/3] e2fsprogs: nommu: Add patch to use vfork in nommu arch.
> Sonic Zhang <sonic.adi@gmail.com>
> http://patchwork.ozlabs.org/patch/291514
> 
> All two patches: C unsure: the first patch has received several
> comments but does not seem to have a follow-up version. What to do
> with all these Blackfin vfork patches is also unclear to me: should we
> wait for upstream to accept them or not?

My problem with those noMMU patches is that they seem to simply do
s/fork/vfork/ and s/exit/_exit/ without any real testing other than 'it
builds'. fork() and vfork() are not interchangeable, and therefore we
want to see a justification for each replacement of the reasons why it
works. I think for now, we've solved the problem by marking the
relevant parts of util-linux as 'depends on BR2_USE_MMU' and ditto for
e2fsprogs.

Therefore, I would indeed suggest to ask Sonic to work with the
upstream folks of util-linux and e2fsprogs to get the problems fixed.

> audiofile: needs dynamic library
> Simon Dawson <spdawson@gmail.com>
> http://patchwork.ozlabs.org/patch/290552
> 
> C unsure: the autobuild problem this patch is supposed to fixed is
> still present (http://autobuild.buildroot.org/?reason=audiofile-0.3.6)
> but the correctness of the patch has been under discussion. Gustavo
> acknowledged the problem. I marked the patch as delegated to him.

Discussed with Yann yesterday: we should reject. The problem is not
related to audiofile directly, other packages are affected as well. We
see it on audiofile because it starts with 'a' so tends to be at the
beginning of the build. Gustavo's patches are more likely to resolve
the problem correctly for all packages.

> [v2,2/3] e2fsprogs: flat: Add patch to append uuid link flag after the
> blkid link flags when checking the blkid library in the FLAT binary
> mode.
> Sonic Zhang <sonic.adi@gmail.com>
> http://patchwork.ozlabs.org/patch/291515
> 
> B reject: according to me this patch is superseded by commit
> http://git.buildroot.org/buildroot/commit/?id=a8da3cd61aafd3e2fd44b87725fcc14b60b93be8.
> ThomasP: could you confirm?

Well, it is surely not the same fix. Sonic patches were making possible
to build libblkid and e2fsprogs on noMMU platforms, while my patch
simply disallowed them. But see the explanation above: we're
unconvinced by the apparently blind replacements of fork() by vfork(),
and Sonic never came back with new iterations and proper justification.
So I'd say Reject.

> [v2] util-linux: flat: Add patch to skip creating dynamic libraries
> Sonic Zhang <sonic.adi@gmail.com>
> http://patchwork.ozlabs.org/patch/291522
> 
> C unsure, is this still relevant? Is the solution correct? I couldn't
> answer it...

This patch touches the build of three libraries: libmount, libblkid and
libuuid. libmound and libblkid are now disabled on noMMU platforms
(since the patch you pointed above). And libuuid builds just fine on
Blackfin FLAT (I just tested again to be sure).

> [2/2] mpg123: use code optimized for ARM NEON SIMD engine if available
> Sven Neumann <neumann@teufel.de>
> http://patchwork.ozlabs.org/patch/293605
> 
> Now superseded by commit 1cf2c6ea93d3bd855df7c9883d3882034f0568fa.

Correct. Did you mark Sven's patch as superseded?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
