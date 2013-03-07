From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Mar 2013 11:53:46 +0100
Subject: [Buildroot] ARM allyespackageconfig report
In-Reply-To: <20130307111108.64a6dc0a@skate> (Thomas Petazzoni's message of
 "Thu, 7 Mar 2013 11:11:08 +0100")
References: <20130307111108.64a6dc0a@skate>
Message-ID: <87hakn5vlw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> I again did a build of an ARM allyespackageconfig configuration, with
 Thomas> the Linaro 2013.01 toolchain. Results are not too bad:

 Thomas>  * I'm disabling jamvm and classpath because I don't have javac
 Thomas>    installed in the chroot I used to test Buildroot. Installing javac
 Thomas>    builds gazillions of dependencies, and since I want my chroot to
 Thomas>    remain as limited as possible in terms of number of distro packages,
 Thomas>    I don't want to installed javac. So definitely, those two packages
 Thomas>    have not been tested.

 Thomas>  * Besides those two packages that I disable ahead of time, only three
 Thomas>    packages failed to build: mplayer, ltp-testsuite and sconeserver.

 Thomas> After disabling those 5 packages, the entire build went
 Thomas> through.  output/target/ weights 1023 MB, output/build/ weights
 Thomas> 17 GB with a total number of 785324 files and directories. I
 Thomas> don't have the overall build time though, since the build was
 Thomas> interrupted 3 times due to the 3 failed packages.

Cool!


 Thomas> mplayer build failure
 Thomas> =====================

 Thomas> {standard input}: Assembler messages:
 Thomas> {standard input}:2857: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
 Thomas> {standard input}:2951: Error: selected processor does not support ARM mode `veor q0,q0,q2'
 Thomas> {standard input}:2952: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
 Thomas> {standard input}:3023: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
 Thomas> {standard input}:3106: Error: selected processor does not support ARM mode `veor d0,d0,d2'
 Thomas> {standard input}:3107: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'

Sounds like thumb2 / arm mismatch.

 Thomas> ltp-testsuite build failure
 Thomas> ===========================

 Thomas> par_chld_ipv6.c: In function 'main':
 Thomas> par_chld_ipv6.c:55:14: error: 'CLONE_NEWNS' undeclared (first use in this function)
 Thomas> par_chld_ipv6.c:55:14: note: each undeclared identifier is reported only once for each function it appears in
 Thomas> par_chld_ipv6.c:84:9: warning: implicit declaration of function 'unshare' [-Wimplicit-function-declaration]
 Thomas> par_chld_ipv6.c:93:5: warning: implicit declaration of function 'crtchild' [-Wimplicit-function-declaration]
 Thomas> two_children_ns.c: In function 'main':make[6]: *** [par_chld_ipv6.o] Error 1

Odd, do the Linaro guys build against old kernel headers (without
NEWNS/unshare)?

 Thomas> sconeserver build failure
 Thomas> =========================

 Thomas> checking for InitializeMagick in -lMagick++... no
 Thomas> configure: error: library 'Magick++' is required for Sconesite:image
 Thomas> make[1]: *** [/home/test/outputs/allpkg/build/sconeserver-183/.stamp_configured] Error 1
 Thomas> make: *** [all] Error 2

Could you have a look in config.log to see what goes wrong with the
InitializeMagick check?

-- 
Bye, Peter Korsgaard
