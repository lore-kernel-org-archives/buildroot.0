From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jun 2010 23:45:58 +0200
Subject: [Buildroot] [PATCH 14/46] u-boot: support building for mkimage
In-Reply-To: <09b5460223d8c9930125c60c4ab8dab52b05372b.1275343447.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 1 Jun 2010 00:08:00 +0200")
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<09b5460223d8c9930125c60c4ab8dab52b05372b.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877hm9i4fd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When mkimage needs to be built (when building an uImage for the Linux
 Thomas> kernel is needed), but U-Boot hasn't been selected for compilation,
 Thomas> U_BOOT_VERSION and U_BOOT_BOARD_NAME aren't defined. Define them to
 Thomas> default values in this case.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  boot/u-boot/u-boot.mk |   29 ++++++++++++++++++++++-------
 Thomas>  1 files changed, 22 insertions(+), 7 deletions(-)

 Thomas> diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
 Thomas> index ac16c8b..1f5b216 100644
 Thomas> --- a/boot/u-boot/u-boot.mk
 Thomas> +++ b/boot/u-boot/u-boot.mk
 Thomas> @@ -4,6 +4,15 @@
 Thomas>  #
 Thomas>  #############################################################
 Thomas>  U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
 Thomas> +U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 Thomas> +
 Thomas> +# An U-Boot version and board might not be specified if U-Boot isn't
 Thomas> +# explicitly selected, but mkimage needs to be compiled. In this case,
 Thomas> +# we just take a random U-Boot version and configuration.
 Thomas> +ifeq ($(U_BOOT_VERSION),)
 Thomas> +U_BOOT_VERSION=2010.03
 Thomas> +U_BOOT_BOARD_NAME=smdk2410
 Thomas> +endif
  
 Thomas>  # u-boot still uses arch=ppc for powerpc
 Thomas>  U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 
Does that work if KERNEL_ARCH != arm?

 Thomas> +$(MKIMAGE): $(U_BOOT_DIR)/.configured
 Thomas>  	mkdir -p $(@D)
 Thomas> -	cp -dpf $(U_BOOT_DIR)/tools/mkimage $@
 Thomas> +	$(TARGET_CONFIGURE_OPTS) \
 Thomas> +		CFLAGS="$(TARGET_CFLAGS)" \
 Thomas> +		LDFLAGS="$(TARGET_LDFLAGS)" \
 Thomas> +		$(U_BOOT_CONFIGURE_OPTS) \
 Thomas> +		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 Thomas> +		-C $(U_BOOT_DIR) tools
 Thomas> +	cp -dpf $(U_BOOT_DIR)/tools/mkimage $(@D)

Huh, isn't that supposed to be mkimage for the host? Why do you need to
pass all this target stuff?

-- 
Bye, Peter Korsgaard
