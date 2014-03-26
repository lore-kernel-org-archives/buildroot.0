From: Jeremie Scheer <jeremie.scheer@armadeus.com>
Date: Wed, 26 Mar 2014 15:07:23 +0100
Subject: [Buildroot] [PATCH] Add package Marble
In-Reply-To: <53170267.9080903@free.fr>
References: <1393940100-15788-1-git-send-email-jeremie.scheer@armadeus.com>
 <53170267.9080903@free.fr>
Message-ID: <5332DF1B.2040601@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On 03/05/2014 11:54 AM, Julien Boibessot wrote:
> Hello J?r?mie,
>
> On 03/04/2014 02:35 PM, jeremie.scheer at armadeus.com wrote:
>> From: Jeremie Scheer <jeremie.scheer@armadeus.com>
>>
>>
>> Signed-off-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
>> ---
>>  package/Config.in        |    3 +-
>>  package/marble/Config.in |  145 ++++++++++++++++++++++++++++
>>  package/marble/marble.mk |  238 ++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 385 insertions(+), 1 deletion(-)
>>  create mode 100644 package/marble/Config.in
>>  create mode 100644 package/marble/marble.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 417c9b8..19a48a4 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -199,8 +199,9 @@ source "package/sdl_sound/Config.in"
>>  source "package/sdl_ttf/Config.in"
>>  
>>  comment "Other GUIs"
>> -source "package/efl/Config.in"
>> +source "package/marble/Config.in"
>>  source "package/qt/Config.in"
>> +source "package/efl/Config.in"
> why move EFL stuff ?
The problem is that what is put after Qt package in the menu config
file, with the flag BR2_PACKAGE_QT, is placed inside Qt menu.
So I've put package EFL between Qt package and other packages that
depends on Qt, and that fixes the problem.
>
>>  
>>  if BR2_PACKAGE_QT
>>  comment "QT libraries and helper libraries"
>> diff --git a/package/marble/Config.in b/package/marble/Config.in
>> new file mode 100644
>> index 0000000..282ed34
>> --- /dev/null
>> +++ b/package/marble/Config.in
>> @@ -0,0 +1,145 @@
>> +comment "Marble needs Qt to be installed"
>> +	depends on !BR2_PACKAGE_QT
>> +
>> +menuconfig BR2_PACKAGE_MARBLE
>> +	bool "KDE Marble"
>> +	depends on BR2_PACKAGE_QT
>> +	select BR2_PACKAGE_QT_SCRIPT
>> +	select BR2_PACKAGE_QT_SVG
>> +	select BR2_PACKAGE_QT_WEBKIT
>> +	select BR2_PACKAGE_QT_XML
>> +	help
>> +	  Compile & install KDE Marble for
>> +	  geolocalization applications.
>> +
> Remove "Compile & install" and be more accurate on Marble purpose + add
> the website please.
>
>> +if BR2_PACKAGE_MARBLE
>> +
>> +config BR2_PACKAGE_MARBLE_BINARY
>> +	bool "Marble binary"
>> +	help
>> +	  Install Marble binary on target
> why this option ?
Marble is a library for Qt, but it can also be used as a stand-alone
application. For this, Marble binary can be useful.
>
>> +
>> +config BR2_PACKAGE_MARBLE_AUDIO
>> +	bool "Audio files"
>> +	help
>> +	  Install audio files on target
>> +
> option description is not user friendly, "install audio files" would be
> better I think.
> "on target" is not needed in help
>
>> +config BR2_PACKAGE_MARBLE_BITMAPS
>> +	bool "Bitmaps"
>> +	help
>> +	  Install bitmaps on target
>> +
> idem
>
>> +config BR2_PACKAGE_MARBLE_FLAGS
>> +	bool "Flags"
>> +	help
>> +	  Install flags on target
>> +
> idem, what are "Flags" ?
These are country flags.
>
>> +menu "Maps"
>> +
>> +menu "Earth maps"
>> +
>> +config BR2_PACKAGE_MARBLE_BLUEMARBLE
>> +	bool "Bluemarble"
>> +	help
>> +	  Install Bluemarble map on target
>> +
> "on target" not needed in help
>
>> +config BR2_PACKAGE_MARBLE_CITYLIGHTS
>> +	bool "Citylights"
>> +	help
>> +	  Install Citylights map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_CLOUDS
>> +	bool "Clouds"
>> +	help
>> +	  Install Clouds map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_HILLSHADING
>> +	bool "Hillshading"
>> +	help
>> +	  Install Hillshading map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_OPENSTREETMAP
>> +	bool "OpenStreetMap"
>> +	help
>> +	  Install Openstreetmap map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_PLAIN
>> +	bool "Plain"
>> +	help
>> +	  Install Plain map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_PRECIP_DEC
>> +	bool "December precipitations"
>> +	help
>> +	  Install December precipitation map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_PRECIP_JULY
>> +	bool "July precipitations"
>> +	help
>> +	  Install July precipitation map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_SCHAGEN
>> +	bool "Schagen 1689"
>> +	help
>> +	  Install Schagen 1689 map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_SRTM
>> +	bool "SRTM"
>> +	help
>> +	  Install SRTM map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_SRTM2
>> +	bool "SRTM 2"
>> +	help
>> +	  Install SRTM 2 map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_TEMP_DEC
>> +	bool "December temperatures"
>> +	help
>> +	  Install December temperature map on target
>> +
> idem
>> +config BR2_PACKAGE_MARBLE_TEMP_JULY
>> +	bool "July temperatures"
>> +	help
>> +	  Install July temperature map on target
>> +
> idem
>> +endmenu #Earth maps
>> +
>> +menu "Moon maps"
>> +
>> +config BR2_PACKAGE_MARBLE_CLEMENTINE
>> +	bool "Clementine"
>> +	help
>> +	  Install Clementine map on target
>> +
>> +endmenu #Moon maps
>> +
>> +endmenu #Maps
>> +
>> +config BR2_PACKAGE_MARBLE_MWDBII
>> +	bool "MWDBII files"
>> +	help
>> +	  Install MWDBII files on target
> idem + be more verbose in help
>> +
>> +config BR2_PACKAGE_MARBLE_PLACEMARKS
>> +	bool "Placemarks"
>> +	help
>> +	  Install placemarks on target
> idem
>> +
>> +config BR2_PACKAGE_MARBLE_STARS
>> +	bool "Stars"
>> +	help
>> +	  Install star data on target
> idem
>> +
>> +config BR2_PACKAGE_MARBLE_SVG
>> +	bool "SVG files"
>> +	help
>> +	  Install SVG files on target
> idem
>> +
>> +config BR2_PACKAGE_MARBLE_WEATHER
>> +	bool "Weather data"
>> +	help
>> +	  Install weather data on target
> idem
>> +
>> +endif #BR2_PACKAGE_MARBLE
>> +
>> diff --git a/package/marble/marble.mk b/package/marble/marble.mk
>> new file mode 100644
>> index 0000000..54d1c0e
>> --- /dev/null
>> +++ b/package/marble/marble.mk
>> @@ -0,0 +1,238 @@
>> +#############################################################
> 80 x #
>> +#
>> +# KDE Marble
> lower cases
>> +#
>> +#############################################################
>> +MARBLE_VERSION = 88ba87c90195dede8594375b2f81c9d926db3924
>> +MARBLE_SOURCE = marble-$(MARBLE_VERSION)-source.tar.gz
>> +MARBLE_SITE = git://anongit.kde.org/marble.git
>> +MARBLE_SITE_METHOD = git
> I think it's redundant with MARBLE_SITE
Yes, I will remove it.
>
>> +
>> +MARBLE_DEPENDENCIES = qt
>> +
>> +MARBLE_CONF_OPT += -DQTONLY=ON
>> +MARBLE_CONF_OPT += -DTILES_AT_COMPILETIME=OFF
>> +
>> +define MARBLE_CONFIGURE_CMDS
>> +	(cd $(@D) && \
>> +	rm -f CMakeCache.txt && \
> indentation
>> +	$(HOST_DIR)/usr/bin/cmake $(@D) \
>> +		-DCMAKE_TOOLCHAIN_FILE="$(BASE_DIR)/host/usr/share/buildroot/toolchainfile.cmake" \
>> +		$(MARBLE_CONF_OPT) \
>> +	)
> cmake infrastructure doesn't already handle that ?
When this patch was made, Buildroot's cmake compilation didn't handle
it, but it seems that now that is correctly done. So I will remove this
define.
>
>> +endef
>> +
>> +define MARBLE_BUILD_CMDS
>> +	$(MAKE) -C $(@D)
>> +endef
> cmake infrastructure doesn't already handle that ?
Same as Marble configure command.
>> +
>> +MARBLE_INSTALL_STAGING = YES
>> +
>> +define MARBLE_CLEAN_TARGET_INSTALL
>> +	rm -rf $(TARGET_DIR)/usr/local/share/marble/data/*
>> +	rm -rf $(TARGET_DIR)/usr/local/include/marble
>> +	rm -rf $(TARGET_DIR)/usr/local/bin/marble
>> +endef
> cf remark on the hooks below...
>
>> +
>> +define MARBLE_INSTALL_BINARY
>> +	cp -rf $(STAGING_DIR)/usr/local/bin/marble $(TARGET_DIR)/usr/local/bin
>> +endef
>> +
>> +define MARBLE_INSTALL_AUDIO_FILES
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/audio $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_BITMAPS
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/bitmaps $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_FLAGS
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/flags $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_BLUEMARBLE_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/bluemarble $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_CITYLIGHTS_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/citylights $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_CLOUDS_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/clouds $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_HILLSHADING_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/hillshading $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_OPENSTREETMAP_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/openstreetmap $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_PLAIN_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/plain $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_PRECIP_DEC_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/precip-dec $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_PRECIP_JULY_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/precip-july $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_SCHAGEN_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/schagen1689 $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_SRTM_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/srtm $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_SRTM2_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/srtm2 $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_TEMP_DEC_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/temp-dec $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_TEMP_JULY_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/temp-july $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
>> +endef
>> +
>> +define MARBLE_INSTALL_CLEMENTINE_MAP
>> +	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/moon
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/moon/clementine $(TARGET_DIR)/usr/local/share/marble/data/maps/moon
>> +endef
>> +
>> +define MARBLE_INSTALL_MWDBII_FILES
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/mwdbii $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_PLACEMARKS
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/placemarks $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_STARS_DATA
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/stars $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_SVG
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/svg $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +define MARBLE_INSTALL_WEATHER_DATA
>> +	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/weather $(TARGET_DIR)/usr/local/share/marble/data
>> +endef
>> +
>> +
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_CLEAN_TARGET_INSTALL
>> +
> set the hooks just after the define please
>
>> +ifeq ($(BR2_PACKAGE_MARBLE_BINARY),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BINARY
>> +endif
> merge the hook with the define please, and put all inside ifeq
>
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_AUDIO),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_AUDIO_FILES
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_BITMAPS),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BITMAPS
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_FLAGS),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_FLAGS
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_BLUEMARBLE),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BLUEMARBLE_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_CITYLIGHTS),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CITYLIGHTS_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_CLOUDS),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CLOUDS_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_HILLSHADING),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_HILLSHADING_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_OPENSTREETMAP),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_OPENSTREETMAP_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_PLAIN),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PLAIN_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_PRECIP_DEC),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PRECIP_DEC_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_PRECIP_JULY),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PRECIP_JULY_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_SCHAGEN),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SCHAGEN_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_SRTM),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SRTM_MAP
>> +endif
> pfff... idem... :-)
> no idea how to factorize that ??
>
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_SRTM2),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SRTM2_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_TEMP_DEC),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_TEMP_DEC_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_TEMP_JULY),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_TEMP_JULY_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_CLEMENTINE),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CLEMENTINE_MAP
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_MWDBII),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_MWDBII_FILES
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_PLACEMARKS),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PLACEMARKS
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_STARS),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_STARS_DATA
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_SVG),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SVG
>> +endif
> idem
>> +
>> +ifeq ($(BR2_PACKAGE_MARBLE_WEATHER),y)
>> +MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_WEATHER_DATA
>> +endif
> idem
>> +
>> +$(eval $(cmake-package))
> Regards,
> Julien
>


-- 
J?r?mie Scheer
Software Engineer
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
Armadeus Systems - A new vision of the embedded world
http://www.armadeus.com
