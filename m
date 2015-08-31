From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Aug 2015 16:43:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/kodi: Add support for libssh
Message-ID: <1441032211-23162-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch depends on http://patchwork.ozlabs.org/patch/512480/
and adds sftp support to the virtual filesystems supported by Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 797f59d..9622d89 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -217,6 +217,12 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	help
 	  Enable Samba support
 
+config BR2_PACKAGE_KODI_LIBSSH
+	bool "ssh"
+	select BR2_PACKAGE_LIBSSH
+	help
+	  Enable sftp virtual filesystem using libssh.
+
 config BR2_PACKAGE_KODI_LIBTHEORA
 	bool "theora"
 	select BR2_PACKAGE_LIBTHEORA
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6399ff1..6f4c1f3 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -34,7 +34,6 @@ KODI_CONF_OPTS +=  \
 	--disable-openmax \
 	--disable-projectm \
 	--disable-pulse \
-	--disable-ssh \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -172,6 +171,13 @@ else
 KODI_CONF_OPTS += --disable-airplay
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LIBSSH),y)
+KODI_DEPENDENCIES += libssh
+KODI_CONF_OPTS += --enable-ssh
+else
+KODI_CONF_OPTS += --disable-ssh
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_AVAHI),y)
 KODI_DEPENDENCIES += avahi
 KODI_CONF_OPTS += --enable-avahi
-- 
2.1.4
