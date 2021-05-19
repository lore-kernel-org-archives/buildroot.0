From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 13:38:11 +0200
Subject: [Buildroot] [PATCH] configs/bananapi_m2_zero: bump versions and
 add WiFi support
In-Reply-To: <20210508201614.16041-1-vincent.stehle@laposte.net>
References: <20210508201614.16041-1-vincent.stehle@laposte.net>
Message-ID: <20210519113811.GT2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2021-05-08 22:16 +0200, Vincent Stehl? via buildroot spake thusly:
> - Bump kernel to version 5.12.2.
> - Bump U-Boot to version 2021.04.
> 
> Also, adapt the SD card name in the boot script to follow Linux naming.
> While at it, add comments to make the defconfig more readable.
> 
> The Banana Pi M2 Zero comprises an AMPAK AP6212 module with a Broadcom
> bcm43438/a1 WiFi chip. Add the necessary firmware and tools to support it
> and update documentation. We switch to mdev for /dev management, so that
> the WiFi driver get auto-loaded.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> ---
[--SNIP--]
> diff --git a/board/bananapi/bananapi-m2-zero/firmware-links.sh b/board/bananapi/bananapi-m2-zero/firmware-links.sh
> new file mode 100755
> index 0000000000..7f320fb1a5
> --- /dev/null
> +++ b/board/bananapi/bananapi-m2-zero/firmware-links.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +# Create the necessary WiFi firmware symbolic links for the brcmfmac driver
> +set -eu
> +
> +cd "$1/lib/firmware"
> +[ -d brcm ] || mkdir -v brcm
> +cd brcm
> +ln -svf ../ap6212/nvram.txt brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt
> +ln -svf ../ap6212/fw_bcm43438a1_apsta.bin brcmfmac43430-sdio.bin

In linux-firmware, there is the WHENCE file which describes the links to
install, and we parse that in linux-firmware.mk.

Why can't we do similarly with armbian-firmware.mk?

Yeah, it misses WHENCE or something similar, but we should do it
nonethelessC, like so:

    diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
    index 0ed069025d..51bc5b903d 100644
    --- a/package/armbian-firmware/armbian-firmware.mk
    +++ b/package/armbian-firmware/armbian-firmware.mk
    @@ -11,6 +11,13 @@ ARMBIAN_FIRMWARE_SITE_METHOD = git
     # AP6212 WiFi/BT combo firmware
     ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212),y)
     ARMBIAN_FIRMWARE_DIRS += ap6212
    +define ARMBIAN_FIRMWARE_AP6212_LINKS
    +	ln -svf ../ap6212/nvram.txt \
    +		$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt
    +	ln -svf ../ap6212/fw_bcm43438a1_apsta.bin \
    +		$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
    +endef
    +ARMBIAN_FIRMWARE_POST_INSTALL_TARGET_HOOKS += ARMBIAN_FIRMWARE_AP6212_LINKS
     endif
     
     # AP6256 WiFi/BT combo firmware

Also, if one look at armbian-firmware, there is already a brcm/
sub-directory, and that already has brcm/brcmfmac43430-sdio.bin. Of
course, the two are different...

Additionally, linux-firmware has brcm/brcmfmac43430a0-sdio.bin and
brcm/brcmfmac43430-sdio.AP6212.txt, again with different content. The
latter states "NVRAM config file for the Ampak AP6212 43430 WiFi/BT
module".

So, this is quite a mess. Why do we have to use the armbian-fw ones,
instead of those from linux-firmware? We are using an upstream kernel,
and supposedly, drivers in there are supposed (as I understand it) to
only require blobs from linux-firmware...

By the way, where does the weird 'brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt'
name comes from? Is that a 'compatible' string from the DT?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
