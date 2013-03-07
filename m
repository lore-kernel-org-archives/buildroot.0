From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 11:11:08 +0100
Subject: [Buildroot] ARM allyespackageconfig report
Message-ID: <20130307111108.64a6dc0a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I again did a build of an ARM allyespackageconfig configuration, with
the Linaro 2013.01 toolchain. Results are not too bad:

 * I'm disabling jamvm and classpath because I don't have javac
   installed in the chroot I used to test Buildroot. Installing javac
   builds gazillions of dependencies, and since I want my chroot to
   remain as limited as possible in terms of number of distro packages,
   I don't want to installed javac. So definitely, those two packages
   have not been tested.

 * Besides those two packages that I disable ahead of time, only three
   packages failed to build: mplayer, ltp-testsuite and sconeserver.

After disabling those 5 packages, the entire build went through.
output/target/ weights 1023 MB, output/build/ weights 17 GB with a
total number of 785324 files and directories. I don't have the overall
build time though, since the build was interrupted 3 times due to the 3
failed packages.

mplayer build failure
=====================

{standard input}: Assembler messages:
{standard input}:2857: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:2951: Error: selected processor does not support ARM mode `veor q0,q0,q2'
{standard input}:2952: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:3023: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
{standard input}:3106: Error: selected processor does not support ARM mode `veor d0,d0,d2'
{standard input}:3107: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'

ltp-testsuite build failure
===========================

par_chld_ipv6.c: In function 'main':
par_chld_ipv6.c:55:14: error: 'CLONE_NEWNS' undeclared (first use in this function)
par_chld_ipv6.c:55:14: note: each undeclared identifier is reported only once for each function it appears in
par_chld_ipv6.c:84:9: warning: implicit declaration of function 'unshare' [-Wimplicit-function-declaration]
par_chld_ipv6.c:93:5: warning: implicit declaration of function 'crtchild' [-Wimplicit-function-declaration]
two_children_ns.c: In function 'main':make[6]: *** [par_chld_ipv6.o] Error 1
make[6]: *** Waiting for unfinished jobs....

two_children_ns.c:58:14: error: 'CLONE_NEWNS' undeclared (first use in this function)
two_children_ns.c:58:14: note: each undeclared identifier is reported only once for each function it appears in
two_children_ns.c:100:3: warning: implicit declaration of function 'unshare' [-Wimplicit-function-declaration]
two_children_ns.c:107:6: warning: implicit declaration of function 'crtchild' [-Wimplicit-function-declaration]
make[6]: *** [two_children_ns.o] Error 1
common.c: In function 'create_net_namespace':
common.c:64:17: error: 'CLONE_NEWNS' undeclared (first use in this function)
common.c:64:17: note: each undeclared identifier is reported only once for each function it appears in
common.c: In function 'child_fn':
common.c:124:11: error: 'CLONE_NEWNS' undeclared (first use in this function)
common.c:127:11: error: 'CLONE_FS' undeclared (first use in this function)
common.c:147:2: warning: implicit declaration of function 'unshare' [-Wimplicit-function-declaration]

sconeserver build failure
=========================

checking for InitializeMagick in -lMagick++... no
configure: error: library 'Magick++' is required for Sconesite:image
make[1]: *** [/home/test/outputs/allpkg/build/sconeserver-183/.stamp_configured] Error 1
make: *** [all] Error 2

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
