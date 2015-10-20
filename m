From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Oct 2015 21:42:26 +0200
Subject: [Buildroot] [PATCH 10/10] package/kodi: Add support for libssh
In-Reply-To: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1445370146-12033-11-git-send-email-bernd.kuhls@t-online.de>
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
index eede243..9d3ea6f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -218,6 +218,12 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
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
index 24c5e5a..46d8650 100644
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
2.6.1
