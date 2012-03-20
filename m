From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 00:05:25 +0100
Subject: [Buildroot] [PATCH 1/1] Add FbTerm package for OMAP4
 (targetting pandaboard) Signed-off-by: JoM <johann.mercadier@imerir.com>
In-Reply-To: <1332281066-364-1-git-send-email-johann.mercadier@imerir.com>
References: <1332281066-364-1-git-send-email-johann.mercadier@imerir.com>
Message-ID: <20120321000525.0e834330@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johann,

Thanks for your contribution!

Le Tue, 20 Mar 2012 22:04:26 +0000,
JoM <johann.mercadier@imerir.com> a ?crit :

> ---
>  package/Config.in        |  644 ++++------------------------------------------

There has been an issue with your patch here. You have deleted all the
contents of package/Config.in and replaced it with the contents of
package/fbterm/Config.in. This is wrong. Can you fix your patch?

I also have more comments below.

> diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
> new file mode 100644
> index 0000000..aca2462
> --- /dev/null
> +++ b/package/fbterm/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_FBTERM
> +	bool "fbterm"
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_ZLIB
> +	
> +	help

No newline between the selects and the help.

> +	FbTerm (Frame buffer terminal emulator) is a fast terminal emulator and a 
> +	standalone replacement of GNU/Linux terminal that can function outside of
> +	Xorg with the frame buffer device or VESA video card.

The complete help text should be intended by one tab + two spaces.

I think the three lines above + the URL are sufficient as the help
text. No need to copy the long list of features.

> --- /dev/null
> +++ b/package/fbterm/fbterm.mk
> @@ -0,0 +1,47 @@
> +#############################################################
> +#
> +# fbterm
> +#
> +#############################################################
> +FBTERM_BINARY = fbterm
> +FBTERM_TARGET_BINARY = usr/bin/$(FBTERM_BINARY)

Please remove these variables, they are useless;

> +FBTERM_VERSION_MAJOR = 1.7
> +FBTERM_VERSION = $(FBTERM_VERSION_MAJOR).0

Remove the VERSION_MAJOR, and just do:

FBTERM_VERSION = 1.7.0

> +FBTERM_SOURCE = $(FBTERM_BINARY)-$(FBTERM_VERSION_MAJOR).tar.gz

Remove, this is the default.

> +FBTERM_SITE = http://fbterm.googlecode.com/files
> +#FBTERM_SITE_METHOD =

Remove the site method.

> +FBTERM_DIR = $(BUILD_DIR)/$(FBTERM_BINARY)-$(FBTERM_VERSION_MAJOR)

Remove, unneeded. You mixed up the old manual way of doing Makefiles
(which required such a definition, but is now a completely deprecated
way of writing the .mk file) with the new way of doing .mk files with
the GENTARGETS, AUTOTARGETS and CMAKETARGETS infrastructures.

> +#FBTERM_AUTORECONF = NO

Remove, unneeded (it's already commented)

> +FBTERM_INSTALL_STAGING = YES

fbterm seems to be a program, so there's no need to install it in the
staging directory.

> +FBTERM_INSTALL_TARGET = YES

Remove, unneeded, this is the default.

> +#FBTERM_CONF_OPT = --enable-shared

Please remove comments.

> +FBTERM_DEPENDENCIES += freetype fontconfig

Ok.

> +FBTERM_CAT = $(ZCAT)

Remove, unneeded.

> +define FBTERM_CONFIGURE_CMDS
> +	(cd $(FBTERM_DIR); rm -f config.cache; \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		./configure \
> +		--build=arm-linux- --target=arm-linux- --host=i686-pc-linux-gnu \
> +		build_alias=arm-linux- target_alias=arm-linux- \
> +		CXX=arm-linux-g++ \
> +	)
> +endef

Please remove this completely. AUTOTARGETS will already call the
configure script with the right arguments. If some things are missing
in the environment, use FBTERM_CONF_ENV, if some things are missing as
options of the configure script, use FBTERM_CONF_OPT (see the
documentation of the AUTOTARGETS infrastructure for more details).

> +define FBTERM_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(@D)
> +endef

Please remove, this is the default.

> +define FBTERM_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D $(@D)/src/$(FBTERM_BINARY) $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
> +endef

Isn't there a "make install" target that already does the right thing?
If so, we prefer using it.

> +define FBTERM_CLEAN_CMDS
> +	rm -f $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
> +	-$(MAKE) -C $(@D) clean
> +endef

This mixes uninstallation (which should go in FBTERM_UNINSTALL_CMDS)
and cleaning of the source tree (which should go in FBTERM_CLEAN_CMDS,
but is useless in this case since the AUTOTARGETS infrastructure has a
default implementation of xxx_CLEAN_CMDS which already does the right
thing).

> +$(eval $(call AUTOTARGETS,package,fbterm))

Please change this to:

$(eval $(call AUTOTARGETS))

The two last arguments are no longer needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
