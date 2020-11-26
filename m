From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 26 Nov 2020 16:28:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config options
Message-ID: <20201126152832.1115350-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd has very many options, adding a way for the user
to set custom options can help customizations
without changing buildroot files.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 2c89538987..946b2d9905 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -89,6 +89,14 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
+config BR2_PACKAGE_SYSTEMD_EXTRA_CONFIG
+	string "Additional target systemd options"
+	default ""
+	help
+	  Any additional systemd configure options you may want to
+	  include. The options are appended to Buildroot generated
+	  options and can override these.
+
 config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2f1d898e0d..878e99ed00 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -500,6 +500,8 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
+SYSTEMD_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_SYSTEMD_EXTRA_CONFIG))
+
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs multi-user.target \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
-- 
2.29.2
