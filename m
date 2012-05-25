From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Date: Fri, 25 May 2012 09:33:45 +0300
Subject: [Buildroot] [PATCH] quota: add package
Message-ID: <1337927625-18671-1-git-send-email-jarkko.sakkinen@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
---
 package/Config.in       |    3 +++
 package/quota/Config.in |    9 +++++++++
 package/quota/quota.mk  |   19 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/quota/Config.in
 create mode 100644 package/quota/quota.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..eb76e14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -632,6 +632,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
+endif
+source "package/quota/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
diff --git a/package/quota/Config.in b/package/quota/Config.in
new file mode 100644
index 0000000..d2b7490
--- /dev/null
+++ b/package/quota/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QUOTA
+	bool "quota"
+	depends on BR2_INET_RPC
+	help
+		Implementation of the disk quota system.
+		http://sourceforge.net/projects/linuxquota/
+
+comment "quota requires a toolchain with RPC support"
+	depends on !BR2_INET_RPC
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
new file mode 100644
index 0000000..90254ba
--- /dev/null
+++ b/package/quota/quota.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# QUOTA
+#
+#############################################################
+
+QUOTA_VERSION = 4.00
+QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
+QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
+
+QUOTA_CONF_OPT = \
+	--prefix=$(TARGET_DIR) \
+	--exec-prefix=$(TARGET_DIR)
+
+QUOTA_MAKE_OPT = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)"
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
