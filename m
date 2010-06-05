From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:18:46 +0200
Subject: [Buildroot] [git commit master] qt: fix libQtMultimedia installation
Message-ID: <20100605201925.3C69712F5D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=79ec8e88f3a5afacff27e8eb94a5aeda17cf734a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With BR2_PACKAGE_QT_MULTIMEDIA=y, libQtMultimedia.so.* was not
copied to the target directory.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/qt/qt.mk |    8 ++++++++
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index b653124..0a2c189 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, libidn, netperf
+	Updated/fixed packages: cdrkit, libidn, netperf, qt
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index aaf965e..e2ebbb2 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -387,6 +387,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
 QT_LIBS+= qt-sql
 endif
+ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
+QT_LIBS+= qt-multimedia
+endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_LIBS+= qt-phonon
 endif
@@ -542,6 +545,11 @@ ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
 endif
 
+qt-multimedia: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtMultimedia.so.* $(TARGET_DIR)/usr/lib/
+endif
+
 qt-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
 	$(call QT_INSTALL_PLUGINS,phonon_backend)
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-- 
1.6.3.3
