From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:01:40 +0100
Subject: [Buildroot] [PATCH] package/quickjs: new package
In-Reply-To: <20201018111125.899134-1-francois.perrad@gadz.org>
References: <20201018111125.899134-1-francois.perrad@gadz.org>
Message-ID: <20201025110140.0659c29f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Thanks for this contribution!

On Sun, 18 Oct 2020 13:11:25 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> +config BR2_PACKAGE_QUICKJS
> +	bool "quickjs"

It really has no dependencies at all on toolchain features ?

For example, here it fails to build with:

quickjs.c:33:18: fatal error: fenv.h: No such file or directory

with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_QUICKJS=y
# BR2_TARGET_ROOTFS_TAR is not set

I also see it is using fork(), which probably indicates it needs a
BR2_USE_MMU dependency.

> +define QUICKJS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CROSS_PREFIX="$(TARGET_CROSS)" \
> +		all
> +endef
> +
> +define QUICKJS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CROSS_PREFIX="$(TARGET_CROSS)" \
> +		DESTDIR=$(STAGING_DIR) \
> +		STRIP=true \

Please disable stripping here.

> +		prefix=/usr \
> +		install
> +endef
> +
> +define QUICKJS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CROSS_PREFIX="$(TARGET_CROSS)" \
> +		DESTDIR=$(TARGET_DIR) \
> +		STRIP=true \

... and here.

Indeed, we want stripping to be done by Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
