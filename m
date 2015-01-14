From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 14 Jan 2015 01:37:24 +0100
Subject: [Buildroot] [PATCH 1/1] pppd: add config option to install scripts
	shipped with pppd's source
Message-ID: <1421195844-865-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/pppd/Config.in | 8 ++++++++
 package/pppd/pppd.mk   | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index b77d7b0..6933fcf 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -22,6 +22,14 @@ config BR2_PACKAGE_PPPD_RADIUS
 	help
 	  Install RADIUS support for pppd
 
+config BR2_PACKAGE_PPPD_INSTALL_SCRIPTS
+	string "Install these PPP scripts"
+	default ""
+	help
+	  Space delimited list to specify which scripts
+	  need to be installed from pppd source tree's
+	  scripts directory
+
 endif
 
 comment "pppd needs a toolchain w/ dynamic library"
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 453445b..34e1d59 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -14,6 +14,7 @@ PPPD_LICENSE_FILES = \
 
 PPPD_INSTALL_STAGING = YES
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
+PPPD_TARGET_SCRIPTS = $(call qstrip,$(BR2_PACKAGE_PPPD_INSTALL_SCRIPTS))
 PPPD_RADIUS_CONF = \
 	dictionary dictionary.ascend dictionary.compat \
 	dictionary.merit dictionary.microsoft \
@@ -83,6 +84,10 @@ define PPPD_INSTALL_TARGET_CMDS
 		$(INSTALL) -D $(PPPD_DIR)/$$sbin/$$sbin \
 			$(TARGET_DIR)/usr/sbin/$$sbin; \
 	done
+	for scriptfile in $(PPPD_TARGET_SCRIPTS); do \
+		$(INSTALL) -D $(PPPD_DIR)/scripts/$$scriptfile \
+			$(TARGET_DIR)/usr/sbin/; \
+	done
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/minconn.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/minconn.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/passprompt.so \
-- 
2.1.0
