From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Wed, 06 Jun 2007 09:47:37 +0200
Subject: [Buildroot] ALSA for build root Part 2
In-Reply-To: <465DFAAF.3030704@teamboyce.co.uk>
References: <4656F77D.30303@teamboyce.co.uk> <465847FE.6050304@teamboyce.co.uk>
	<1180422192.32245.22.camel@localhost.localdomain>
	<20070529200050.GA30684@aon.at>  <465DFAAF.3030704@teamboyce.co.uk>
Message-ID: <1181116057.25173.118.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2007-05-30 at 23:29 +0100, Rod Boyce wrote:
> Bernhard Fischer wrote:
> > On Tue, May 29, 2007 at 09:03:12AM +0200, Hans-Christian Egtvedt wrote:

<cut>

> Attached is an updated patch that does not offend the sensibilities of 
> other ALSA people working on build root.  This is just alsa-lib and 
> alsa-utils I will send out a patch for more alsa stuff latter.  This 
> outputs to $(STAGING_DIR)/usr/lib which on my build happens to be a link 
> back to $(STAGING_DIR)/lib. 

Same here, AFAIK it is supposed to be that way.

> I have also removed the device links that I 
> was putting in the dev directory I had not removed this since I switched 
> over to udev.  Just --prefix=/usr did not fix all paths all of the time 
> although I think that I have the minimum custom options for configure 
> and install targets for both utilities and library makefile fragments 
> now.

Weird, what prefixes are not correct? I only have to give --prefix=/usr
and --sysconfdir=/etc .

> I also figured out what the "basename nonsense" was and while I 
> approve of the intent I used a more makefile way of doing the same thing.
> 
> Hopefully this is a more acceptable patch, if anybody has some more 
> suggestions then perhaps they would like to contribute their own ALSA 
> patch's so we can either pick the best or merge and get the best of both 
> worlds and produce a better build-root system.

Comments below.

> diff -uN --recursive ../trunk/package/alsa-lib/alsa-lib.mk
> package/alsa-lib/alsa-lib.mk
> --- ../trunk/package/alsa-lib/alsa-lib.mk       1970-01-01
> 01:00:00.000000000 +0100
> +++ package/alsa-lib/alsa-lib.mk        2007-05-30 22:58:14.604803783
> +0100
> @@ -0,0 +1,95 @@
> +#############################################################
> +#
> +# ALSA library
> +#
> +#############################################################
> +
> +ALSA-LIB_VERSION := 1.0.14rc4

Same as for alsa-tools, I prefer the ALSA_LIB_VERSION, all underscores.

> +ALSA-LIB_SOURCE := alsa-lib-$(ALSA-LIB_VERSION).tar.bz2
> +ALSA-LIB_SITE := ftp://ftp.alsa-project.org/pub/lib/
> +ALSA-LIB_DIR := $(BUILD_DIR)/$(patsubst %.tar.bz2,%,$(ALSA-LIB_SOURCE))

Again, I prefer the all written approach, to easier see what the
variable is.

> +ALSA-LIB_CAT := $(BZCAT)
> +ALSA-LIB_PATH := /usr/lib

usr/lib, skip leading /

> +ALSA-LIB_DEBUG := yes
> +ifneq ($(BR2_PACKAGE_ALSA-LIB_DEBUG_ENABLE),y)
> +ALSA-LIB_DEBUG := no
> +endif

Nice, but better to set them as "--with-debug" or "--without-debug" and
append them to the ./configure.

> +$(DL_DIR)/$(ALSA-LIB_SOURCE):
> +       $(WGET) -P $(DL_DIR) $(ALSA-LIB_SITE)/$(ALSA-LIB_SOURCE)
> +
> +$(ALSA-LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA-LIB_SOURCE)
> +       $(ALSA-LIB_CAT) $(DL_DIR)/$(ALSA-LIB_SOURCE) | tar -C
> $(BUILD_DIR) $(TAR_OPTIONS) -
> +       touch $@
> +
> +$(ALSA-LIB_DIR)/.configured: $(ALSA-LIB_DIR)/.unpacked
> +       (cd $(ALSA-LIB_DIR); rm -rf config.cache; \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               ./configure \
> +               --target=$(GNU_TARGET_NAME) \
> +               --host=$(GNU_TARGET_NAME) \
> +               --build=$(GNU_HOST_NAME) \
> +               --prefix=/usr \
> +               --sysconfdir=/etc \
> +               --libdir=$(ALSA-LIB_PATH) \

This should be set with the prefix, not needed.

Add the ALSA-LIB_DEBUG variable.

> +               --disable-docs \
> +               --with-debug=$(ALSA-LIB_DEBUG) \
> +               $(DISABLE_NLS) \
> +       );
> +       touch $@
> +
> +$(ALSA-LIB_DIR)/src/libasound.la: $(ALSA-LIB_DIR)/.configured
> +       rm -f $@
> +       $(MAKE) CFLAGS=-g CC=$(TARGET_CC) -C $(ALSA-LIB_DIR)

Only append -g if you actually are making debug target, see comment on
debug option further up.

> +$(STAGING_DIR)$(ALSA-LIB_PATH)/libasound.so.2.0.0:
> $(ALSA-LIB_DIR)/src/libasound.la
> +       $(MAKE) prefix=$(STAGING_DIR) \
> +           exec_prefix=$(STAGING_DIR) \
> +           libdir=$(STAGING_DIR)$(ALSA-LIB_PATH) \
> +           -C $(ALSA-LIB_DIR) install;
> +       @touch -c $@
> +
> +$(TARGET_DIR)$(ALSA-LIB_PATH)/libasound.so.2.0.0:
> $(STAGING_DIR)$(ALSA-LIB_PATH)/libasound.so.2.0.0
> +       @mkdir -p $(TARGET_DIR)/usr/share/alsa
> +       @mkdir -p $(TARGET_DIR)$(ALSA-LIB_PATH)/alsa-lib/smixer

$(TARGET_DIR)/$(ALSA-LIB_PATH) (add a / in between).

> +       cp -dpf $(STAGING_DIR)/lib/libasound.so* $(TARGET_DIR)/lib

exchange /lib/ with /$(ALSA-LIB_PATH)/ on both sides.

> +       cp -rdpf $(STAGING_DIR)/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
> +       cp -rdpf $(STAGING_DIR)$(ALSA-LIB_PATH)/alsa-lib/* $(TARGET_DIR)$(ALSA-LIB_PATH)/alsa-lib/

$(TARGET_DIR)/$(ALSA-LIB_PATH) (add a / in between).

> +       -$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libasound.so*

exchange /lib/ with /$(ALSA-LIB_PATH)/

> +       -$(STRIP) --strip-unneeded $(TARGET_DIR)$(ALSA-LIB_PATH)/alsa-lib/smixer/smixer-*.so

$(TARGET_DIR)/$(ALSA-LIB_PATH) (add a / in between).

> +       @touch -c $@
> +
> +
> +$(TARGET_DIR)$(ALSA-LIB_PATH)/libasound.la: $(STAGING_DIR)$(ALSA-LIB_PATH)/libasound.so.2.0.0
> +       @mkdir -p $(TARGET_DIR)/usr/include/alsa/sound
> +       @mkdir -p $(TARGET_DIR)/usr/include/sys
> +       cp -rdpf $(STAGING_DIR)/include/alsa $(TARGET_DIR)/usr/include
> +       cp -dpf $(STAGING_DIR)/include/sys/asoundlib.h $(TARGET_DIR)/usr/include/sys/
> +       cp -dpf $(STAGING_DIR)/lib/libasound.la $(TARGET_DIR)$(ALSA-LIB_PATH)

$(TARGET_DIR)/$(ALSA-LIB_PATH) (add a / in between).

> +       @touch -c $@
> +
> +alsa-lib-headers: $(TARGET_DIR)$(ALSA-LIB_PATH)/libasound.la

$(TARGET_DIR)/$(ALSA-LIB_PATH) (add a / in between).

> +
> +alsa-lib: linux26 uclibc $(TARGET_DIR)$(ALSA-LIB_PATH)/libasound.so.2.0.0
> +
> +alsa-lib-source: $(DL_DIR)/$(ALSA-LIB_SOURCE)
> +
> +alsa-lib-clean:
> +       @if [ -d $(ALSA-LIB_DIR)/Makefile ] ; then \
> +               $(MAKE) -C $(ALSA-LIB_DIR) clean ; \
> +       fi;
> +
> +alsa-lib-dirclean:
> +       rm -rf $(ALSA-LIB_DIR) $(ALSA-LIB_DIR)
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_ALSA-LIB)),y)
> +TARGETS+=alsa-lib
> +endif
> +
> +ifeq ($(strip $(BR2_PACKAGE_ALSA-LIB_TARGET_HEADERS)),y)
> +TARGETS+=alsa-lib-headers
> +endif
> diff -uN --recursive ../trunk/package/alsa-lib/Config.in package/alsa-lib/Config.in
> --- ../trunk/package/alsa-lib/Config.in 1970-01-01 01:00:00.000000000 +0100
> +++ package/alsa-lib/Config.in  2007-05-30 18:58:51.493711408 +0100
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_ALSA-LIB
> +       bool "alsa-lib"
> +       default n
> +       help
> +         Advanced Linux Sound Architecture
> +
> +         http://www.alsa-project.org/
> +
> +config BR2_PACKAGE_ALSA-LIB_DEBUG_ENABLE
> +       bool "Build alsa-lib with debug"
> +       default y
> +       depends on BR2_PACKAGE_ALSA-LIB
> +       help
> +         Build libraries with debug turned on see alsa-lib/NOTES
> +
> +config BR2_PACKAGE_ALSA-LIB_TARGET_HEADERS
> +       bool "alsa-lib headers in target"
> +       default n
> +       depends on BR2_PACKAGE_ALSA-LIB
> +       help
> +         Put headers files in the target.

Other than that, alsa-lib looks good.

> diff -uN --recursive ../trunk/package/alsa-utils/alsa-utils.mk
> package/alsa-utils/alsa-utils.mk
> --- ../trunk/package/alsa-utils/alsa-utils.mk   1970-01-01
> 01:00:00.000000000 +0100
> +++ package/alsa-utils/alsa-utils.mk    2007-05-30 22:57:20.186203681
> +0100
> @@ -0,0 +1,105 @@
> +#############################################################
> +#
> +# ALSA Utils
> +#
> +#############################################################
> +ALSA-UTILS_VERSION := 1.0.14rc4

Same comment about underscores in variables.

> +ALSA-UTILS_SOURCE := alsa-utils-$(ALSA-UTILS_VERSION).tar.bz2
> +ALSA-UTILS_SITE := ftp://ftp.alsa-project.org/pub/utils/
> +ALSA-UTILS_DIR := $(BUILD_DIR)/$(patsubst %.tar.bz2,%,$(ALSA-UTILS_SOURCE))

Again, I prefer the all written approach, to easier see what the
variable is.

> +ALSA-UTILS_CAT := $(BZCAT)
> +
> +AUTOOLS :=
> +AUBIN := 
> +AUSBIN := 
> +
> +AUTOOLS += aplay/aplay
> +AUTOOLS += aplay/arecord
> +AUTOOLS += alsaconf/alsaconf
> +AUTOOLS += alsactl/alsactl
> +AUTOOLS += alsamixer/alsamixer
> +AUTOOLS += amidi/amidi
> +AUTOOLS += amixer/amixer
> +AUTOOLS += seq/aplaymidi/arecordmidi
> +AUTOOLS += seq/aseqdump/aseqdump
> +AUTOOLS += seq/aseqnet/aseqnet
> +AUTOOLS += seq/aconnect/aconnect
> +AUTOOLS += iecset/iecset
> +AUTOOLS += speaker-test/speaker-test
> +
> +AUBIN += aconnect
> +AUBIN += alsamixer
> +AUBIN += amidi
> +AUBIN += amixer
> +AUBIN += aplay
> +AUBIN += aplaymidi
> +AUBIN += arecord
> +AUBIN += arecordmidi
> +AUBIN += aseqdump
> +AUBIN += aseqnet
> +AUBIN += iecset
> +AUBIN += speaker-test
> +
> +AUSBIN += alsaconf
> +AUSBIN += alsactl

Make all this configurable in Kconfig, will save some space on targets
where you only need alsactl and a mixer.

Same approach as the tools:

LSA_UTILS_TARGETS_ :=
ALSA_UTILS_TARGETS_y :=

ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF)	+= usr/sbin/alsaconf
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL)	+= usr/sbin/alsactl
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER)	+= usr/bin/alsamixer
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI)	+= usr/bin/amidi
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER)	+= usr/bin/amixer
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY)	+= usr/bin/aplay
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORD)	+= usr/bin/arecord
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_IECSET)	+= usr/bin/iecset
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ACONNECT)	+= usr/bin/aconnect
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAYMIDI)	+= usr/bin/aplaymidi
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI)	+= usr/bin/arecordmidi
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQDUMP)	+= usr/bin/aseqdump
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQNET)	+= usr/bin/aseqnet
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST)	+= usr/bin/speaker-test

> +$(DL_DIR)/$(ALSA-UTILS_SOURCE):
> +       $(WGET) -P $(DL_DIR) $(ALSA-UTILS_SITE)/$(ALSA-UTILS_SOURCE)
> +
> +$(ALSA-UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA-UTILS_SOURCE)
> +       $(ALSA-UTILS_CAT) $(DL_DIR)/$(ALSA-UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +       touch $(ALSA-UTILS_DIR)/.unpacked
> +
> +$(ALSA-UTILS_DIR)/.configured: $(ALSA-UTILS_DIR)/.unpacked
> +       (cd $(ALSA-UTILS_DIR); rm -rf config.cache; \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               ./configure \
> +               --target=$(GNU_TARGET_NAME) \
> +               --host=$(GNU_TARGET_NAME) \
> +               --build=$(GNU_HOST_NAME) \
> +               --disable-docs \
> +               --prefix=/usr \
> +               --sysconfdir=/etc \
> +        --disable-alsatest \
> +               $(DISABLE_NLS) \
> +       );
> +       touch $@

@ out the touches, I may have overseen some of them.

> +$(ALSA-UTILS_DIR)/aplay/aplay: $(ALSA-UTILS_DIR)/.configured
> +       $(MAKE) CC=$(TARGET_CC) -C $(ALSA-UTILS_DIR)
> +
> +
> +$(STAGING_DIR)/usr/bin/aplay: $(ALSA-UTILS_DIR)/aplay/aplay
> +       $(MAKE) prefix=$(STAGING_DIR)/usr \
> +               exec_prefix=$(STAGING_DIR)/usr \
> +           -C $(ALSA-UTILS_DIR) install;

Use DESTDIR=$(STAGING_DIR) instead.

> +$(TARGET_DIR)/usr/bin/aplay: $(STAGING_DIR)/usr/bin/aplay
> +       @mkdir -p $(TARGET_DIR)/usr/bin
> +       @mkdir -p $(TARGET_DIR)/usr/sbin
> +       cp -dpf $(addprefix $(STAGING_DIR)/usr/bin/,$(AUBIN)) $(TARGET_DIR)/usr/bin/
> +       cp -dpf $(addprefix $(STAGING_DIR)/usr/sbin/,$(AUSBIN)) $(TARGET_DIR)/usr/sbin/
> +       for i in $(addprefix $(STAGING_DIR)/usr/bin/,$(AUBIN)) $(addprefix $(STAGING_DIR)/usr/sbin/,$(AUSBIN)); \
> +       do $(STRIP) --strip-unneeded $$i > /dev/null 2>&1; done

Replace install procedure with something like:
	@mkdir -p $(TARGET_DIR)/usr/bin
	@mkdir -p $(TARGET_DIR)/usr/sbin
	for file in $(ALSA_UTILS_TARGETS_y) ; do \
		cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
		$(STRIP) --strip-unneeded $(STAGING_DIR)/$$file; \
	done
	@if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ] ; then \
		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
		mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa; \
		cp -rdpf $(STAGING_DIR)/usr/share/alsa/speaker-test/* $(TARGET_DIR)/usr/share/alsa/speaker-test/; \
		cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/* $(TARGET_DIR)/usr/share/sounds/alsa/; \
	fi;

> +
> +alsa-utils: uclibc alsa-lib $(TARGET_DIR)/usr/bin/aplay

IMHO alsactl is the "main" util.

> +
> +alsa-utils-clean:
> +       @if [ -d $(ALSA-UTILS_DIR)/Makefile ] ; then \
> +               $(MAKE) -C $(ALSA-UTILS_DIR) clean ; \
> +       fi;
> +
> +alsa-utils-dirclean:
> +       rm -rf $(ALSA-UTILS_DIR) $(ALSA-UTILS_DIR)
> +
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_ALSA-UTILS)),y)
> +TARGETS+=alsa-utils
> +endif
> diff -uN --recursive ../trunk/package/alsa-utils/Config.in package/alsa-utils/Config.in
> --- ../trunk/package/alsa-utils/Config.in       1970-01-01 01:00:00.000000000 +0100
> +++ package/alsa-utils/Config.in        2007-05-07 22:13:02.134609691 +0100
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_ALSA-UTILS
> +       bool "alsa-utils"
> +       default n
> +       help
> +         Utilities from Advanced Linux Sound Architecture
> +
> +         http://www.alsa-project.org/

And add the configuration options:
menu "ALSA utils selection"
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ALSACONF
	bool "alsaconf"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ALSACTL
	bool "alsactl"
	default y
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
	bool "alsamixer"
	default y
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_AMIDI
	bool "amidi"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_AMIXER
	bool "amixer"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_APLAY
	bool "aplay"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ARECORD
	bool "arecord"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_IECSET
	bool "iecset"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ACONNECT
	bool "aconnect"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
	bool "aplaymidi"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI
	bool "arecordmidi"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ASEQDUMP
	bool "aseqdump"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_ASEQNET
	bool "aseqnet"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
	bool "speaker-test"
	default n
	depends on BR2_PACKAGE_ALSA_UTILS

endmenu

> diff -uN --recursive ../trunk/package/Config.in package/Config.in
> --- ../trunk/package/Config.in  2007-05-30 23:10:52.748747759 +0100
> +++ package/Config.in   2007-05-28 18:53:59.880317482 +0100
> @@ -239,12 +239,14 @@
>           Support for audio libraries and applications
>  
>  if BR2_AUDIO_SUPPORT
> +source "package/alsa-lib/Config.in"
> +source "package/alsa-utils/Config.in"
>  source "package/asterisk/Config.in"
>  source "package/libid3tag/Config.in"
>  source "package/libmad/Config.in"
>  source "package/libsndfile/Config.in"
>  source "package/madplay/Config.in"
>  source "package/mpg123/Config.in"
>  endif
>  
>  menuconfig BR2_GRAPHIC_SUPPORT

Again, looks nice, will be good to have full alsa support i Buildroot.

-- 
Mvh
Hans-Christian Egtvedt
