From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jul 2016 11:11:32 +0200
Subject: [Buildroot] [PATCH v4 2/6] package/kodi: Add suboption to control
	MySQL support
In-Reply-To: <1468055496-26192-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468055496-26192-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468055496-26192-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a buildroot defconfig with mysql enabled I would like to be able to
build Kodi without mysql support because I do not need it at runtime.

Kodi can store its internal databases not only locally using sqlite but
also on a mysql server, this allows several local Kodi machines to share
the same databases. Because I do only use one Kodi instance I do not
need mysql support and would like to reduce build time when testing/
installing Kodi while not touching other packages.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: added a note about the motivation for this patch (Thomas)
v3: rebased series, no changes to this patch
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3d3ecfd..e57939e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -174,6 +174,12 @@ config BR2_PACKAGE_KODI_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
+config BR2_PACKAGE_KODI_MYSQL
+	bool "mysql"
+	select BR2_PACKAGE_MYSQL
+	help
+	  Enable MySQL support
+
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 8a3b0bf..9d6b966 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -78,7 +78,7 @@ KODI_CONF_OPTS +=  \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += --enable-mysql
 KODI_CONF_ENV += ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 KODI_DEPENDENCIES += mysql
-- 
2.8.1
