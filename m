From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:45:39 +0200
Subject: [Buildroot] [git commit] mpd: add support for libupnp18
Message-ID: <20180401224540.EE05B83830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=252218881b1e807ca4d625f457675f01d1158f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of selecting BR2_PACKAGE_LIBUPNP, select BR2_PACKAGE_LIBUPNP18
if BR2_PACKAGE_LIBUPNP is not enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 2 +-
 package/mpd/mpd.mk    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5991b6f4bb..bad32f8440 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -309,7 +309,7 @@ config BR2_PACKAGE_MPD_TCP
 config BR2_PACKAGE_MPD_UPNP
 	bool "UPnP"
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
 	help
 	  Enable MPD UPnP client support.
 
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 26e82af0a8..f50e3d90c7 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -236,7 +236,9 @@ MPD_CONF_OPTS += --disable-twolame-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_UPNP),y)
-MPD_DEPENDENCIES += expat libupnp
+MPD_DEPENDENCIES += \
+	expat \
+	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
 MPD_CONF_OPTS += --enable-upnp
 else
 MPD_CONF_OPTS += --disable-upnp
