From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 01:10:25 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/murata-wireless-cyw-fmac-fw:
 new package
In-Reply-To: <20190507083218.24283-2-m.niestroj@grinn-global.com>
References: <20190507083218.24283-1-m.niestroj@grinn-global.com>
 <20190507083218.24283-2-m.niestroj@grinn-global.com>
Message-ID: <77f579fb-40a9-1063-59a8-f35405c29cf7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2019 10:32, Marcin Niestroj wrote:
> +config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4339
> +	bool "CYW4339 (1CK/ZP)"
> +	help
> +	  Murata Wireless FMAC WiFi CYW4339 (1CK/ZP) module
> +	  firmware.
> +
> +config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430
> +	bool "CYW43430/CYW4343W/CYW43364 (1DX/1FX/1LN)"
> +	help
> +	  Murata Wireless FMAC WiFi CYW43430/CYW4343W/CYW43364
> +	  (1DX/1FX/1LN) module firmware.
> +
> +choice
> +	prompt "CYW43430/CYW4343W/CYW43364 module" if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430
> +
> +config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1DX
> +	bool "1DX"
> +
> +config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1FX
> +	bool "1FX"
> +
> +config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1LN
> +	bool "1LN"
> +
> +endchoice

 I don't understand this. Why is it possible to install firmware for CYW4339 and
CYW43430 1DX at the same time, but not for CYW43430 IDX and CYW43430 1FX?

 In other words, why a choice and not just separate options like for the rest?

 So I think what you want is that the
BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430 option becomes a blind option
and moves out of the choice, and that it gets selected by
BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1DX etc.


> +ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43340),y)
> +MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43340-sdio.bin
> +endif

 In most of this type of many-simple-options situations, we use something like

MURATA_WIRELESS_CYW_FMAC_FW_FILES_$(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43340)
+= brcmfmac43340-sdio.bin

 By the way, I think the package name is way too long. With Yann's idea to merge
the three, I think we could name it e.g. murata-cyw-fw.

 Regards,
 Arnout
