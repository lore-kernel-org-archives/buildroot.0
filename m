From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Mar 2018 23:40:56 +0100
Subject: [Buildroot] [PATCH 1/1] mpd: add support for libupnp18
Message-ID: <20180310224056.3860-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of selecting BR2_PACKAGE_LIBUPNP, makes UPnP option depending on
BR2_PACKAGE_LIBUPNP or BR2_PACKAGE_LIBUPNP18 and let the user choose his
preferred libupnp version

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 5 ++++-
 package/mpd/mpd.mk    | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5991b6f4bb..eee25c4c07 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -308,11 +308,14 @@ config BR2_PACKAGE_MPD_TCP
 
 config BR2_PACKAGE_MPD_UPNP
 	bool "UPnP"
+	depends on BR2_PACKAGE_LIBUPNP || BR2_PACKAGE_LIBUPNP18
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBUPNP
 	help
 	  Enable MPD UPnP client support.
 
+comment "UPnP client support needs libupnp or libupnp18"
+	depends on !BR2_PACKAGE_LIBUPNP && !BR2_PACKAGE_LIBUPNP18
+
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
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
-- 
2.14.1
