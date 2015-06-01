From: Doug Kehn <rdkehn@yahoo.com>
Date: Sun, 31 May 2015 21:19:07 -0500
Subject: [Buildroot] [PATCH 1/1] package/pppd: install pon/poff option
Message-ID: <1433125147-11903-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Config option for installing pon and poff scritps.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/pppd/Config.in | 5 +++++
 package/pppd/pppd.mk   | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index b77d7b0..f1f1da0 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -22,6 +22,11 @@ config BR2_PACKAGE_PPPD_RADIUS
 	help
 	  Install RADIUS support for pppd
 
+config BR2_PACKAGE_PPPD_PON_POFF
+	bool "pon poff scripts"
+	help
+	  Install pon and poff scripts.
+
 endif
 
 comment "pppd needs a toolchain w/ dynamic library"
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0f9945f..bab9f8b 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -75,6 +75,13 @@ define PPPD_INSTALL_RADIUS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_PPPD_PON_POFF),y)
+define PPPD_INSTALL_PON_POFF
+	$(INSTALL) -D -m 0755 $(PPPD_DIR)/scripts/pon $(TARGET_DIR)/usr/bin/pon
+	$(INSTALL) -D -m 0755 $(PPPD_DIR)/scripts/poff $(TARGET_DIR)/usr/bin/poff
+endef
+endif
+
 define PPPD_INSTALL_TARGET_CMDS
 	for sbin in $(PPPD_TARGET_BINS); do \
 		$(INSTALL) -D $(PPPD_DIR)/$$sbin/$$sbin \
@@ -99,6 +106,7 @@ define PPPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
 	$(PPPD_INSTALL_RADIUS)
+	$(PPPD_INSTALL_PON_POFF)
 endef
 
 define PPPD_INSTALL_STAGING_CMDS
-- 
2.4.1
