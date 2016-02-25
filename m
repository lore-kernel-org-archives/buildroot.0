From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:24 +0000
Subject: [Buildroot] [PATCH 15/32] package/systemd: add optional support for
	sysusers
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-16-git-send-email-gabe@hashrabbit.co>
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
index 2f89b0e..a6c888b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -127,6 +127,14 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUSERS
+	bool "enable sysusers support"
+	help
+	  systemd-sysusers creates system users and groups, based on the file format
+	  and location specified in sysusers.d(5).
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index aebdbbc..296c079 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -157,6 +157,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-tmpfiles
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+SYSTEMD_CONF_OPTS += --enable-sysusers
+else
+SYSTEMD_CONF_OPTS += --disable-sysusers
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
