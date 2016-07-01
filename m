From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:05 +0200
Subject: [Buildroot] [PATCH 05/31] package/systemd: add optional support for
	backlight
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-5-git-send-email-maxime.hadjinlian@gmail.com>
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
index c08ddf1..5e17209 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -167,6 +167,14 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
+config BR2_PACKAGE_SYSTEMD_BACKLIGHT
+	bool "enable backlight support"
+	help
+	  systemd-backlight is a service that restores the display backlight
+	  brightness at early boot and saves it at shutdown.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5672f00..98c97c3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -183,6 +183,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-randomseed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BACKLIGHT),y)
+SYSTEMD_CONF_OPTS += --enable-backlight
+else
+SYSTEMD_CONF_OPTS += --disable-backlight
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
