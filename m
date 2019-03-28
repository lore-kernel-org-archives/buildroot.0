From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 28 Mar 2019 14:41:00 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: add fixup for default
 configuration
Message-ID: <1553780460-1429-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fail2ban default configuration is not compatible with buildroot as is.
In order to not force the user to overwrite it in an overlay and having a
fail2ban service running out of the box, this patch adds a fixup step to
adapt the default configuration to running on buildroot.

The dbfile is None to not add a dependency on BR2_PACKAGE_PYTHON_SQLITE.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/fail2ban/fail2ban.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index b7e6bdc..0a3dd94 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -9,6 +9,13 @@ FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_SETUP_TYPE = distutils
+FAIL2BAN_POST_INSTALL_TARGET_HOOKS = FAIL2BAN_FIX_DEFAULT_CONFIG
+
+define FAIL2BAN_FIX_DEFAULT_CONFIG
+	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
+	$(SED) '/^pidfile/c\pidfile = /run/fail2ban.pid' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
+	$(SED) '/^dbfile/c\dbfile = None' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
+endef
 
 define FAIL2BAN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/fail2ban/S60fail2ban \
@@ -22,6 +29,7 @@ define FAIL2BAN_INSTALL_INIT_SYSTEMD
 	ln -fs ../../../../usr/lib//systemd/system/fail2ban.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fail2ban.service
 	$(SED) 's, at BINDIR@,/usr/bin,g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+	$(SED) '/^PIDFile/c\PIDFile=/run/fail2ban.pid' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
 endef
 
 $(eval $(python-package))
-- 
2.7.4
