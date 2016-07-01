From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:03 +0200
Subject: [Buildroot] [PATCH 03/31] package/systemd: add optional support for
	firstboot
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-3-git-send-email-maxime.hadjinlian@gmail.com>
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
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 3aa9ff0..f028d4e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -149,6 +149,15 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
 
+config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
+	bool "enable firstboot support"
+	default y
+	help
+	  systemd-firstboot initializes the most basic system settings interactively
+	  on the first boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0520ced..c5d6478 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -171,6 +171,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-sysusers
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_FIRSTBOOT),y)
+SYSTEMD_CONF_OPTS += --enable-firstboot
+else
+SYSTEMD_CONF_OPTS += --disable-firstboot
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
