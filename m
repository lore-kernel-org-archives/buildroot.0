From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 18:04:48 +0200
Subject: [Buildroot] [PATCH v2] Add Marble package.
In-Reply-To: <1396345385-28451-1-git-send-email-jeremie.scheer@armadeus.com>
References: <1396345385-28451-1-git-send-email-jeremie.scheer@armadeus.com>
Message-ID: <20150712180448.1a2a8752@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Apr 2014 11:43:05 +0200, jeremie.scheer at armadeus.com wrote:

>  comment "Other GUIs"
> -source "package/efl/Config.in"
> +source "package/marble/Config.in"

This is probably not the right place: this place is for graphical
libraries, not graphical applications.

> +endmenu #Earth maps

#Earth maps -> # Earth maps

and ditto for all other comments.

> diff --git a/package/marble/marble.mk b/package/marble/marble.mk
> new file mode 100644
> index 0000000..3a73a25
> --- /dev/null
> +++ b/package/marble/marble.mk
> @@ -0,0 +1,199 @@
> +#############################################################
> +#
> +# KDE Marble
> +#
> +#############################################################

80 # signs are part of our coding style, and the text should just be
the name of the package, i.e. 'marble'. Yes rules are meant to be
silly :)

> +MARBLE_VERSION = 0299004157ce00cf901b6113c4ac14fa0c323c00
> +MARBLE_SOURCE = marble-$(MARBLE_VERSION)-source.tar.gz

Having MARBLE_SOURCE defined to a tarball with MARBLE_SITE pointing to a
Git repository does not make sense.

> +MARBLE_SITE = git://anongit.kde.org/marble.git

MARBLE_LICENSE and MARBLE_LICENSE_FILES are required.

> +MARBLE_DEPENDENCIES = qt
> +
> +MARBLE_CONF_OPT += -DQTONLY=ON
> +MARBLE_CONF_OPT += -DTILES_AT_COMPILETIME=OFF

The variable is now called <pkg>_CONF_OPTS, and it should be in a
single command here:

MARBLE_CONF_OPTS = \
	-DQTONLY=ON \
	-DTILES_AT_COMPILETIME=OFF

> +MARBLE_INSTALL_STAGING = YES

Why ?

> +
> +define MARBLE_CLEAN_TARGET_INSTALL
> +	rm -rf $(TARGET_DIR)/usr/share/marble/data/*
> +	rm -rf $(TARGET_DIR)/usr/include/marble
> +	rm -rf $(TARGET_DIR)/usr/bin/marble
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_CLEAN_TARGET_INSTALL

Why are you removing everything?

Removing $(TARGET_DIR)/usr/include is not needed, it's already done
automatically by Buildroot at the end of the build.

And removing the binary should only be done if
BR2_PACKAGE_MARBLE_BINARY is disabled.

But there's a more general question: why would the user want to *not*
install the binary?

> +ifeq ($(BR2_PACKAGE_MARBLE_BINARY),y)
> +define MARBLE_INSTALL_BINARY
> +	cp -rf $(STAGING_DIR)/usr/bin/marble $(TARGET_DIR)/usr/bin
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BINARY
> +endif

As suggested above, do the opposite: remove the binary if
BR2_PACKAGE_MARBLE_BINARY is disabled.

> +
> +ifeq ($(BR2_PACKAGE_MARBLE_AUDIO),y)
> +define MARBLE_INSTALL_AUDIO_FILES
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/audio $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_AUDIO_FILES
> +endif

Ditto.

> +
> +ifeq ($(BR2_PACKAGE_MARBLE_BITMAPS),y)
> +define MARBLE_INSTALL_BITMAPS
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/bitmaps $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BITMAPS
> +endif

Ditto.

> +
> +ifeq ($(BR2_PACKAGE_MARBLE_FLAGS),y)
> +define MARBLE_INSTALL_FLAGS
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/flags $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_FLAGS
> +endif

Ditto.

And you can probably factorize that a bit by doing something like:

MARBLE_TO_REMOVE_$(BR2_PACKAGE_MARBLE_BITMAPS) += usr/share/marble/data/bitmaps
MARBLE_TO_REMOVE_$(BR2_PACKAGE_MARBLE_FLAGS) += usr/share/marble/data/flags

and then:

	$(if $(MARBLE_TO_REMOVE_),$(RM) -rf $(MARBLE_TO_REMOVE_))


> +ifeq ($(BR2_PACKAGE_MARBLE_BLUEMARBLE),y)
> +define MARBLE_INSTALL_BLUEMARBLE_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/bluemarble $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BLUEMARBLE_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_CITYLIGHTS),y)
> +define MARBLE_INSTALL_CITYLIGHTS_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/citylights $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CITYLIGHTS_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_CLOUDS),y)
> +define MARBLE_INSTALL_CLOUDS_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/clouds $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CLOUDS_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_HILLSHADING),y)
> +define MARBLE_INSTALL_HILLSHADING_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/hillshading $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_HILLSHADING_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_OPENSTREETMAP),y)
> +define MARBLE_INSTALL_OPENSTREETMAP_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/openstreetmap $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_OPENSTREETMAP_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_PLAIN),y)
> +define MARBLE_INSTALL_PLAIN_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/plain $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PLAIN_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_PRECIP_DEC),y)
> +define MARBLE_INSTALL_PRECIP_DEC_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/precip-dec $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PRECIP_DEC_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_PRECIP_JULY),y)
> +define MARBLE_INSTALL_PRECIP_JULY_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/precip-july $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PRECIP_JULY_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_SCHAGEN),y)
> +define MARBLE_INSTALL_SCHAGEN_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/schagen1689 $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SCHAGEN_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_SRTM),y)
> +define MARBLE_INSTALL_SRTM_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/srtm $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SRTM_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_SRTM2),y)
> +define MARBLE_INSTALL_SRTM2_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/srtm2 $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SRTM2_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_TEMP_DEC),y)
> +define MARBLE_INSTALL_TEMP_DEC_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/temp-dec $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_TEMP_DEC_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_TEMP_JULY),y)
> +define MARBLE_INSTALL_TEMP_JULY_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/earth/temp-july $(TARGET_DIR)/usr/share/marble/data/maps/earth
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_TEMP_JULY_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_CLEMENTINE),y)
> +define MARBLE_INSTALL_CLEMENTINE_MAP
> +	mkdir -p $(TARGET_DIR)/usr/share/marble/data/maps/moon
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/maps/moon/clementine $(TARGET_DIR)/usr/share/marble/data/maps/moon
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CLEMENTINE_MAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_MWDBII),y)
> +define MARBLE_INSTALL_MWDBII_FILES
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/mwdbii $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_MWDBII_FILES
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_PLACEMARKS),y)
> +define MARBLE_INSTALL_PLACEMARKS
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/placemarks $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PLACEMARKS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_STARS),y)
> +define MARBLE_INSTALL_STARS_DATA
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/stars $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_STARS_DATA
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_SVG),y)
> +define MARBLE_INSTALL_SVG
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/svg $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SVG
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MARBLE_WEATHER),y)
> +define MARBLE_INSTALL_WEATHER_DATA
> +	cp -rf $(STAGING_DIR)/usr/share/marble/data/weather $(TARGET_DIR)/usr/share/marble/data
> +endef
> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_WEATHER_DATA
> +endif

Ditto, please factorize that in a smarter way.

Also, can you think of using string option to give the list of things
to install (like lists of datasets) rather than having one Config.in
option for each element? It seems like each new Marble version will
bring new elements to be installed, which would require even more
Config.in options to be added.

Care to repost an updated version with those issues fixed?

In the mean time, we'll mark your patch as Changes Requested in
patchwork.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
