From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jun 2014 12:20:40 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140615063014.70ACF100EAC@stock.ovh.net>
References: <20140615063014.70ACF100EAC@stock.ovh.net>
Message-ID: <20140615122040.6effbc93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Over the next few days, I'll try to do a quick analysis of the build
failures, to let you know which build failures are "real", and which
build failures are caused by issues in the autobuilder infrastructure.

On Sun, 15 Jun 2014 08:30:14 +0200 (CEST), Thomas Petazzoni wrote:

>    powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b62615a2d933f2b69c8b402d0134c72675a7e527/

Still the libstdc++ static linking issue.

>       i686 |                  cairo-1.12.10 | TIM | http://autobuild.buildroot.net/results/211fbc0aee997139a7a9d65b4776e02a5b294b4e/

Timeout on my private server. It seems like this server is by an order
of magnitude slower than the Free Electrons build server, and that
therefore the timeout  of 4 hours is not appropriate for builds that
can have up to 30% of the packages enabled. For example, this private
server needs 20 minutes to build libglib2 (which seems very long, not
sure what's going on there).

I'm looking for suggestions on this, because I'm sure other people
testing the autobuild-run script will have similar problems, as they
will not all have 8 cores monsters with 32 GB of RAM and fast I/O.
There are two possible directions:

 * Make the timeout configurable, so that people can adjust it to their
   configuration to avoid false positives as much as possible.

 * Make the timeout a per-package timeout. However, that requires
   having a process running in parallel to the build to monitor the
   progress of the build. Not impossible, but requires a bit of
   additional logic in autobuild-run.

 * Make the KCONFIG_PROBABILITY configurable. My statistics lessons are
   way too much in the past, but I'm wondering if having different
   KCONFIG_PROBABILITY in the various builders is not going to make the
   statistic of failed vs. success builds a bit meaningless. If one
   machine runs with a low KCONFIG_PROBABILITY, this machine will do a
   lot of small builds, and small builds have a much higher chance of
   being successful than bigger builds. Therefore, such a machine could
   easily reach a very high success rate of builds, compared to a
   machine running with a higher KCONFIG_PROBABILITY value. Thoughts on
   this? Or people better in statistics than me to confirm or infirm my
   reasoning?

> microblazeel |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/5f9957a76381890a5efa5f52900592bf915550ce/
>     x86_64 |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/273539eaf9e930d0230a8c4b11e295733ab4f871/
>        arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/128abc06acbf7d4872bbebffd99f97c073237303/
>        arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/1bf4342d4aa1d49294a278f25322a00ee0d188ea/
>        arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/411f6171e972eab4486143dedbfd078136886ab0/
>        arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/365e6d1ef2faef546dd41b5c0a6ab04212b519dd/
>       i686 |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/072cb54fdbc246a97c6cfbf854a6e648779e9755/
>     xtensa |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/875ae36dff9fdd84f71f1177349d7c80adfb3f27/
>    powerpc |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/de6000fbe76fe5e8bd2832f090ddf81c09c9d8d8/
>        arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/0dd652d3caa212089caab0f962213d9938d9745e/

This is all fixed by
http://git.buildroot.net/buildroot/commit/?id=9c080f34076cdf48bcf72e1a1fbe2024b47a2694.

>    powerpc |             eigen-ffa86ffb5570 | NOK | http://autobuild.buildroot.net/results/d7daa7ac359c6bef85ea0c65c5318f3068159010/

Temporary failure of upstream Mercurial server + lack of the tarball on
sources.buildroot.net. I just checked, the upstream Mercurial server
works fine now.

>    powerpc |        gst1-plugins-good-1.2.4 | NOK | http://autobuild.buildroot.net/results/4f746cb9d8266abea2671718ad0f292763263873/

  CC       libgstvideo4linux2_la-gstv4l2sink.lo
gstv4l2object.c: In function 'gst_v4l2_object_set_format':
gstv4l2object.c:2384:23: error: 'union <anonymous>' has no member named 'pix_mp'
gstv4l2object.c:2385:24: error: 'union <anonymous>' has no member named 'pix_mp'

pix_mp was added in 2.6.39, and this toolchain uses older kernel
headers. So I propose to package this package depend on kernel headers
greater than 3.0. Even though that's not exactly correct, it's good enough, and
we decided to not have Config.in options for each of the 2.6 kernels. Is that OK ?

>   mips64el |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cc99d4b8d0d83705071034bc72dd4e2efbb07acf/

Seems like it could be solved by
http://patchwork.ozlabs.org/patch/326425/. I'll try to reproduce in the
autobuilders to be sure.

> microblazeel | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/30af5cd7f39fb556925321f9ce5c733a6688bc81/

That's an issue with the autobuilder infrastructure, ignore.

>   mips64el | make: Leaving directory `/h... | NOK | http://autobuild.buildroot.net/results/16c9d9baf11082e6b7db8bc5076ee7c54ddbd164/

Same, ignore.

>       i486 | make: Leaving directory `/h... | NOK | http://autobuild.buildroot.net/results/67f79482f8a80e63aca366df6d3ea232336c9ce1/

That's the same dialog issue, which is already fixed. The "reason" was
mis-detected due to slight variations in the format that caused the
logic on http://autobuild.buildroot.org to not recognized the correct
reason in the log file.

>        arm |  make[1]: *** [dialog] Error 1 | NOK | http://autobuild.buildroot.net/results/dae1d1cfff19f52ebdbf558b884cbe0a45cf2564/

Same.

>    powerpc |  make[2]: *** [opt] Terminated | TIM | http://autobuild.buildroot.net/results/b9f67e5b23032eb81be30107fda8104952bf775f/

A timeout on the private server.

>        arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/549ef23ea1c9daeba8337b45ffabb254321c72e3/

../libutil++/libutil++.a(bfd_support.o): In function `bfd_info::get_synth_symbols()':
bfd_support.cpp:(.text+0x190c): undefined reference to `bfd_elf64_powerpc_vec'
bfd_support.cpp:(.text+0x1910): undefined reference to `bfd_elf64_powerpcle_vec'
collect2: error: ld returned 1 exit status

Looks weird. PowerPC symbols, but we're building for ARM. Why?

>       bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/ec2fa986493cf278681e9aa85d80356f9f3f15d1/

I investigated that: it builds fine with the gcc 4.3 Blackfin toolchain
(called stable), but not with the gcc 4.5 Blackfin toolchain (called
experimental). Maybe we should switch to use the gcc 4.3 Blackfin
toolchain by default. But on the other hand, that doesn't allow us to
detect issues and report them to ADI. That being said, when I look at
the toolchain bug tracker of ADI, it looks more like /dev/null that
anything really useful.

Suggestions?

>      avr32 |             wpa_supplicant-2.2 | NOK | http://autobuild.buildroot.net/results/20908f479b33c1e2952622f5e8ad6b60d58af693/

Baruch has already sent a patch disabling wpa_supplicant to avoid this
problem.

>       bfin |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/db4f913a0dc9a0d8875cf3879e350837a73e26aa/

Many "error: inline function 'pthread_atfork' cannot be declared weak"
and similar messages for other functions.

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/3af3d41ba5b60f30e3c9e7bcea33f52dc0c89cf2/

Exact same failure as snmpp.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
