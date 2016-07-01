From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:12 +0200
Subject: [Buildroot] [PATCH 12/31] package/systemd: add optional support for
	localed
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-12-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bd282ea..22355d0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -231,6 +231,15 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 
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
index ad75315..ee7f74d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -225,6 +225,12 @@ else
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
2.8.1
