From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:05:13 +0200
Subject: [Buildroot] couple autobuilder questions
In-Reply-To: <CAFt09wMWfXRfi-KYQUXDJL9nnYu=w3cut_XeaoRQiv3_6+uzxw@mail.gmail.com>
References: <CAFt09wMWfXRfi-KYQUXDJL9nnYu=w3cut_XeaoRQiv3_6+uzxw@mail.gmail.com>
Message-ID: <20160329160513.64592050@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[Thomas DS: there is some stuff for you below. Read on!]

On Mon, 28 Mar 2016 23:06:58 -0500, Matthew Weber wrote:
> ## 32bit architectures
> I'm curious to get your thoughts on adding another variant of the
> prebuilt "br" toolchains you have on the autobuilder.  Would you
> welcome the rebuilding of the 32bit arch toolchains on a 32bit system
> so that the wrappers allow them to execute on 32bit machines?

Why only the 32 bits arch toolchains? All Buildroot external toolchains
used in the autobuilders today are indeed built for x86_64, so you
can't use them on a x86 32 bits host. However, this has nothing to do
with the bitness of the target architecture: you can perfectly well
have a toolchain targetting ARM64 or x86_64 or PowerPC64 running on a
x86 32 bits platform.

Also, in your discussion, you're focusing on the wrapper being 64 bits,
but the wrapper is only the tip of the iceberg: the *entire* toolchain
(gcc binaries, binutils binaries, gcc companion libraries) are built
for 64 bits.

> I was on the fence as the value this would bring but I have at least
> once case where I've ran into a server that's still 32bit and I've
> been running the autobuilder with occasional failures because of the
> toolchain wrapper being x86_64.

Right. As said earlier, it's not only the wrapper.

> If toolchains with a 32bit wrapper could be added, I'm assuming some
> detection smarts would need to be added to the script to detect the
> host architecture and then altering what is allowed during
> configuration generation.

This is actually already planned, but not implemented properly. If you
look at
http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
the second field is the host architecture of the toolchain. All of them
are listed as x86, which is obviously not correct since some of them
are x86-64 only. So, we should:

 1/ Change those values to be either i386 or x86_64 for each
    configuration.

 2/ Fix the autobuild-run script to not assimilate i686 and x86_64 to
    be the x86 architecture. Originally, this feature was introduced
    because Peter was running some autobuilder instance on a PowerPC
    machine, so we only cared about x86 or not. But obviously, if you
    want to run the autobuilder on a x86 32 bits machine, we need to
    adjust that.

Is this something you are willing to look at, or should I go ahead and
look at it?

Another thing that is wrong is that for the "internal" toolchain
configurations listed in the CSV file, the "host architecture" field
should have no value, or some magic value. Indeed, since it's this case
the toolchain is built from scratch, it doesn't matter on which
architecture we are running.

> ## (Possible bug) Latest master of buildroot and autobr regex issue
> I had to open up the run script's get_failure() regex to wildcard part
> of the string search for the failing package.
> Instead of "make:  " , I ended up with "make.* " in both the php
> import and autobuilder-run scripts.  I was going to push a patch out
> for these after a bit more testing.
> 
> Looks like the output changed from:
> 
> make: *** [/<instance-path>/output/build/mplayer-1.2/.stamp_built] Error 2
> to
> make[1]: *** [/<instance=path>/output/build/mplayer-1.2/.stamp_built] Error 2

This depends on your umask :)

If your umask is wrong, we fix it and run a sub-make, which explains
why you have make[1] instead of make. See
bee5745ccc20be6dbba243b1f8af0d5c522923e8 for the original commit
introducing this.

I do remember handling this situation though. I did a bit of research,
and here is what happens:

 * The detection of the failure reason for the autobuild.buildroot.org
   website is done on the Web server side, not by the autobuild-run
   script. And the PHP logic was adjusted to take into account the
   umask handling. See
   https://git.busybox.net/buildroot-test/commit/?id=e82328cf02a1f0aea90c7c243e8a48dbdb6e53ab.

 * The failure reason is also detected by the autobuild-run script
   itself, but for a completely different purpose: to be able to
   provide in build-end.log the complete build of the failing package
   rather than just the last 500 lines. Here, the regexp is indeed
   wrong, and doesn't account for the make[1] case. The consequence is
   that if the autobuilder instance is running with a umask different
   than 0022, then you will never get a full build-end.log, but just
   the last 500 lines of the build log. I'm Cc'ing Thomas DS on this,
   since he wrote this code.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
