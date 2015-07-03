From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2015 00:33:40 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150703223340.GK3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2015-07-02 00:58 +0200, Petr Vorel spake thusly:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Here's a quick and definitely not thourough review of this patch.

[--SNIP--]
> diff --git a/package/linux-backports/0001-backports-add-missing-include-for-vfree.patch b/package/linux-backports/0001-backports-add-missing-include-for-vfree.patch
> new file mode 100644
> index 0000000..3aee980
> --- /dev/null
> +++ b/package/linux-backports/0001-backports-add-missing-include-for-vfree.patch
> @@ -0,0 +1,26 @@
> +From e9dadfe5f446c9b2b1563ad50daf3a50b4497726 Mon Sep 17 00:00:00 2001
> +From: Jonathan Liu <net147@gmail.com>
> +Date: Fri, 5 Jun 2015 23:06:53 +1000
> +Subject: [PATCH] backports: add missing include for vfree

Has this patch been pushed upstream?

[--SNIP--]
> diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
> new file mode 100644
> index 0000000..4d793b2
> --- /dev/null
> +++ b/package/linux-backports/Config.in
> @@ -0,0 +1,48 @@
> +comment "linux-backports needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS
> +	bool "linux-backports"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +          The linux-backports package includes many Linux drivers from
> +          recent kernels, backported to older ones.
> +
> +          This version of linux-backports supports kernels starting from 3.0.
> +
> +	  https://backports.wiki.kernel.org
> +
> +if BR2_PACKAGE_LINUX_BACKPORTS
> +
> +choice
> +	prompt "Linux kernel driver backports configuration"
> +	default BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> +	bool "Using a defconfig"
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
> +	bool "Using a custom config file"

I'm a bit confused. Do you meant to differentiate between a defconfig
that is bundled in linux-backports, vs. a full .config that is providd
by the user? Is that all that is supported?

I would have expected that the user may either:
  - use a bundled defconfig (or even full .config), or
  - provide his own defconfig (or full .config),

like we do for other kconfig packages.

So, the prompts would be:

    choice
        bool "Linux backports configuration"

    config BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
        bool "Using an in-tree defconfig file"

    config BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
        bool "Using a custom (def)config file"

    endchoice

Note: this is similar to the variable names in linux/Config.in which are
probably a bit mis-named, but that's historical. What is important is
how we use them.

> +endchoice
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES
> +	string "Additional linux-backports configuration fragment files"
> +	help
> +	  A space-separated list of configuration fragment files,
> +	  that will be merged to the main linux-backports configuration file.

Please, put the option for the fragments list after the base files,
below:

> +config BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG
> +	string "Defconfig name"
> +	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> +	help
> +          Name of the backports defconfig file to use. The defconfig is
> +          located in defconfigs/ directory in the backports tree.
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the backports configuration file

... here.

> +endif

[--SNIP--]
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> new file mode 100644
> index 0000000..d45166a
> --- /dev/null
> +++ b/package/linux-backports/linux-backports.mk
> @@ -0,0 +1,64 @@
> +################################################################################
> +#
> +# linux-backports
> +#
> +################################################################################
> +
> +LINUX_BACKPORTS_VERSION_MAJOR = 4.0.1
> +LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
> +LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
> +LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
> +
> +LINUX_BACKPORTS_DEPENDENCIES = linux
> +# FIXME: does linux extracting, patching, but we need also linux to be configured.
> +LINUX_BACKPORTS_PATCH_DEPENDENCIES = linux

You can drop the 'FIXME:' and just state:

    # We need linux to be extracted and patch first before we are patched,
    # but we also need it to be built before we are configured, hence we do
    # need both dependencies:
    LINUX_BACKPORTS_PATCH_DEPENDENCIES = linux
    LINUX_BACKPORTS_DEPENDENCIES = linux

> +LINUX_BACKPORTS_MAKE_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \
> +	KLIB_BUILD=$(LINUX_DIR) \
> +	KLIB=$(TARGET_DIR)
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +LINUX_BACKPORTS_SOURCE_CONFIG = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))

Do not use $(LINUX_BACKPORTS_DIR) but use $(@D) instead.

> +else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +LINUX_BACKPORTS_SOURCE_CONFIG = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)

You need to qstrip that one as well.

> +endif
> +
> +# backports configure needs a configured kernel
> +# FIXME: not used as we'd need to assign LINUX_BACKPORTS_SOURCE_CONFIG with :=,
> +# but then we don't get $(LINUX_BACKPORTS_DIR) evaluated.

Would using $(@D) like I suggest above solve this issue?

> +$(LINUX_BACKPORTS_SOURCE_CONFIG): linux
> +
> +define LINUX_BACKPORTS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)

Would it work if you were to write (note the added trailing 'modules'):

    $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
        -C $(@D) modules

I ask, because I have a pending series that provides an infra for
building kernel modules:
    http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/kernel-modules

and it looks like that would probably help you quite a lot here...

Also, you probably want to use $(LINUX_MAKE_ENV) instead of just
$(TARGET_MAKE_ENV).

> +endef
> +
> +define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \

Ditto $(LINUX_MAKE_ENV).

> +		-C $(LINUX_DIR) M=$(@D) \
> +		INSTALL_MOD_DIR=backports \
> +		modules_install
> +endef
> +
> +LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_SOURCE_CONFIG)

Why don't you directly assign to LINUX_BACKPORTS_KCONFIG_FILE without
using the intermediate LINUX_BACKPORTS_SOURCE_CONFIG ?

> +LINUX_BACKPORTS_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES))
> +LINUX_BACKPORTS_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
> +LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
> +
> +$(eval $(kconfig-package))
> +
> +# Checks to give errors that the user can understand
> +ifeq ($(filter source,$(MAKECMDGOALS)),)

We now have a variable that explicitly states whether we are building or
not:

    ifeq ($(BR_BUILDING),y)

> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
> +$(error No linux-backports defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
> +$(error No linux-backports configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
> +endif
> +endif
> +
> +endif

When nesting ifeq-blocks, we like having the endif statements remind to
which ifeq they apply, like so:

    endif # BR_BUILDING

so the file stays readable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
