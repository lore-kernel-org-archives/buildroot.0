From: Robert Hancock <hancock@sedsystems.ca>
Date: Wed, 29 May 2019 17:02:41 -0600
Subject: [Buildroot] [PATCH] package/gpsd: Fix systemd service installation
 and paths
Message-ID: <1559170961-14091-1-git-send-email-hancock@sedsystems.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix several issues with systemd service file installation for gpsd:

-systemd support in the gpsd build was defaulting to enabled or not
based on whether the host system had systemd directories present. Set
this explicitly based on whether BR2_INIT_SYSTEMD is set.

-The installed systemd service files referenced paths in /usr/local when
the actual binaries are installed in /usr. Replace /usr/local with /usr
in the installed service files.

-When BR2_PACKAGE_HAS_UDEV was enabled, all of the binaries were
re-installed again, along with the udev rules, as part of the
post-install hooks. Just choose between using install and udev-install
based on whether udev is enabled to avoid redundant re-installations.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 package/gpsd/gpsd.mk | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index d2c7612..a5c7477 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -24,7 +24,8 @@ GPSD_SCONS_OPTS = \
 	sysroot=$(STAGING_DIR)\
 	strip=no\
 	python=no \
-	qt=no
+	qt=no \
+	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 GPSD_DEPENDENCIES += ncurses
@@ -216,7 +217,7 @@ define GPSD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) \
 		$(HOST_DIR)/bin/python2 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		install)
+		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
 endef
 
 define GPSD_INSTALL_INIT_SYSV
@@ -224,6 +225,14 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
+define GPSD_INSTALL_INIT_SYSTEMD
+# systemd unit files are installed automatically, but need to update the
+# /usr/local path references in the provided files to /usr.
+	$(SED) 's%/usr/local%/usr%' \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl at .service
+endef
+
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
@@ -233,16 +242,10 @@ define GPSD_INSTALL_STAGING_CMDS
 		install)
 endef
 
-# After installing the udev rule, make it writable so that this
+# After the udev rule is installed, make it writable so that this
 # package can be re-built/re-installed.
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define GPSD_INSTALL_UDEV_RULES
-	(cd $(@D); \
-		$(GPSD_SCONS_ENV) \
-		DESTDIR=$(TARGET_DIR) \
-		$(HOST_DIR)/bin/python2 $(SCONS) \
-		$(GPSD_SCONS_OPTS) \
-		udev-install)
 	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
 endef
 
-- 
1.8.3.1
