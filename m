From: Arguin, Christopher P     UTAS <Christopher.Arguin@utas.utc.com>
Date: Tue, 19 Jul 2016 18:13:31 +0000
Subject: [Buildroot] Issues with cross-compiling from x86_64 to a different
	x86_64
Message-ID: <34C69F44FE4EA4498813EAECDBF40C1623A46E39@GUSALE0B.na.utcmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I think I've uncovered a bug where targeting special instruction sets within the x86_64 family is not always getting treated as a cross-compile. 

I'm targeting a 4th Gen i7 board. We had everything working, but had the generic "nocona"  architecture instead of the more specific 'core-avx2'. Our application would benefit from the AVX2 instruction set, so I switched it. After switching everything built fine on my laptop, which also happens to be a 4th Gen i7.

I then migrated my build environment onto our build server, which is Xeon processor based. Suddenly the build starting failing with "illegal instruction" errors during the compile process. I switched the target architecture back to "nocona" and everything works in both environments.

The only change between working and not-working is this entry in the config file:
   BR2_x86_core_avx2=y

Currently there are two failure points, the second of which is fatal. A full working build takes about 61 minutes and the failing build took 52 minutes, so it got through most of the stuff before giving up.

The first sign of problems occurs when building openssl, and it may be that it is incorrectly trying to use just-built code to generate or verify certificates:
   Doing certs/demo
   Illegal instruction (core dumped)
   Illegal instruction (core dumped)
   WARNING: Skipping duplicate certificate pca-cert.pem
   Illegal instruction (core dumped)
   WARNING: Skipping duplicate certificate ca-cert.pem
   Illegal instruction (core dumped)


The second failure is on ncftp, and it fails immediately and catastrophically, as if the compiler is not working at all:
   Makefile:62: recipe for target 'DStrFree.o' failed
   make[4]: *** [DStrFree.o] Illegal instruction (core dumped)
   make[4]: *** Waiting for unfinished jobs....
   Makefile:62: recipe for target 'strtokc.o' failed
   make[4]: *** [strtokc.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'Strncpy.o' failed
   make[4]: *** [Strncpy.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'Strnpcpy.o' failed
   make[4]: *** [Strnpcpy.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'StrFree.o' failed
   make[4]: *** [StrFree.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'DStrCpyList.o' failed
   make[4]: *** [DStrCpyList.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'Strncat.o' failed
   make[4]: *** [Strncat.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'DStrCpy.o' failed
   make[4]: *** [DStrCpy.o] Illegal instruction (core dumped)
   Makefile:62: recipe for target 'DStrInit.o' failed
   make[4]: *** [DStrInit.o] Illegal instruction (core dumped)
   Makefile:32: recipe for target 'libs' failed
   make[3]: *** [libs] Error 2

This despite the configure output looking pretty reasonable:
   checking for x86_64-buildroot-linux-gnu-gcc... /home/jenkins/workspace/LinuxOS/output/svme1908/host/usr/bin/x86_64-buildroot-linux-gnu-gcc
   checking whether the C compiler works... yes
   checking for C compiler default output file name... a.out
   checking for suffix of executables... 
   checking whether we are cross compiling... yes

I'll start delving into this myself, but I wanted to check this mailing list to see if this is some "known-and-too-hard-to-solve" problem. I couldn't find it mentioned anywhere.

Thanks,
Chris Arguin
