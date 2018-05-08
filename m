From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:40:28 +0200
Subject: [Buildroot] [git commit] package/libplayer: remove mplayer support
Message-ID: <20180509193609.284698C5EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f44911971f7ceecbcc3371806c970e93a10a3f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               | 6 ++++++
 package/libplayer/Config.in    | 5 -----
 package/libplayer/libplayer.mk | 8 +-------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c51984a3b9..2b03ba7324 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -156,6 +156,12 @@ config BR2_PACKAGE_LIBKCAPI_APPS
 	  Test applications (hasher, rng read, speed-test, test) now
 	  have their own configuration options in the libkcapi menu.
 
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
