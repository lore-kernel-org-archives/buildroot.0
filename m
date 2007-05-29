From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Tue, 29 May 2007 09:03:12 +0200
Subject: [Buildroot] ALSA for build root
In-Reply-To: <465847FE.6050304@teamboyce.co.uk>
References: <4656F77D.30303@teamboyce.co.uk> <465847FE.6050304@teamboyce.co.uk>
Message-ID: <1180422192.32245.22.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2007-05-26 at 15:45 +0100, Rod Boyce wrote:
> Rod Boyce wrote:

<cut intro about alsa patches>

> As promised attached is a patch to add ALSA packages to build root I 
> have only tested on i386 but it seems to work for me.  This patch is 
> against the latest SVN repository No. 18694.  I have not tested the 
> alsa-tools well and in-fact because I am not using X or GTK most will 
> not compile I have disabled all the the ac3dec by default.  Also I am 
> assuming the latest version of ALSA and a compatible kernel.

I am working on the exactly same package (alsa + alsa-util) for
buildroot, so far testing on an AVR32 platform.

> diff -Nu --recursive --exclude=.svn --exclude=config --exclude=libogg
> --exclude=libvorbis ../trunk/package/alsa-lib/alsa-lib.mk
> package/alsa-lib/alsa-lib.mk
> --- ../trunk/package/alsa-lib/alsa-lib.mk       1970-01-01
> 01:00:00.000000000 +0100
> +++ package/alsa-lib/alsa-lib.mk        2007-05-26 08:17:42.849975524
> +0100
> @@ -0,0 +1,135 @@
> +#############################################################
> +#
> +# ALSA library
> +#
> +#############################################################
> +
> +ALSA-LIB_VERSION=1.0.14rc4
> +ALSA-LIB_SOURCE=alsa-lib-$(ALSA-LIB_VERSION).tar.bz2
> +ALSA-LIB_SITE=ftp://ftp.alsa-project.org/pub/lib/
> +ALSA-LIB_DIR=$(BUILD_DIR)/${shell basename
> $(ALSA-LIB_SOURCE) .tar.bz2}
> +ALSA-LIB_WORKDIR=$(BUILD_DIR)/alsa-lib-$(ALSA-LIB_VERSION)
> +ALSA-LIB_CAT:=$(BZCAT)
> +ALLNKSTRGS :=
> +
> +$(DL_DIR)/$(ALSA-LIB_SOURCE):
> +       $(WGET) -P $(DL_DIR) $(ALSA-LIB_SITE)/$(ALSA-LIB_SOURCE)
> +
> +$(ALSA-LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA-LIB_SOURCE)
> +       $(ALSA-LIB_CAT) $(DL_DIR)/$(ALSA-LIB_SOURCE) | tar -C
> $(BUILD_DIR) $(TAR_OPTIONS) -
> +       touch $(ALSA-LIB_DIR)/.unpacked
> +
> +$(ALSA-LIB_DIR)/.configured: $(ALSA-LIB_DIR)/.unpacked
> +       (cd $(ALSA-LIB_DIR); rm -rf config.cache; \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               ./configure \
> +               --target=$(GNU_TARGET_NAME) \
> +               --host=$(GNU_TARGET_NAME) \
> +               --build=$(GNU_HOST_NAME) \
> +               --prefix=/usr \
> +               --exec-prefix=/usr \
> +               --sysconfdir=/etc \
> +               --libdir=/lib \

Why /lib? I prefer user libraries in /usr/lib.

AFAIK specifying --prefix=/usr should be more than enough.

> +               --datarootdir=$(STAGING_DIR)/usr/share \
> +               --datadir=/usr/share \
> +               --exec-prefix=/usr/bin \
> +               --includedir=$(STAGING_DIR)/include \
> +               --disable-docs \
> +               --with-debug=yes \

Make this optional at least, I do not need debug symbols when it is
working.

> +               $(DISABLE_NLS) \
> +       );
> +       touch $(ALSA-LIB_DIR)/.configured
> +
> +$(ALSA-LIB_WORKDIR)/src/libasound.la: $(ALSA-LIB_DIR)/.configured
> +       rm -f $@
> +       $(MAKE) CFLAGS=-g CC=$(TARGET_CC) -C $(ALSA-LIB_WORKDIR)
> +
> +$(STAGING_DIR)/lib/libasound.so.2.0.0:
> $(ALSA-LIB_WORKDIR)/src/libasound.la
> +       $(MAKE) prefix=$(STAGING_DIR) \
> +           exec_prefix=$(STAGING_DIR) \
> +           bindir=$(STAGING_DIR)/bin \
> +           sbindir=$(STAGING_DIR)/sbin \
> +           libexecdir=$(STAGING_DIR)/bin \
> +           datadir=$(STAGING_DIR)/share \
> +           sysconfdir=$(STAGING_DIR)/etc \
> +           sharedstatedir=$(STAGING_DIR)/com \
> +           localstatedir=$(STAGING_DIR)/var \
> +           libdir=$(STAGING_DIR)/lib \
> +           includedir=$(STAGING_DIR)/include \
> +           oldincludedir=$(STAGING_DIR)/include \
> +           infodir=$(STAGING_DIR)/info \
> +           mandir=$(STAGING_DIR)/man \

All these dir can easily be replaced with DESTDIR=$(STAGING_DIR).

> +           -C $(ALSA-LIB_DIR) install;
> +       @touch -c $@
> +
> +$(TARGET_DIR)/lib/libasound.so.2.0.0:
> $(STAGING_DIR)/lib/libasound.so.2.0.0
> +       @mkdir -p $(TARGET_DIR)/usr/share/alsa
> +       @mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib/smixer
> +       cp -dpf $(STAGING_DIR)/lib/libasound.so* $(TARGET_DIR)/lib
> +       cp -rdpf $(STAGING_DIR)/share/alsa/*
> $(TARGET_DIR)/usr/share/alsa/
> +       cp -rdpf $(STAGING_DIR)/lib/alsa-lib/*
> $(TARGET_DIR)/usr/lib/alsa-lib/
> +       -$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libasound.so*
> +       -$(STRIP) --strip-unneeded
> $(TARGET_DIR)/usr/lib/alsa-lib/smixer/smixer-*.so
> +       @touch -c $(TARGET_DIR)/lib/libasound.so.2.0.0
> +
> +$(TARGET_DIR)/dev/dsp:
> +       @(cd $(dir $@) && ln -sf dsp0 $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/dsp

This is handled by mdev in busybox. And when using tmpfs on /dev this is
not even visible for the filesystem. If these symlinks are needed, I
think they should added to target/ instead.

> +$(TARGET_DIR)/dev/adsp:
> +       @(cd $(dir $@) && ln -sf adsp0 $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/adsp

Same as above.

> +$(TARGET_DIR)/dev/sequencer2:
> +       @(cd $(dir $@) && ln -sf music $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/sequencer2

Same as above.

> +$(TARGET_DIR)/dev/amidi:
> +       @(cd $(dir $@) && ln -sf amidi0 $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/amidi

Same as above.

> +$(TARGET_DIR)/dev/audio:
> +       @(cd $(dir $@) && ln -sf audio0 $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/audio

Same as above.

> +$(TARGET_DIR)/dev/midi:
> +       @(cd $(dir $@) && ln -sf midi00 $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/midi

Same as above.

> +$(TARGET_DIR)/dev/mixer:
> +       @(cd $(dir $@) && ln -sf mixer0 $(notdir $@))
> +ALLNKSTRGS += $(TARGET_DIR)/dev/mixer

Same as above.

> +$(TARGET_DIR)/usr/lib/libasound.la:
> $(STAGING_DIR)/lib/libasound.so.2.0.0
> +       @mkdir -p $(TARGET_DIR)/usr/include/alsa/sound
> +       @mkdir -p $(TARGET_DIR)/usr/include/sys
> +       cp -rdpf $(STAGING_DIR)/include/alsa $(TARGET_DIR)/usr/include
> +       cp -dpf $(STAGING_DIR)/include/sys/asoundlib.h
> $(TARGET_DIR)/usr/include/sys/
> +       cp -dpf $(STAGING_DIR)/lib/libasound.la $(TARGET_DIR)/usr/lib/
> +       @touch -c $(TARGET_DIR)/usr/lib/libasound.la
> +
> +alsa-lib-headers: $(TARGET_DIR)/usr/lib/libasound.la
> +
> +alsa-lib: linux26 $(TARGET_DIR)/lib/libasound.so.2.0.0 $(ALLNKSTRGS)
> +
> +alsa-lib-source: $(DL_DIR)/$(ALSA-LIB_SOURCE)
> +
> +alsa-lib-clean:
> +       @if [ -d $(ALSA-LIB_WORKDIR)/Makefile ] ; then \
> +               $(MAKE) -C $(ALSA-LIB_WORKDIR) clean ; \
> +       fi;
> +
> +alsa-lib-dirclean:
> +       rm -rf $(ALSA-LIB_DIR) $(ALSA-LIB_WORKDIR)
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
> diff -Nu --recursive --exclude=.svn --exclude=config --exclude=libogg
> --exclude=libvorbis ../trunk/package/alsa-lib/Config.in
> package/alsa-lib/Config.in
> --- ../trunk/package/alsa-lib/Config.in 1970-01-01 01:00:00.000000000
> +0100
> +++ package/alsa-lib/Config.in  2007-05-07 18:16:23.220365544 +0100
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_ALSA-LIB
> +       bool "alsa-lib"
> +       default n
> +       help
> +         Advanced Linux Sound Architecture
> +
> +         http://www.alsa-project.org/
> +
> +config BR2_PACKAGE_ALSA-LIB_TARGET_HEADERS
> +       bool "alsa-lib headers in target"
> +       default n
> +       depends on BR2_PACKAGE_ALSA-LIB
> +       help
> +         Put headers files in the target.
> +

<cut alsa-tools Makefile and Config.in>

> diff -Nu --recursive --exclude=.svn --exclude=config --exclude=libogg
> --exclude=libvorbis ../trunk/package/alsa-utils/alsa-utils.mk
> package/alsa-utils/alsa-utils.mk
> --- ../trunk/package/alsa-utils/alsa-utils.mk   1970-01-01
> 01:00:00.000000000 +0100
> +++ package/alsa-utils/alsa-utils.mk    2007-05-13 10:25:35.339532842
> +0100
> @@ -0,0 +1,114 @@
> +#############################################################
> +#
> +# ALSA Tools

Copy-paste (-:

> +#
> +#############################################################
> +ALSA-UTILS_VERSION=1.0.14rc4
> +ALSA-UTILS_SOURCE=alsa-utils-$(ALSA-UTILS_VERSION).tar.bz2
> +ALSA-UTILS_SITE=ftp://ftp.alsa-project.org/pub/utils/
> +ALSA-UTILS_DIR=$(BUILD_DIR)/${shell basename
> $(ALSA-UTILS_SOURCE) .tar.bz2}
> +ALSA-UTILS_WORKDIR=$(BUILD_DIR)/alsa-utils-$(ALSA-UTILS_VERSION)
> +ALSA-UTILS_CAT:=$(BZCAT)
> +
> +AU_TOOLS :=
> +AU_BIN := 
> +AU_SBIN := 
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
> +
> +
> +$(DL_DIR)/$(ALSA-UTILS_SOURCE):
> +       $(WGET) -P $(DL_DIR) $(ALSA-UTILS_SITE)/$(ALSA-UTILS_SOURCE)
> +
> +$(ALSA-UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA-UTILS_SOURCE)
> +       $(ALSA-UTILS_CAT) $(DL_DIR)/$(ALSA-UTILS_SOURCE) | tar -C
> $(BUILD_DIR) $(TAR_OPTIONS) -
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
> +               --exec-prefix=$(STAGING_DIR)/usr/bin \
> +               --libdir=$(STAGING_DIR)/lib \
> +               --includedir=$(STAGING_DIR)/include \
> +               --datadir=$(STAGING_DIR)/usr/share \
> +       );
> +       touch $(ALSA-UTILS_DIR)/.configured
> +
> +$(addprefix $(ALSA-UTILS_WORKDIR)/,$(AUTOOLS)):
> $(ALSA-UTILS_DIR)/.configured
> +       $(MAKE) CC=$(TARGET_CC) -C $(ALSA-UTILS_WORKDIR)
> +
> +
> +$(addprefix $(STAGING_DIR)/,$(addprefix bin/,$(AUBIN)) $(addprefix
> sbin/,$(AUSBIN))): $(addprefix $(ALSA-UTILS_WORKDIR)/,$(AUTOOLS))
> +       $(MAKE) prefix=$(STAGING_DIR) exec_prefix=$(STAGING_DIR) \
> +           bindir=$(STAGING_DIR)/bin sbindir=$(STAGING_DIR)/sbin \
> +           libexecdir=$(STAGING_DIR)/bin datadir=$(STAGING_DIR)/share
> \
> +           sysconfdir=$(STAGING_DIR)/etc sharedstatedir=
> $(STAGING_DIR)/com \
> +           localstatedir=$(STAGING_DIR)/var libdir=$(STAGING_DIR)/lib
> \
> +           includedir=$(STAGING_DIR)/include oldincludedir=
> $(STAGING_DIR)/include \
> +           infodir=$(STAGING_DIR)/info mandir=$(STAGING_DIR)/man \
> +           -C $(ALSA-UTILS_DIR) install;

Use DESTDIR=$(STAGING_DIR) instead.

> +       touch -c $@
> +
> +$(addprefix $(TARGET_DIR)/,$(addprefix usr/bin/,$(AUBIN)) $(addprefix
> usr/sbin/,$(AUSBIN))): $(addprefix $(STAGING_DIR)/,$(addprefix bin/,
> $(AUBIN)) $(addprefix sbin/,$(AUSBIN)))
> +       @mkdir -p $(TARGET_DIR)/usr/bin
> +       @mkdir -p $(TARGET_DIR)/usr/sbin
> +       cp -dpf $(filter $(STAGING_DIR)/bin/%, $^)
> $(TARGET_DIR)/usr/bin/
> +       cp -dpf $(filter $(STAGING_DIR)/sbin/%, $^)
> $(TARGET_DIR)/usr/sbin/
> +       -$(STRIP) --strip-unneeded $@ > /dev/null 2>&1
> +       touch -c $@
> +
> +
> +alsa-utils: uclibc alsa-lib $(addprefix $(TARGET_DIR)/,$(addprefix
> usr/bin/,$(AUBIN)) $(addprefix usr/sbin/,$(AUSBIN)))
> +
> +alsa-utils-clean:
> +       @if [ -d $(ALSA-UTILS_WORKDIR)/Makefile ] ; then \
> +               $(MAKE) -C $(ALSA-UTILS_WORKDIR) clean ; \
> +       fi;
> +
> +alsa-utils-dirclean:
> +       rm -rf $(ALSA-UTILS_DIR) $(ALSA-UTILS_WORKDIR)
> +
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_ALSA-UTILS)),y)
> +TARGETS+=alsa-utils
> +endif
> diff -Nu --recursive --exclude=.svn --exclude=config --exclude=libogg
> --exclude=libvorbis ../trunk/package/alsa-utils/Config.in
> package/alsa-utils/Config.in
> --- ../trunk/package/alsa-utils/Config.in       1970-01-01
> 01:00:00.000000000 +0100
> +++ package/alsa-utils/Config.in        2007-05-07 22:13:02.134609691
> +0100
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_ALSA-UTILS
> +       bool "alsa-utils"
> +       default n
> +       help
> +         Utilities from Advanced Linux Sound Architecture
> +
> +         http://www.alsa-project.org/
> +
> diff -Nu --recursive --exclude=.svn --exclude=config --exclude=libogg
> --exclude=libvorbis ../trunk/package/Config.in package/Config.in
> --- ../trunk/package/Config.in  2007-05-25 17:08:32.583594165 +0100
> +++ package/Config.in   2007-05-25 15:22:03.475398547 +0100
> @@ -239,12 +239,15 @@
>           Support for audio libraries and applications
>  
>  if BR2_AUDIO_SUPPORT
> +source "package/alsa-lib/Config.in"
> +source "package/alsa-tools/Config.in"
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

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
