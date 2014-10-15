From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 12:39:22 +0200
Subject: [Buildroot] [PATCH 6/8] package/mpd: enable support for libnfs
In-Reply-To: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
References: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413369564-22124-6-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 7 +++++++
 package/mpd/mpd.mk    | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index cce676c..18219ec 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -180,6 +180,13 @@ config BR2_PACKAGE_MPD_CURL
 	help
 		Enable curl streaming (http) support.
 
+config BR2_PACKAGE_MPD_LIBNFS
+	bool "nfs"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBNFS
+	help
+		Enable Network File System (NFS) support.
+
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
 	depends on !BR2_nios2 # samba
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ecd2a77..476bf0a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -90,6 +90,14 @@ else
 MPD_CONF_OPTS += --disable-lame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
+PKG_CONFIG_PATH = "$(STAGING_DIR)/usr/lib/pkgconfig"
+MPD_DEPENDENCIES += libnfs
+MPD_CONF_OPTS += --enable-nfs
+else
+MPD_CONF_OPTS += --disable-nfs
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
 MPD_DEPENDENCIES += samba
 MPD_CONF_OPTS += --enable-smbclient
-- 
2.1.2
