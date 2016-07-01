From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:04 +0200
Subject: [Buildroot] [PATCH 04/31] package/systemd: add optional support for
	random-seed
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f028d4e..c08ddf1 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -158,6 +158,15 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
+config BR2_PACKAGE_SYSTEMD_RANDOMSEED
+	bool "enable random-seed support"
+	help
+	  systemd-random-seed is a service that restores the random seed of the system
+	  at early boot and saves it at shutdown. Saving/restoring the random seed
+	  across boots increases the amount of available entropy early at boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c5d6478..5672f00 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -177,6 +177,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-firstboot
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RANDOMSEED),y)
+SYSTEMD_CONF_OPTS += --enable-randomseed
+else
+SYSTEMD_CONF_OPTS += --disable-randomseed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
