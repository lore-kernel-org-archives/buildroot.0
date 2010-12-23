From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 23 Dec 2010 13:03:15 -0600
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <20101223082740.3a8e44c4@surf>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
	<20101223082740.3a8e44c4@surf>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, I've done some tracking and have found the issue, but I don't know
Mips asm that great (only 2 months into mips).

The code that it pukes at for building gmp for the native toolchain is:

#define umul_ppmm(w1, w0, u, v) \
__asm__ ("multu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))

(defined in longlong.h under the root of gmp-4.2.4)

The error given is:
dive_1.c:114:4: error: impossible constraint in 'asm'

dive_1.c:114 is: umul_ppmm (h, dummy, l, divisor);

Also, for my edification and learning, how does that asm line read?

Thanks in advance for your help!
Andy 


-----Original Message-----
From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: Thursday, December 23, 2010 1:28 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] oprofile "requires" gmp???

Hello,

On Wed, 22 Dec 2010 22:47:17 -0600
ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> buildroot v2011.02-git Configuration:
> 
> MIPS-32r2 using native toolchain, uclibc-0.9.31.x, gcc-4.5.x, binutils
> 2.20.1.
> 
> When I select oprofile from packages -> debug utils, gmp is selected,
> though the .config file reports # BR2_PACKAGE_LIBGMP is not set,
> though buildroot attempts to build it.
> 
> There are no dependencies for gmp listed in the oprofile help section.
> 
> What gives?

oprofile needs binutils on target, which in turns requires gmp on
target. So the fact that gmp gets compiled is normal.

However, the fact that BR2_PACKAGE_LIBGMP is not set is indeed
incorrect. But Gustavo has a patch series that rewrites how binutils,
gmp, mpfr are handled, so presumably he could fix that particular
problem as part of this patch set.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
