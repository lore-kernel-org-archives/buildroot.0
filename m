From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 May 2018 09:10:14 +0200
Subject: [Buildroot] [PATCH 1/4] package/libplayer: remove mplayer support
Message-ID: <20180501071017.14270-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy               | 6 ++++++
 package/libplayer/Config.in    | 5 -----
 package/libplayer/libplayer.mk | 8 +-------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3d8b28c5fe..e6b33db199 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_LIBPLAYER_MPLAYER
+	bool "mplayer support in libplayer removed"
+	select BR2_LEGACY
+	help
+	  The mplayer package was removed.
+
 config BR2_PACKAGE_IQVLINUX
 	bool "iqvlinux package removed"
 	select BR2_LEGACY
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 82083a0eea..3cad683248 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -9,11 +9,6 @@ config BR2_PACKAGE_LIBPLAYER
 	  http://libplayer.geexbox.org/
 
 if BR2_PACKAGE_LIBPLAYER
-config BR2_PACKAGE_LIBPLAYER_MPLAYER
-	bool "mplayer backend"
-	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
-	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	bool "gstreamer backend"
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index f4eccedb06..8d139cea0e 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -20,18 +20,12 @@ define LIBPLAYER_CONFIGURE_CMDS
 	./configure \
 		--prefix=/usr \
 		--cross-compile \
+		--disable-mplayer \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(LIBPLAYER_CONF_OPTS) \
 	)
 endef
 
-ifeq ($(BR2_PACKAGE_LIBPLAYER_MPLAYER),y)
-LIBPLAYER_DEPENDENCIES += mplayer
-LIBPLAYER_CONF_OPTS += --enable-mplayer
-else
-LIBPLAYER_CONF_OPTS += --disable-mplayer
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
 LIBPLAYER_DEPENDENCIES += gstreamer
 LIBPLAYER_CONF_OPTS += --enable-gstreamer
-- 
2.14.2
