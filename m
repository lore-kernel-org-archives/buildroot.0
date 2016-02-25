From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:26 +0000
Subject: [Buildroot] [PATCH 17/32] package/systemd: add optional support for
	random-seed
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-18-git-send-email-gabe@hashrabbit.co>
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
index 4d53054..8cce2c9 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -143,6 +143,15 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
+config BR2_PACKAGE_SYSTEMD_RANDOMSEED
+	bool "enable random-seed support"
+	help
+	  systemd-random-seed is a service that restores the random seed of the system
+	  at early boot and saves it at shutdown. Saving/restoring the random seed
+	  across boots increases the amount of available entropy early at boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5257729..0c5f056 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -169,6 +169,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-firstboot
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RANDOMSEED),y)
+SYSTEMD_CONF_OPTS += --enable-randomseed
+else
+SYSTEMD_CONF_OPTS += --disable-randomseed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
