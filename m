From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Apr 2017 14:43:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-09
In-Reply-To: <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
References: <20170410062848.062C02803A@b01ledav001.gho.pok.ibm.com>
 <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
Message-ID: <20170411144331.699becca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding the Buildroot mailing in Cc, and therefore keeping the full
context.

On Tue, 11 Apr 2017 11:00:19 +1000, Sam Bobroff wrote:

> I had a look at this, but I'm not having much luck. Do you have any
> advice?
> 
> The error itself is clear from the build log, both during configure and
> later at the link failure:
> 
> From http://autobuild.buildroot.net/results/005/0050aa0d5360d166d07d4b6ee4484f4746b224f5/readline-7.0/config.log
> 
> configure:6025: checking for tgetent in -lncurses
> configure:6050:
> /home/buildroot/build/instance-0/output/host/usr/bin/powerpc64-linux-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  conftest.c -lncurses   >&5
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/5.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lncurses
> 
> From http://autobuild.buildroot.net/results/005/0050aa0d5360d166d07d4b6ee4484f4746b224f5/build-end.log
> 
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/5.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lncurses
> collect2: error: ld returned 1 exit status
> 
> (I do see why it's using ncurses even though it wasn't detected: the package
> file forces -lncurses into LIBS.)
> 
> There are no references to ncurses in the build-time.log file, so it
> apparently wasn't built at all during this run.
> 
> But the package file for readline has "READLINE_DEPENDENCIES = ncurses"
> and "BR2_PACKAGE_NCURSES=y" *is* set in the Buildroot config.
> 
> I can't replicate the failure locally, Buildroot always builds ncurses
> as I expect from that configuration.
> 
> So the only explanation I can think of is that the autobuilder's target
> directory is missing ncurses but the Buildroot stamp file must indicate
> that it's already been installed.
> 
> Am I missing something?

There is a -Wl,-rpath,/usr/lib in the link command link that isn't
correct. This means that the compiler will try to link against the host
ncurses if available, which is bad.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
