From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:22 +0000
Subject: [Buildroot] [PATCH 13/32] package/systemd: add optional support for
	quotacheck
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-14-git-send-email-gabe@hashrabbit.co>
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
index c111d46..2ebd825 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -109,6 +109,15 @@ config BR2_PACKAGE_SYSTEMD_BOOTCHART
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
 
+config BR2_PACKAGE_SYSTEMD_QUOTACHECK
+	bool "enable quotacheck tools"
+	help
+	  systemd-quotacheck is a service responsible for file system quota checks. It
+	  is run once at boot after all necessary file systems are mounted. It is
+	  pulled in only if at least one file system has quotas enabled.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6627177..14c180a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -145,6 +145,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-bootchart
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
+SYSTEMD_CONF_OPTS += --enable-quotacheck
+else
+SYSTEMD_CONF_OPTS += --disable-quotacheck
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
