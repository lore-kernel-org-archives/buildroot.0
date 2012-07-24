From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 00:10:29 +0200
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
Message-ID: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

prefix should always be /usr, and destdir must be passed as DESTDIR,
and in the environment, not as a scons argument. Finally, we pass the
sysroot= argument to scons so that it doesn't add -L/usr/lib
parameters when compiling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7d1dbcd..759cd9c 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -17,8 +17,9 @@ GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
 GPSD_SCONS_OPTS = \
 	arch=$(ARCH)\
-	prefix=$(TARGET_DIR)/usr\
+	prefix=/usr\
 	chrpath=no\
+	sysroot=$(STAGING_DIR)\
 	strip=no
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
@@ -210,9 +211,9 @@ endef
 define GPSD_INSTALL_TARGET_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
+		DESTDIR=$(TARGET_DIR) \
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		destdir=$(TARGET_DIR) \
 		install)
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
 		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
@@ -223,10 +224,9 @@ endef
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
+		DESTDIR=$(TARGET_DIR) \
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		destdir=$(STAGING_DIR) \
-		includedir="$(STAGING_DIR)/usr/include" \
 		install)
 endef
 
-- 
1.7.9.5
