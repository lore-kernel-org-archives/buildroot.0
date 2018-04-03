From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Apr 2018 22:03:41 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] mpd: add optional libmpdclient dependency
Message-ID: <20180403200341.11856-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Add BR2_PACKAGE_MPD_LIBMPDCLIENT option

 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index bad32f8440..6c7468e173 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -285,6 +285,12 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_MPD_LIBMPDCLIENT
+	bool "libmpdclient"
+	select BR2_PACKAGE_LIBMPDCLIENT
+	help
+	  Enable libmpdclient support.
+
 config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
 	bool "neighbor discovery support"
 	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || BR2_PACKAGE_MPD_UPNP
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f50e3d90c7..639c8c1981 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -113,6 +113,13 @@ else
 MPD_CONF_OPTS += --disable-lame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBMPDCLIENT),y)
+MPD_DEPENDENCIES += libmpdclient
+MPD_CONF_OPTS += --enable-libmpdclient
+else
+MPD_CONF_OPTS += --disable-libmpdclient
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
 MPD_DEPENDENCIES += libnfs
 MPD_CONF_OPTS += --enable-nfs
-- 
2.14.1
