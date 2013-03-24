From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 10:58:59 +0100
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host/taget package
In-Reply-To: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
References: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <20130324105859.3e488934@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

Typo in the title: taget -> target.

On Thu, 14 Mar 2013 20:31:36 +0100, Carlo Caione wrote:

> diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
> new file mode 100644
> index 0000000..d151a74
> --- /dev/null
> +++ b/package/sunxi-tools/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SUNXI_TOOLS
> +	bool "sunxi nand-part"

On hardware specific packages, we generally try to restrict them to the
architecture on which they make sense, so you could add a:

	depends on BR2_arm

here.

> +	help
> +	  nand-part is a tool to repartition the internal NAND on sunxi
> +	  devices

It would be good to copy a bit more text from the host-sunxi package
description. Something that at least mentions Allwinner A10 and A13.

> +	  http://linux-sunxi.org/Sunxi-tools
> +
> diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
> new file mode 100644
> index 0000000..0208adb
> --- /dev/null
> +++ b/package/sunxi-tools/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_SUNXI_TOOLS
> +	bool "host sunxi-tools"

depends on BR2_arm

> +	help
> +	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i) based devices.
> +	  This includes fexc which can be used to compile .fex board definition files to
> +	  the binary script.bin format required by the linux-sunxi kernel.
> +
> +	  http://linux-sunxi.org/Sunxi-tools

It would be good to mention explicitly that those tools don't apply to
the mainline Linux kernel version.

> +
> diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
> new file mode 100644
> index 0000000..cfb88d7
> --- /dev/null
> +++ b/package/sunxi-tools/sunxi-tools.mk
> @@ -0,0 +1,42 @@
> +#############################################################
> +#
> +# sunxi-tools
> +#
> +#############################################################
> +
> +SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
> +SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/master
> +SUNXI_TOOLS_LICENSE = GPLv2+
> +SUNXI_TOOLS_LICENSE_FILES = COPYING
> +HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
> +
> +define HOST_SUNXI_TOOLS_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS) -std=c99 \
> +	  -D_POSIX_C_SOURCE=200112L -Iinclude/" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)

Maybe:
	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
		CFLAGS="$(HOST_CFLAGS) ..." -C $(@D)

we prefer using $(HOST_CONFIGURE_OPTS), which will pass the right CC,
LD, LDFLAGS and so on. You only need to override CFLAGS here.

> +endef
> +
> +define HOST_SUNXI_TOOLS_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/fexc $(HOST_DIR)/usr/bin/fexc
> +	$(INSTALL) -D -m 0755 $(@D)/bin2fex $(HOST_DIR)/usr/bin/bin2fex
> +	$(INSTALL) -D -m 0755 $(@D)/fex2bin $(HOST_DIR)/usr/bin/fex2bin
> +	$(INSTALL) -D -m 0755 $(@D)/bootinfo $(HOST_DIR)/usr/bin/bootinfo
> +	$(INSTALL) -D -m 0755 $(@D)/fel $(HOST_DIR)/usr/bin/fel
> +	$(INSTALL) -D -m 0755 $(@D)/pio $(HOST_DIR)/usr/bin/pio
> +	$(INSTALL) -D -m 0755 $(@D)/nand-part $(HOST_DIR)/usr/bin/nand-part

This could be changed to:

	for i in fexc bin2fex fex2bin bootinfo fel pio nand-part; do \
		$(INSTALL) -D -m 0755 $(@D)/$$i $(HOST_DIR)/usr/bin/$$i ; \
	done

also, isn't nand-part useful only on the target?

> +endef
> +
> +define SUNXI_TOOLS_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)"                               \
> +		LDFLAGS="$(TARGET_LDFLAGS)"                     \
> +		CFLAGS="$(TARGET_CFLAGS)                        \
> +		 -std=c99 -D_POSIX_C_SOURCE=200112L -Iinclude/" \
> +		 -C $(@D)					\
> +		nand-part

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) ..." -C $(@D) nand-part

TARGET_CONFIGURE_OPTS already defines CC, LDFLAGS, CFLAGS for you. You
only have to override the CFLAGS definition.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
