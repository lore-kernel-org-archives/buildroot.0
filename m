From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 24 Jul 2012 21:29:09 +0100
Subject: [Buildroot] [PATCH] gpsd: fix qt build problem
Message-ID: <1343161749-23289-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

When gpsd is configured with Qt bindings enabled, the build falls over
because the Qt headers are not found.

A representative build log can be seen at

  http://autobuild.buildroot.org/results/c76888749337788c9ae9a04499f1fc1e1c5a2e81/build-end.log

This patch sets CFLAGS in the environment, so that the headers are found.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/gpsd.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7d1dbcd..7a492ad 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -12,6 +12,7 @@ GPSD_INSTALL_STAGING = YES
 GPSD_DEPENDENCIES = host-scons
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
+GPSD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/QtCore -I$(STAGING_DIR)/usr/include/QtNetwork
 
 GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
@@ -198,7 +199,7 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 	GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
-GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)"
+GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
 
 define GPSD_BUILD_CMDS
 	(cd $(@D); \
-- 
1.7.9.5
