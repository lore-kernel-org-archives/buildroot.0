From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:11 +0200
Subject: [Buildroot] [PATCH 11/31] package/systemd: add optional support for
	timedated
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-11-git-send-email-maxime.hadjinlian@gmail.com>
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
index 68f410d..bd282ea 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -221,6 +221,16 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
+config BR2_PACKAGE_SYSTEMD_TIMEDATED
+	bool "enable timedate daemon"
+	default y
+	help
+	  systemd-timedated is a system service that may be used as a mechanism to
+	  change the system clock and timezone, as well as to enable/disable NTP
+	  time synchronization.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5e58017..ad75315 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -219,6 +219,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-hostnamed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TIMEDATED),y)
+SYSTEMD_CONF_OPTS += --enable-timedated
+else
+SYSTEMD_CONF_OPTS += --disable-timedated
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
