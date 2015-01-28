From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jan 2015 16:17:36 +0100
Subject: [Buildroot] [PATCH] package: add support for the wf111 WiFi
 driver and its utilities
In-Reply-To: <1422453245-11725-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1422453245-11725-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <20150128161736.67c93ab7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Antoine Tenart,

The preferred title for a new package is:

	<package name>: new package

On Wed, 28 Jan 2015 14:54:05 +0100, Antoine Tenart wrote:
> Adds support for the BlueGiga WF111 WiFi driver and the binary utilities
> distributed alongside the driver. An account is required to download the
> sources from the BlueGiga website, which can be created freely. The
> driver is available for armv5, arvmv7a and i386.

Typo on armv7.

> It is not possible to automatically retrieve the sources, because of the

Missing "Since" at the beginning of the sentence?

> required user account needed on the BlueGiga website, an option is added
> to let the Buildroot user specify the directory were the driver's

were -> where

"the driver's tarball" -> the driver tarball.

> tarball was downloaded.
> 
> Finally, two options must be selected in the Linux kernel configuration:
> CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV.

Please explain that those options are blind options, so they cannot be
enabled by a change in linux/linux.mk. And maybe you should explain how
the user is supposed to enable such blind options: either patch the
kernel to make them non-blind, or enable some other random WiFi driver
that selects them.

> diff --git a/package/wf111/Config.in b/package/wf111/Config.in
> new file mode 100644
> index 000000000000..4806a6958476
> --- /dev/null
> +++ b/package/wf111/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_WF111
> +	bool "wf111"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
> +	# Binary tools are distributed alongside the driver, and are
> +	# dynamically linked against the glibc.
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  BlueGiga WF111 WiFi driver and utilities.
> +
> +	  Warning: CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV must be
> +	  selected in the Linux kernel configuration.

See above: please give more details about this. Also, the upstream URL
should be in the Config.in help text of the main option, i.e here.

> +
> +if BR2_PACKAGE_WF111
> +
> +config BR2_PACKAGE_WF111_TARBALL_PATH
> +	string "WF111 tarball directory location"

No need to repeat "WF111" in the prompt, since this option will appear
as a sub-option of the previous one, so:

	string "local tarball location"

or something like that.

> +	help
> +	  The WF111 tarball can be retrieve on the BlueGiga website after

retrieve -> retrieved.

> +	  registration. This options specify the path were the tarball is

options -> option
specify -> specifies
were -> where

> +	  locally saved.
> +
> +	  http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/
> +
> +endif

Please add:

comment "wf111 needs an (e)glibc toolchain"
	depends on BR2_LINUX_KERNEL
	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
	depends on !BR2_TOOLCHAIN_USES_GLIBC

> diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
> new file mode 100644
> index 000000000000..a9642e5d724a
> --- /dev/null
> +++ b/package/wf111/wf111.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# wf111
> +#
> +################################################################################
> +
> +WF111_VERSION = 5.2.2
> +WF111_SITE_METHOD = file
> +WF111_SITE = $(BR2_PACKAGE_WF111_TARBALL_PATH)

Maybe:

WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))

to strip the double quotes that appear in the value of string options.

> +WF111_DEPENDENCIES = linux
> +
> +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv7-a.tar.gz
> +else ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv5t.tar.gz
> +else ifeq ($(BR2_i386),y)
> +WF111_SOURCE = wf111-linux-driver_5.2.2-r1_x86.tar.gz
> +endif
> +
> +define WF111_BUILD_CMDS
> +	make \

	$(MAKE)

> +		-C $(@D) PWD=$(@D) ARCH=arm \

ARCH=arm, really ? :-)

Please use $(LINUX_MAKE_FLAGS) instead, which already contains ARCH=
correctly.

> +		CC=$(TARGET_CC) LD=$(TARGET_LD) \

With $(LINUX_MAKE_FLAGS) containing CROSS_COMPILE, this should probably
become unnecessary.

> +		KDIR=$(LINUX_DIR) \
> +		install_static
> +endef
> +
> +define WF111_INSTALL_TARGET_CMDS
> +	rsync -a $(@D)/output/ $(TARGET_DIR)

We typically don't use rsync for such things. What does $(@D)/output
contains exactly? We would more typically use:

	cp -dpfr $(@D)/output/* $(TARGET_DIR)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
