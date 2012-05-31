From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Date: Thu, 31 May 2012 20:08:10 +0300
Subject: [Buildroot] [PATCH] quota: new package (v5)
Message-ID: <1338484090-18434-1-git-send-email-jarkko.sakkinen@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
---
 package/Config.in       |    3 +++
 package/quota/Config.in |   13 +++++++++++++
 package/quota/quota.mk  |   18 ++++++++++++++++++
 3 files changed, 34 insertions(+)
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
index 0000000..62dcdfb
--- /dev/null
+++ b/package/quota/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QUOTA
+	bool "quota"
+	depends on BR2_INET_RPC
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+	  Implementation of the disk quota system.
+	  http://sourceforge.net/projects/linuxquota/
+
+comment "quota requires a toolchain with RPC + LARGEFILE + WCHAR support"
+	depends on !(BR2_INET_RPC && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
new file mode 100644
index 0000000..d84a12e
--- /dev/null
+++ b/package/quota/quota.mk
@@ -0,0 +1,18 @@
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
+QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
+
+# Package uses autoconf but not automake.
+QUOTA_INSTALL_TARGET_OPT = \
+	ROOTDIR=$(TARGET_DIR) \
+	install
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
