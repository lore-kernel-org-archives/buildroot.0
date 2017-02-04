From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:31 +0100
Subject: [Buildroot] [PATCH v3 18/38] package/kodi: add optional support for
	pulseaudio
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6f8e9a1cc..246cc8a48 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -193,6 +193,12 @@ config BR2_PACKAGE_KODI_NONFREE
 	  Enable components with non-free licenses. This option
 	  currently only controls support for RAR archives.
 
+config BR2_PACKAGE_KODI_PULSEAUDIO
+	bool "pulseaudio"
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable Pulseaudio support.
+
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
 	select BR2_PACKAGE_LIBSHAIRPLAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 08ed68b14..ccf6c3a3e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -64,7 +64,6 @@ KODI_MAKE_ENV = \
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
 	--disable-openmax \
-	--disable-pulse \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
@@ -277,6 +276,13 @@ else
 KODI_CONF_OPTS += --disable-optical-drive
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PULSEAUDIO),y)
+KODI_CONF_OPTS += --enable-pulse
+KODI_DEPENDENCIES += pulseaudio
+else
+KODI_CONF_OPTS += --disable-pulse
+endif
+
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define KODI_BOOTSTRAP
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/JsonSchemaBuilder
-- 
2.11.0
