From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Feb 2019 15:47:02 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/arm-gnu-rm-toolchain: new
 package
In-Reply-To: <20190205104512.23718-2-kostap@marvell.com>
References: <20190205104512.23718-1-kostap@marvell.com>
 <20190205104512.23718-2-kostap@marvell.com>
Message-ID: <20190209154702.32875ba6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kostya,

On Tue, 5 Feb 2019 12:45:10 +0200
<kostap@marvell.com> wrote:

> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> Add cross-compialtion ARM RM toolchain for supporting firmware

cross-compilation

> diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
> new file mode 100644
> index 0000000000..d8797d9c13
> --- /dev/null
> +++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
> @@ -0,0 +1,3 @@
> +# taken from the distribution site

Please indicate the URL at which the hashes were found.

> +md5 299ebd3f1c2c90930d28ab82e5d8d6c0 gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
> +md5 7f88d3f1d0285e73e116cc3428bc1e13 gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2

Since md5 hashes are not very strong, please also add:

# Locally calculated
sha256 here the SHA256 gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
sha256 here the SHA256 gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2

> +ARM_GNU_RM_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2
> +ARM_GNU_RM_TOOLCHAIN_VERSION = 7-2018-q2-update
> +ARM_GNU_RM_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)-linux.tar.bz2
> +
> +ARM_GNU_RM_TOOLCHAIN_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+, LGPL-2.0+, LGPL-3.0+

These licensing details are not complete enough. There are some parts
that use the GCC exception.

> +ARM_GNU_RM_TOOLCHAIN_LICENSE_FILES = license.txt

This doesn't work, for two reasons:

 (1) You're moving files away from $(@D) when building

 (2) license.txt is deep down in
     share/doc/gcc-arm-none-eabi/license.txt, not at the root of the
     tree.

Please run "make legal-info" and make sure it works.

> +ARM_GNU_RM_TOOLCHAIN_ACTUAL_SOURCE_TARBALL = https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2
> +
> +HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
> +
> +define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
> +	rm -rf $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)
> +	mkdir -p $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)
> +	mv $(@D)/* $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)/

Don't move files, but copy them, otherwise legal-info will not work
after a build.

> +

Add:

	mkdir -p $(HOST_DIR)/bin

> +	cd $(HOST_DIR)/bin; \

Replace with:

	cd $(HOST_DIR)/bin && \

> +	for i in $(HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_DIR)/bin/*; do \
> +		ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
> +	done
> +endef
> +
> +$(eval $(host-generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
