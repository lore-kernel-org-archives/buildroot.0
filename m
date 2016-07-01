From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:10 +0200
Subject: [Buildroot] [PATCH 10/31] package/systemd: add optional support for
	hostnamed
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-10-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Maxime: add default y]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 17f62a4..68f410d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -212,6 +212,15 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+config BR2_PACKAGE_SYSTEMD_HOSTNAMED
+	bool "enable hostname daemon"
+	default y
+	help
+	  systemd-hostnamed is a system service that may be used as a mechanism to
+	  change the system's hostname.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8bcbcf8..5e58017 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -213,6 +213,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-importd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HOSTNAMED),y)
+SYSTEMD_CONF_OPTS += --enable-hostnamed
+else
+SYSTEMD_CONF_OPTS += --disable-hostnamed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
