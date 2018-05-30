From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 23:40:59 +0200
Subject: [Buildroot] [PATCH 2/2] board: amarula: a64-relic: Add WiFi
 support
In-Reply-To: <20180528171227.8352-2-jagan@amarulasolutions.com>
References: <20180528171227.8352-1-jagan@amarulasolutions.com>
 <20180528171227.8352-2-jagan@amarulasolutions.com>
Message-ID: <c7d8ca34-02ae-125e-1d2c-862ad221ccd9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-05-18 19:12, Jagan Teki wrote:
> Amarula A64-Relic board has AP6330 WiFi/BT combo, but does
> not have ethernet port. So it makes sense to enable wireless
> networking by default:
> - add broadcom wireless firmware package to image
> - add basic wireless tools to image
> - add rootfs overlay with proper NVRAM file for on-board AP6330 chip
> - add init script to load modules
> - update readme.txt to test wifi
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  board/amarula/a64-relic/readme.txt                 |  9 +++
>  .../rootfs_overlay/etc/init.d/S02-modload          | 12 ++++
>  .../rootfs_overlay/etc/modules-load.d/modules.conf |  1 +
>  .../lib/firmware/brcm/brcmfmac4330-sdio.txt        | 83 ++++++++++++++++++++++
>  configs/amarula_a64_relic_defconfig                | 12 ++++
>  5 files changed, 117 insertions(+)
>  create mode 100755 board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload
>  create mode 100644 board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf
>  create mode 100644 board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> 
> diff --git a/board/amarula/a64-relic/readme.txt b/board/amarula/a64-relic/readme.txt
> index 534ed32e7b..18824e1669 100644
> --- a/board/amarula/a64-relic/readme.txt
> +++ b/board/amarula/a64-relic/readme.txt
> @@ -57,4 +57,13 @@ GPT:
>    $ fastboot -i 0x1f3a flash esp boot.vfat
>    $ fastboot -i 0x1f3a flash system rootfs.ext2
>  
> +WiFi
> +====
> +

 Maybe add a little bit of text here. "To use the WiFi, you need to configure
your accesspoint first. Log in over the serial port, then type:"

> + # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
> +   (type password and enter)
> + # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
> + # udhcpc -i wlan0

 Could we add the latter two to an init script instead? Should be S40 so it
coincides with S40network from ifupdown-scripts.

 So in the readme, these two lines would then be replaced with

# /etc/init.d/S40wlan start

> + # ping google.com
> +
>  Enjoy!
> diff --git a/board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload b/board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload
> new file mode 100755
> index 0000000000..81d85ce01c
> --- /dev/null
> +++ b/board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +#
> +
> +load_modules()
> +{
> +	while IFS= read -r line; do
> +		modprobe -a $line
> +	done < "/etc/modules-load.d/modules.conf"
> +}
> +
> +load_modules
> +echo "Loading modules: OK"

 Init scripts should handle the start and stop arguments, otherwise the module
will be loaded again during shutdown.

 Also, I don't think it makes a lot of sense to introduce all this flexibility.
Just include 'modprobe -a brcmfmac' to S40wlan.

> diff --git a/board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf b/board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf
> new file mode 100644
> index 0000000000..a86ef4c668
> --- /dev/null
> +++ b/board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf
> @@ -0,0 +1 @@
> +brcmfmac
> diff --git a/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> new file mode 100644
> index 0000000000..d095f24c26
> --- /dev/null
> +++ b/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> @@ -0,0 +1,83 @@
> +#AP6330_NVRAM_V1.0_20121130
> +#Sample variables file for BCM94330 SD FC AGB board

 Arg, these horrible brcm config files...


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
