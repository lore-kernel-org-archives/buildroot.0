From: daggs <daggs@gmx.com>
Date: Thu, 2 Jun 2016 07:15:54 +0200
Subject: [Buildroot] [PATCH v2] libamcodec: New Package
In-Reply-To: <20160601233202.4b87a7d1@free-electrons.com>
References: <20160601211607.31807-1-daggs@gmx.com>,
 <20160601233202.4b87a7d1@free-electrons.com>
Message-ID: <trinity-c4682c6f-5d4c-4b50-a55e-c13bce625378-1464844554036@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Hello,
> 
> Thanks for this new iteration!
> 
> On Thu,  2 Jun 2016 00:16:07 +0300, Dagg wrote:
> 
> > +-CPP=g++
> > +-AS=as
> > +-AR=ar
> > +-LD=ld
> > +-NM=nm
> > +-STRIP=strip
> > +-OBJCOPY=objcopy
> > ++CPP ?= g++
> > ++AS ?= as
> > ++AR ?= ar
> > ++LD ?= ld
> > ++NM ?= nm
> > ++STRIP ?= strip
> > ++OBJCOPY ?= objcopy
> 
> This patch would not be needed if $(TARGET_CONFIGURE_OPTS) was passed
> as a make option instead of in the make environment. I.e
> 
> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)
> 
> instead of
> 
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE)
> 
> However, this also means that a number of other variables from your
> package Makefile will be overridden, such as CFLAGS, CXXFLAGS, LDFLAGS,
> etc. This sometimes causes some problems.
seems like I've encountered such an issue,
using the format above resulted in missing includes error, e.g. local paths are not part of the flags.
what is the proper way to fix it?

> 
> > +comment "libamcodec needs a toolchain w/ threads"
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> You need to replicate the architecture dependency here, so that the
> comment is not needlessly displayed on architectures for which the
> libamcodec option will anyway not be available, regardless of the
> availability of thread support.
> 
> > +LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
> > +LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
> > +LIBAMCODEC_DEPENDENCIES = alsa-lib
> > +
> > +# this pkg uses a non standard prefix vars, so we need to use them.
> 
> # This package uses the M_PREFIX variable to construct the header and
> # library paths used when compiling.
> 
> is probably a slightly better explanation.
> 
correct, done.

> > +define LIBAMCODEC_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amavutils M_PREFIX="$(STAGING_DIR)/usr"
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amadec M_PREFIX="$(STAGING_DIR)/usr"
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amcodec PREFIX="$(STAGING_DIR)"
> > +endef
> > +
> > +define LIBAMCODEC_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib
> 
> Full destination path needed.
> 
not sure what you mean by Full destination path needed, can you elaborate please?

> > +
> 
> Unneeded empty line (already mentioned by Vicente)
> 
done.

> > +	mkdir -p $(STAGING_DIR)/usr/include/amcodec
> > +	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
> > +endef
> > +
> > +define LIBAMCODEC_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib
> 
> Full destination path needed.
> 
the same as above.

> Thanks,
> 
> Thomas

Dagg.
