From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:32:02 +0200
Subject: [Buildroot] [PATCH v2] libamcodec: New Package
In-Reply-To: <20160601211607.31807-1-daggs@gmx.com>
References: <20160601211607.31807-1-daggs@gmx.com>
Message-ID: <20160601233202.4b87a7d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration!

On Thu,  2 Jun 2016 00:16:07 +0300, Dagg wrote:

> +-CPP=g++
> +-AS=as
> +-AR=ar
> +-LD=ld
> +-NM=nm
> +-STRIP=strip
> +-OBJCOPY=objcopy
> ++CPP ?= g++
> ++AS ?= as
> ++AR ?= ar
> ++LD ?= ld
> ++NM ?= nm
> ++STRIP ?= strip
> ++OBJCOPY ?= objcopy

This patch would not be needed if $(TARGET_CONFIGURE_OPTS) was passed
as a make option instead of in the make environment. I.e

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)

instead of

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE)

However, this also means that a number of other variables from your
package Makefile will be overridden, such as CFLAGS, CXXFLAGS, LDFLAGS,
etc. This sometimes causes some problems.

> +comment "libamcodec needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

You need to replicate the architecture dependency here, so that the
comment is not needlessly displayed on architectures for which the
libamcodec option will anyway not be available, regardless of the
availability of thread support.

> +LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
> +LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
> +LIBAMCODEC_DEPENDENCIES = alsa-lib
> +
> +# this pkg uses a non standard prefix vars, so we need to use them.

# This package uses the M_PREFIX variable to construct the header and
# library paths used when compiling.

is probably a slightly better explanation.

> +define LIBAMCODEC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amavutils M_PREFIX="$(STAGING_DIR)/usr"
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amadec M_PREFIX="$(STAGING_DIR)/usr"
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amcodec PREFIX="$(STAGING_DIR)"
> +endef
> +
> +define LIBAMCODEC_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib

Full destination path needed.

> +

Unneeded empty line (already mentioned by Vicente)

> +	mkdir -p $(STAGING_DIR)/usr/include/amcodec
> +	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
> +endef
> +
> +define LIBAMCODEC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib
> +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib
> +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib

Full destination path needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
