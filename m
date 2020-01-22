From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Wed, 22 Jan 2020 14:15:14 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: add python3 support
Message-ID: <20200122131514.10400-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the fail2ban codebase is still native python2, but 2to3 is supported

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/fail2ban/Config.in   | 2 +-
 package/fail2ban/fail2ban.mk | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index f05adbb..86e6233 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 0a8f3c6..0c5de9a 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -10,6 +10,13 @@ FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_SETUP_TYPE = distutils
 
+define FAIL2BAN_PYTHON_2TO3
+	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
+endef
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_PYTHON_2TO3
+endif
+
 define FAIL2BAN_FIX_DEFAULT_CONFIG
 	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
 	$(SED) '/^pidfile/c\pidfile = /run/fail2ban.pid' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
-- 
2.7.4
