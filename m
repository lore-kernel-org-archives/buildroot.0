From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Tue, 14 Jul 2015 15:51:06 +0200
Subject: [Buildroot] [PATCHv2] transmission: improve systemd support
In-Reply-To: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
Message-ID: <1436881866-2168-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxim Mikityanskiy <maxtram95@gmail.com>

Support running transmission-daemon in system-wide mode using systemd:

1. Pass --with-systemd-daemon to configure script if systemd is enabled.

2. Install sysctl.d config file to increase send and receive buffer
sizes.

3. Install sysusers.d config file to create transmission user when using
systemd. Create transmission user when not using systemd.

4. Install transmission-daemon.service for systemd.

[Aur?lien : Fix symlink relative path, use upstream service file,
no need for config path, and use transmission user in sysv script]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/transmission/S92transmission            |  4 +--
 package/transmission/transmission.mk            | 37 +++++++++++++++++++++++++
 package/transmission/transmission_sysctl.conf   |  2 ++
 package/transmission/transmission_sysusers.conf |  1 +
 4 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 package/transmission/transmission_sysctl.conf
 create mode 100644 package/transmission/transmission_sysusers.conf

diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
index 1870522..e5976b0 100644
--- a/package/transmission/S92transmission
+++ b/package/transmission/S92transmission
@@ -24,9 +24,7 @@
 # by default, this is set to 'transmission'.
 # For the sake of security you shouldn't set a password
 # on this user
-#USERNAME=transmission
-USERNAME=default
-
+USERNAME=transmission
 
 
 # ----- *ADVANCED* CONFIGURATION -----
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index bbc32bf..81dd110 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -36,11 +36,48 @@ endif
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 TRANSMISSION_CONF_OPTS += --enable-daemon
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TRANSMISSION_DEPENDENCIES += systemd
+TRANSMISSION_CONF_OPTS += --with-systemd-daemon
+else
+TRANSMISSION_CONF_OPTS += --without-systemd-daemon
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
+	$(INSTALL) -D -m 0755 $(@D)/daemon/transmission-daemon.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/transmission-daemon.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/transmission-daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/transmission-daemon.service
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
-- 
2.4.5
