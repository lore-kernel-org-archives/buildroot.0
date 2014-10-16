From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 17 Oct 2014 00:29:00 +0200
Subject: [Buildroot] [PATCH v3 5/8] package/mpd: enable support for
	libsmbclient
In-Reply-To: <1413498543-643-1-git-send-email-jkrause@posteo.de>
References: <1413498543-643-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413498543-643-5-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v2 -> v3:
  - fix indentation of help text
Changes v1 -> v2:
  - none
---
 package/mpd/Config.in | 8 ++++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e62a37d..09df556 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -182,6 +182,14 @@ config BR2_PACKAGE_MPD_CURL
 	help
 	  Enable curl streaming (http) support.
 
+config BR2_PACKAGE_MPD_LIBSMBCLIENT
+	bool "samba"
+	depends on !BR2_nios2 # samba
+	select BR2_PACKAGE_SAMBA
+	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	help
+	  Enable Samba support.
+
 config BR2_PACKAGE_MPD_SOUNDCLOUD
 	bool "soundcloud"
 	select BR2_PACKAGE_YAJL
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 92d7292..ecd2a77 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -90,6 +90,13 @@ else
 MPD_CONF_OPTS += --disable-lame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
+MPD_DEPENDENCIES += samba
+MPD_CONF_OPTS += --enable-smbclient
+else
+MPD_CONF_OPTS += --disable-smbclient
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
 MPD_CONF_OPTS += --enable-lsr
-- 
2.1.2
