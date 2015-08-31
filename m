From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Aug 2015 16:34:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Add support for libssh
Message-ID: <1441031642-21869-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch depends on http://patchwork.ozlabs.org/patch/512480/
and adds sftp support to the virtual filesystems supported by Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 662154d..fc8bb09 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -197,6 +197,12 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
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
index 80554e9..f46d9b3 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -36,7 +36,6 @@ KODI_CONF_OPTS +=  \
 	--disable-projectm \
 	--disable-pulse \
 	--disable-rsxs \
-	--disable-ssh \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -152,6 +151,13 @@ else
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
