From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 18:04:44 +0100
Subject: [Buildroot] [PATCH v2] configs: beaglebone: bump kernel and
 uboot version
In-Reply-To: <20180208075122.13603-1-lothar.felten@gmail.com>
References: <20180208075122.13603-1-lothar.felten@gmail.com>
Message-ID: <f7a469db-18e2-862d-7307-9d5a582e08e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Lothar,

 Sorry to bother you with more questions :-)

On 08-02-18 08:51, Lothar Felten wrote:
> Switch to Linux kernel version 4.9.59 from the TI SDK 04.02.00.09
> (TI SDK release date: 23.12.2017)
> Updated uboot to version 2018.01
> 
> v2:
> - set uboot version to 2018.01 in defconfig
> - keep default rootfs size
> - keep Kconfig for uboot

 Side remark: we don't want to include the patch changelog in our git history,
so in the future put it below a --- line:

> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
Here.

> ---
>  board/beaglebone/uEnv.txt    | 8 ++++++--
>  configs/beaglebone_defconfig | 9 +++------
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
> index 70b3b721..8365c3af 100644
> --- a/board/beaglebone/uEnv.txt
> +++ b/board/beaglebone/uEnv.txt
> @@ -1,4 +1,8 @@
>  bootpart=0:1
> +devtype=mmc
>  bootdir=
> -bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
> -uenvcmd=run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr};
> +bootfile=zImage
> +bootpartition=mmcblk0p2
> +set_mmc1=if test $board_name = A33515BB; then setenv bootpartition mmcblk1p2; fi; 

 The ; at the end of the line here is a bit weird but OK.

 It would have been nice to mention in the commit message why this change is
made. I guess it is to support a new revision of the board. Which really should
have been done in a separate commit, unless this revision is only supported by
the newer U-Boot/kernel (though I don't really mind squashing the commits).


> +set_bootargs=setenv bootargs console=ttyO0,115200n8 root=/dev/${bootpartition} rw rootfstype=ext4 rootwait
> +uenvcmd=run set_mmc1; run set_bootargs;run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr};
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 611b6941..eea20436 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -1,13 +1,13 @@
[snip]
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
> -BR2_TARGET_UBOOT_NEEDS_DTC=y

 Are you sure U-Boot doesn't need dtc anymore? Did you test with a clean build?

 Regards,
 Arnout

>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="MLO"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
