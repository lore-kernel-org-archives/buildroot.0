From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 23:52:03 +0200
Subject: [Buildroot] [PATCH v4 3/3] dpdk: new package
In-Reply-To: <1459042284-6684-4-git-send-email-viktorin@rehivetech.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-4-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160415235203.3f9ed61e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Mar 2016 03:31:24 +0200, Jan Viktorin wrote:

> The included hash was calculated locally by downloading the tar.gz archives by
> hand.
> 
> There are unfortunately some pitfalls:
> 
> * it may require to enable PCI, MSIX, UIO in the Linux Kernel
>   (some defconfigs does not include as default and it is platform
>   dependent as ARMv7 almost does not use PCI)

I have enabled PCI_MSI=y and UIO=y in my kernel configuration, and
still, I don't have any .ko file installed in my target. Is this
expected?

> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000..69bc56e8
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,64 @@
> +config BR2_PACKAGE_DPDK
> +	bool "dpdk"
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_LINUX_KERNEL
> +	select BR2_LINUX_NEEDS_MODULES
> +	help
> +	  DPDK is a set of libraries and drivers for fast packet processing. It
> +	  was designed to run on any processors, however, Intel x86 has been
> +	  the first CPU to be supported. Ports for other CPUs like IBM Power 8
> +	  and ARM are under progress. It runs mostly in Linux userland. A
> +	  FreeBSD port is now available for a subset of DPDK features.
> +
> +	  Notes:
> +	  * To build the included Linux Kernel drivers, it is necessary to
> +	    enable CONFIG_PCI_MSI, CONFIG_UIO.
> +	  * To build the PCAP PMD properly, you need to enable the libpcap
> +	    manually.
> +	  * You may need to install the python2 interpreter if you want to use
> +	    scripts dpdk_nic_bind.py and cpu_layout.py
> +
> +	  http://www.dpdk.org/
> +
> +config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	bool
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 &&\
> +		BR2_TOOLCHAIN_HAS_SYNC_2 &&\
> +		BR2_TOOLCHAIN_HAS_SYNC_4 &&\
> +		BR2_TOOLCHAIN_HAS_SYNC_8
> +	default y if (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \
> +			&& !BR2_x86_i586 && !BR2_x86_x1000)
> +	default y if BR2_ARM_CPU_ARMV7A
> +	default y if BR2_aarch64 || BR2_aarch64_be

What about BR2_x86_64 ?

> +
> +comment "dpdk needs a glibc toolchain and a Linux Kernel to be built"
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_LINUX_KERNEL

The BR2_PACKAGE_DPDK_ARCH_SUPPORTS option and the comment should go
before the BR2_PACKAGE_DPDK so that the dpdk sub-options can be
properly indented by menuconfig.

> +if BR2_PACKAGE_DPDK
> +
> +config BR2_PACKAGE_DPDK_CONFIG
> +	string "Configuration"
> +	default "i686-native-linuxapp-gcc" \
> +		if BR2_x86_i686
> +	default "x86_64-native-linuxapp-gcc" \
> +		if BR2_x86_64
> +	default "arm-armv7a-linuxapp-gcc" \
> +		if BR2_ARM_CPU_ARMV7A
> +	default "arm64-armv8a-linuxapp-gcc" \
> +		if BR2_aarch64 || BR2_aarch64_be
> +
> +config BR2_PACKAGE_DPDK_TEST
> +	bool "Install tests suite"
> +	select BR2_PACKAGE_PYTHON_PEXPECT if BR2_PACKAGE_PYTHON
> +	help
> +	  Install all DPDK tests. If you want to run the tests by the included
> +	  autotest.py script you need to enable python manually.
> +
> +config BR2_PACKAGE_DPDK_EXAMPLES
> +	bool "Build & install examples"
> +	help
> +	  Build and install all examples selected by the current configuration.

Please remove this option and the example build/installation. It is too
complicated for now. Upstream should create a proper build/installation
process for these. In the mean time, let's merge a dpdk package that
does not bother building/installing the examples.

> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> new file mode 100644
> index 0000000..6a4824a
> --- /dev/null
> +++ b/package/dpdk/dpdk.mk
> @@ -0,0 +1,106 @@
> +################################################################################
> +#
> +# dpdk
> +#
> +################################################################################
> +
> +DPDK_VERSION = 16.04-rc2

Please update to the latest 16.04 version.

> +DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
> +
> +DPDK_LICENSE = BSD-2c (core), GPLv2+ (Linux drivers)
> +DPDK_LICENSE_FILES = GNUmakefile LICENSE.GPL
> +DPDK_INSTALL_STAGING = YES
> +
> +DPDK_DEPENDENCIES += linux
> +
> +ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> +DPDK_DEPENDENCIES += libpcap
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +define DPDK_ENABLE_SHARED_LIBS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_RTE_BUILD_SHARED_LIB,\
> +			$(@D)/build/.config)
> +endef
> +
> +DPDK_POST_CONFIGURE_HOOKS += DPDK_ENABLE_SHARED_LIBS
> +endif
> +
> +# We're building a kernel module without using the kernel-module infra,
> +# so we need to tell we want module support in the kernel
> +ifeq ($(BR2_PACKAGE_DPDK),y)
> +LINUX_NEEDS_MODULES = y
> +endif

This is no longer needed since you are selecting
BR2_LINUX_NEEDS_MODULES.

> +DPDK_CONFIG = $(call qstrip,$(BR2_PACKAGE_DPDK_CONFIG))
> +
> +ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
> +# Build of DPDK examples is not very straight-forward. It requires to have
> +# the SDK and runtime installed on same place to reference it by RTE_SDK.
> +# We place it locally in the build directory.
> +define DPDK_BUILD_EXAMPLES
> +	$(MAKE) -C $(@D) DESTDIR=$(@D)/examples-sdk \
> +		CROSS=$(TARGET_CROSS) install-sdk install-runtime
> +	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) \
> +		RTE_SDK=$(@D)/examples-sdk/usr/local/share/dpdk \
> +		T=$(DPDK_CONFIG) examples
> +endef
> +
> +DPDK_EXAMPLES_PATH = $(@D)/examples-sdk/usr/local/share/dpdk/examples
> +
> +# Installation of examples is tricky in DPDK so we do it explicitly here.
> +# As the binaries and libraries do not have a single or regular location
> +# where to find them after build, we search for them by find.
> +define DPDK_INSTALL_EXAMPLES
> +	for f in `find $(DPDK_EXAMPLES_PATH) -executable -type f       \
> +			-path '*/lib/*.so*'`; do                       \
> +		$(INSTALL) -m 0755 -D $$f                              \
> +			$(TARGET_DIR)/usr/lib/`basename $$f` || exit 1;\
> +	done
> +	for f in `find $(DPDK_EXAMPLES_PATH) -executable -type f       \
> +			-path '*/app/*'`; do                           \
> +		$(INSTALL) -m 0755 -D $$f                              \
> +			$(TARGET_DIR)/usr/bin/`basename $$f` || exit 1;\
> +	done
> +endef
> +
> +# Build of the power example is broken (at least for 16.04).
> +define DPDK_DISABLE_POWER
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_RTE_LIBRTE_POWER,\
> +			$(@D)/build/.config)
> +endef
> +
> +DPDK_POST_CONFIGURE_HOOKS += DPDK_DISABLE_POWER
> +endif

Please remove this entire ifeq ... endif block.

> +
> +define DPDK_CONFIGURE_CMDS
> +	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) \
> +			   CROSS=$(TARGET_CROSS) config
> +endef
> +
> +define DPDK_BUILD_CMDS
> +	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS)

When the architecture is ARMv7, please pass:

	CPU_FLAGS=

Otherwise, the dpdk build system passes -mfloat-abi=softfp, which makes
the build fail when the selected ABI is EABIhf. And please report the
bug upstream: the dpdk build system should not make assumptions on the
selected ARM ABI.

> +	$(DPDK_BUILD_EXAMPLES)

This can be removed.

> +endef
> +
> +define DPDK_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) prefix=/usr \
> +		 CROSS=$(TARGET_CROSS) install-sdk
> +endef
> +
> +ifeq ($(BR2_PACKAGE_DPDK_TEST),y)
> +define DPDK_INSTALL_TARGET_TEST
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/dpdk

	mkdir -p

> +	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk

Full destination path:

	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk/test

> +	$(INSTALL) -m 0755 -D $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk

To copy multiple files:

	cp -dpfr $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk

> +define DPDK_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr \
> +		CROSS=$(TARGET_CROSS) install-runtime
> +	$(DPDK_INSTALL_TARGET_TEST)
> +	$(DPDK_INSTALL_EXAMPLES)

Remove this one.

Can you fix those issues and resend?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
