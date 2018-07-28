From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 19:37:53 +0200
Subject: [Buildroot] [PATCH v5 1/3] uboot: zynqmp: generate SPL image
 with PMUFW binary
In-Reply-To: <20180725143538.25268-2-luca@lucaceresoli.net>
References: <20180725143538.25268-1-luca@lucaceresoli.net>
 <20180725143538.25268-2-luca@lucaceresoli.net>
Message-ID: <20180728193753.686dbf7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jul 2018 16:35:36 +0200, Luca Ceresoli wrote:
> In order to boot on the Xilinx ZynqMP SoCs, U-Boot SPL requires a
> recent PMU firmware loaded. Instruct U-Boot to add pmufw.bin to the
> boot.bin file together with U-Boot SPL, and the boot ROM will load
> both.
> 
> For this to work properly, a patch to U-Boot is needed. However this
> patch must be applied by each defconfig that wishes to use
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW. If it were in boot/uboot/ to be applied
> unconditionally, it would break the build for configs using a U-Boot
> version higher than 2018.7-rc1 where the patch is already applied.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Joel Carlson <joelsoncarl@gmail.com>

I have applied, with some minor changes, see below.


> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> +	string "PMU firmware location"
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	help
> +	  Location of a PMU firmware binary.
> +
> +	  If not empty, instructs the U-Boot build process to generate
> +	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
> +	  both the U-Boot SPL and the PMU firmware in the
> +	  Xilinx-specific boot format.
> +
> +	  The value can be an absolute or relative path, and will be
> +	  used directly from where it is located, or an URI
> +	  (e.g. http://...), and it will be downloaded and used from
> +	  the download directory.
> +
> +	  If empty, the generated boot.bin will not contain a PMU
> +	  firmware.

I've added a note explaining that this feature requires U-Boot >=
2018.07.

> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
> +
> +UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> +
> +ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
> +UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> +BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
> +define UBOOT_ZYNQMP_KCONFIG_PMUFW
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))", \
> +	       $(@D)/.config)
> +endef
> +else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
> +define UBOOT_ZYNQMP_KCONFIG_PMUFW
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))", \
> +	       $(@D)/.config)
> +endef
> +endif

I've refactored this to avoid the duplication of
UBOOT_ZYNQMP_KCONFIG_PMUFW. Instead, I've defined
UBOOT_ZYNQMP_PMUFW_PATH which contains the path to the PMU firmware,
and used it in a single definition of UBOOT_ZYNQMP_KCONFIG_PMUFW.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
