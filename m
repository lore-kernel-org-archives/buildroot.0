From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 12 Jun 2010 18:22:38 +0200
Subject: [Buildroot] [PATCH 1/4] ffmpeg: add new package
In-Reply-To: <1276359761-13721-1-git-send-email-luca@lucaceresoli.net>
References: <1276359761-13721-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1276359761-13721-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 CHANGES                             |    2 +-
 package/multimedia/Config.in        |    1 +
 package/multimedia/ffmpeg/Config.in |   25 +++++++++++
 package/multimedia/ffmpeg/ffmpeg.mk |   79 +++++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/ffmpeg/Config.in
 create mode 100644 package/multimedia/ffmpeg/ffmpeg.mk

diff --git a/CHANGES b/CHANGES
index 3ba7195..6ca4fc9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: cgilua, copas, coxpcall, luafilesystem,
+	New packages: cgilua, copas, coxpcall, ffmpeg, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: cdrkit, file, gawk, gstreamer, intltool,
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 3305f7b..3b0eec5 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -3,6 +3,7 @@ source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/flac/Config.in"
+source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
new file mode 100644
index 0000000..bc8fb22
--- /dev/null
+++ b/package/multimedia/ffmpeg/Config.in
@@ -0,0 +1,25 @@
+menuconfig BR2_PACKAGE_FFMPEG
+	bool "ffmpeg"
+	help
+         FFmpeg is a complete, cross-platform solution to record, convert
+         and stream audio and video.
+
+	 http://www.ffmpeg.org
+
+if BR2_PACKAGE_FFMPEG
+
+config BR2_PACKAGE_FFMPEG_GPL
+	bool "Enable GPL code"
+	default n
+	help
+         allow use of GPL code, the resulting libs and binaries will
+         be under GPL
+
+config BR2_PACKAGE_FFMPEG_NONFREE
+	bool "Enable nonfree code"
+	default n
+	help
+         allow use of nonfree code, the resulting libs and binaries
+         will be unredistributable
+
+endif
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
new file mode 100644
index 0000000..b4abefb
--- /dev/null
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -0,0 +1,79 @@
+#############################################################
+#
+# ffmpeg
+#
+#############################################################
+FFMPEG_VERSION := 0.5.2
+FFMPEG_SOURCE := ffmpeg-$(FFMPEG_VERSION).tar.bz2
+FFMPEG_SITE := http://ffmpeg.org/releases
+FFMPEG_INSTALL_STAGING = YES
+FFMPEG_INSTALL_TARGET = YES
+
+FFMPEG_CONF_OPT = \
+	--prefix=/usr		\
+	--enable-shared 	\
+	--disable-ffmpeg	\
+	--disable-ffplay	\
+	--disable-ffserver	\
+	--disable-avfilter	\
+	--disable-postproc	\
+	--disable-swscale	\
+	--disable-vhook		\
+
+ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
+FFMPEG_CONF_OPT += --enable-gpl
+else
+FFMPEG_CONF_OPT += --disable-gpl
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_NONFREE),y)
+FFMPEG_CONF_OPT += --enable-nonfree
+else
+FFMPEG_CONF_OPT += --disable-nonfree
+endif
+
+ifeq ($(BR2_PTHREADS_NONE),y)
+FFMPEG_CONF_OPT += --disable-pthreads
+else
+FFMPEG_CONF_OPT += --enable-pthreads
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+FFMPEG_CONF_OPT += --enable-ipv6
+else
+FFMPEG_CONF_OPT += --disable-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+FFMPEG_CONF_OPT += --enable-zlib
+FFMPEG_DEPENDENCIES += zlib
+else
+FFMPEG_CONF_OPT += --disable-zlib
+endif
+
+# Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
+define FFMPEG_CONFIGURE_CMDS
+	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(TARGET_CONFIGURE_ENV) \
+	$(FFMPEG_CONF_ENV) \
+	./configure \
+		--enable-cross-compile	\
+		--cross-prefix=$(TARGET_CROSS) \
+		--sysroot=$(STAGING_DIR) \
+		--host-cc=$(HOSTCC) \
+		--cc=$(TARGET_CC) \
+		--arch=$(BR2_ARCH) \
+		--extra-cflags=-fPIC \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+		$(DISABLE_IPV6) \
+		$(FFMPEG_CONF_OPT) \
+	)
+endef
+
+# Override FFMPEG_INSTALL_TARGET_OPT: FFmpeg does not support install-strip
+FFMPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package/multimedia,ffmpeg))
-- 
1.7.0.4
