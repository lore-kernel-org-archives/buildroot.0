From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2016 01:13:40 -0700
Subject: [Buildroot] [PATCH] openblas: fix build issues on ARM
In-Reply-To: <1470520434-15516-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470520434-15516-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <9111A0DF-B21B-4A2E-9CA7-FEAE55D1E91A@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 6, 2016, at 2:53 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> This commit fixes two build issues of OpenBLAS on ARM:
> 
> - The first one occured on ARMv5 platforms, when the ARMV5 OpenBLAS
>   architecture is used. In this case, OpenBLAS build system forces
>   -march=armv5, which may not be correct for certain toolchains. As an
>   example, the Sourcery CodeBench toolchain has an ARMv4 and an ARMv5
>   sysroot. The ARMv5 sysroot is actually an armv5te sysroot, so when
>   OpenBLAS forces -march=armv5, gcc thinks it should use the ARMv4
>   sysroot, causing build failures.
> 
>   To address this, a patch to completely remove the
>   architecture-specific CFLAGS is added to OpenBLAS.
> 
>   Fixes:
> 
>     http://autobuild.buildroot.net/results/991497b12b70f948169e5ad99eebd0fe7f6209a2/
> 
> - The second one occured on ARMv7 platforms, when the ARMV7 OPenBLAS
>   architecture is used. In this case, the OpenBLAS build system forces
>   -mfloat-abi=hard, which is completely wrong, as using other floating
>   point ABIs is perfectly fine.
> 
>   To address this, the same patch removing the architecture-specific
>   CFLAGS does the job.
> 
>   Fixes:
> 
>     http://autobuild.buildroot.net/results/0ba0bee48a83367fcefab827e8eaa72f0c8fe90b/
> 
> - Once the previous ARMv7 problem has been fixed, it turns out that the
>   ARMv7 specific code in OpenBLAS contains VFPv3 specific
>   code. Therefore, the user *must* have choosen either VFPv3 or VFPv4,
>   or the code will not build. VFPv3-D16/VFPv4-D16 are not sufficient,
>   as more than 16 registers are used by the OpenBLAS code.
> 
>   To address this, the ARMV7 platform of OpenBLAS is restricted to the
>   proper VFPv3/VFPv4 selection.
> 
>   This problem was not visible in the autobuilders, as it was hidden by
>   the previous one.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> .../0002-Makefile.arm-remove-contents.patch        | 66 ++++++++++++++++++++++
> package/openblas/Config.in                         |  5 +-
> 2 files changed, 70 insertions(+), 1 deletion(-)
> create mode 100644 package/openblas/0002-Makefile.arm-remove-contents.patch
> 
> diff --git a/package/openblas/0002-Makefile.arm-remove-contents.patch b/package/openblas/0002-Makefile.arm-remove-contents.patch
> new file mode 100644
> index 0000000..06d8e4a
> --- /dev/null
> +++ b/package/openblas/0002-Makefile.arm-remove-contents.patch
> @@ -0,0 +1,66 @@
> +From 883e98a1d40d7bb5fd55b80eeddd7dbb79c17835 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sat, 6 Aug 2016 22:14:22 +0200
> +Subject: [PATCH] Makefile.arm: remove contents
> +
> +The compiler flags being set in Makefile.arm are potentially incorrect
> +and harmful:
> +
> + - Assuming that one uses -mfloat-abi=hard on ARMv7 is completely
> +   wrong. -mfloat-abi=softfp is a perfectly valid choice on ARMv7, and
> +   OpenBLAS should not make such assumptions.

perhaps they do not support softfp, this should be confirmed.

> +
> + - Assuming that -march=armv5 is correct for ARMv5 is wrong. There are
> +   multiple variants: armv5t, armv5te, and using -march=armv5 instead
> +   of the proper variant can cause the wrong sysroot to be used in
> +   multilib toolchains.
> +
> +Therefore, the user should simply make sure to provide the relevant
> +CFLAGS for his platform, and OpenBLAS should not force them.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Makefile.arm | 32 +-------------------------------
> + 1 file changed, 1 insertion(+), 31 deletions(-)
> +
> +diff --git a/Makefile.arm b/Makefile.arm
> +index 62bf275..bc63beb 100644
> +--- a/Makefile.arm
> ++++ b/Makefile.arm
> +@@ -1,31 +1 @@
> +-# ifeq logical or
> +-ifeq ($(CORE), $(filter $(CORE),CORTEXA9 CORTEXA15))
> +-ifeq ($(OSNAME), Android)
> +-CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a
> +-FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a
> +-else
> +-CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
> +-FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
> +-endif
> +-endif
> +-
> +-ifeq ($(CORE), ARMV7)
> +-ifeq ($(OSNAME), Android)
> +-CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a -Wl,--no-warn-mismatch
> +-FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a -Wl,--no-warn-mismatch
> +-else
> +-CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
> +-FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
> +-endif
> +-endif
> +-
> +-ifeq ($(CORE), ARMV6)
> +-CCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard  -march=armv6
> +-FCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard  -march=armv6
> +-endif
> +-
> +-
> +-ifeq ($(CORE), ARMV5)
> +-CCOMMON_OPT += -marm -march=armv5
> +-FCOMMON_OPT += -marm -march=armv5

-marm option is also removed. I wonder if this code will now build when we have thumb/thumb2 ISA
selected as default for an arm machine.

> +-endif
> ++# empty
> +\ No newline at end of file
> +--
> +2.7.4
> +
> diff --git a/package/openblas/Config.in b/package/openblas/Config.in
> index 51afaec..a97e935 100644
> --- a/package/openblas/Config.in
> +++ b/package/openblas/Config.in
> @@ -34,7 +34,10 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
> 	default "CORTEXA9"     if BR2_cortex_a9
> 	default "ARMV5"        if BR2_ARM_CPU_ARMV5
> 	default "ARMV6"        if BR2_ARM_CPU_ARMV6
> -	default "ARMV7"        if BR2_ARM_CPU_ARMV7A
> +	# On ARMv7, OpenBLAS assumes that a full VFPv3 or VFPv4 is
> +	# available (and not the more limited D16 variant)
> +	default "ARMV7"        if (BR2_ARM_CPU_ARMV7A && \
> +				   (BR2_ARM_FPU_VFPV3 || BR2_ARM_FPU_VFPV4))
> 	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
> 	help
> 	  OpenBLAS target CPU. See TargetList.txt in the source tree for
> --
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160807/b482d2bb/attachment.asc>
