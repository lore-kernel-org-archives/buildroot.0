From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 14:44:12 +0200
Subject: [Buildroot] [PATCH v3] xenomai: Add config for enabling/disabling
	SMP
In-Reply-To: <20170410001700.31490-1-sikor6@gmail.com>
References: <20170410001700.31490-1-sikor6@gmail.com>
Message-ID: <20170410124412.4526-1-sikor6@gmail.com>
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
Changes v2 -> v3:
 - Corrections in help (Arnout V.)

 package/xenomai/Config.in  | 17 +++++++++++++++++
 package/xenomai/xenomai.mk |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b548ee810..8bf9c4ae1 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,6 +51,23 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
 	  Kernel -> Linux Kernel Extensions menu.
 
+config BR2_PACKAGE_XENOMAI_ENABLE_SMP
+	bool "Enable SMP"
+	default y
+	help
+	  This option enables SMP support in Xenomai userspace.
+
+	  If this option is turned on while no SMP support is enabled
+	  in the kernel, things will still work. However, if SMP is
+	  enabled in the kernel but this option is not turned on,
+	  Xenomai applications will complain with 'feature mismatch:
+	  missing="smp/nosmp'.
+
+	  Please refer to this troubleshooting guide for more
+	  information:
+
+	  http://xenomai.org/troubleshooting-a-dual-kernel-configuration/#feature_mismatch_missing8221smpnosmp8221
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
