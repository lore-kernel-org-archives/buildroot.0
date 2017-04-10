From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 02:17:00 +0200
Subject: [Buildroot] [PATCH v2] xenomai: Add config for enabling/disabling
	SMP
In-Reply-To: <20170406234657.31813-1-sikor6@gmail.com>
References: <20170406234657.31813-1-sikor6@gmail.com>
Message-ID: <20170410001700.31490-1-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option for enabling/disabling SMP
in Xenomai userspace in version 3.x

Enabled by default.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
Changes v1 -> v2:
 - default y, moving comment to help, changed help, adding explicitly
   --disable-smp opt in the else statement (suggested by Arnout V.)
 
 package/xenomai/Config.in  | 24 ++++++++++++++++++++++++
 package/xenomai/xenomai.mk |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b548ee810..b2697e5af 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,6 +51,30 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
 	  Kernel -> Linux Kernel Extensions menu.
 
+config BR2_PACKAGE_XENOMAI_ENABLE_SMP
+	bool "Enable SMP"
+	default y
+	help
+	  This option allows to enable SMP in Xenomai userspace.
+
+	  Please note:
+	  If you use Xenomai 2.x you have SMP enabled by default.
+
+	  Xenomai 3.x is being built by default with SMP disabled,
+	  but to have a behaviour similar to previous versions,
+	  option is enabled by default and you need to uncheck it
+	  if you don't need it.
+
+	  Second reason of setting it by default is that Xenomai
+	  userspace with SMP enabled and with Linux Kernel without
+	  SMP config are working fine together.
+	  But NOT the other way around.
+
+	  Please refer to this troubleshooting guide for more
+	  information in section "feature mismatch: missing=?smp/nosmp?:
+
+	  https://xenomai.org/troubleshooting-a-dual-kernel-configuration/
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c9e810e05..04880e69a 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -23,6 +23,12 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
 
+ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_SMP),y)
+XENOMAI_CONF_OPTS += --enable-smp
+else
+XENOMAI_CONF_OPTS += --disable-smp
+endif
+
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
-- 
2.12.1
