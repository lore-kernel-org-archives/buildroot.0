From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Date: Tue, 29 May 2012 23:23:15 +0300
Subject: [Buildroot] [PATCH] quota: new package
Message-ID: <1338322995-25082-1-git-send-email-jarkko.sakkinen@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added linuxquota package.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
---
 fs/skeleton/etc/network/interfaces |    2 ++
 package/Config.in                  |    3 +++
 package/quota/Config.in            |   11 +++++++++++
 package/quota/quota.mk             |   19 +++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/quota/Config.in
 create mode 100644 package/quota/quota.mk

diff --git a/fs/skeleton/etc/network/interfaces b/fs/skeleton/etc/network/interfaces
index 218b82c..e70b502 100644
--- a/fs/skeleton/etc/network/interfaces
+++ b/fs/skeleton/etc/network/interfaces
@@ -2,3 +2,5 @@
 auto lo
 iface lo inet loopback
 
+auto eth0
+iface eth0 inet dhcp
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
index 0000000..a2fa9b6
--- /dev/null
+++ b/package/quota/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QUOTA
+	bool "quota"
+	depends on BR2_INET_RPC
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+		Implementation of the disk quota system.
+		http://sourceforge.net/projects/linuxquota/
+
+comment "quota requires a toolchain with RPC support"
+	depends on !BR2_INET_RPC
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
new file mode 100644
index 0000000..7ed3839
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
+QUOTA_MAKE_OPT = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)"
+
+QUOTA_INSTALL_TARGET_OPT = \
+	ROOTDIR=$(TARGET_DIR) \
+	install
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
