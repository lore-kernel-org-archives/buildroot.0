From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 21:23:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/cli11: new package
In-Reply-To: <20200706111715.46462-1-aleksandr.o.makarov@gmail.com>
References: <20200706111715.46462-1-aleksandr.o.makarov@gmail.com>
Message-ID: <20200727212345.2d650692@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksandr,

On Mon,  6 Jul 2020 05:17:15 -0600
Aleksandr Makarov <aleksandr.o.makarov@gmail.com> wrote:

> diff --git a/package/cli11/Config.in b/package/cli11/Config.in
> new file mode 100644
> index 0000000000..77619a1366
> --- /dev/null
> +++ b/package/cli11/Config.in
> @@ -0,0 +1,26 @@
> +comment "cli11 needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

This should be:

	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9


> +CLI11_VERSION = 1.9.1
> +CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
> +CLI11_LICENSE = BSD-3-Clause
> +CLI11_LICENSE_FILES = LICENCE
> +CLI11_INSTALL_STAGING = YES
> +CLI11_INSTALL_TARGET = NO
> +CLI11_CONF_OPTS = -DCLI11_BUILD_EXAMPLES=OFF \
> +                  -DCLI11_BUILD_DOCS=OFF
> +
> +ifeq ($(BR2_PACKAGE_CLI11_SINGLE_FILE),y)
> +CLI11_CONF_OPTS += -DCLI11_SINGLE_FILE=ON \
> +                   -DCLI11_INSTALL=OFF
> +CLI11_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +endif

Overall, wouldn't it be simpler to simply use the pre-generated single
header file that the upstream project provides at
https://github.com/CLIUtils/CLI11/releases ?

For example
https://github.com/CLIUtils/CLI11/releases/download/v1.9.1/CLI11.hpp
for the latest release. Is there any drawback in doing this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
