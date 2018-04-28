From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:36:02 +0200
Subject: [Buildroot] [git commit] mpd: add mms support
Message-ID: <20180428163609.33ACE89016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b3d8129a11b03fe9309c6cd8d585cdb7453332b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 6c7468e173..831e4ab0d7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -180,6 +180,12 @@ config BR2_PACKAGE_MPD_CURL
 	help
 	  Enable curl streaming (http) support.
 
+config BR2_PACKAGE_MPD_LIBMMS
+	bool "mms"
+	select BR2_PACKAGE_LIBMMS
+	help
+	  Enable MMS support.
+
 config BR2_PACKAGE_MPD_LIBNFS
 	bool "nfs"
 	# libnfs -> libtirpc
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 639c8c1981..64471d4da5 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -120,6 +120,13 @@ else
 MPD_CONF_OPTS += --disable-libmpdclient
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBMMS),y)
+MPD_DEPENDENCIES += libmms
+MPD_CONF_OPTS += --enable-mms
+else
+MPD_CONF_OPTS += --disable-mms
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
 MPD_DEPENDENCIES += libnfs
 MPD_CONF_OPTS += --enable-nfs
