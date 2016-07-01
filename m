From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:01 +0200
Subject: [Buildroot] [PATCH 01/31] package/systemd: add optional support for
	tmpfiles
Message-ID: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Maxime: Add default y]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 324e884..65998a4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -131,6 +131,16 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
 
+config BR2_PACKAGE_SYSTEMD_TMPFILES
+	bool "enable tmpfiles support"
+	default y
+	help
+	  systemd-tmpfiles creates, deletes, and cleans up volatile and temporary
+	  files and directories, based on the configuration file format and location
+	  specified in tmpfiles.d(5).
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c0503ae..779d7c5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -159,6 +159,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-quotacheck
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+SYSTEMD_CONF_OPTS += --enable-tmpfiles
+else
+SYSTEMD_CONF_OPTS += --disable-tmpfiles
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
