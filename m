From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:51:58 +0200
Subject: [Buildroot] [PATCH v2] openblas: fix build issues on ARM
In-Reply-To: <1470605554-30398-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470605554-30398-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809155158.12b66bad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 23:32:34 +0200, Thomas Petazzoni wrote:
> This commit fixes several build issues of OpenBLAS on ARM:
> 
>  - The first one occured on ARMv5 platforms, when the ARMV5 OpenBLAS
>    architecture is used. In this case, OpenBLAS build system forces
>    -march=armv5, which may not be correct for certain toolchains. As an
>    example, the Sourcery CodeBench toolchain has an ARMv4 and an ARMv5
>    sysroot. The ARMv5 sysroot is actually an armv5te sysroot, so when
>    OpenBLAS forces -march=armv5, gcc thinks it should use the ARMv4
>    sysroot, causing build failures.
> 
>    To address this, a patch to completely remove the -march ARM CFLAGS
>    is added to OpenBLAS.
> 
>    Fixes:
> 
>      http://autobuild.buildroot.net/results/991497b12b70f948169e5ad99eebd0fe7f6209a2/
> 
>  - The second one occured on ARMv7 platforms, when the ARMV7 OpenBLAS
>    architecture is used. The OpenBLAS code expects an EABIhf build, so a
>    dependency is added for EABIhf for both ARMv6 and ARMv7.
> 
>    Fixes:
> 
>      http://autobuild.buildroot.net/results/0ba0bee48a83367fcefab827e8eaa72f0c8fe90b/
> 
>  - Once the previous ARMv7 problem has been fixed, it turns out that the
>    ARMv7 specific code in OpenBLAS contains VFPv3 specific
>    code. Therefore, the user *must* have choosen either VFPv3 or VFPv4,
>    or the code will not build. VFPv3-D16/VFPv4-D16 are not sufficient,
>    as more than 16 registers are used by the OpenBLAS code.
> 
>    To address this, the ARMV7 platform of OpenBLAS is restricted to the
>    proper VFPv3/VFPv4 selection, and the ARMV6 platform is restricted to
>    the proper VFPv2 selection.
> 
>    This problem was not visible in the autobuilders, as it was hidden by
>    the previous one.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - Only remove -march flags, keep the -mfpu and -mfloat-abi flags.
>  - Make the ARMV6 and ARMV7 platform selection depend on BR2_ARM_EABIHF,
>    since EABIhf is required
>  - Make the ARMV6 platform selection depend on VFPv2 usage, since it is
>    needed.
>  - Also handle the Cortex-A9 and Cortex-A15 cases.
> ---
>  .../0002-Makefile.arm-remove-march-flags.patch     | 73 ++++++++++++++++++++++
>  package/openblas/Config.in                         | 19 ++++--
>  2 files changed, 88 insertions(+), 4 deletions(-)
>  create mode 100644 package/openblas/0002-Makefile.arm-remove-march-flags.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
