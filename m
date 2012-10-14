From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 14 Oct 2012 20:45:02 +0200
Subject: [Buildroot] [PATCH 10/13] Add update-all-config target
In-Reply-To: <20121013231438.17317.13801.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231438.17317.13801.stgit@localhost>
Message-ID: <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Oct 14, 2012 at 1:14 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> The update-all-config target updates all the external configuration
> file with their current values.  This includes:
> - buildroot
> - busybox
> - linux
> - crosstool-ng
> - uClibc
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I like this idea, and would propose to go through with this regardless
of the outcome of the series.
See below for some comments though.

> ---
> Barebox is missing because there is no BR2_TARGET_BAREBOX_CONFIG option.
> ---
>  Makefile                                         |    6 ++++++
>  linux/linux.mk                                   |    2 ++
>  package/busybox/busybox.mk                       |    4 ++++
>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 +++++++
>  toolchain/uClibc/uclibc.mk                       |    4 ++++
>  5 files changed, 23 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 1f42141..0e5b28e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -660,6 +660,10 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>                 --savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>                 $(CONFIG_CONFIG_IN)
>
> +# UPDATE_ALL_CONFIG_TARGETS is set by the individual packages that have a
> +# save*config target.
> +update-all-config: savedefconfig $(UPDATE_ALL_CONFIG_TARGETS)
> +
>  # check if download URLs are outdated
>  source-check:
>         $(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> @@ -714,6 +718,8 @@ help:
>         @echo '  defconfig              - New config with default answer to all options'
>         @echo '                             BR2_DEFCONFIG, if set, is used as input'
>         @echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
> +       @echo '  update-all-config      - Update all configuration targets that have an input:'
> +       @echo '                           buildroot, busybox, linux, crosstool-ng, uClibc'
>         @echo '  allyesconfig           - New config where all options are accepted with yes'
>         @echo '  allnoconfig            - New config where all options are answered with no'
>         @echo '  randpackageconfig      - New config with random answer to package options'
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c4bdf90..98ffe44 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -151,6 +151,8 @@ ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
>  KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
> +# savedefconfig requires a kernel >= 2.6.33
> +UPDATE_ALL_CONFIG_TARGETS += linux-update-defconfig
>  endif
>
>  define LINUX_CONFIGURE_CMDS
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 33f8633..5063a8b 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -217,3 +217,7 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
>
>  busybox-update-config:
>         cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
> +
> +ifneq ($(BUSYBOX_CONFIG_FILE),)
> +UPDATE_ALL_CONFIG_TARGETS += busybox-update-config
> +endif
> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> index d18f5d5..688bcfe 100644
> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> @@ -397,3 +397,10 @@ ctng-menuconfig: $(CTNG_DIR)/.config
>         $(call ctng-oldconfig,$<)
>         $(call ctng-check-config-changed,$<,$<.timestamp)
>         $(Q)rm -f $<.timestamp
> +
> +ctng-update-config: $(CTNG_DIR)/.config
> +       $(Q)cp $< $(CTNG_CONFIG_FILE)
> +
> +ifneq ($(CTNG_CONFIG_FILE),)
> +UPDATE_ALL_CONFIG_TARGETS += ctng-update-config
> +endif

I would personally have split the addition of an update-config feature
for crosstool-ng from this patch that wraps the different
update-config targets in one update-all-config.

I wonder why ctng-update-config uses a different type of recipe than
their counterparts in busybox, uclibc, ...

For busybox it is:
>  busybox-update-config:
>         cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)

while for ctng, as proposed above:
> +ctng-update-config: $(CTNG_DIR)/.config
> +       $(Q)cp $< $(CTNG_CONFIG_FILE)

Differences:

- target dependency
- $(Q)
- forced copy

I would say that since all these packages are using the same kind of
config system, the way to save their config files should also line up.
It's possible that the new ctng-update-config is better in some ways,
but in this case I think the other ones should be updated as well


> diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
> index d1cd718..0faaf18 100644
> --- a/toolchain/uClibc/uclibc.mk
> +++ b/toolchain/uClibc/uclibc.mk
> @@ -508,6 +508,10 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
>  uclibc-update-config: uclibc-config
>         cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
>
> +ifneq ($(UCLIBC_CONFIG_FILE),)
> +UPDATE_ALL_CONFIG_TARGETS += uclibc-update-config
> +endif
> +
>  uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
>
>  uclibc-configured-source: uclibc-source
>

Best regards,
Thomas
