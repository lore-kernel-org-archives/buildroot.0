From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Nov 2017 12:37:05 +0530
Subject: [Buildroot] [PATCH v4 2/3] board: Add Vyasa RK388 board support
In-Reply-To: <20171123224321.447ed853@windsurf.lan>
References: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
 <1510997329-4111-2-git-send-email-jagan@amarulasolutions.com>
 <20171123224321.447ed853@windsurf.lan>
Message-ID: <CAMty3ZBNPnaDxCN+0fmB_VLbNXxovXSyE618LB_5KA7kXt74Lw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Nov 24, 2017 at 3:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Title is wrong I believe, it shoul dbe RK3288 I guess.
>
> On Sat, 18 Nov 2017 10:28:48 +0100, Jagan Teki wrote:
>
>> diff --git a/board/amarula/vyasa/linux_gmac.fragment b/board/amarula/vyasa/linux_gmac.fragment
>> new file mode 100644
>> index 0000000..dd458c7
>> --- /dev/null
>> +++ b/board/amarula/vyasa/linux_gmac.fragment
>> @@ -0,0 +1,3 @@
>> +# Currently kernel mainline exhibits issues when running rockchip gmac
>> +# on the board, so enable it as loadable module and insert it later
>> +CONFIG_DWMAC_ROCKCHIP=m
>> diff --git a/board/amarula/vyasa/post-build.sh b/board/amarula/vyasa/post-build.sh
>> new file mode 100755
>> index 0000000..ffbbcde
>> --- /dev/null
>> +++ b/board/amarula/vyasa/post-build.sh
>> @@ -0,0 +1,9 @@
>> +#!/bin/sh
>> +
>> +MKIMAGE=$HOST_DIR/bin/mkimage
>
> So you need host-uboot-tools, but it is not enabled in your defconfig.
>
>
>> diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
>> new file mode 100644
>> index 0000000..5e62ac0
>> --- /dev/null
>> +++ b/configs/amarula_vyasa_rk3288_defconfig
>> @@ -0,0 +1,59 @@
>> +# Architecture
>> +BR2_arm=y
>> +BR2_cortex_a17=y
>> +BR2_ARM_FPU_NEON_VFPV4=y
>> +
>> +# Linux headers same as kernel, a 4.13 series
>> +BR2_KERNEL_HEADERS_4_13=y
>> +
>> +# Toolchain
>> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>
> Please keep the default toolchain configuration.
>
>> +
>> +# Bootloader
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>> +BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
>> +
>> +# Kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7e8a1fd62911a59f1f95d4620e89603230fdd6f9"
>
> Using linux-next doesn't work, as it gets rebased constantly. The
> commit 7e8a1fd62911a59f1f95d4620e89603230fdd6f9 no longer exists. You
> have to wait for the support for this board to land into the mainline
> kernel, or point to a vendor-specific Git tree.

Can't we use linux-next at all? you are with head commits which were
always changes during rebase, but I've used the board specific commit
in v5 and that will always unchanged.

If you remember I've asked during ELCE, Prague about using linux-next
on BR and we discussed the same scenario.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
