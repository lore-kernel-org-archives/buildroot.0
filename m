From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 11:18:10 +0200
Subject: [Buildroot] [PATCH 4/5] Fix Qt build with MySQL
In-Reply-To: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7981bbb912a703ae5cc52fe990768b47c17c4a72.1279271863.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several issues were preventing the Qt MySQL support to build properly:

 * In Config.sql.in, missing selection of the MYSQL_CLIENT package
   when the Qt MySQL driver is enabled

 * In qt.mk :
    - Missing dependency on mysql_client
    - As MySQL installs headers in $(STAGING_DIR)/usr/include/mysql
      and libs in $(STAGING_DIR)/usr/lib/mysql, additional -I and -L
      options need to be passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.sql.in |    1 +
 package/qt/qt.mk         |   14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 2ce8d79..0c17c1a 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -6,6 +6,7 @@ menuconfig BR2_PACKAGE_QT_SQL_MODULE
 if BR2_PACKAGE_QT_SQL_MODULE
 config BR2_PACKAGE_QT_MYSQL
 	bool "MySQL Driver"
+	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  Build MySQL driver
 	  If unsure, say n.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b4b6b29..c144901 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -18,6 +18,10 @@ QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(ZCAT)
 QT_TARGET_DIR:=$(BUILD_DIR)/qt-everywhere-opensource-src-$(QT_VERSION)
 
+QT_TARGET_CFLAGS=$(TARGET_CFLAGS)
+QT_TARGET_CXXFLAGS=$(TARGET_CXXFLAGS)
+QT_TARGET_LDFLAGS=$(TARGET_LDFLAGS)
+
 QT_CONFIGURE:=#empty
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
@@ -273,6 +277,10 @@ QT_CONFIGURE+= -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
 QT_CONFIGURE+= -qt-sql-mysql
+QT_DEP_LIBS+=mysql_client
+QT_TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include/mysql
+QT_TARGET_CXXFLAGS+=-I$(STAGING_DIR)/usr/include/mysql
+QT_TARGET_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE+= -qt-sql-odbc
@@ -487,9 +495,9 @@ endif
 	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
 	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
 	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP))
-	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS))
-	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
-	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
+	$(call QT_QMAKE_SET,CFLAGS,$(QT_TARGET_CFLAGS))
+	$(call QT_QMAKE_SET,CXXFLAGS,$(QT_TARGET_CXXFLAGS))
+	$(call QT_QMAKE_SET,LFLAGS,$(QT_TARGET_LDFLAGS))
 	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
 		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
-- 
1.7.0.4
