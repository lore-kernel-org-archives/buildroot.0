From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:08:40 +0200
Subject: [Buildroot] [PATCH v2 5/6] boot/riscv-pk: add bootloader for
 RISC-V architecture
In-Reply-To: <20180912102256.3164-6-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-6-mark.corbin@embecosm.com>
Message-ID: <20180925220840.562695d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:55 +0100, Mark Corbin wrote:
> Add the RISC-V Proxy Kernel (pk) package which provides the Berkeley
> Boot Loader for booting RISC-V kernel images.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

I have applied, after doing some minor changes, see below.

> diff --git a/boot/riscv-pk/Config.in b/boot/riscv-pk/Config.in
> new file mode 100644
> index 0000000000..ec49f6aa6d
> --- /dev/null
> +++ b/boot/riscv-pk/Config.in
> @@ -0,0 +1,13 @@
> +comment "riscv-pk (BBL) needs a Linux kernel to be built"

Changed to just "riscv-pk needs ..."

> +	depends on BR2_riscv
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_TARGET_RISCV_PK
> +	bool "riscv-pk (BBL)"

Changed to just "riscv-pk"

For both changes: our policy is to try to stick to the upstream package
name in the Config.in prompt and comments.

> +	depends on BR2_riscv
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  The RISC-V Proxy Kernel (pk) package contains the Berkeley
> +	  Boot Loader (BBL) which has been designed to boot a Linux
> +	  kernel on a RISC-V processor.

I've added a missing blank line here.

> +	  https://github.com/riscv/riscv-pk.git

> +define RISCV_PK_CONFIGURE_CMDS
> +	mkdir -p $(@D)/build
> +	(cd $(@D)/build; \
> +	$(TARGET_CONFIGURE_OPTS) ../configure \
> +	--host=$(GNU_TARGET_NAME) \
> +	--with-payload=$(BINARIES_DIR)/vmlinux \

I fixed a bit the indentation here.

> +	)
> +endef
> +
> +define RISCV_PK_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) \
> +		-C $(@D)/build bbl

Changed this to be on one single line.

> +endef
> +
> +define RISCV_PK_INSTALL_IMAGES_CMDS
> +	cp $(@D)/build/bbl $(BINARIES_DIR)

And changed to:

	$(INSTALL) -D -m 0755 $(@D)/build/bbl $(BINARIES_DIR)/bbl

Thanks again for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
