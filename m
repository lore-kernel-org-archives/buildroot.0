From: Arguin, Christopher P     UTAS <Christopher.Arguin@utas.utc.com>
Date: Wed, 20 Jul 2016 02:07:43 +0000
Subject: [Buildroot] [External] Re: Issues with cross-compiling from
 x86_64 to a different x86_64
In-Reply-To: <20160720000154.4132543d@free-electrons.com>
References: <34C69F44FE4EA4498813EAECDBF40C1623A46E39@GUSALE0B.na.utcmail.com>
 <20160720000154.4132543d@free-electrons.com>
Message-ID: <34C69F44FE4EA4498813EAECDBF40C1623A47382@GUSALE0B.na.utcmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks for the quick reply.

I'm working on a minimal set now. I've stripped out practically everything and still see the same issue, but I'll also upgrade buildroot from 2016.02 to 2016.05 and move away from the BR2_EXTERNAL setup I have to make it as simple as possible. 

I looked up your Xeon processor and it still supports the AVX extensions, although not AVX2. Mine is an "Intel(R) Xeon(R) CPU           E5649  @ 2.53GHz", which doesn't support AVX at all.

That said, I can't imagine why compiling ncftp of all things would be a problem.

Thanks,
Chris



-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Tuesday, July 19, 2016 6:02 PM
To: Arguin, Christopher P UTAS
Cc: buildroot at busybox.net
Subject: [External] Re: [Buildroot] Issues with cross-compiling from x86_64 to a different x86_64

Hello,

First of all, thanks for your report!

On Tue, 19 Jul 2016 18:13:31 +0000, Arguin, Christopher P     UTAS
wrote:

> I think I've uncovered a bug where targeting special instruction sets within the x86_64 family is not always getting treated as a cross-compile. 
> 
> I'm targeting a 4th Gen i7 board. We had everything working, but had the generic "nocona"  architecture instead of the more specific 'core-avx2'. Our application would benefit from the AVX2 instruction set, so I switched it. After switching everything built fine on my laptop, which also happens to be a 4th Gen i7.
> 
> I then migrated my build environment onto our build server, which is Xeon processor based. Suddenly the build starting failing with "illegal instruction" errors during the compile process. I switched the target architecture back to "nocona" and everything works in both environments.
> 
> The only change between working and not-working is this entry in the config file:
>    BR2_x86_core_avx2=y
> 
> Currently there are two failure points, the second of which is fatal. A full working build takes about 61 minutes and the failing build took 52 minutes, so it got through most of the stuff before giving up.
> 
> The first sign of problems occurs when building openssl, and it may be that it is incorrectly trying to use just-built code to generate or verify certificates:
>    Doing certs/demo
>    Illegal instruction (core dumped)
>    Illegal instruction (core dumped)
>    WARNING: Skipping duplicate certificate pca-cert.pem
>    Illegal instruction (core dumped)
>    WARNING: Skipping duplicate certificate ca-cert.pem
>    Illegal instruction (core dumped)
> 
> 
> The second failure is on ncftp, and it fails immediately and catastrophically, as if the compiler is not working at all:
>    Makefile:62: recipe for target 'DStrFree.o' failed
>    make[4]: *** [DStrFree.o] Illegal instruction (core dumped)
>    make[4]: *** Waiting for unfinished jobs....
>    Makefile:62: recipe for target 'strtokc.o' failed
>    make[4]: *** [strtokc.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'Strncpy.o' failed
>    make[4]: *** [Strncpy.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'Strnpcpy.o' failed
>    make[4]: *** [Strnpcpy.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'StrFree.o' failed
>    make[4]: *** [StrFree.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'DStrCpyList.o' failed
>    make[4]: *** [DStrCpyList.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'Strncat.o' failed
>    make[4]: *** [Strncat.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'DStrCpy.o' failed
>    make[4]: *** [DStrCpy.o] Illegal instruction (core dumped)
>    Makefile:62: recipe for target 'DStrInit.o' failed
>    make[4]: *** [DStrInit.o] Illegal instruction (core dumped)
>    Makefile:32: recipe for target 'libs' failed
>    make[3]: *** [libs] Error 2

I've just built the following defconfig:

BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_PACKAGE_NCFTP=y

On a Xeon machine:

$ cat /proc/cpuinfo  | grep "model name"
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz
model name      : Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz

And it built just fine.

Could you provide us a minimal configuration, which exhibits the ncftp problem in your case?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
