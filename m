From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 23:19:31 +0100
Subject: [Buildroot] [PATCH v2] toolchain-external: add Synopsys
 DesignWare tools for ARC cores
In-Reply-To: <1425936246-17045-1-git-send-email-abrodkin@synopsys.com>
References: <1425936246-17045-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150309231931.100c5a76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 10 Mar 2015 00:24:06 +0300, Alexey Brodkin wrote:
> With this change we add pre-built external toolachins for DesignWare ARC
> cores. All currently existed flavours are supported:
>  * ARC 700 and ARC HS cores
>  * Little- and big-enadian configurations

enadian -> endian.

> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700
> +	bool "Synopsys ARC 2014.12 for ARC 700"
> +	depends on BR2_arcle
> +	depends on BR2_arc750d || BR2_arc770d
> +	depends on BR2_HOSTARCH = "x86_64"
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_LARGEFILE
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_ENABLE_LOCALE
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	help
> +	  Toolchain for the ARC 700 architecture, from
> +	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
> +
> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700_EB
> +	bool "Synopsys ARC 2014.12 for ARC 700 (big endian)"
> +	depends on BR2_arceb
> +	depends on BR2_arc750d || BR2_arc770d
> +	depends on BR2_HOSTARCH = "x86_64"
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_LARGEFILE
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_ENABLE_LOCALE
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	help
> +	  Toolchain for the ARC 700 architecture, from
> +	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
> +
> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS
> +	bool "Synopsys ARC 2014.12 for ARC HS"
> +	depends on BR2_arcle
> +	depends on BR2_archs38
> +	depends on BR2_HOSTARCH = "x86_64"
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_LARGEFILE
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_ENABLE_LOCALE
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	help
> +	  Toolchain for the ARC HS architecture, from
> +	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
> +
> +config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS_EB
> +	bool "Synopsys ARC 2014.12 for ARC HS (big endian)"
> +	depends on BR2_arceb
> +	depends on BR2_archs38
> +	depends on BR2_HOSTARCH = "x86_64"
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_LARGEFILE
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_ENABLE_LOCALE
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	help
> +	  Toolchain for the ARC HS architecture, from
> +	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases

I am wondering if we really need one option per-toolchain. Can't we do
like we do for the Musl toolchain? Something like:

config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
	bool "Synopsys ARC 2014.12"
	depends on BR2_arc750d || BR2_arc770d || BR2_archs38
	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
	select BR2_INSTALL_LIBSTDCPP
	select BR2_LARGEFILE
	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
	select BR2_ENABLE_LOCALE
	select BR2_USE_WCHAR
	select BR2_TOOLCHAIN_HAS_THREADS
	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13


config BR2_TOOLCHAIN_EXTERNAL_PREFIX
	string
+	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
+	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb


> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 386f987..63ec12b 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -54,3 +54,9 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
>  sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
> +
> +# Synopsys DesignWare ARC toolchains
> +sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> +sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> +sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
> +sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
> \ No newline at end of file

Please keep an ending new line in this file.

> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 612c49d..f7ba280 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -22,6 +22,7 @@
>  #    default glibc-based variant is.
>  #  * Analog Devices toolchains for the Blackfin architecture
>  #  * Xilinx toolchains for the Microblaze architecture
> +#  * Synopsys DesignWare toolchains for ARC cores
>  #
>  # The basic principle is the following
>  #
> @@ -217,6 +218,9 @@ ifeq ($(BR2_mips)$(BR2_mips64),y)
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
>  TOOLCHAIN_EXTERNAL_CFLAGS += -EB
>  endif
> +ifeq ($(BR2_arceb),y)
> +TOOLCHAIN_EXTERNAL_CFLAGS += -EB
> +endif

You also need to add -EB to the external wrapper:

> +ifeq ($(BR2_arceb),y)
  + TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
> +TOOLCHAIN_EXTERNAL_CFLAGS += -EB
> +endif

And in the wrapper, change:

#ifdef BR_MIPS_TARGET_BIG_ENDIAN
        "-EB",
#endif

to:

#if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
        "-EB",
#endif

> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700),y)
> +TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
> +TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700_EB),y)
> +TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
> +TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS),y)
> +TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
> +TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS_EB),y)
> +TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
> +TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz

And here adjust a bit the conditionals to download the right tarball
depending on the CPU core:

else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = arc700
else
TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = archs
endif
ifeq ($(BR2_arcle),y)
TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = le
else
TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
endif
TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
else

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
