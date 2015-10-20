From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:03:31 +0200
Subject: [Buildroot] [git commit] package/kodi: Add support for libssh
Message-ID: <20151020200500.88C817FB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62ce7751b46eb609f13582352a6d6f11559819c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch depends on http://patchwork.ozlabs.org/patch/512480/
and adds sftp support to the virtual filesystems supported by Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in |    6 ++++++
 package/kodi/kodi.mk   |    8 +++++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

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
