From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:01:24 +0200
Subject: [Buildroot] [PATCH 2/2] b2g: new package
In-Reply-To: <1468663217-21940-2-git-send-email-francois.perrad@gadz.org>
References: <1468663217-21940-1-git-send-email-francois.perrad@gadz.org>
 <1468663217-21940-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160716150124.4349f570@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 12:00:17 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for this patch. It looks mostly good, but I have some questions.

First of all, the obvious annoying aspect is the need of autoconf2.13.
Do they have some plans to update to a newer decent version of
autoconf, or would we have to keep autoconf2.13 forever?

>  package/Config.in                  |   1 +
>  package/b2g/0001-fix-linking.patch |  28 +++++++++
>  package/b2g/Config.in              |  29 +++++++++
>  package/b2g/b2g.mk                 | 125 +++++++++++++++++++++++++++++++++++++

Should the package be named boot2gecko, in order to be more explicit
than b2g ? I'm not sure, since indeed from upstream's point of view the
name is b2g. Maybe we should keep it.

> diff --git a/package/b2g/0001-fix-linking.patch b/package/b2g/0001-fix-linking.patch
> new file mode 100644
> index 0000000..5433160
> --- /dev/null
> +++ b/package/b2g/0001-fix-linking.patch
> @@ -0,0 +1,28 @@
> +fix linking
> +
> +b2g-2_5_20160125/dom/audiochannel/AudioChannelService.cpp:580: error:
> + undefined reference to 'mozilla::dom::TabParent::AudioChannelChangeNotification(nsPIDOMWindow*, mozilla::dom::AudioChannel, float, bool)'
> +collect2: error: ld returned 1 exit status
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +diff --git a/dom/audiochannel/AudioChannelService.cpp b/dom/audiochannel/AudioChannelService.cpp
> +index 7c9593e..cd9e1a5 100644
> +--- a/dom/audiochannel/AudioChannelService.cpp
> ++++ b/dom/audiochannel/AudioChannelService.cpp
> +@@ -574,11 +574,13 @@ AudioChannelService::RefreshAgentsVolumeAndPropagate(AudioChannel aAudioChannel,
> +     return;
> +   }
> + 
> ++#if 0
> +   for (uint32_t i = 0; i < mTabParents.Length(); ++i) {
> +     mTabParents[i]->AudioChannelChangeNotification(aWindow, aAudioChannel,
> +                                                    winData->mChannels[(uint32_t)aAudioChannel].mVolume,
> +                                                    winData->mChannels[(uint32_t)aAudioChannel].mMuted);
> +   }
> ++#endif

You're just removing the problematic code. Is this the right fix?

> diff --git a/package/b2g/Config.in b/package/b2g/Config.in
> new file mode 100644
> index 0000000..6c932de
> --- /dev/null
> +++ b/package/b2g/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_B2G
> +	bool "b2g"
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PDF
> +	select BR2_PACKAGE_CAIRO_TEE
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LIBGTK2
> +	select BR2_PACKAGE_LIBVPX
> +	select BR2_PACKAGE_OPENSSL # libcurl4-openssl
> +	select BR2_PACKAGE_XLIB_LIBXT
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2

Also needed because of the libvpx select.

> +	depends on BR2_USE_MMU # libgtk2
> +	depends on BR2_USE_WCHAR # libgtk2
> +	help
> +	  B2G (Boot 2 Gecko), the Firefox OS desktop client.
> +
> +	  https://developer.mozilla.org/en-US/Firefox_OS
> +
> +comment "b2g needs a toolchain w/wchar, threads, C++"

Space between w/ and wchar.

> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/b2g/b2g.mk b/package/b2g/b2g.mk
> new file mode 100644
> index 0000000..172b062
> --- /dev/null
> +++ b/package/b2g/b2g.mk
> @@ -0,0 +1,125 @@
> +################################################################################
> +#
> +# b2g
> +#
> +################################################################################
> +
> +B2G_VERSION = 2_5_20160125
> +B2G_SITE = https://hg.mozilla.org/releases/mozilla-b2g44_v2_5/archive
> +B2G_SOURCE = B2G_$(B2G_VERSION)_MERGEDAY.tar.gz
> +B2G_LICENSE = MPLv2.0
> +B2G_LICENSE_FILES = toolkit/content/license.html
> +
> +B2G_DEPENDENCIES = host-autoconf2-13 host-python jpeg libcurl libevent libgtk2 libvpx xlib_libXt
> +
> +define B2G_MOZCONFIG_COMMON
> +	echo "ac_add_options --prefix=/usr"                     >  $(@D)/mozconfig
> +	echo "ac_add_options --target=$(GNU_TARGET_NAME)"       >> $(@D)/mozconfig
> +	echo "ac_add_options --host=$(GNU_HOST_NAME)"           >> $(@D)/mozconfig
> +	echo "ac_add_options --build=$(GNU_HOST_NAME)"          >> $(@D)/mozconfig
> +	echo "ac_add_options --enable-application=b2g"          >> $(@D)/mozconfig
> +	echo "ac_add_options --enable-xterm-updates"            >> $(@D)/mozconfig
> +	echo "ac_add_options --disable-debug"                   >> $(@D)/mozconfig
> +	echo "ac_add_options --disable-tests"                   >> $(@D)/mozconfig
> +	echo "ac_add_options --enable-optimize"                 >> $(@D)/mozconfig
> +	echo "ac_add_options --enable-mobile-optimize"          >> $(@D)/mozconfig
> +	echo "ac_add_options --disable-strip"                   >> $(@D)/mozconfig
> +	echo "ac_add_options --disable-install-strip"           >> $(@D)/mozconfig
> +	echo "ac_add_options --disable-gconf"                   >> $(@D)/mozconfig
> +	echo "ac_add_options --with-system-bz2"                 >> $(@D)/mozconfig
> +	echo "ac_add_options --with-system-jpeg"                >> $(@D)/mozconfig
> +	echo "ac_add_options --with-system-libevent"            >> $(@D)/mozconfig
> +	echo "ac_add_options --with-system-libvpx"              >> $(@D)/mozconfig
> +	echo "ac_add_options --with-system-zlib"                >> $(@D)/mozconfig
> +	echo "ac_add_options --enable-system-cairo"             >> $(@D)/mozconfig
> +	echo "ac_add_options --enable-system-ffi"               >> $(@D)/mozconfig

Since you specify --enable-system-ffi, I would have expected a
dependency on libffi. Did I miss something?

> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
> +B2G_DEPENDENCIES += gst1-plugins-base
> +define B2G_MOZCONFIG_GSTREAMER
> +	echo "ac_add_options --enable-gstreamer=1.0"            >> $(@D)/mozconfig
> +endef
> +else
> +ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)

Put the 

else ifeq ...

on the same line...

> +B2G_DEPENDENCIES += gst-plugins-base
> +define B2G_MOZCONFIG_GSTREAMER
> +	echo "ac_add_options --enable-gstreamer=0.10"           >> $(@D)/mozconfig
> +endef
> +else
> +define B2G_MOZCONFIG_GSTREAMER
> +	echo "ac_add_options --disable-gstreamer"               >> $(@D)/mozconfig
> +endef
> +endif
> +endif

... as it allows to remove one endif:

ifeq ...
...
else ifeq ...
...
endif

> +ifeq ($(BR2_PACKAGE_ICU),y)
> +B2G_DEPENDENCIES += icu
> +define B2G_MOZCONFIG_ICU
> +	echo "ac_add_options --with-intl-api"                   >> $(@D)/mozconfig
> +	echo "ac_add_options --with-system-icu"                 >> $(@D)/mozconfig
> +endef
> +else
> +define B2G_MOZCONFIG_ICU
> +	echo "ac_add_options --without-intl-api"                >> $(@D)/mozconfig
> +endef
> +endif

This whole thing seems a bit redundant. What about instead:

ifeq ...
B2G_CONF_OPTS += --with-intl-api --with-system-icu
else
B2G_CONF_OPTS += --without-intl-api
endif

And then later on:

	$(foreach opt,$(B2G_CONF_OPTS),\
		echo "ac_add_options $(opt)" >> $(@D)/mozconfig
	)

It avoids having to duplicate the echo "ac_add_options ..." >>
$(@D)/mozconfig numerous times.

> +
> +B2G_CONF_ENV = \
> +	MOZ_OBJDIR=$(@D)/obj-b2g \
> +	CROSS_COMPILE=1 \
> +	AUTOCONF=$(HOST_DIR)/usr/bin/autoconf2.13 \
> +	PERL=$(shell which perl) \

A priori this should not be needed, since package/Makefile.in exports
PERL with the exact same value. Can you double check if it's really
needed?

> +	PYTHON=$(HOST_DIR)/usr/bin/python
> +
> +define B2G_CONFIGURE_CMDS
> +	$(B2G_MOZCONFIG_COMMON)
> +	$(B2G_MOZCONFIG_ALSA)
> +	$(B2G_MOZCONFIG_DBUS)
> +	$(B2G_MOZCONFIG_GSTREAMER)
> +	$(B2G_MOZCONFIG_ICU)
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(B2G_CONF_ENV) \

Continuation lines should be indented with one more tab than the first
line:

> +	$(MAKE1) -C $(@D) -f client.mk configure

	$(TARGET_CONFIGURE_OPTS) $(BG2_CONF_ENV)
		$(MAKE1) -C $(@D) -f client.mk configure

> +endef
> +
> +define B2G_BUILD_CMDS
> +	$(MAKE1) -C $(@D) -f client.mk build_all \
> +		MOZ_OBJDIR=$(@D)/obj-b2g
> +	$(MAKE1) -C $(@D)/obj-b2g package
> +endef
> +
> +define B2G_INSTALL_TARGET_CMDS
> +	rm -rf $(TARGET_DIR)/usr/lib/b2g

We normally don't remove stuff from the target prior to the
installation.

> +	tar xfj $(@D)/obj-b2g/dist/b2g-*.tar.bz2 -C $(TARGET_DIR)/usr/lib
> +	ln -sf ../lib/b2g/b2g $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
