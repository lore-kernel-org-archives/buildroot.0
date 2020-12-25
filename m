From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 19:28:28 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: add new option for
 USB TI 3410/5052 firmware
In-Reply-To: <2a63d2fb5dc2a51888737af1d3e868b4b8cf74c8.1608718184.git.stefan@agner.ch>
References: <2a63d2fb5dc2a51888737af1d3e868b4b8cf74c8.1608718184.git.stefan@agner.ch>
Message-ID: <20201225182828.GD1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2020-12-23 11:11 +0100, Stefan Agner spake thusly:
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/linux-firmware/Config.in         | 9 +++++++++
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index dbdfdb52b3..6d5e961527 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -490,4 +490,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X
>  
>  endmenu
>  
> +menu "USB to Serial Firmware"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI
> +	bool "USB TI 3410/5052 Serial Firmware"
> +	help
> +	  Firmware files for TI 3410/5052
> +
> +endmenu
> +
>  endif
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index f1c84a134d..f00fb2e6ae 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -620,6 +620,12 @@ LINUX_FIRMWARE_FILES += qat_c62x.bin qat_c62x_mmp.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI),y)
> +LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw

That driver lists a lot of other firmware files:

   492 MODULE_FIRMWARE("ti_3410.fw");
   493 MODULE_FIRMWARE("ti_5052.fw");
   494 MODULE_FIRMWARE("mts_cdma.fw");
   495 MODULE_FIRMWARE("mts_gsm.fw");
   496 MODULE_FIRMWARE("mts_edge.fw");
   497 MODULE_FIRMWARE("mts_mt9234mu.fw");
   498 MODULE_FIRMWARE("mts_mt9234zba.fw");
   499 MODULE_FIRMWARE("moxa/moxa-1110.fw");
   500 MODULE_FIRMWARE("moxa/moxa-1130.fw");
   501 MODULE_FIRMWARE("moxa/moxa-1131.fw");
   502 MODULE_FIRMWARE("moxa/moxa-1150.fw");
   503 MODULE_FIRMWARE("moxa/moxa-1151.fw");

which are all available in linux-firmware. I was about to add them to
the list and commit that, but the situation is a bit more complex, as
there is a license file for the moxa firmwares.

Care to respin with the extra firmware added to the list, please?

Regards,
Yann E. MORIN.

> +# No license file; the license is in the file WHENCE
> +# which is installed unconditionally
> +endif
> +
>  ifneq ($(LINUX_FIRMWARE_FILES),)
>  define LINUX_FIRMWARE_INSTALL_FILES
>  	cd $(@D) && \
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
