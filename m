From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:17:08 +0100
Subject: [Buildroot] [PATCH] package/libeastl: new package
In-Reply-To: <1545159105-19680-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1545159105-19680-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181231141708.10dda9d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Dec 2018 12:51:45 -0600, Matt Weber wrote:
> This patch adds the Entertainment Arts Standard Template Library.
> 
> The initial version uses the latest hash so that the aarch64 support
> is included vs Buildroot having to apply the aarch64 support patch.
> 
> Signed-off-by: Maury Anderson <maury.anderson@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I've applied, after fixing a few issues. See below.

> diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
> new file mode 100644
> index 0000000..07bfe2c
> --- /dev/null
> +++ b/package/libeastl/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +	default y if BR2_aarch64
> +	default y if BR2_powerpc
> +	default y if BR2_powerpc64
> +
> +config BR2_PACKAGE_LIBEASTL
> +	bool "libeastl"
> +	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14

So the package uses C++, but doesn't have a BR2_INSTALL_LIBSTDCPP
dependency ? Seems weird! :-)

> +	help
> +	  EASTL stands for Electronic Arts Standard Template Library.

I've extended a bit this description, because the next paragraph is a
bit useless as it only says "hey, we're the best library".

> +	  It is an extensive and robust implementation that has an
> +	  emphasis on high performance.
> +
> +	  https://github.com/electronicarts/EASTL
> +
> +comment "libeastl needs a toolchain w/ gcc >= 4.9"
> +	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

I've added the C++ dependency here as well.

> diff --git a/package/libeastl/libeastl.mk b/package/libeastl/libeastl.mk
> new file mode 100644
> index 0000000..4fdf552
> --- /dev/null
> +++ b/package/libeastl/libeastl.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libeastl
> +#
> +################################################################################
> +
> +LIBEASTL_VERSION = 45469730d641868ce05433fff2e199510c7d45c3
> +LIBEASTL_SITE = https://github.com/electronicarts/EASTL.git
> +LIBEASTL_SITE_METHOD = git

I've used the github helper here.

> +LIBEASTL_LICENSE = BSD-3-Clause
> +LIBEASTL_LICENSE_FILES = LICENSE
> +LIBEASTL_INSTALL_STAGING = YES
> +
> +define LIBEASTL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755  $(@D)/libEASTL.so $(TARGET_DIR)/usr/lib/
> +endef

And dropped this custom install command, the default installation
command of cmake-package works just fine.

Applied to master with those fixes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
