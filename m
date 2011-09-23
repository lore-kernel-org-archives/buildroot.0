From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2011 16:17:44 +0200
Subject: [Buildroot] [PATCH] boost: New package added. Version 1.47
In-Reply-To: <1316777702-12037-2-git-send-email-a@awn.dk>
References: <1316777702-12037-1-git-send-email-a@awn.dk>
 <1316777702-12037-2-git-send-email-a@awn.dk>
Message-ID: <20110923161744.4a464443@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Sep 2011 13:35:02 +0200,
"Allan W. Nielsen" <a@awn.dk> a ?crit :

> +#############################################################
> +#
> +# Boost
> +#
> +#############################################################
> +
> +BOOST_VERSION = 1.47.0
> +BOOST_FILE_VERSION=$(subst .,_,$(BOOST_VERSION))

To be consistent, space before and after =.

> +BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
> +BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
> +BOOST_INSTALL_STAGING=YES

Same here.

> +
> +TARGET_CC_VERSION = $(shell $(TARGET_CC) --version | head -n 1 | sed -e "s/.*[[:space:]]\([[:digit:].]\+$$\)/\1/g" )
> +
> +BOOST_DEPENDENCIES=bzip2
> +BOOST_DEPENDENCIES+=zlib

Same here.

> +BOOST_WITHOUT_FLAGS_COMMASEPERATED = $(shell echo $(BOOST_WITHOUT_FLAGS) | tr ' ' ',')

So, here you can use the $(subst
$(space),$(comma),$(BOOST_WITHOUT_FLAGS)) trick.

> +define BOOST_CONFIGURE_CMDS
> +	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
> +	echo "using gcc : $(TARGET_CC_VERSION) : \"$(TARGET_CXX)\" : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
> +	echo "" >> $(@D)/user-config.jam
> +endef
> +
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
> +endef
> +
> +define BOOST_INSTALL_STAGING_CMDS
> +	(cd $(@D) && ./bjam -d+2 \
> +	--user-config=$(@D)/user-config.jam \
> +	toolset=gcc \
> +	variant=$(BOOST_VARIANT) \
> +	link=$(BOOST_LINK) \
> +	threading=$(BOOST_MULTI) \
> +	runtime-link=$(BOOST_LINK) \
> +	--prefix=$(STAGING_DIR)/usr \
> +	--layout=system install)
> +endef
> +
> +define BOOST_REMOVE_HDRS
> +	rm -rf $(TARGET_DIR)/usr/include/boost
> +endef
> +
> +BOOST_POST_INSTALL_STAGING_HOOKS += BOOST_REMOVE_HDRS

Again, this is not needed, usr/include in TARGET_DIR is removed
globally by target-finalize in the main Makefile.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
