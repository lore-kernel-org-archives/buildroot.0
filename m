From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Mon, 20 Jul 2015 00:18:01 +0200
Subject: [Buildroot] [PATCH v3] transmission: improve systemd support
In-Reply-To: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
Message-ID: <1437344281-12250-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxim Mikityanskiy <maxtram95@gmail.com>

Support running transmission-daemon in system-wide mode using systemd:

1. Pass --with-systemd-daemon to configure script if systemd is enabled.

2. Create the transmission user if having daemon

3. Install transmission-daemon.service for systemd.

[Aur?lien : Fix symlink relative path, use upstream service file,
no need for config path, and use transmission user in sysv script,
remove sysctl stuff]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/transmission/S92transmission |  4 +---
 package/transmission/transmission.mk | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

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
index bbc32bf..efc00a1 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -36,11 +36,30 @@ endif
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 TRANSMISSION_CONF_OPTS += --enable-daemon
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TRANSMISSION_DEPENDENCIES += systemd
+TRANSMISSION_CONF_OPTS += --with-systemd-daemon
+else
+TRANSMISSION_CONF_OPTS += --without-systemd-daemon
+endif
+
+define TRANSMISSION_USERS
+	transmission -1 transmission -1 * /var/lib/transmission - transmission Transmission Daemon
+endef
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
 else
 TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
-- 
2.4.6
