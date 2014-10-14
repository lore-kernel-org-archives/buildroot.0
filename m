From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Oct 2014 22:54:11 +0300
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141014195411.GI3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Oct 14, 2014 at 12:45:53PM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

[snip]

> diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
> new file mode 100644
> index 0000000..c0ed9ef
> --- /dev/null
> +++ b/package/spidev_test/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_SPIDEV_TEST
> +	bool "spidev_test"
> +	depends on BR2_LINUX_KERNEL

That is a heavy dependency. As you noted in another message, it also make the 
autobuilder skip this package. I suggest to download just spidev_test.c from 
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION), 
and make it depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 (as of v3.17). This 
solves both the autobuilder issue, and the toolchain headers dependency.

baruch

> +	help
> +	  SPI testing utility (using spidev driver).
> +
> +	  This package builds and installs the userspace 'spidev_test'
> +	  command. It is up to the user to ensure that the kernel
> +	  configuration has all the suitable options enabled to allow a
> +	  proper operation of 'spidev_test'.
> +
> +	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
> +
> +comment "spidev_test needs Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
> new file mode 100644
> index 0000000..24c0f89
> --- /dev/null
> +++ b/package/spidev_test/spidev_test.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# spidev_test
> +#
> +################################################################################
> +
> +# Source taken from the Linux kernel tree
> +SPIDEV_TEST_SOURCE =
> +SPIDEV_TEST_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +SPIDEV_TEST_DEPENDENCIES = linux
> +
> +define SPIDEV_TEST_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/spidev_test \
> +		$(LINUX_DIR)/Documentation/spi/spidev_test.c
> +endef
> +
> +define SPIDEV_TEST_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/spidev_test \
> +		$(TARGET_DIR)/usr/sbin/spidev_test
> +endef
> +
> +$(eval $(generic-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
