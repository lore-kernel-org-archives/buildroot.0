From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 13 Apr 2017 15:34:06 +1000
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-04-09
In-Reply-To: <20170412095212.1A18EB2050@b01ledav03.gho.pok.ibm.com>
References: <20170410062848.062C02803A@b01ledav001.gho.pok.ibm.com>
 <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
 <20170411144331.699becca@free-electrons.com>
 <20170412095212.1A18EB2050@b01ledav03.gho.pok.ibm.com>
Message-ID: <20170413053406.GA4103@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 12, 2017 at 11:51:41AM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 11-04-17 14:43, Thomas Petazzoni wrote:
> > Hello,
> > 
> > Adding the Buildroot mailing in Cc, and therefore keeping the full
> > context.
> > 
> > On Tue, 11 Apr 2017 11:00:19 +1000, Sam Bobroff wrote:
> > 
> >> I had a look at this, but I'm not having much luck. Do you have any
> >> advice?
> >>
> >> The error itself is clear from the build log, both during configure and
> >> later at the link failure:
> >>
> >> From http://autobuild.buildroot.net/results/005/0050aa0d5360d166d07d4b6ee4484f4746b224f5/readline-7.0/config.log
> >>
> >> configure:6025: checking for tgetent in -lncurses
> >> configure:6050:
> >> /home/buildroot/build/instance-0/output/host/usr/bin/powerpc64-linux-gcc
> >> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> >> -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> >> -D_FILE_OFFSET_BITS=64  conftest.c -lncurses   >&5
> >> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/5.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lncurses
> >>
> >> From http://autobuild.buildroot.net/results/005/0050aa0d5360d166d07d4b6ee4484f4746b224f5/build-end.log
> >>
> >> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/5.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lncurses
> >> collect2: error: ld returned 1 exit status
> >>
> >> (I do see why it's using ncurses even though it wasn't detected: the package
> >> file forces -lncurses into LIBS.)
> >>
> >> There are no references to ncurses in the build-time.log file, so it
> >> apparently wasn't built at all during this run.
> 
>  I suspect this is a circular dependency. Possibly
> 
> ncurses -> busybox -> libselinux -> python3 -> readline -> ncurses
> 
>  It would be nice to have the first 50 lines or so of the build log saved as
> well, then we would see such a circular dependency.

Hmm, I wondered about this and I agree: the first 50 or so lines (maybe
200? All of it? :-) How much is space an issue?) would be really useful.

And, I think you're on to the right track...

> >>
> >> But the package file for readline has "READLINE_DEPENDENCIES = ncurses"
> >> and "BR2_PACKAGE_NCURSES=y" *is* set in the Buildroot config.
> >>
> >> I can't replicate the failure locally, Buildroot always builds ncurses
> >> as I expect from that configuration.
> 
>  Did you use the same .config?

I tried, but unfortunately selinux failes to build (not sure when I'll
have time to look at that one; some linker error to do with -fPIC).

However, I *do* see a "Circular dependency dropped" message, which is
good confirmation for the theory above.

> >> So the only explanation I can think of is that the autobuilder's target
> >> directory is missing ncurses but the Buildroot stamp file must indicate
> >> that it's already been installed.
> >>
> >> Am I missing something?
> > 
> > There is a -Wl,-rpath,/usr/lib in the link command link that isn't
> > correct. This means that the compiler will try to link against the host
> > ncurses if available, which is bad.
> 
>  I suspect that that is there just because ncurses wasn't detected. But I could
> be wrong.

(I saw the bad rpath even on my successful builds -- I'll see if it's
easy to fix, since I'm looking at it anyway.)

So it seems fairly clear now: there is a circular dependency in that set
of packages and GNU make's behaviour is to drop a dependency and
continue building, so we end up building readline configured with
ncurses, with no ncurses, so it fails.

(IMHO this is very poor behaviour from GNU make: it seems to be
knowingly producing a broken build but exiting with success, and the
only indication is one fairly innocuous looking line of output. There is
no option to convert that warning into a fatal error! I even checked the
source :-( )

So, what do we do? It seems like it would be nice to catch any circular
dependency but is there any good way to do that? I don't like the idea
of running make under grep looking for "errors", or trying to manualy
detect circular dependencies either... Has this been explored already?

Thanks!
Sam.
