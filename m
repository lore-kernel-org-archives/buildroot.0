From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 18:14:11 +0200
Subject: [Buildroot] [PATCH/next 9/9] boot/optee-os: support alternate
 image files
In-Reply-To: <6d46c9a3c321d623029f2670f4ab98393825da98.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
 <6d46c9a3c321d623029f2670f4ab98393825da98.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <20190803181411.6806c378@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Etienne,

On Fri,  1 Mar 2019 17:47:13 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Some platform may generate specific boot image files instead of
> the generic files tee.bin and tee-*_v2.bin when building OP-TEE OS
> package.
> 
> This change introduces optee-os configuration directive
> BR2_TARGET_OPTEE_OS_CORE_IMAGES that allows board configuration
> to specify its expected boot image file names.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

Thanks, I've applied this patch, with some changes. See below.

> +config BR2_TARGET_OPTEE_OS_CORE_IMAGES
> +	string "Binary boot image filenames"
> +	default "tee-header_v2.bin tee-pager_v2.bin"

The problem with this default value is that it breaks existing
configurations. Indeed, today (without your patch), was get copied is
tee.bin tee-*_v2.bin. So we want to preserve this behavior, and to
achieve that, I've changed this line to:

	default "tee.bin tee-*_v2.bin"


> +	  With OP-TEE pager disabled, defaults are tee-header_v2.bin
> +	  and tee-pager_v2.bin.
> +
> +	  With OP-TEE pager enabled, one would select the 3 files
> +	  tee-header_v2.bin, tee-pager_v2.bin and tee-pageable_v2.bin.

I dropped these details, which I think are no longer that relevant with
the changed default value.

>  define OPTEE_OS_INSTALL_IMAGES_CORE
>  	mkdir -p $(BINARIES_DIR)
> -	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee.bin $(BINARIES_DIR)
> -	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee-*_v2.bin $(BINARIES_DIR)
> +	$(foreach f,$(OPTEE_OS_IMAGE_FILES), \
> +		cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/$(f) $(BINARIES_DIR)/

I have changed this to:

	cp -dpf $(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/$(f)) $(BINARIES_DIR)/

so that the tee-*_v2.bin gets properly expanded. I tested with a
Marvell Armada 7K/8K OP-TEE configuration, and it continued to properly
install the .bin files that were installed before this patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
