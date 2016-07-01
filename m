From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:07 +0200
Subject: [Buildroot] [PATCH 07/31] package/systemd: add optional support for
	logind
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-7-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 7 +++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b562e64..944aeb7 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -183,6 +183,13 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
 
+config BR2_PACKAGE_SYSTEMD_LOGIND
+	bool "enable login daemon"
+	help
+	  systemd-logind is a system service that manages user logins.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index edd72c1..93b56fc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -195,6 +195,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-rfkill
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
+SYSTEMD_CONF_OPTS += --enable-logind
+else
+SYSTEMD_CONF_OPTS += --disable-logind
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
