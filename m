From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:08:11 +0100
Subject: [Buildroot] [PATCH] rtl8723bu: new package
In-Reply-To: <20171126215913.28767-1-mylene.josserand@free-electrons.com>
References: <20171126215913.28767-1-mylene.josserand@free-electrons.com>
Message-ID: <20171127090811.22628218@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Nov 2017 22:59:13 +0100, Myl?ne Josserand wrote:
> Add RTL8723BU package to compile the Realtek RTL8723BU Wifi driver.
> 
> Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>

Thanks for this contribution!

>  package/Config.in                |  1 +
>  package/rtl8723bu/Config.in      | 10 ++++++++++
>  package/rtl8723bu/rtl8723bu.hash |  2 ++
>  package/rtl8723bu/rtl8723bu.mk   | 25 +++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)

Could you add yourself to the DEVELOPERS file for this package?

> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> new file mode 100644
> index 0000000000..774caa02f9
> --- /dev/null
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# rtl8723bu
> +#
> +################################################################################
> +
> +RTL8723BU_VERSION = b922079a090dcaad58179d478442ff97f18521c9
> +RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
> +RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
> +
> +RTL8723BU_MODULE_MAKE_OPTS = \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	KSRC=$(LINUX_DIR)
> +
> +RTL8723BU_BINS = rtl8723b_fw.bin
> +
> +define RTL8723BU_INSTALL_FIRMWARE
> +	$(foreach bin, $(RTL8723BU_BINS), \
> +		$(INSTALL) -D -m 644 $(@D)/$(bin) $(TARGET_DIR)/lib/firmware/rtlwifi/$(bin)
> +	)

The loop is not needed, since you have a single firmware file, so this
can be simplified as:

	$(INSTALL) -D -m 0644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtlwifi/rtl8723b_fw.bin

> +endef
> +RTL8723BU_POST_INSTALL_TARGET_HOOKS += RTL8723BU_INSTALL_FIRMWARE

I know the rtl8723bs package that you probably used as an example does
this, but in fact there is no need to use a post install target hook
here. You can just do:

define RTL8723BU_INSTALL_TARGET_CMDS
	$(INSTALL) -D ...
endef

Could you fix those minor details, and submit an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
