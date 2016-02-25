From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:33 +0000
Subject: [Buildroot] [PATCH 24/32] package/systemd: add optional support for
	timedated
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-25-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f388936..d7ff2a2 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -205,6 +205,15 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
+config BR2_PACKAGE_SYSTEMD_TIMEDATED
+	bool "enable timedate daemon"
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
index 1492885..f7b1bbb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -211,6 +211,12 @@ else
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
1.9.1
