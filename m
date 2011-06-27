From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jun 2011 11:56:11 +0200
Subject: [Buildroot] [git commit] qt: fix webkit/sqlite build without
	largefile support
Message-ID: <20110627095900.A6A0C835C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e4d47593850851d6fcaa6068258c16cc8761ab5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The embedded sqlite module forces FILE_OFFSET_BITS=64 unless
SQLITE_DISABLE_LFS is defined, breaking the build for !largefile toolchains.
Webkit internally builds sqlite, so that's affected as well.

Fix it by passing -DSQLITE_DISABLE_LFS in C/CXXFLAGS for !largefile
builds, similar to how we do it for the standalone sqlite package.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e8b7a49..ff67058 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -28,10 +28,21 @@ ifneq ($(QT_CONFIG_FILE),)
 QT_CONFIGURE_OPTS += -config buildroot
 endif
 
+QT_CFLAGS = $(TARGET_CFLAGS)
+QT_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 ifeq ($(BR2_LARGEFILE),y)
 QT_CONFIGURE_OPTS += -largefile
 else
 QT_CONFIGURE_OPTS += -no-largefile
+
+# embedded sqlite module forces FILE_OFFSET_BITS=64 unless this is defined
+# webkit internally uses this module as well
+ifneq ($(BR2_PACKAGE_QT_SQLITE_QT)$(BR2_PACKAGE_QT_WEBKIT),)
+QT_CFLAGS += -DSQLITE_DISABLE_LFS
+QT_CXXFLAGS += -DSQLITE_DISABLE_LFS
+endif
+
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
@@ -465,8 +476,8 @@ define QT_CONFIGURE_CMDS
 	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY),$(@D))
 	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB),$(@D))
 	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP),$(@D))
-	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS),$(@D))
-	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS),$(@D))
+	$(call QT_QMAKE_SET,CFLAGS,$(QT_CFLAGS),$(@D))
+	$(call QT_QMAKE_SET,CXXFLAGS,$(QT_CXXFLAGS),$(@D))
 	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS),$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
-- 
1.7.3.4
