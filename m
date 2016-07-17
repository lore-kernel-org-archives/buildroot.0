From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:32:01 +0200
Subject: [Buildroot] [git commit] package/kodi: Add suboption to control
	MySQL support
Message-ID: <20160717123353.CE3F781D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=453657df6b36b596eea673056cd909060a4b0b0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a Buildroot configuration with mysql enabled it might be useful to
be able to build Kodi without mysql support because Kodi may not need
it at runtime.

Kodi can store its internal databases not only locally using sqlite
but also on a mysql server, this allows several local Kodi machines to
share the same databases. When using only one Kodi instance, mysql
support is not needed, and not building mysql support helps reducing
build time.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index afb834e..f388a72 100644
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
 	bool "nonfree components"
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
