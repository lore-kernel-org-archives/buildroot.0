From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 May 2021 00:08:52 +0200
Subject: [Buildroot] [PATCH v3 7/7] configs/beaglev: enable building of
 low-level firmware
In-Reply-To: <20210504205139.1055360-8-thomas.petazzoni@bootlin.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-8-thomas.petazzoni@bootlin.com>
Message-ID: <20210507220852.GH2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> This commit extends the beaglev_defconfig and its documentation to
> build the low-level firmware, and explain how to reflash it.

I just had to adapt thedefconfig to use the real beagle_ddrlnit package
name, since I renamed it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  board/beaglev/readme.txt  | 38 ++++++++++++++++++++++++++++++++++++--
>  configs/beaglev_defconfig |  2 ++
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
> index d8511d3fd1..a3adaba3ae 100644
> --- a/board/beaglev/readme.txt
> +++ b/board/beaglev/readme.txt
> @@ -17,6 +17,8 @@ Build results
>  
>  After building, output/images contains:
>  
> ++ bootloader-BEAGLEV-buildroot.bin.out
> ++ ddrinit-2133-buildroot.bin.out
>  + Image
>  + fw_payload.bin
>  + fw_payload.bin.out
> @@ -26,7 +28,11 @@ After building, output/images contains:
>  + sdcard.img
>  + u-boot.bin
>  
> -The two important files are:
> +The four important files are:
> +
> + - bootloader-BEAGLEV-buildroot.bin.out, the first stage bootloader
> +
> + - ddrinit-2133-buildroot.bin.out, the DDR initialization firmware
>  
>   - fw_payload.bin.out, which is the bootloader image, containing
>     both OpenSBI and U-Boot.
> @@ -51,7 +57,7 @@ Insert your SD card.
>  
>  Power-up the board using an USB-C cable.
>  
> -Flashing the bootloader
> +Flashing OpenSBI/U-Boot
>  =======================
>  
>  The bootloader pre-flashed on the Beagle-V has a non-working
> @@ -86,3 +92,31 @@ fw_payload.bin.out using the Xmodem protocol.
>  
>  After reflashing is complete, restart the board, it will automatically
>  start the system from the SD card, and reach the login prompt.
> +
> +Flashing low-level bootloaders
> +==============================
> +
> +The BeagleV comes pre-flashed with functional low-level bootloaders
> +(called "secondboot" and "ddrinit"). Re-flashing them is not necessary
> +to use this Buildroot defconfig. However, for the sake of
> +completeness, Buildroot builds and provides those low-level bootloader
> +images.
> +
> +You can flash them as follows:
> +
> + - In the same "pre-loader" menu as the one used above, instead of
> +   entering 0 or 1, enter the magic "root at s5t" string. This enters the
> +   "expert" features.
> +
> + - Then, press 0 and send over X-modem the
> +   bootloader-BEAGLEV-buildroot.bin.out file.
> +
> + - Then, press 1 and send over X-modem the
> +   ddrinit-2133-buildroot.bin.out.
> +
> +Note that the reflashing mechanism itself relies on those low-level
> +bootloaders, so if you flash non-working versions, you'll have to go
> +through a recovery process. This requires wiring up to a separate
> +debug UART, whose pins are located near the HDMI connector. See
> +https://wiki.seeedstudio.com/BeagleV-Update-bootloader-ddr-init-boot-uboot-Recover-bootloader/
> +section "Recover the bootloader" for more details.
> diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
> index e94c4ab639..8943ce9c34 100644
> --- a/configs/beaglev_defconfig
> +++ b/configs/beaglev_defconfig
> @@ -18,6 +18,8 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_BEAGLEV_DDRINIT=y
> +BR2_TARGET_BEAGLEV_SECONDBOOT=y
>  BR2_TARGET_OPENSBI=y
>  BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
>  # HEAD of the Fedora branch
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
