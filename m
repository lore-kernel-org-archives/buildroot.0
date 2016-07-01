From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:14 +0200
Subject: [Buildroot] [PATCH 14/31] package/systemd: add optional support for
	polkit
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-14-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b0cc672..a857a95 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -248,6 +248,16 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 
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
index 4a2654c..5b0aa01 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -237,6 +237,12 @@ else
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
2.8.1
