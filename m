From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jul 2016 20:08:58 +0200
Subject: [Buildroot] [PATCH v5 4/8] package/kodi: Add suboption to control
	unrar support
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468260542-7194-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: no changes
v4: no changes
v3: rebased series, no changes to this patch
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a000e79..5e7aa67 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -174,6 +174,12 @@ config BR2_PACKAGE_KODI_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
+config BR2_PACKAGE_KODI_NONFREE
+	bool "nonfree"
+	help
+	  Enable components with non-compliant licenses.
+	  This option currently only controls support for RAR archives.
+
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 52593aa..da5d1fa 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -86,6 +86,14 @@ else
 KODI_CONF_OPTS += --disable-mysql
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_NONFREE),y)
+KODI_CONF_OPTS += --enable-non-free
+KODI_LICENSE := $(KODI_LICENSE), unrar
+KODI_LICENSE_FILES += lib/UnrarXLib/license.txt
+else
+KODI_CONF_OPTS += --disable-non-free
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
 KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
-- 
2.8.1
