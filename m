From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jan 2019 17:14:04 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add options to install
 more Mediatek firmwares.
In-Reply-To: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
References: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20190104161404.GC19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2019-01-04 16:49 +0100, Nicolas Cavallari spake thusly:
> Add option to install the MT7650 bluetooth firmware and the
> MT76x2e wifi firmware.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/linux-firmware/Config.in         | 10 ++++++++++
>  package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index dcc8d4bade..3efb3d9050 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -59,6 +59,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
>  	help
>  	  Firmware files for QCA Rome 6174A bluetooth support.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
> +	bool "MediaTek MT7650"
> +	help
> +	  Firmware files for MediaTek MT7650 bluetooth support
> +
>  endmenu # Bluetooth
>  
>  menu "WiFi firmware"
> @@ -242,6 +247,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
>  	help
>  	  MediaTek MT7601U
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E
> +	bool "MediaTek MT76x2e"
> +	help
> +	  MediaTek MT76x2e

We're trying to limit the number of options in each category, and given
there already is a wifi mediatek entry above, can we just make it install
all the mediatek wifi firmwares?

You'll need to:

  - rename the option to BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_WIFI_MT7xxx;
    note that I added 'WIfI' in the option name, because we can forsee
    we'll have the same issue with BT firmwares, as they too are named
    mt7*;

  - add the old BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U option to
    Config.in.legacy, and select the new one;

  - use the new option in linux-firmware.mk to install all the WiFi
    firmware blobs.

Thanks! :-)

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
>  	bool "Qualcomm Atheros 6174"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index ee02c7a030..c238d9f01b 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -243,6 +243,18 @@ LINUX_FIRMWARE_FILES += mt7601u.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
>  endif
>  
> +# MT7650
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
> +LINUX_FIRMWARE_FILES += mt7650.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
> +endif
> +
> +# MT76x2e
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E),y)
> +LINUX_FIRMWARE_FILES += mt7662.bin mt7662_rom_patch.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
> +endif
> +
>  # qca6174
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
>  LINUX_FIRMWARE_FILES += ath10k/QCA6174
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
