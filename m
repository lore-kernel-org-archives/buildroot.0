From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 23:03:24 +0100
Subject: [Buildroot] [PATCH v2 4/8] boot/arm-trusted-firmware: support
 alternate image files
In-Reply-To: <1552951269-16967-4-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-4-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190320230324.23023b9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Tue, 19 Mar 2019 00:21:05 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Some platform may generate specific boot image files instead of
> the generic files *.bin  when building TF-A package. This change
> introduces new configuration directive for the arm-trusted-firmware
> boot package.
> 
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES is boolean.
> When disabled, install boot image files are .../*.bin.
> When enabled, BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES shall
> lists the names of the generated boot image files.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

I think this is more complicated than it needs to be. See an alternate
proposal below.

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES
> +	bool "Use custom binary boot image filenames"
> +	help
> +	  If not set, build generates the boot image files with the
> +	  generic filename that is images with .bin extension. These
> +	  are copied to the output images/ directory.
> +
> +	  If enabled, use BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGES
> +	  to list the generated file names.
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES
> +	string "Binary boot image filenames"
> +	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES
> +	help
> +	  This is used when TF-A platform generates boot image files
> +	  with custom file names. When so, this should list the path
> +	  of the generated files location relatively to the package
> +	  build root directory. These files are copied to the output
> +	  images/ directory.

Just one new option:

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGE_NAMES
	string "Image names"
	default "*.bin"
	help
	  ...
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES),y)
> +define ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL
> +	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES)), \
> +		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/ \
> +	)
> +endef
> +else
> +define ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL
> +	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
> +endef
> +endif

And then just:

ARM_TRUSTED_FIRMWARE_IMAGE_NAMES = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGE_NAMES))

define ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL
	$(foreach f,$(wildcard $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(ARM_TRUSTED_FIRMWARE_IMAGE_NAMES)), \
		$(INSTALL) -D -m 0644 $(f) $(BINARIES_DIR)/$(notdir $(f))
	)
endef

(totally untested of course)

Could you try something like this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
