From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Apr 2021 11:49:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: add various options to
 disable optional components
Message-ID: <20210403094958.890489-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When enabled some IPTV streams are piped using /usr/bin/ffmpeg so make
sure that the ffmpeg binary is present.

Transcoding support can already be disabled reducing /usr/bin/tvheadend
by 1,03MB.

By disabling all new options provided by this patch the binary size can
additionally be reduced by 2,08MB.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in    | 27 ++++++++++++++++++++++++++-
 package/tvheadend/tvheadend.mk | 27 +++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 909d955c02..29a7f2d86e 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -3,7 +3,7 @@ comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-config BR2_PACKAGE_TVHEADEND
+menuconfig BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -28,6 +28,31 @@ config BR2_PACKAGE_TVHEADEND
 
 if BR2_PACKAGE_TVHEADEND
 
+config BR2_PACKAGE_TVHEADEND_DESCRAMBLER
+	bool "descrambler support"
+	default y
+	help
+	  Enable support for various descrambler modules.
+
+config BR2_PACKAGE_TVHEADEND_IPTV
+	bool "IPTV support"
+	default y
+	select BR2_PACKAGE_FFMPEG_FFMPEG if BR2_PACKAGE_FFMPEG
+	help
+	  Enable IPTV support.
+
+config BR2_PACKAGE_TVHEADEND_SATIP
+	bool "SAT>IP support"
+	default y
+	help
+	  Enable SAT>IP support.
+
+config BR2_PACKAGE_TVHEADEND_TIMESHIFT
+	bool "timeshift support"
+	default y
+	help
+	  Enable timeshift support.
+
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 114142bfa9..f9e748531e 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -63,6 +63,33 @@ TVHEADEND_CONF_OPTS += \
 	--disable-libx265
 endif
 
+ifeq ($(BR2_PACKAGE_TVHEADEND_DESCRAMBLER),y)
+TVHEADEND_CONF_OPTS += --enable-cardclient --enable-cwc \
+	--enable-cccam --enable-capmt --enable-constcw
+else
+TVHEADEND_CONF_OPTS += --disable-cardclient --disable-cwc \
+	--disable-cccam --disable-capmt --disable-constcw
+endif
+
+ifeq ($(BR2_PACKAGE_TVHEADEND_IPTV),y)
+TVHEADEND_CONF_OPTS += --enable-iptv
+TVHEADEND_DEPENDENCIES += ffmpeg
+else
+TVHEADEND_CONF_OPTS += --disable-iptv
+endif
+
+ifeq ($(BR2_PACKAGE_TVHEADEND_SATIP),y)
+TVHEADEND_CONF_OPTS += --enable-satip_client --enable-satip_server
+else
+TVHEADEND_CONF_OPTS += --disable-satip_client --disable-satip_server
+endif
+
+ifeq ($(BR2_PACKAGE_TVHEADEND_TIMESHIFT),y)
+TVHEADEND_CONF_OPTS += --enable-timeshift
+else
+TVHEADEND_CONF_OPTS += --disable-timeshift
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-tvhcsa
-- 
2.29.2
