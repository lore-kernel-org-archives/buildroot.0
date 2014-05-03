From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 May 2014 17:35:45 +0200
Subject: [Buildroot] [PATCH] avahi: Add systemd init script
Message-ID: <1399131345-11199-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This consists of two files:
  - avahi-daemon.service:
    It start/stop the daemon avahi, it's a copy of the S50avahi-daemon
    script.
  - avahi_tmpfiles.conf:
    This one gets installed in /usr/lib/tmpfiles.d/ to be used by
    systemd-tmpfiles which will create the correct directory structure
    with the appropriate rights.
    This is the equivalent of the S05avahi-setup.sh script.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/avahi/avahi-daemon.service | 15 +++++++++++++++
 package/avahi/avahi.mk             | 22 +++++++++++++++++++---
 package/avahi/avahi_tmpfiles.conf  |  1 +
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 package/avahi/avahi-daemon.service
 create mode 100644 package/avahi/avahi_tmpfiles.conf

diff --git a/package/avahi/avahi-daemon.service b/package/avahi/avahi-daemon.service
new file mode 100644
index 0000000..c9b7b1f
--- /dev/null
+++ b/package/avahi/avahi-daemon.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Avahi daemon
+Requires=dbus.target
+After=syslog.target network.target auditd.service
+
+[Service]
+Type=oneshot
+RemainAfterExit=ye
+ExecStart=/usr/sbin/avahi-daemon -s
+ExecReload=/usr/sbin/avahi-daemon -r
+ExecStop=/usr/sbin/avahi-daemon -k
+Restart=restart-always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 609b05d..6e84564 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -153,12 +153,28 @@ ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_AUTOIPD
 endif
 
-define AVAHI_INSTALL_DAEMON_INITSCRIPT
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+
+define AVAHI_INSTALL_INIT_SYSTEMD
+  $(INSTALL) -D -m 644 package/avahi/avahi-daemon.service \
+    $(TARGET_DIR)/etc/systemd/system/avahi-daemon.service
+
+  mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+  ln -fs ../avahi-daemon.service \
+    $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
+
+  mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
+
+  $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
+    $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
+
+endef
+
+define AVAHI_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
 endef
 
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
-AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
 endif
 
 $(eval $(autotools-package))
diff --git a/package/avahi/avahi_tmpfiles.conf b/package/avahi/avahi_tmpfiles.conf
new file mode 100644
index 0000000..41eb3c6
--- /dev/null
+++ b/package/avahi/avahi_tmpfiles.conf
@@ -0,0 +1 @@
+d /tmp/avahi-autopid 0755 default default
-- 
1.9.2
