From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:02 +0200
Subject: [Buildroot] [PATCH 02/31] package/systemd: add optional support for
	sysusers
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 65998a4..3aa9ff0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -141,6 +141,14 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
 
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
index 779d7c5..0520ced 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -165,6 +165,12 @@ else
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
2.8.1
