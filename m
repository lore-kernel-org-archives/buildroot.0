From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Feb 2013 05:57:42 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-02-11
In-Reply-To: <511D5BF2.5060906@mind.be>
References: <20130212073431.F3A9752C982@lolut.humanoidz.org>
 <511D5BF2.5060906@mind.be>
Message-ID: <20130215055742.4402d9ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 14 Feb 2013 22:49:38 +0100, Arnout Vandecappelle wrote:

>  The problem with this one is the following:
> 
> /home/test/test/output1/host/usr/bin/i686-pc-linux-gnu-ld -r -o src/library.o  src/library/getopt.o src/library/gettext.o
> /home/test/test/output1/host/usr/bin/i686-pc-linux-gnu-ld: i386:x86-64 architecture of input file `src/library/gettext.o' is incompatible with i386 output
> 
> 
>  This is because the Sourcery toolchain is a multilib toolchain that can
> generate two different emulations (elf_i386 and elf_x86_64). gcc adds the
> "-m elf_x86_64" option to ld, but of course there is no way for configure
> or whatever to discover that this is necessary.
> 
>  There are probably other packages that suffer the same problem - in fact,
> any package that uses $(TARGET_LD) will most likely suffer from it.
> 
>  I'm not sure how to solve this. We could set TARGET_LD to 
> "$(TARGET_CROSS)ld -m elf_x86_64" for the specific case of x86_64 external
> toolchains (it probably doesn't hurt to add the default emulation 
> explicitly). But there may be other external toolchains with the same
> problem - none of the current ones, at first sight, but who knows what the
> future brings.
> 
>  So what do you think?

We discussed this during the Buildroot Developers meeting, don't you
remember ? :-)

From your report:

   Flags in external toolchain wrapper. The source of this discussion
   is the Cavium toolchain which requires an additional linker option
   to link correctly. Note that this is only about compile/link flags
   that are strictly needed for compiling for the right target, so
   typically things like -mfpu. The conclusion is that we want: 
   [...]

Just like the Cavium toolchain required a special -m flag at link time,
the Sourcery toolchain also needs a -m flag at link time.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
