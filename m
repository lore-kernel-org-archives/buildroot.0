From: Pawel Sikora <sikor6@gmail.com>
Date: Fri,  7 Apr 2017 01:46:57 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add config for enabling SMP for 3.x
Message-ID: <20170406234657.31813-1-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option for enabling SMP in Xenomai
userspace, only for versions >= 3.x

In 2.x versions this option was enabled by
default, so for now behaviour for it will
not change, while as buildroot supports
now Xenomai 3.0.3 it's good to let users
have this option.

Add a comment about this config's behaviour
above this option in the menuconfig.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/xenomai/Config.in  | 12 ++++++++++++
 package/xenomai/xenomai.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b548ee810..cd323545c 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,6 +51,18 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
 	  Kernel -> Linux Kernel Extensions menu.
 
+comment "-------------------------------------------------------"
+comment "Please note:                                           "
+comment "Option for enabling SMP in Xenomai userspace is meant  "
+comment "only for Xenomai 3.x                                   "
+comment "If you use Xenomai 2.x you have SMP enabled by default."
+comment "-------------------------------------------------------"
+
+config BR2_PACKAGE_XENOMAI_ENABLE_SMP
+	bool "Enable SMP"
+	help
+	  This option allows to enable SMP in Xenomai userspace.
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c9e810e05..7af4e0cf5 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -23,6 +23,10 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
 
+ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_SMP),y)
+XENOMAI_CONF_OPTS += --enable-smp
+endif
+
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
-- 
2.12.1
