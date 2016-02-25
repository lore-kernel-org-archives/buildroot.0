From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:21 +0000
Subject: [Buildroot] [PATCH 12/32] package/systemd: add optional support for
	bootchart
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-13-git-send-email-gabe@hashrabbit.co>
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
index b4b844f..c111d46 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -100,6 +100,15 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
+config BR2_PACKAGE_SYSTEMD_BOOTCHART
+	bool "enable bootchart tool"
+	help
+	  systemd-bootchart is a tool, usually run at system startup, that collects
+	  the CPU load, disk load, memory usage, as well as per-process information
+	  from a running system. Collected results are output as an SVG graph.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 75e2739..6627177 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -139,6 +139,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-vconsole
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BOOTCHART),y)
+SYSTEMD_CONF_OPTS += --enable-bootchart
+else
+SYSTEMD_CONF_OPTS += --disable-bootchart
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
