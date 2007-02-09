From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Feb 2007 19:21:45 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <200702091857.13886.yann.morin.1998@anciens.enib.fr>
References: <FA7EECCA3735EF46BE49245D249B788CE2E308@exchange1.wgate.com>
	<20070209142934.GA17891@aon.at>
	<200702091857.13886.yann.morin.1998@anciens.enib.fr>
Message-ID: <20070209182145.GU12488@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 09, 2007 at 06:57:13PM +0100, Yann E. MORIN wrote:
>Bernhard,
>All,
>
>On Friday 09 February 2007 152, Bernhard Fischer wrote:
>> I'm curious as to why you think we don't have -lfloat?
>
>I din't say that either.

Well, IIRC one of your patches (for gcc-4.0.4 in this thread) removed
-lfloat which begs the above question :)

I simply do not know when gcc grew it's own float-fallbacks (and i don't
want to search for it, TBH).

>As I said in an earlier post, I don't use buildroot to build my toolchains
>(because I need toolchains, not a rootfs, and for other technical reasons).

Fair enough, but let me point out that recently a patch went in that
allows to use an external toolchain, fwiw ?).
>
>For reference, I'm using a highly modified version of crosstool, please see:
>  http://sources.redhat.com/ml/crossgcc/2007-02/msg00009.html
>
>> Could somebody please follow up on
>> http://www.busybox.net/lists/buildroot/2007-January/001182.html
>
>Quoted from the message referenced above:
>> Please edit package/libfloat/libfloat.mk
>> and remove the check for the gcc version 3.3 and let me know if that
>> fixed it.
>
>I'm gonna give it a try in the WE. The fact that having to link with an
>external library when gcc has the adequate code seems odd to me... :-/

Could very well be that an external libfloat isn't needed anymore.

Still, i, personally since i'm in the fortunate position to have an mmu
as well as an FPU natively, have no idea how i could simulate
appropriate targets, thus my plea for a kernel .config for an mmu-less,
softfloat target that i can emulate with e.g. qemu :-/


We currently have in buildroot (short of /me having any test-target for
[+-]mmu and/or float variants):

[quote from toolchain/gcc/Makefile.in]
ifeq ($(findstring 4.,$(GCC_VERSION)),4.)
SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
ifeq ($(BR2_SOFT_FLOAT_FP),y)
TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
else # no fp at all
TARGET_SOFT_FLOAT:=-mfloat-abi=soft
endif
else # not gcc-4.x
TARGET_SOFT_FLOAT:=-msoft-float
endif
ARCH_FPU_SUFFIX:=_nofpu
else # no softfloat support
SOFT_FLOAT_CONFIG_OPTION:=
TARGET_SOFT_FLOAT:=
ARCH_FPU_SUFFIX:=
endif
[quote/]

Where currently "BR2_SOFT_FLOAT_FP" isn't set anywhere.
Help on that option can be obtained from invoke.texi from gcc or the
respective online-docs somewhere at http://gcc.gnu.org/

>Regards,
>Yann E. MORIN.

?) Sounds like marketing mumble, really, but heck :)

friendly,
Bernhard
