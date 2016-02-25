From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:36 +0000
Subject: [Buildroot] [PATCH 27/32] package/systemd: add optional support for
	polkit
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-28-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 1596d88..b0dbdbd 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -231,6 +231,16 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
+config BR2_PACKAGE_SYSTEMD_POLKIT
+	bool "enable polkit support"
+	select BR2_PACKAGE_POLKIT
+	help
+	  If enabled, systemd is built with polkit support and policy files for its
+	  services are generated and installed. It is useful for allowing unprivileged
+	  processes to speak to systemd's many privileged processes.
+
+	  http://wiki.freedesktop.org/www/Software/polkit/
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3e6d055..9f64971 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -229,6 +229,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-coredump
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
+SYSTEMD_CONF_OPTS += --enable-polkit
+else
+SYSTEMD_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
