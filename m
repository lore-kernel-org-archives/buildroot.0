From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Oct 2014 22:07:00 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/tvheadend: Add transcoding
	support by ffmpeg
Message-ID: <1414789621-10892-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --disable-libffmpeg_static to disable static linking of ffmpeg
libraries into the tvheadend binary.

tvheadend compiles with ffmpeg using this minimal defconfig:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_TVHEADEND=y

---
v4: simplify ffmpeg dependency handling, add description for
    --disable-libffmpeg_static to commit log (Thomas)
v3: no changes
v2: add --disable-libffmpeg_static, newly added option to git master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in    |    2 ++
 package/tvheadend/tvheadend.mk |    8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index f7182a1..303a345 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_TVHEADEND
 	# architecture is avr32, which uses gcc 4.2.
 	depends on !BR2_avr32
 	select BR2_PACKAGE_DTV_SCAN_TABLES
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index bd46d0e..08d8e7e 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+TVHEADEND_DEPENDENCIES += ffmpeg
+TVHEADEND_CONF_OPTS += --enable-libav
+else
+TVHEADEND_CONF_OPTS += --disable-libav
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-dvbcsa
@@ -38,6 +45,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
 	 --enable-bundle			\
+	 --disable-libffmpeg_static		\
 	 $(TVHEADEND_CONF_OPTS)			\
 	)
 endef
-- 
1.7.10.4
