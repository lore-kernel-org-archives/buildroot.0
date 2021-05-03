From: Drew Fustini <drew@beagleboard.org>
Date: Mon, 3 May 2021 00:18:32 -0700
Subject: [Buildroot] [PATCH v2 6/6] configs/beaglev: enable building of
 low-level firmware
In-Reply-To: <20210502212141.934384-14-thomas.petazzoni@bootlin.com>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-14-thomas.petazzoni@bootlin.com>
Message-ID: <20210503071832.GA367228@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 02, 2021 at 11:21:41PM +0200, Thomas Petazzoni wrote:
> This commit extends the beaglev_defconfig and its documentation to
> build the low-level firmware, and explain how to reflash it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

This is not something that needs to be noted in the patch, but I wanted
to make people aware that the instructions currently recommed using
SecureCRT as the terminal emulator.  I know many including myself would
not want to use a trial version of commercial software.  

The author of the guide, Lakshantha, told me that he could not transfer
the vic_second_boot.boot.bin using xmodem in minicom when connected via
the debug header.  After he uploaded the file using minicom, he would
type "do 0x18000000", but there would be no response. It did however
work ok in SecureCRT.

Lakshantha will be back on May 6 but in the meantime I would welcome any
suggestions. I figure there must be some difference in the default
behavior of securecrt vs minicom.

thanks,
drew
