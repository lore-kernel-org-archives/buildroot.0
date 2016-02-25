From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:32 +0000
Subject: [Buildroot] [PATCH 23/32] package/systemd: add optional support for
	hostnamed
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-24-git-send-email-gabe@hashrabbit.co>
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
index 601281c..f388936 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -197,6 +197,14 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+config BR2_PACKAGE_SYSTEMD_HOSTNAMED
+	bool "enable hostname daemon"
+	help
+	  systemd-hostnamed is a system service that may be used as a mechanism to
+	  change the system's hostname.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5369b8a..1492885 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -205,6 +205,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-importd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HOSTNAMED),y)
+SYSTEMD_CONF_OPTS += --enable-hostnamed
+else
+SYSTEMD_CONF_OPTS += --disable-hostnamed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
