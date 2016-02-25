From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:25 +0000
Subject: [Buildroot] [PATCH 16/32] package/systemd: add optional support for
	firstboot
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-17-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index a6c888b..4d53054 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -135,6 +135,14 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
 
+config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
+	bool "enable firstboot support"
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
index 296c079..5257729 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -163,6 +163,12 @@ else
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
1.9.1
