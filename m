From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:32:23 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/gpsd: Fix systemd
 service installation and paths
Message-ID: <20191031143059.00C278E276@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10be9575b6f98ce6e54763a7a7a0fa30a57cf53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fix several issues with systemd service file installation for gpsd:

- systemd support in the gpsd build was defaulting to enabled or not
based on whether the host system had systemd directories present. Set
this explicitly based on whether BR2_INIT_SYSTEMD is set.

- The installed systemd service files referenced paths in /usr/local when
the actual binaries are installed in /usr. Replace /usr/local with /usr
in the installed service files.

- When BR2_PACKAGE_HAS_UDEV was enabled, all of the binaries were
re-installed again, along with the udev rules, as part of the
post-install hooks. This overwrites the service files that were just
fixed up. Since udev-install implies install, we can just call
udev-install.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 690222d239c951c14844c9de4f8ce485af287f9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 79d2ccfeaa..9268b2fe6b 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -25,7 +25,8 @@ GPSD_SCONS_OPTS = \
 	strip=no \
 	python=no \
 	qt=no \
-	ntpshm=yes
+	ntpshm=yes \
+	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 GPSD_DEPENDENCIES += ncurses
@@ -214,7 +215,7 @@ define GPSD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) \
 		$(HOST_DIR)/bin/python2 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
-		install)
+		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
 endef
 
 define GPSD_INSTALL_INIT_SYSV
@@ -222,6 +223,14 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
+# systemd unit files are installed automatically, but need to update the
+# /usr/local path references in the provided files to /usr.
+define GPSD_INSTALL_INIT_SYSTEMD
+	$(SED) 's%/usr/local%/usr%' \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl at .service
+endef
+
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
@@ -231,16 +240,10 @@ define GPSD_INSTALL_STAGING_CMDS
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
 
