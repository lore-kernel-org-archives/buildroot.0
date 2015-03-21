From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 16:24:49 +0100
Subject: [Buildroot] [PATCH 1/2] imx6sabresd: rename to imx6sabre
In-Reply-To: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
References: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550D8D41.3080504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/15 18:41, Vincent Stehl? wrote:
> Rename imx6sabresd board folder to imx6sabre, to prepare for Sabre Auto
> addition. Update doc, link and defconfigs accordingly.

 One annoying thing: the SABRELite is quite different from the AI and SD, so the
readme wouldn't be such a good fit for it. But that's a problem for whoever adds
SABRELite :-)


> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>

 I have a few comments but nothing major, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> Cc: Eric B?nard <eric@eukrea.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Gilles Talis <gilles.talis@gmail.com>
> Cc: Gary Bisson <bisson.gary@gmail.com>
> ---
>  board/freescale/imx53loco/create-boot-sd.sh        |  2 +-
>  board/freescale/imx6sabre/create-boot-sd.sh        | 93 ++++++++++++++++++++++
>  ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 +++++++++
>  board/freescale/imx6sabre/readme.txt               | 68 ++++++++++++++++
>  board/freescale/imx6sabresd/create-boot-sd.sh      | 93 ----------------------
>  ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ---------
>  board/freescale/imx6sabresd/readme.txt             | 67 ----------------

 That's a big diffstat for just moving some files around, and it hides the fact
that you actually did change something in the readme. In the future, please use
the -M option to git format-patch (and even -C for the second patch to make the
similarity between the boards more explicit). In fact, there's no reason why -M
and -C shouldn't be the default in git, so please add them to your git config:

git config --global --bool format.find-renames true
git config --global --bool format.find-copies true

And you probably also want that for diffs, so:

git config --global diff.renames copies


 So to simplify the review, I've replaced your mail below with the result of git
format-patch -M

> ---
>  board/freescale/imx53loco/create-boot-sd.sh           |  2 +-
>  .../{imx6sabresd => imx6sabre}/create-boot-sd.sh      |  0
>  ...e_common-boot-Linux-to-init-in-mfgtools-mode.patch |  0
>  board/freescale/{imx6sabresd => imx6sabre}/readme.txt | 19 ++++++++++---------
>  configs/freescale_imx6dlsabresd_defconfig             |  2 +-
>  configs/freescale_imx6qsabresd_defconfig              |  2 +-
>  6 files changed, 13 insertions(+), 12 deletions(-)
>  rename board/freescale/{imx6sabresd => imx6sabre}/create-boot-sd.sh (100%)
>  rename board/freescale/{imx6sabresd => imx6sabre}/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch (100%)
>  rename board/freescale/{imx6sabresd => imx6sabre}/readme.txt (78%)
> 
> diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
> index 3083fd2..b1ce208 120000
> --- a/board/freescale/imx53loco/create-boot-sd.sh
> +++ b/board/freescale/imx53loco/create-boot-sd.sh
> @@ -1 +1 @@
> -../imx6sabresd/create-boot-sd.sh
> \ No newline at end of file
> +../imx6sabre/create-boot-sd.sh

 Since it is also used by imx53loco, perhaps it's better to put this script in
the freescale directory instead?

> \ No newline at end of file
> diff --git a/board/freescale/imx6sabresd/create-boot-sd.sh b/board/freescale/imx6sabre/create-boot-sd.sh
> similarity index 100%
> rename from board/freescale/imx6sabresd/create-boot-sd.sh
> rename to board/freescale/imx6sabre/create-boot-sd.sh
> diff --git a/board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
> similarity index 100%
> rename from board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
> rename to board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
> diff --git a/board/freescale/imx6sabresd/readme.txt b/board/freescale/imx6sabre/readme.txt
> similarity index 78%
> rename from board/freescale/imx6sabresd/readme.txt
> rename to board/freescale/imx6sabre/readme.txt
> index 583ef40..4287a4a 100644
> --- a/board/freescale/imx6sabresd/readme.txt
> +++ b/board/freescale/imx6sabre/readme.txt
> @@ -11,12 +11,12 @@ http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.p
>  Build
>  =====
>  
> -First, configure Buildroot for your SABRESD board.
> -For i.MX6Q:
> +First, configure Buildroot for your SABRE board.
> +For i.MX6Q SABRE SD board:
>  
>    make freescale_imx6qsabresd_defconfig
>  
> -For i.MX6DL:
> +For i.MX6DL SABRE SD board:
>  
>    make freescale_imx6dlsabresd_defconfig
>  
> @@ -25,7 +25,8 @@ Build all components:
>    make
>  
>  You will find in ./output/images/ the following files:
> -  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb
> +  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb or imx6q-sabreauto.dtb or
> +    imx6dl-sabreauto.dtb

 The auto things are only added by the second patch...

>    - rootfs.ext2
>    - rootfs.tar
>    - u-boot.imx
> @@ -44,13 +45,13 @@ and copy the bootloader, kernel, DTBs and root filesystem as needed.
>  
>  *** WARNING! The script will destroy all the card content. Use with care! ***
>  
> -  ./board/freescale/imx6sabresd/create-boot-sd.sh <your-sd-device>
> +  ./board/freescale/imx6sabre/create-boot-sd.sh <your-sd-device>
>  
> -Boot the SABRESD board
> -======================
> +Boot the SABRE board
> +====================
>  
> -To boot your newly created system (refer to the SABRESD Quick Start Guide for
> -guidance):
> +To boot your newly created system on a SABRE SD Board (refer to the SABRE SD
> +Quick Start Guide for guidance):
>  - insert the SD card in the SD3 slot of the board;
>  - locate the BOOT dip switches (SW6), set dips 2 and 7 to ON, all others to OFF;
>  - connect a Micro USB cable to Debug Port and connect using a terminal emulator
> diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
> index 680031d..a13d2b9 100644
> --- a/configs/freescale_imx6dlsabresd_defconfig
> +++ b/configs/freescale_imx6dlsabresd_defconfig
> @@ -3,7 +3,7 @@ BR2_arm=y
>  BR2_cortex_a9=y
>  
>  # patches
> -BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
> +BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
>  
>  # toolchain
>  BR2_KERNEL_HEADERS_VERSION=y
> diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
> index f2f702e..95f29d7 100644
> --- a/configs/freescale_imx6qsabresd_defconfig
> +++ b/configs/freescale_imx6qsabresd_defconfig
> @@ -3,7 +3,7 @@ BR2_arm=y
>  BR2_cortex_a9=y
>  
>  # patches
> -BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
> +BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
>  
>  # toolchain
>  BR2_KERNEL_HEADERS_VERSION=y




-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
