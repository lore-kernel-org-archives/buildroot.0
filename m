From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 23:13:05 +0100
Subject: [Buildroot] [git commit master] PATCH: Add more config options to
	alsa, bump version
Message-ID: <20100128221453.E020377752@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aea2ef9b9e639f75e6fd8b574f40e60221fa03a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: William Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   15 +++---
 package/multimedia/alsa-lib/Config.in              |   51 ++++++++++++++++++++
 ...lsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch |   30 ------------
 package/multimedia/alsa-lib/alsa-lib.mk            |   40 +++++++++++++++-
 package/multimedia/alsa-utils/Config.in            |    2 +-
 package/multimedia/alsa-utils/alsa-utils.mk        |   11 ++++-
 6 files changed, 108 insertions(+), 41 deletions(-)
 delete mode 100644 package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch

diff --git a/CHANGES b/CHANGES
index 2076950..311d906 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,13 +4,14 @@
 
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
-	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
-	busybox, dbus, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
-	gst-plugins-bad, gvfs, flex, hal, iptables, iw, jpeg, kismet, libfuse,
-	libglib2, libpcap, libungif, libxml2, libxslt, lighttpd, mesa, mpg123,
-	mtd-utils, neon, netstat-nat, openvpn, pcre, qt, readline, rpm,
-	sawman, sdl, sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot,
-	usb_modeswitch, usbutils, webkit, wpa_supplicant, xfsprogs, zlib
+	Updated/fixed packages: alsa-lib, alsa-utils, at, autoconf, bash,
+	bind, binutils, bootutils, busybox, dbus, directfb, dnsmasq,
+	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, flex, hal,
+	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
+	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, neon,
+	netstat-nat, openvpn, pcre, qt, readline, rpm, sawman, sdl, sdl_ttf,
+	ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils,
+	webkit, wpa_supplicant, xfsprogs, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/alsa-lib/Config.in b/package/multimedia/alsa-lib/Config.in
index 78a22d0..84629e6 100644
--- a/package/multimedia/alsa-lib/Config.in
+++ b/package/multimedia/alsa-lib/Config.in
@@ -16,3 +16,54 @@ config BR2_PACKAGE_ALSA_LIB_PYTHON
 	  in the target directory
 	  http://www.alsa-project.org/
 
+if BR2_PACKAGE_ALSA_LIB
+menu "ALSA lib selection"
+
+config BR2_PACKAGE_ALSA_LIB_DEVDIR
+	string "directory with ALSA device files"
+	default "/dev/snd"
+
+config BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS
+	string "built PCM plugins"
+	default "all"
+
+config BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS
+	string "built control plugins"
+	default "all"
+
+config BR2_PACKAGE_ALSA_LIB_ALOAD
+	bool "aload"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_MIXER
+	bool "mixer"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_PCM
+	bool "pcm"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	bool "rawmidi"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_HWDEP
+	bool "hwdep"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_SEQ
+	bool "seq"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_ALISP
+	bool "alisp"
+	default y
+
+config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
+	bool "old-symbols"
+	default y
+
+endmenu
+
+endif
+
diff --git a/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch b/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch
deleted file mode 100644
index 7dfde94..0000000
--- a/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c821f2e7f2534ece24a10402df3f501536a09cbd Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.de>
-Date: Wed, 28 Jan 2009 15:00:35 +0100
-Subject: [PATCH] Fix off_t in kernel struct
-
-The off_t in kernel struct (for ioctls) is actually different from the
-definition of user-space off_t.  The kernel off_t is equial with long
-while user-space off_t depends on the large-file support.
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- include/sound/asound.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/sound/asound.h b/include/sound/asound.h
-index 977b2d6..62d1e57 100644
---- a/include/sound/asound.h
-+++ b/include/sound/asound.h
-@@ -402,7 +402,7 @@ struct sndrv_pcm_sw_params {
- 
- struct sndrv_pcm_channel_info {
- 	unsigned int channel;
--	off_t offset;			/* mmap offset */
-+	long offset;			/* mmap offset */
- 	unsigned int first;		/* offset to first sample in bits */
- 	unsigned int step;		/* samples distance in bits */
- };
--- 
-1.5.6.5
-
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 517021d..1f120c6 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -3,7 +3,7 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION = 1.0.18
+ALSA_LIB_VERSION = 1.0.22
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
@@ -13,8 +13,36 @@ ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
 
 ALSA_LIB_CONF_OPT = --enable-shared \
 		    --enable-static \
+		    --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
+		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
+		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
 		    --without-versioned
 
+ifneq ($(BR2_PACKAGE_ALSA_LIB_ALOAD),y)
+ALSA_LIB_CONF_OPT += --disable-aload
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_MIXER),y)
+ALSA_LIB_CONF_OPT += --disable-mixer
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+ALSA_LIB_CONF_OPT += --disable-pcm
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_RAWMIDI),y)
+ALSA_LIB_CONF_OPT += --disable-rawmidi
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_HWDEP),y)
+ALSA_LIB_CONF_OPT += --disable-hwdep
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
+ALSA_LIB_CONF_OPT += --disable-seq
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_ALISP),y)
+ALSA_LIB_CONF_OPT += --disable-alisp
+endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS),y)
+ALSA_LIB_CONF_OPT += --disable-old-symbols
+endif
+
 ifeq ($(BR2_ENABLE_DEBUG),y)
 # install-exec doesn't install the config files
 ALSA_LIB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
@@ -44,3 +72,13 @@ ALSA_LIB_USE_CONFIG_CACHE = NO
 
 $(eval $(call AUTOTARGETS,package/multimedia,alsa-lib))
 
+$(ALSA_LIB_TARGET_UNINSTALL):
+	-rm -f $(TARGET_DIR)/usr/lib/libasound.so*
+	-rm -rf $(TARGET_DIR)/usr/lib/alsa-lib
+	-rm -rf $(TARGET_DIR)/usr/share/alsa
+
+$(ALSA_LIB_TARGET_CLEAN):
+	-rm -f $(STAGING_DIR)/usr/lib/libasound.*
+	-rm -rf $(STAGING_DIR)/usr/lib/alsa-lib
+	-rm -rf $(STAGING_DIR)/usr/share/alsa
+
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index f2fc3c1..54ab3f9 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_LARGEFILE
 	depends on BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_NCURSES
 	help
 	  This package contains the command line utilities for the ALSA
 	  project.
@@ -24,6 +23,7 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
+	select BR2_PACKAGE_NCURSES
 	default y
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 2aa038a..f98b9cd 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -3,7 +3,7 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VERSION:=1.0.18
+ALSA_UTILS_VERSION:=1.0.22
 ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VERSION)
@@ -11,6 +11,11 @@ ALSA_UTILS_CAT:=$(BZCAT)
 ALSA_UTILS_BINARY:=alsactl/alsactl
 ALSA_UTILS_TARGET_BINARY:=usr/sbin/alsactl
 
+ALSA_UTILS_CONFIGURE_OPTS =
+ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
+ALSA_UTILS_CONFIGURE_OPTS += --disable-alsamixer --disable-alsatest
+endif
+
 $(DL_DIR)/$(ALSA_UTILS_SOURCE):
 	$(call DOWNLOAD,$(ALSA_UTILS_SITE),$(ALSA_UTILS_SOURCE))
 
@@ -32,6 +37,8 @@ $(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
+		$(ALSA_UTILS_CONFIGURE_OPTS) \
+		--disable-xmlto \
 	)
 	touch $@
 
@@ -72,7 +79,7 @@ $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY
 	fi
 	touch -c $@
 
-alsa-utils: alsa-lib ncurses $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
+alsa-utils: alsa-lib $(if $(BR2_PACKAGE_NCURSES),ncurses) $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
 
 alsa-utils-unpacked: $(ALSA_UTILS_DIR)/.unpacked
 
-- 
1.6.3.3
