From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:13 +0200
Subject: [Buildroot] [PATCH 13/31] package/systemd: add optional support for
	coredump
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-13-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 22355d0..b0cc672 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -240,6 +240,14 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
 
+config BR2_PACKAGE_SYSTEMD_COREDUMP
+	bool "enable coredump hook"
+	help
+	  systemd-coredump can be used as a helper binary by the kernel when a user
+	  space program receives a fatal signal and dumps core.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ee7f74d..4a2654c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -231,6 +231,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-localed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
+SYSTEMD_CONF_OPTS += --enable-coredump
+else
+SYSTEMD_CONF_OPTS += --disable-coredump
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
@@ -289,6 +295,7 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 define SYSTEMD_USERS
+	systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
-- 
2.8.1
