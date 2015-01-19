From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:10 +0200
Subject: [Buildroot] [PATCH 10/16] package/transmission: improve systemd
	support
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support running transmission-daemon in system-wide mode using systemd:

1. Pass --with-systemd-daemon to configure script if systemd is enabled.

2. Install sysctl.d config file to increase send and receive buffer
sizes.

3. Install tmpfiles.d config file to create transmission config
directory.

4. Install sysusers.d config file to create transmission user when using
systemd. Create transmission user when not using systemd.

5. Install transmission-daemon.service for systemd.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/transmission/transmission-daemon.service | 12 +++++++
 package/transmission/transmission.mk             | 45 ++++++++++++++++++++++++
 package/transmission/transmission_sysctl.conf    |  2 ++
 package/transmission/transmission_sysusers.conf  |  1 +
 package/transmission/transmission_tmpfiles.conf  |  1 +
 5 files changed, 61 insertions(+)
 create mode 100644 package/transmission/transmission-daemon.service
 create mode 100644 package/transmission/transmission_sysctl.conf
 create mode 100644 package/transmission/transmission_sysusers.conf
 create mode 100644 package/transmission/transmission_tmpfiles.conf

diff --git a/package/transmission/transmission-daemon.service b/package/transmission/transmission-daemon.service
new file mode 100644
index 0000000..4e7c98b
--- /dev/null
+++ b/package/transmission/transmission-daemon.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Transmission BitTorrent Daemon
+After=network.target
+
+[Service]
+User=transmission
+Type=notify
+ExecStart=/usr/bin/transmission-daemon -f --log-error -g /var/lib/transmission/config
+ExecReload=/bin/kill -s HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index b8a5c42..b5b9c8b 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -36,11 +36,56 @@ endif
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 	TRANSMISSION_CONF_OPTS += --enable-daemon
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	TRANSMISSION_DEPENDENCIES += systemd
+	TRANSMISSION_CONF_OPTS += --with-systemd-daemon
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),)
+define TRANSMISSION_USERS
+	transmission -1 transmission -1 * /var/lib/transmission - transmission Transmission Daemon
+endef
+endif
+
 define TRANSMISSION_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
 		$(TARGET_DIR)/etc/init.d/S92transmission
 endef
 
+define TRANSMISSION_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/transmission/transmission-daemon.service \
+		$(TARGET_DIR)/lib/systemd/system/transmission-daemon.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs /lib/systemd/system/transmission-daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/transmission-daemon.service
+
+	mkdir -p $(TARGET_DIR)/var/lib/transmission/config
+endef
+
+define TRANSMISSION_INSTALL_SYSCTL_HOOK
+	$(INSTALL) -D -m 644 package/transmission/transmission_sysctl.conf \
+		$(TARGET_DIR)/usr/lib/sysctl.d/20-transmission.conf
+endef
+
+TRANSMISSION_POST_INSTALL_TARGET_HOOKS += \
+	TRANSMISSION_INSTALL_SYSCTL_HOOK
+
+define TRANSMISSION_INSTALL_TMPFILES_HOOK
+	$(INSTALL) -D -m 644 package/transmission/transmission_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/transmission.conf
+endef
+
+TRANSMISSION_POST_INSTALL_TARGET_HOOKS += \
+	TRANSMISSION_INSTALL_TMPFILES_HOOK
+
+define TRANSMISSION_INSTALL_SYSUSERS_HOOK
+	$(INSTALL) -D -m 644 package/transmission/transmission_sysusers.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/transmission.conf
+endef
+
+TRANSMISSION_POST_INSTALL_TARGET_HOOKS += \
+	TRANSMISSION_INSTALL_SYSUSERS_HOOK
+
 else
 	TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
diff --git a/package/transmission/transmission_sysctl.conf b/package/transmission/transmission_sysctl.conf
new file mode 100644
index 0000000..7862332
--- /dev/null
+++ b/package/transmission/transmission_sysctl.conf
@@ -0,0 +1,2 @@
+net.core.wmem_max = 1048576
+net.core.rmem_max = 4194304
diff --git a/package/transmission/transmission_sysusers.conf b/package/transmission/transmission_sysusers.conf
new file mode 100644
index 0000000..09396d4
--- /dev/null
+++ b/package/transmission/transmission_sysusers.conf
@@ -0,0 +1 @@
+u transmission - "Transmission daemon" /var/lib/transmission
diff --git a/package/transmission/transmission_tmpfiles.conf b/package/transmission/transmission_tmpfiles.conf
new file mode 100644
index 0000000..e40b94a
--- /dev/null
+++ b/package/transmission/transmission_tmpfiles.conf
@@ -0,0 +1 @@
+d /var/lib/transmission/config 0700 transmission users -
-- 
2.2.1
