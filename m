From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Jun 2015 23:58:52 +0200
Subject: [Buildroot] [PATCH v2 1/2] host-zynq-boot-bin: new package
In-Reply-To: <1434971728-16094-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <20150618231816.513316f9@free-electrons.com>
 <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1434971728-16094-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <5588851C.2000705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/15 13:15, Jan Viktorin wrote:
> From: Jan Viktorin <viktorin@rehivetech.com>
> 
> The package creates file images/boot.bin to boot
> Xilinx Zynq based boards. It might not work with
> U-Boot older then 2015.07.
> 
> The script zynq-boot-bin.py is contained in the
> Xilinx repository of U-Boot (it is not in upstream).
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/Config.in.host                 |  1 +
>  package/zynq-boot-bin/Config.in.host   |  8 ++++++++
>  package/zynq-boot-bin/zynq-boot-bin.mk | 22 ++++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/zynq-boot-bin/Config.in.host
>  create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1e047aa..030c91f 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -27,5 +27,6 @@ menu "Host utilities"
>  	source "package/sunxi-tools/Config.in.host"
>  	source "package/uboot-tools/Config.in.host"
>  	source "package/util-linux/Config.in.host"
> +	source "package/zynq-boot-bin/Config.in.host"
>  
>  endmenu
> diff --git a/package/zynq-boot-bin/Config.in.host b/package/zynq-boot-bin/Config.in.host
> new file mode 100644
> index 0000000..bc151a7
> --- /dev/null
> +++ b/package/zynq-boot-bin/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_ZYNQ_BOOT_BIN
> +	bool "host zynq-boot-bin"
> +	depends on BR2_TARGET_UBOOT_SPL
> +	help
> +	  This is a simple Python script that creates BOOT.BIN file
> +	  to boot Xilinx Zynq based on U-Boot's SPL.
> +
> +	  https://github.com/Xilinx/u-boot-xlnx
> diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
> new file mode 100644
> index 0000000..cb1b4b5
> --- /dev/null
> +++ b/package/zynq-boot-bin/zynq-boot-bin.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# zynq-boot-bin
> +#
> +################################################################################
> +
> +ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
> +ZYNQ_BOOT_BIN_SOURCE = $(ZYNQ_BOOT_BIN_VERSION).tar.gz
> +ZYNQ_BOOT_BIN_SITE = https://github.com/Xilinx/u-boot-xlnx/archive

 Since we only need a single file from this archive, perhaps it is better to
set (untested):

ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools

define ZYNQ_BOOT_BIN_EXTRACT_CMDS
	@cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
endef

> +
> +ZYNQ_BOOT_BIN_INSTALL_STAGING = NO
> +ZYNQ_BOOT_BIN_INSTALL_IMAGES = YES
> +
> +HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = uboot host-python

 As mentioned by Baruch, host-python dependency shouldn't be needed.

> +HOST_ZYNQ_BOOT_BIN_NEEDS_PYTHON = python2

 It's actually _NEEDS_HOST_PYTHON, so this is clearly not needed.


 Regards,
 Arnout

> +
> +define HOST_ZYNQ_BOOT_BIN_BUILD_CMDS
> +	$(HOST_DIR)/usr/bin/python2 $(@D)/tools/zynq-boot-bin.py -o $(BINARIES_DIR)/boot.bin \
> +		-u $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)))
> +endef
> +
> +$(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
