From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:06 +0200
Subject: [Buildroot] [PATCH 06/31] package/systemd: add optional support for
	rfkill
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 5e17209..b562e64 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -175,6 +175,14 @@ config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 
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
index 98c97c3..edd72c1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -189,6 +189,12 @@ else
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
2.8.1
