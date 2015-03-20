From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:16 -0400
Subject: [Buildroot] [PATCH v2 25/25] gpsd: fix udev and systemd support
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-26-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd should be enabled based on buildroot configuration, not host
systemd presence. SConstruct file had to be patched to install systemd
service files in /usr/lib; passed systemd_dir is overridden.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/gpsd/0004-fix-systemd-service-path.patch | 13 +++++++++++++
 package/gpsd/gpsd.mk                             | 15 ++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 package/gpsd/0004-fix-systemd-service-path.patch

diff --git a/package/gpsd/0004-fix-systemd-service-path.patch b/package/gpsd/0004-fix-systemd-service-path.patch
new file mode 100644
index 0000000..2f1d8e7
--- /dev/null
+++ b/package/gpsd/0004-fix-systemd-service-path.patch
@@ -0,0 +1,13 @@
+diff --git a/SConstruct b/SConstruct
+index 1afd28a..4be0189 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -90,7 +90,7 @@ def _getoutput(cmd, input=None, cwd=None, env=None):
+ # Start by reading configuration variables from the cache
+ opts = Variables('.scons-option-cache')
+ 
+-systemd_dir = '/lib/systemd/system'
++systemd_dir = '/usr/lib/systemd/system'
+ systemd = os.path.exists(systemd_dir)
+ 
+ # Set distribution-specific defaults here
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 3e6411b..e662eab 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -21,7 +21,14 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr\
 	sysroot=$(STAGING_DIR)\
 	strip=no\
-	python=no
+	python=no\
+	udevdir=/usr/lib/udev
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	GPSD_SCONS_OPTS += systemd=yes
+else
+	GPSD_SCONS_OPTS += systemd=no
+endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	GPSD_DEPENDENCIES += ncurses
@@ -213,6 +220,12 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
+define GPSD_INSTALL_INIT_SYSTEMD
+	mkdir -p /etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/gpsd.socket \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+endef
+
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
-- 
2.1.0
