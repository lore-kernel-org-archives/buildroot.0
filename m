From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 18:12:34 +0100
Subject: [Buildroot] [git commit] package/fail2ban: add python3 support
Message-ID: <20200203170133.68D0D88DBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d666026385573286371a0f5d9f4b5e0d80f723b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fail2ban codebase is still native python2, but 2to3 is supported
upstream.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
[Peter: ensure host-python3 is available]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/Config.in   | 2 +-
 package/fail2ban/fail2ban.mk | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 8fa63bfdcb..39e996fdb6 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
 	  bans IPs that show the malicious signs -- too many password
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 07c0c04787..6f023b48a1 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -10,6 +10,14 @@ FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_SETUP_TYPE = distutils
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+define FAIL2BAN_PYTHON_2TO3
+	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
+endef
+FAIL2BAN_DEPENDENCIES += host-python3
+FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_PYTHON_2TO3
+endif
+
 define FAIL2BAN_FIX_DEFAULT_CONFIG
 	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
 	$(SED) '/^pidfile/c\pidfile = /run/fail2ban.pid' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
