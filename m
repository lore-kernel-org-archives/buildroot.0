From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:30:01 +0100
Subject: [Buildroot] [PATCH v3,1/3] package/tbb: new package
In-Reply-To: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
References: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208153001.286c6be7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Dec 2019 20:17:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Intel Threading Building Blocks (TBB), is a C++ library to help developers
> write highly parallelized applications. OpenCV uses it to accelerate some of
> it's more heavy weight procedures.
> 
> Signed-off-by: bradford barr <bradford@density.io>

The commit author must match the first Signed-off-by. Since either
Bradford must be kept as the author, or you need to be the first
Signed-off-by (and you can credit Bradford with something like "Based
on initial work from ..." in the commit log).

> diff --git a/package/tbb/Config.in b/package/tbb/Config.in
> new file mode 100644
> index 0000000000..8d4532795a
> --- /dev/null
> +++ b/package/tbb/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_TBB
> +	bool "tbb"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Would be good to have a small comment that says why this depends on
glibc.

OpenEmbedded had a patch that I guess made it work with non-glibc
toolchains:
https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch

> +TBB_VERSION = 2019_U9
> +TBB_SITE = $(call github,intel,tbb,$(TBB_VERSION))
> +TBB_INSTALL_STAGING = YES
> +TBB_LICENSE = Apache-2.0
> +TBB_LICENSE_FILES = LICENSE
> +
> +TBB_SO_VERSION = 2
> +TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
> +
> +TBB_BIN_PATH = $(@D)/build/linux_*_release
> +
> +define TBB_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) arch=$(BR2_ARCH) -C $(@D)

I am a bit skeptical about arch=$(BR2_ARCH). Indeed, when I look at
https://github.com/intel/tbb/blob/tbb_2019/build/linux.gcc.inc and see
the values for $(arch) that are used, it's ia32, intel64, ia64, which
we don't use in Buildroot. Are you sure we can simply pass $(BR2_ARCH)
as "arch" ? Doesn't this require a conversion between the BR2_ARCH
values in Buildroot, and the "arch" values expected by TBB Makefiles ?



> +endef
> +
> +define TBB_INSTALL_LIBS
> +	$(foreach lib,$(TBB_LIBS),
> +		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
> +			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
> +		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
> +	)
> +endef
> +
> +define TBB_INSTALL_STAGING_CMDS

Need to create the $(STAGING_DIR)/usr/include folder before copying
files into it.

> +	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include
> +	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
> +endef
> +
> +define TBB_INSTALL_TARGET_CMDS
> +	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
> +endef
> +
> +$(eval $(generic-package))

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
