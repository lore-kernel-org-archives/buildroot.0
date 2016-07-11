From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jul 2016 20:09:02 +0200
Subject: [Buildroot] [PATCH v5 8/8] package/kodi: Add suboption to control
	MySQL support
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468260542-7194-8-git-send-email-bernd.kuhls@t-online.de>
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
v5: no changes
v4: added a note about the motivation for this patch (Thomas)
v3: rebased series, no changes to this patch
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 59a94d7..cda2d06 100644
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
 config BR2_PACKAGE_KODI_NONFREE
 	bool "nonfree"
 	help
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 9f21bf2..e0361da 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -77,7 +77,7 @@ KODI_CONF_OPTS +=  \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += --enable-mysql
 KODI_CONF_ENV += ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 KODI_DEPENDENCIES += mysql
-- 
2.8.1
