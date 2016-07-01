From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:08 +0200
Subject: [Buildroot] [PATCH 08/31] package/systemd: add optional support for
	machined
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-8-git-send-email-maxime.hadjinlian@gmail.com>
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
index 944aeb7..8a1c312 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -190,6 +190,14 @@ config BR2_PACKAGE_SYSTEMD_LOGIND
 
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
index 93b56fc..44a22a9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -201,6 +201,12 @@ else
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
2.8.1
