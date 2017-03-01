From: ren_guo <ren_guo@c-sky.com>
Date: Wed, 1 Mar 2017 20:37:45 +0800
Subject: [Buildroot] [PATCH 1/1] csky: Add new architecture
In-Reply-To: <20170301102208.79668e6f@free-electrons.com>
References: <1488357224-5141-1-git-send-email-ren_guo@c-sky.com>
 <20170301102208.79668e6f@free-electrons.com>
Message-ID: <1174d987-9327-9109-8fd5-f369977cb437@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx, Thomas

> Thanks for submitting the support for this new architecture. I'll
> review your patch below. However, I have one question: if you add a new
> architecture like this in Buildroot, then we will need your help to fix
> the build issues that will arise on this architecture. Indeed, the
> Buildroot community does a significant build testing effort (see
> http://autobuild.buildroot.org). Can you comment on whether you will
> have some time to investigate and fix the build issues that will occur
> on this CPU architecture ?

Yes, I will help to fix the build issues in autobuild as soon as possible.
I'm preparing my next patch-mail under your guidance and try my best to
test it.

> Could you summarize the upstreaming status of the binutils, gcc, glibc
> and Linux kernel support for csky ?

I just put a prebuild toolchain on the https://github.com/c-sky/tools, this has
been tested by ourserlf.

binutils: current is 2.20 and we are preparing 2.27
gcc: current is 4.5.1 and we are preparing 6.3
glibc: current is 2.17 and we also plan to update it
kernel: current is 4.9.13 and it can be built with the last stable version,
I will update it as soon as possible.

All of above source code will be put on the https://github.com/c-sky first, and next
we will merge them into their own organizations' repo.

>> diff --git a/arch/Config.in b/arch/Config.in
>> index 7149b2c..ea81c4c 100644
>> --- a/arch/Config.in
>> +++ b/arch/Config.in
>> @@ -240,6 +240,14 @@ config BR2_xtensa
>>   	  http://en.wikipedia.org/wiki/Xtensa
>>   	  http://www.tensilica.com/
>>   
>> +config BR2_csky
>> +	bool "csky"
>> +	select BR2_ARCH_HAS_MMU_MANDATORY
>> +	help
>> +	  csky is processor IP from china.
>> +	  http://www.c-sky.com/
>> +	  http://www.github.com/c-sky
> Please keep this file sorted alphabetically.

OK, I will fix it

>>   # The following string values are defined by the individual
>> @@ -409,4 +417,8 @@ if BR2_xtensa
>>   source "arch/Config.in.xtensa"
>>   endif
>>   
>> +if BR2_csky
>> +source "arch/Config.in.csky"
>> +endif
> Same, please keep the includes alphabetically sorted.

ok

>> diff --git a/arch/Config.in.csky b/arch/Config.in.csky
>> new file mode 100644
>> index 0000000..f400388
>> --- /dev/null
>> +++ b/arch/Config.in.csky
>> @@ -0,0 +1,57 @@
>> +choice
>> +	prompt "Target Architecture Variant"
>> +	depends on BR2_csky
> This "depends on" is not needed, as the file is anyway only included
> when BR2_csky=y.

ok

>> +	default BR2_ck810
>> +	help
>> +	  Specific CPU variant to use
>> +
>> +config BR2_ck810
>> +	bool "ck810"
>> +config BR2_ck807
>> +	bool "ck807"
>> +config BR2_ck610
>> +	bool "ck610"
> Any reason to not sort them by order of increasing numbers? 610, then
> 807, then 810 ?

ok, Very strict

>> +config BR2_CSKY_FPU
>> +	bool "Enable FPU coprocessor"
>> +	depends on BR2_ck810 || BR2_ck807
>> +	default n
> "default n" not needed: being not selected is the default for an option.

ok

>> +	help
>> +	  You can say N here if you C-SKY CPU don't have Floating-Point Coprocessor
>> +	  or the user program need not to support FPU.
>> +
>> +	  You'll have say N here if you C-SKY CPU have Floating-Point Coprocessor
>> +	  and the user program need to support FPU. Floating-Point Coprocessor (FPC)
>> +	  is a coprocessor of CK serial processor. The function of FPC is to provide
>> +	  low-cost high-speed float point computation, which is full compliance with
>> +	  ANSI/IEEE Std 754, IEEE Standard for Binary Floating-Point Arithmetic.
> Lines are too long, please wrap at 72 characters.

ok

>> +config BR2_CSKY_DSP
>> +	bool "CPU support DSP enhanced instruction"
>> +	depends on BR2_ck810 || BR2_ck807
>> +	default n
> "default n" not needed. To be more consistent with the FPU option,
> please use something like:
>
> 	"Enable DSP enhance instructions"
>
> as the option prompt.

ok, good option prompt.

>> +# From Config.in requirement
> Comment not really useful.

ok

>> +config BR2_ARCH
>> +	default "csky"
>> +
>> +config BR2_ENDIAN
>> +	default "LITTLE"
>> +
>> +config BR2_GCC_TARGET_ARCH
>> +	default "ck610"	if BR2_ck610
>> +	default "ck807"	if BR2_ck807
>> +	default "ck810"	if BR2_ck810
> Since you're setting BR2_GCC_TARGET_CPU below, I believe this
> BR2_GCC_TARGET_ARCH is useless. Indeed, when you pass -mcpu to gcc, gcc
> can automatically derive the corresponding -march.

ok, and I've confirmed with our toolchain team that you are right.

>> +config BR2_GCC_TARGET_CPU
>> +	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
>> +	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
>> +	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
>> +	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
>> +	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
>> +	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
>> +	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
>> +	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
>> +	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
>> +
>> diff --git a/board/csky/gx6605s/gdbinit b/board/csky/gx6605s/gdbinit
>> new file mode 100644
>> index 0000000..0a6d8ab
>> --- /dev/null
>> +++ b/board/csky/gx6605s/gdbinit
> This file should be part of a separate patch, adding support for c-sky
> boards. Indeed, we want one patch adding the architecture support
> itself, and then other patches for the boards.

ok, I will separate it into arch-patch and board-patch.

>> diff --git a/board/csky/gx6605s/gx6605s.dts b/board/csky/gx6605s/gx6605s.dts
>> new file mode 100644
>> index 0000000..195b0df
>> --- /dev/null
>> +++ b/board/csky/gx6605s/gx6605s.dts
> Could you please put this in your Linux kernel repository instead? We
> really don't want to keep complete Device Tree files in Buildroot.

ok, no problem.

>> diff --git a/board/csky/gx6605s/gx66xx_defconfig b/board/csky/gx6605s/gx66xx_defconfig
>> new file mode 100644
>> index 0000000..94eac2c
>> --- /dev/null
>> +++ b/board/csky/gx6605s/gx66xx_defconfig
> Could you instead add a defconfig in your Linux kernel repository, so
> that we don't have to keep this one in Buildroot? Especially one per
> board seems very excessive.

ok.

>> diff --git a/board/csky/post-image.sh b/board/csky/post-image.sh
>> new file mode 100755
>> index 0000000..7bead4f
>> --- /dev/null
>> +++ b/board/csky/post-image.sh
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +# copy board/csky/xxx/gdbinit to images/.gdbinit for
>> +BOARD_DIR="$(dirname $0)"
>> +cp -af $BOARD_DIR/${2}/gdbinit $BINARIES_DIR/.gdbinit
> Please move this to the patch adding support for the board.
>
ok

>> diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
>> new file mode 100644
>> index 0000000..75226a5
>> --- /dev/null
>> +++ b/configs/csky_gx6605s_defconfig
>> @@ -0,0 +1,26 @@
>> +BR2_csky=y
>> +BR2_ck610=y
>> +BR2_OPTIMIZE_2=y
> Please leave the default optimization level.

ok, thx

>> +BR2_SHARED_STATIC_LIBS=y
> Please keep the default option here as well.

ok, use default.

>> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
> And here as well.

ok as well.

>> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
>> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
>> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>> +BR2_SYSTEM_DHCP="eth0"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/csky/post-image.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="gx6605s"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/csky/gx6605s/gx66xx_defconfig"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
>> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/csky/gx6605s/gx6605s.dts"
>> +BR2_LINUX_KERNEL_EXT_CSKY_ARCH=y
>> +BR2_LINUX_KERNEL_EXT_CSKY_ADDONS=y
>> +BR2_PACKAGE_HOST_MKE2IMG=y
> Why do you need mke2img ?

I don't need it, my bug.

>
>> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
>> index 011dffb..3729849 100644
>> --- a/linux/Config.ext.in
>> +++ b/linux/Config.ext.in
> Your whole kernel handling is way too complicated ad completely not
> standard. So instead of having your csky-linux repository with just
> arch/csky, and your csky-addons repository with the SoC drivers, please
> put on Github a regular Linux kernel repository with the csky
> architecture support.
>
> This will be beneficial for multiple reasons:
>
>   1. That is how everybody expects the kernel source tree to be
>      versioned control, so it will help new developers arriving on your
>      new architecture.
>
>   2. This is how all build systems expect the kernel source code to be
>      organized.
>
> So please remove package/csky-addons, package/csky-arch and your
> changes to the linux/ package, and use a regular Linux kernel tree.

ok, remove them.

>> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
>> index 91cddc2..db073a6 100644
>> --- a/toolchain/toolchain-buildroot/Config.in
>> +++ b/toolchain/toolchain-buildroot/Config.in
>> @@ -47,7 +47,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>>   		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
>>   		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>>   		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
>> -		   BR2_microblaze || BR2_nios2
>> +		   BR2_microblaze || BR2_nios2 || BR2_csky
> If you do this, then you allow people to build a toolchain for csky
> using Buildroot. Do you really have upstream support in binutils, gcc
> and glibc ?
>
> If not, then this chunk shouldn't be here.

ok, it's unnecessary and ? finished the build without this.

> Best regards,
>
> Thomas
