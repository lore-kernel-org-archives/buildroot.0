From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:30 +0000
Subject: [Buildroot] [PATCH 21/32] package/systemd: add optional support for
	machined
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-22-git-send-email-gabe@hashrabbit.co>
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
index b9727e6..41c02a6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -175,6 +175,14 @@ config BR2_PACKAGE_SYSTEMD_LOGIND
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
 
+config BR2_PACKAGE_SYSTEMD_MACHINED
+	bool "enable machine daemon"
+	help
+	  systemd-machined is a system service that keeps track of virtual machines
+	  and containers, and processes belonging to them.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 680efb8..6d6a15e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -193,6 +193,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-logind
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
+SYSTEMD_CONF_OPTS += --enable-machined
+else
+SYSTEMD_CONF_OPTS += --disable-machined
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
