From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jul 2016 21:49:08 +0200
Subject: [Buildroot] [V2 2/2] b2g: new package
In-Reply-To: <1468698548-23876-1-git-send-email-francois.perrad@gadz.org>
References: <1468698548-23876-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1468698548-23876-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/b2g/0001-fix-linking.patch | 28 ++++++++++++
 package/b2g/Config.in              | 30 ++++++++++++
 package/b2g/b2g.mk                 | 93 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+)
 create mode 100644 package/b2g/0001-fix-linking.patch
 create mode 100644 package/b2g/Config.in
 create mode 100644 package/b2g/b2g.mk

diff --git a/package/Config.in b/package/Config.in
index 009b828..4a5807e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -226,6 +226,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/b2g/Config.in"
 	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/b2g/0001-fix-linking.patch b/package/b2g/0001-fix-linking.patch
new file mode 100644
index 0000000..5433160
--- /dev/null
+++ b/package/b2g/0001-fix-linking.patch
@@ -0,0 +1,28 @@
+fix linking
+
+b2g-2_5_20160125/dom/audiochannel/AudioChannelService.cpp:580: error:
+ undefined reference to 'mozilla::dom::TabParent::AudioChannelChangeNotification(nsPIDOMWindow*, mozilla::dom::AudioChannel, float, bool)'
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/dom/audiochannel/AudioChannelService.cpp b/dom/audiochannel/AudioChannelService.cpp
+index 7c9593e..cd9e1a5 100644
+--- a/dom/audiochannel/AudioChannelService.cpp
++++ b/dom/audiochannel/AudioChannelService.cpp
+@@ -574,11 +574,13 @@ AudioChannelService::RefreshAgentsVolumeAndPropagate(AudioChannel aAudioChannel,
+     return;
+   }
+ 
++#if 0
+   for (uint32_t i = 0; i < mTabParents.Length(); ++i) {
+     mTabParents[i]->AudioChannelChangeNotification(aWindow, aAudioChannel,
+                                                    winData->mChannels[(uint32_t)aAudioChannel].mVolume,
+                                                    winData->mChannels[(uint32_t)aAudioChannel].mMuted);
+   }
++#endif
+ 
+   RefreshAgentsVolume(aWindow);
+ }
+-- 
+
diff --git a/package/b2g/Config.in b/package/b2g/Config.in
new file mode 100644
index 0000000..ecf0fa0
--- /dev/null
+++ b/package/b2g/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_B2G
+	bool "b2g"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PDF
+	select BR2_PACKAGE_CAIRO_TEE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_OPENSSL # libcurl4-openssl
+	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2, libvpx
+	depends on BR2_USE_MMU # libgtk2
+	depends on BR2_USE_WCHAR # libgtk2
+	help
+	  B2G (Boot 2 Gecko), the Firefox OS desktop client.
+
+	  https://developer.mozilla.org/en-US/Firefox_OS
+
+comment "b2g needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/b2g/b2g.mk b/package/b2g/b2g.mk
new file mode 100644
index 0000000..d872065
--- /dev/null
+++ b/package/b2g/b2g.mk
@@ -0,0 +1,93 @@
+################################################################################
+#
+# b2g
+#
+################################################################################
+
+B2G_VERSION = 2_5_20160125
+B2G_SITE = https://hg.mozilla.org/releases/mozilla-b2g44_v2_5/archive
+B2G_SOURCE = B2G_$(B2G_VERSION)_MERGEDAY.tar.gz
+B2G_LICENSE = MPLv2.0
+B2G_LICENSE_FILES = toolkit/content/license.html
+
+B2G_DEPENDENCIES = host-autoconf2-13 host-python jpeg libcurl libevent libgtk2 libvpx xlib_libXt
+B2G_AC_OPTS = \
+	--prefix=/usr \
+	--target=$(GNU_TARGET_NAME) \
+	--host=$(GNU_HOST_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--enable-application=b2g \
+	--enable-xterm-updates \
+	--disable-debug \
+	--disable-tests \
+	--enable-optimize \
+	--enable-mobile-optimize \
+	--disable-strip \
+	--disable-install-strip \
+	--disable-gconf \
+	--with-system-bz2 \
+	--with-system-jpeg \
+	--with-system-libevent \
+	--with-system-libvpx \
+	--with-system-zlib \
+	--enable-system-cairo \
+	--enable-system-ffi \
+	--enable-system-pixman \
+	--enable-default-toolkit=cairo-gtk2 \
+	--disable-webrtc
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+B2G_DEPENDENCIES += alsa-lib
+B2G_AC_OPTS += --enable-alsa
+else
+B2G_AC_OPTS += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
+B2G_DEPENDENCIES += dbus-glib
+B2G_AC_OPTS += --enable-dbus
+else
+B2G_AC_OPTS += --disable-dbus --disable-gamepad --disable-necko-wifi
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+B2G_DEPENDENCIES += gst1-plugins-base
+B2G_AC_OPTS += --enable-gstreamer=1.0
+else ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+B2G_DEPENDENCIES += gst-plugins-base
+B2G_AC_OPTS += --enable-gstreamer=0.10
+else
+B2G_AC_OPTS += --disable-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+B2G_DEPENDENCIES += icu
+B2G_AC_OPTS += --with-intl-api --with-system-icu
+else
+B2G_AC_OPTS += --without-intl-api
+endif
+
+B2G_CONF_ENV = \
+	MOZ_OBJDIR=$(@D)/obj-b2g \
+	CROSS_COMPILE=1 \
+	AUTOCONF=$(HOST_DIR)/usr/bin/autoconf2.13 \
+	PYTHON=$(HOST_DIR)/usr/bin/python
+
+define B2G_CONFIGURE_CMDS
+	echo -e $(foreach opt,$(B2G_AC_OPTS),"\nac_add_options $(opt)") > $(@D)/mozconfig
+	$(TARGET_CONFIGURE_OPTS) $(B2G_CONF_ENV) \
+		$(MAKE1) -C $(@D) -f client.mk configure
+endef
+
+define B2G_BUILD_CMDS
+	$(MAKE1) -C $(@D) -f client.mk build_all \
+		MOZ_OBJDIR=$(@D)/obj-b2g
+	$(MAKE1) -C $(@D)/obj-b2g package
+endef
+
+define B2G_INSTALL_TARGET_CMDS
+	tar xfj $(@D)/obj-b2g/dist/b2g-*.tar.bz2 -C $(TARGET_DIR)/usr/lib
+	ln -sf ../lib/b2g/b2g $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
