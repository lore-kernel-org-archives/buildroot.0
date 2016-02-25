From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:29 +0000
Subject: [Buildroot] [PATCH 20/32] package/systemd: add optional support for
	logind
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-21-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 7 +++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f1cbc95..b9727e6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -168,6 +168,13 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 
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
index f7036b9..680efb8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -187,6 +187,12 @@ else
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
1.9.1
