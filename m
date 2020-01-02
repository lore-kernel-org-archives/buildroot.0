From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 2 Jan 2020 14:54:10 -0600
Subject: [Buildroot] [PATCH] package/libnss: fix ppc 32-bit build failure
In-Reply-To: <20200102181740.116227-1-giulio.benetti@benettiengineering.com>
References: <20200102181740.116227-1-giulio.benetti@benettiengineering.com>
Message-ID: <23dbb404-03fa-f18f-607d-62cf8ef43a5f@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio,

On 1/2/20 12:17 PM, Giulio Benetti wrote:
> NSS assumes that Altivec is supported on powerpc64 only, but in
> Makefile it tries to build gcm-ppc.c(containing Altivec functions
> calls), even if powerpc is not 64-bits. So add a patch to add a check if
> architecture is a 64-bit to build gcm-ppc.
>
> Fixes:
> http://autobuild.buildroot.net/results/433/433a7db21654d67626c7a3e5f1272d6c3ce4fe6c/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1606689
> ---
>   ...1606689-Fix-ppc-32-bit-build-failure.patch | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch
>
> diff --git a/package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch b/package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch
> new file mode 100644
> index 0000000000..de30fa7002
> --- /dev/null
> +++ b/package/libnss/0006-Bug-1606689-Fix-ppc-32-bit-build-failure.patch
> @@ -0,0 +1,31 @@
> +From fcac43d6a0af59926da7ad4a15a37255887cdfa2 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 2 Jan 2020 18:55:50 +0100
> +Subject: [PATCH] Bug 1606689 - Fix ppc 32-bit build failure
> +
> +NSS assumes that only 64-bit powerpc support Altivec instructions to be
> +used in gcm-ppc.c, so align Makefile condition to build gcm-ppc.c only
> +if USE_64 is defined.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index 00518d7f8..0e230d8c5 100644
> +--- a/nss/lib/freebl/Makefile
> ++++ b/nss/lib/freebl/Makefile
> +@@ -264,8 +264,8 @@ ifeq ($(CPU_ARCH),arm)
> +     MPI_SRCS += mpi_arm.c
> + endif
> + ifeq ($(CPU_ARCH),ppc)
> +-    EXTRA_SRCS += gcm-ppc.c
> + ifdef USE_64
> ++    EXTRA_SRCS += gcm-ppc.c

Are you dropping this file for 32bit builds due to the Altivec 
requirements? General Altivec instructions are available on 32bit chips, 
such as those from Freescale/NXP. The e600 is a product that comes to 
mind. IMO, the Makefile should include the file if the architecture is 
'ppc'. I think it makes sense that the source file should determine what 
it compiles down to. It's possible the hw acceleration logic for PPC 
changes later and this is one more file that would need to be touched.

Unfortunately, this is where it gets a bit more complicated...

The backing instruction for the vec_xl_be compiler intrinsic is lxvd2x 
(a VSX instruction). Technically I think this instruction was available 
in the Power ISA as early as 2.06, but GCC is only advertising the 
intrinsic as of ISA 3.0 (Power 9+).
https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-Built-in-Functions.html#PowerPC-Built-in-Functions

I've always had issues reading the logic behind GCC's instruction 
generation and I don't have 8+ handy... I'm not sure if there's a guard 
to prevent the lxvd2x instruction from being emitted or not when 
resolving vec_xl_be and, say, '-maltivec -mpcu=7450' is specified. If 
there isn't, I'd expect either an illegal instruction exception or for 
the kernel to emulate it magically. If there is, I'd expect GCC to 
either compile a compatible instruction shim or to simply error out.

Regardless, given the way the hardware acceleration is written currently 
to require that compiler intrinsic, USE_PPC_CRYPTO may need to be 
guarded by __builtin_cpu_supports("arch_3_00")

> +     DEFINES += -DNSS_NO_INIT_SUPPORT
> + endif # USE_64
> + endif # ppc
> +--
> +2.20.1
> +

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
