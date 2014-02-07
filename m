From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 07 Feb 2014 18:17:56 +0100
Subject: [Buildroot] [RFC PATCH] Add OpenTyrian package (SDL game)
In-Reply-To: <52F2BE4F.3080600@mind.be>
References: <1391624243-10898-1-git-send-email-julien.boibessot@free.fr>
 <52F2BE4F.3080600@mind.be>
Message-ID: <52F51544.2060005@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Arnout, Thomas,
thanks for the reviews !

On 02/05/2014 11:42 PM, Arnout Vandecappelle wrote:
> On 05/02/14 19:17, julien.boibessot at free.fr wrote:
>> From: Julien Boibessot <julien.boibessot@armadeus.com>
>>
>>
>> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
>> ---
>>  Comments are welcome on why DOWNLOAD macro fails to get data and if it's
>>  the good way to do !!
>>
>>  package/Config.in                |    1 +
>>  package/opentyrian/Config.in     |   25 +++++++++++++++++
>>  package/opentyrian/opentyrian.mk |   55 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 81 insertions(+), 0 deletions(-)
>>  create mode 100644 package/opentyrian/Config.in
>>  create mode 100644 package/opentyrian/opentyrian.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 631d8b2..b8a67f3 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -159,6 +159,7 @@ source "package/doom-wad/Config.in"
>>  source "package/gnuchess/Config.in"
>>  source "package/lbreakout2/Config.in"
>>  source "package/ltris/Config.in"
>> +source "package/opentyrian/Config.in"
>>  source "package/prboom/Config.in"
>>  source "package/rubix/Config.in"
>>  endmenu
>> diff --git a/package/opentyrian/Config.in b/package/opentyrian/Config.in
>> new file mode 100644
>> index 0000000..81050bd
>> --- /dev/null
>> +++ b/package/opentyrian/Config.in
>> @@ -0,0 +1,25 @@
>> +config BR2_PACKAGE_OPENTYRIAN
>> +	bool "OpenTyrian"
>> +	select BR2_PACKAGE_SDL
>> +	select BR2_PACKAGE_SDL_NET
>> +	help
>> +	  OpenTyrian is a port of the DOS shoot-em-up Tyrian. It uses SDL,
>> +	  making it easily cross-platform.
>> +	  The original Tyrian data files, that have since been released as
>> +	  Freeware, will be installed.
>> +	  A display with minimum 640x480 resolution and a keyboard are needed
>> +	  to play the game.
>> +	  If you want some sound, activate ALSA with OSS emulation.
>> +
>> +	  http://code.google.com/p/opentyrian/
>> +
>> +if BR2_PACKAGE_OPENTYRIAN
>> +
>> +config BR2_PACKAGE_OPENTYRIAN_NET
>> +	bool "network support"
>> +	default y
>> +	select BR2_PACKAGE_SDL_NET
>> +	help
>> +	  Activates network support in OpenTyrian. Will add SDL_net.
>> +
>> +endif
>> diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
>> new file mode 100644
>> index 0000000..f0a635d
>> --- /dev/null
>> +++ b/package/opentyrian/opentyrian.mk
>> @@ -0,0 +1,55 @@
>> +###############################################################################
>> +#
>> +# OpenTyrian
>> +#
>> +###############################################################################
>> +
>> +OPENTYRIAN_VERSION = 2.1.20130907
>> +OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases/
>> +OPENTYRIAN_SOURCE = opentyrian-$(OPENTYRIAN_VERSION)-src.tar.gz
>> +OPENTYRIAN_LICENSE = GPLv2+ Freeware
>> +OPENTYRIAN_LICENSE_FILES = COPYING README
>> +
>> +OPENTYRIAN_DEPENDENCIES = sdl
>> +
>> +ifeq ($(BR2_PACKAGE_OPENTYRIAN_NET),y)
>> +OPENTYRIAN_DEPENDENCIES += sdl_net
>> +OPENTYRIAN_NETWORK = true
>> +else
>> +OPENTYRIAN_NETWORK = false
>> +endif
>> +
>> +OPENTYRIAN_DATA = tyrian21.zip
>> +OPENTYRIAN_DATA_SITE = http://sites.google.com/a/camanis.net/opentyrian/tyrian/
>  Why not simply http://www.camanis.net/opentyrian/tyrian21.zip ?

it also works :-)

>
>> +
>> +define OPENTYRIAN_DOWNLOAD_DATA
>> +	@$(call MESSAGE,Downloading data)
>> +#	@$(call DOWNLOAD,$(OPENTYRIAN_DATA_SITE),$(OPENTYRIAN_DATA)) << doesn't work !!
>  DOWNLOAD expects the full URL as the first argument. The optional second
> argument exists for cases where the local file should be different than
> the base of the URL (e.g. if it contains question marks or other madness).

I think I will create an opentyrian-data package to solve my problem, as
Thomas advised.
(sources and data aren't in the same server directories)

>
>> +	cd $(DL_DIR); $(WGET) -nc $(OPENTYRIAN_DATA_SITE)/$(OPENTYRIAN_DATA)
>> +endef
>> +OPENTYRIAN_POST_DOWNLOAD_HOOKS += OPENTYRIAN_DOWNLOAD_DATA
>> +
>> +define OPENTYRIAN_EXTRACT_DATA
>> +	unzip $(DL_DIR)/$(OPENTYRIAN_DATA) -d $(@D)
>> +endef
>> +OPENTYRIAN_POST_EXTRACT_HOOKS += OPENTYRIAN_EXTRACT_DATA
>> +
>> +define OPENTYRIAN_BUILD_CMDS
>> +        $(MAKE) PLATFORM=UNIX \
>> +		CC="$(TARGET_CC)" \
>> +		STRIP="$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)" \
>  Everything in target is already stripped automatically at the end, so
> it's usually not needed to pass this.

yes but OpenTyrian Makefile otherwise uses host strip and fails to build.
So I will use Thomas method (STRIP=/bin/true).

>
>> +		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
>> +		LDFLAGS="-lm" \
>> +		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
>> +		-C $(@D) release
>> +endef
>> +
>> +define OPENTYRIAN_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/opentyrian $(TARGET_DIR)/usr/games/opentyrian
>  We prefer to install everything in /usr/bin.

prboom & rubix packages already explicitly install everything in
/usr/games/... What should I do ?

Best regards,

Julien


>
>  Regards,
>  Arnout
>
>
>> +	mkdir -p $(TARGET_DIR)/usr/share/opentyrian/data/
>> +	cp $(@D)/tyrian21/* $(TARGET_DIR)/usr/share/opentyrian/data/
>> +	rm -f $(TARGET_DIR)/usr/share/opentyrian/data/*.doc
>> +	rm -f $(TARGET_DIR)/usr/share/opentyrian/data/*.exe
>> +endef
>> +
>> +$(eval $(generic-package))
>>
>
