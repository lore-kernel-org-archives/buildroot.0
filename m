From: Peter Saunderson <peteasa@gmail.com>
Date: Mon, 15 Apr 2013 22:53:32 +0100
Subject: [Buildroot] modifying buildroot for non- linux freertos
Message-ID: <516C76DC.3000607@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been using buildroot for embedded linux builds for a while now 
and think its great.  Now I want to use the shell scripts and the 
general buildroot environment to build freertos using newlib rather than 
uclibc.

I have prototyped this but have run into some not unexpected problems 
and thought you guys might be able to help.  If you consider this email 
just spam flame me now and I will go quietly on without further 
disturbing you.

I want to do this because I want control over my build environment, 
because I need OpenOCD, gdb etc etc and because if the tools are ok for 
my embedded linux environment then I can save effort by using close to 
the same tools for simpler freertos solutions.  The buildroot style 
seems just what I need to solve my problem and would allow me to have 
all the control over my build environment that I need in one place.

Stage 1 is to get the tools built and I only need shared libraries so 
that should be simpler.  I keep configuration simple and just have a 
build freertos configuration file (bf1_config) with all the config stuff 
I find I need so I avoid .config and menuconfig for now.  I use the 
scripts in support and build packages from package (so far I found I 
need zlib, perl, mpfr, mpc, m4, libtool, gmp, expat, binutils, automake, 
autoconf).  The tools I am building are patched from files in toolchain 
(so far I have newlib, gdb, gcc).

The problem originates because newlib (http://sourceware.org/newlib/) 
has a different build style to uClibc but using uclibc.mk as a starting 
point for newlib.mk and making major mods I can get most things 
working.  I have built all the output/host/usr/bin tools but 
$(GCC_BUILD_DIR3)/.installed target has not been run so there is no 
$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc but my newlib build is trying 
to use it.  So what I think I need to do is delay the build of newlib 
and I am not sure how to do that yet.  So I am puzzling over 
$(GCC_BUILD_DIR1)/.configured:, $(GCC_BUILD_DIR2)/.configured: and 
$(GCC_BUILD_DIR3)/.configured: targets and wondering to myself what bit 
in buildroot sequences these and how can I fit my new newlib targets 
into the right place in the build sequence.  If you have read up to this 
point you may have a view or some tips. Perhaps there is a good guide 
that I have missed that could help?  I did a search of the archive but 
did not find anything that was of immediate assistance.  Perhaps there 
is a better place to ask this question?  Perhaps is such an interesting 
problem that you would like to see me create a new git project for it?

Thanks for your time.

Peter.
