From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2011 12:06:34 +0200
Subject: [Buildroot] [PATCH] boost: New package added. Version 1.47
In-Reply-To: <1316767851-26889-1-git-send-email-a@awn.dk>
References: <1316767851-26889-1-git-send-email-a@awn.dk>
Message-ID: <20110923120634.1aff4d4f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Allan,

Thanks for contributing this package!

Le Fri, 23 Sep 2011 10:50:51 +0200,
"Allan W. Nielsen" <a@awn.dk> a ?crit :

> @@ -0,0 +1,102 @@
> +config BR2_PACKAGE_BOOST
> +	bool "boost"
> +	select BR2_PACKAGE_BZIP2
> +        select BR2_PACKAGE_ZLIB

Should be just a tab.

> +config BR2_PACKAGE_BOOST_ICU
> +	depends on BR2_PACKAGE_BOOST
> +	bool "boost-icu"

Presumably you need to select BR2_PACKAGE_ICU here.

> +config BR2_PACKAGE_BOOST_PYTHON
> +	depends on BR2_PACKAGE_BOOST
> +	bool "boost-python"

Don't you need to have Python as a dependency to build this ?

> +BOOST_VERSION = 1.47.0
> +BOOST_FILE_VERSION=$(shell echo $(BOOST_VERSION) | sed -e s/\\\./_/g)

BOOST_FILE_VERSION=$(subst .,_,$(BOOST_VERSION))

> +BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
> +BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
> +
> +TARGET_CC_VERSION = $(shell $(TARGET_CC) --version | head -n 1 | perl -pe "s/^.+?([\d\.]+)[^ ]+$$/\1/g" )

I'd prefer to rely on make/shell only rather than using Perl here.

> +ifneq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
> +BOOST_WITHOUT_FLAGS+=iostreams
> +endif

Note that you can also write:

BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),iostreams)

> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +BOOST_VARIANT=debug
> +else
> +BOOST_VARIANT=release
> +endif

and

BOOST_VARIANT = $(if $(BR2_ENABLE_DEBUG),debug,release)

> +BOOST_WITHOUT_FLAGS_COMMASEPERATED = $(shell echo $(BOOST_WITHOUT_FLAGS) | tr ' ' ',')

Maybe this can be done with a make $(subst ...) call.

> +define BOOST_CONFIGURE_CMDS
> +	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
> +	echo "#!/bin/sh" > $(@D)/gcc-wrap
> +	echo "$(TARGET_CXX) \$$@" >> $(@D)/gcc-wrap
> +	chmod +x $(@D)/gcc-wrap
> +	echo "using gcc : $(TARGET_CC_VERSION) : \"$(@D)/gcc-wrap\" : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
> +	echo "" >> $(@D)/user-config.jam
> +endef

Could you expand a bit on why a gcc wrapper is needed here ? A comment
above the CONFIGURE_CMDS about this would be great.

> +define BOOST_INSTALL_TARGET_CMDS
> +	(cd $(@D) && ./b2 -q -d+2 \
> +	--user-config=$(@D)/user-config.jam \
> +	toolset=gcc \
> +	variant=$(BOOST_VARIANT) \
> +	link=$(BOOST_LINK) \
> +	threading=$(BOOST_MULTI) \
> +	runtime-link=$(BOOST_LINK) \
> +	--prefix=$(TARGET_DIR)/usr \
> +	--layout=system install )
> +
> +	(cd $(@D) && ./bjam -d+2 \
> +	--user-config=$(@D)/user-config.jam \
> +	toolset=gcc \
> +	variant=$(BOOST_VARIANT) \
> +	link=$(BOOST_LINK) \
> +	threading=$(BOOST_MULTI) \
> +	runtime-link=$(BOOST_LINK) \
> +	--prefix=$(STAGING_DIR)/usr \
> +	--layout=system install)

This install to staging, so it should be in BOOST_INSTALL_STAGING_CMDS,
and you should set BOOST_INSTALL_STAGING=YES at the top of your package.

> +define BOOST_REMOVE_HDRS
> +	rm -rf $(TARGET_DIR)/usr/include/boost
> +endef

Not needed, everything in $(TARGET_DIR)/usr/include is removed.

> +define BOOST_STRIP
> +	find $(TARGET_DIR)/usr/lib -name "libboost*" -type f -exec $(STRIPCMD) {} \;
> +endef

Not needed, all binaries are automatically stripped.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
