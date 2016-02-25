From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:34 +0000
Subject: [Buildroot] [PATCH 25/32] package/systemd: add optional support for
	localed
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-26-git-send-email-gabe@hashrabbit.co>
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
index d7ff2a2..0069fed 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -214,6 +214,15 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
 
+config BR2_PACKAGE_SYSTEMD_LOCALED
+	bool "enable locale daemon"
+	help
+	  systemd-localed is a system service that may be used as mechanism to change
+	  the system locale settings, as well as the console key mapping and default
+	  X11 key mapping.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f7b1bbb..b962131 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -217,6 +217,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-timedated
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOCALED),y)
+SYSTEMD_CONF_OPTS += --enable-localed
+else
+SYSTEMD_CONF_OPTS += --disable-localed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
