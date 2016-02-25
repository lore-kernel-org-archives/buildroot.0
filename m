From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:28 +0000
Subject: [Buildroot] [PATCH 19/32] package/systemd: add optional support for
	rfkill
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-20-git-send-email-gabe@hashrabbit.co>
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
index 1238340..f1cbc95 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -160,6 +160,14 @@ config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
 
+config BR2_PACKAGE_SYSTEMD_RFKILL
+	bool "enable rfkill tools"
+	help
+	  systemd-rfkill is a service that restores the RF kill switch state at early
+	  boot and saves it at shutdown.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 09f9071..f7036b9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -181,6 +181,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-backlight
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RFKILL),y)
+SYSTEMD_CONF_OPTS += --enable-rfkill
+else
+SYSTEMD_CONF_OPTS += --disable-rfkill
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
