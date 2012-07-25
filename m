From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:25:42 +0200
Subject: [Buildroot] [git commit branch/next] gpsd: proper usage of prefix
	and DESTDIR
Message-ID: <20120802195300.CB0D696CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c0f75e444846f6436a3c49b40dab9d56032acfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

prefix should always be /usr, and destdir must be passed as DESTDIR,
and in the environment, not as a scons argument. Finally, we pass the
sysroot= argument to scons so that it doesn't add -L/usr/lib
parameters when compiling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index c5270bd..e96d979 100644
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
@@ -207,9 +208,9 @@ endef
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
@@ -220,10 +221,9 @@ endef
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
+		DESTDIR=$(STAGING_DIR) \
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		destdir=$(STAGING_DIR) \
-		includedir="$(STAGING_DIR)/usr/include" \
 		install)
 endef
 
