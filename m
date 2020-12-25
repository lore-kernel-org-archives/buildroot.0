From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 19:25:30 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: add new option for
 Samsung MFC firmware
In-Reply-To: <31eb4b6dd64977c2476a727128ed0a093634c831.1608718175.git.stefan@agner.ch>
References: <31eb4b6dd64977c2476a727128ed0a093634c831.1608718175.git.stefan@agner.ch>
Message-ID: <20201225182530.GC1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2020-12-23 11:11 +0100, Stefan Agner spake thusly:
> Multi format codec (MFC) is the IP present in Samsung Exynos
> series SoCs for video encoding/decoding operations.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied to master, with a little tweakm see below...

> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 105daf42b8..dbdfdb52b3 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -44,6 +44,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO
>  	help
>  	  Firmware files for Qualcomm Adreno GPU firmware
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8
> +	bool "Samsung MFC video encoder/decoder v8 firmware"
> +	help
> +	  Firmware files for Samsung MFC video encoder/decoder driver v8
> +
>  endmenu # Video
>  
>  menu "Bluetooth firmware"
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 8808b5284c..f1c84a134d 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -39,6 +39,12 @@ LINUX_FIRMWARE_FILES += qcom/a*
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8),y)
> +LINUX_FIRMWARE_FILES += s5p-mfc-v8.fw

There are various versions for differenct chips, so I listed all of
them: the driver will be able to load the one it needs. If a user only
really can't afford having all of them in the rootfs, they can remove
them with a post-biuld script.

Thanks!

Regards,
Yann E. MORIN.

> +# No license file; the license is in the file WHENCE
> +# which is installed unconditionally
> +endif
> +
>  # Intel Wireless Bluetooth
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
>  LINUX_FIRMWARE_FILES += intel/ibt-*
> -- 
> 2.29.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
