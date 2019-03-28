From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:52:50 +0100
Subject: [Buildroot] [git commit] package/fail2ban: add fixup for default
 configuration
Message-ID: <20190328164950.30D21884E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d46985a736b63c723c8092a121c8da72099397e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fail2ban default configuration is not compatible with buildroot as is.
In order to not force the user to overwrite it in an overlay and
having a fail2ban service running out of the box, this patch adds a
fixup step to adapt the default configuration to running on buildroot.

The dbfile is None to not add a dependency on
BR2_PACKAGE_PYTHON_SQLITE.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fail2ban/fail2ban.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index b7e6bdc1a6..16fa63c147 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -10,6 +10,13 @@ FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_SETUP_TYPE = distutils
 
+define FAIL2BAN_FIX_DEFAULT_CONFIG
+	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
+	$(SED) '/^pidfile/c\pidfile = /run/fail2ban.pid' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
+	$(SED) '/^dbfile/c\dbfile = None' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
+endef
+FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_DEFAULT_CONFIG
+
 define FAIL2BAN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/fail2ban/S60fail2ban \
 		$(TARGET_DIR)/etc/init.d/S60fail2ban
@@ -22,6 +29,7 @@ define FAIL2BAN_INSTALL_INIT_SYSTEMD
 	ln -fs ../../../../usr/lib//systemd/system/fail2ban.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fail2ban.service
 	$(SED) 's, at BINDIR@,/usr/bin,g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+	$(SED) '/^PIDFile/c\PIDFile=/run/fail2ban.pid' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
 endef
 
 $(eval $(python-package))
