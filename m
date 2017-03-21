From: Pawel Sikora <sikor6@gmail.com>
Date: Tue, 21 Mar 2017 17:44:05 +0100
Subject: [Buildroot] [PATCH 2/2] xenomai: Add configuration opt for SMP in
	Xenomai
In-Reply-To: <20170321164405.23334-1-sikor6@gmail.com>
References: <187458>
 <20170321164405.23334-1-sikor6@gmail.com>
Message-ID: <20170321164405.23334-2-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new option for Xenomai target package for
enabling SMP: BR2_PACKAGE_XENOMAI_ENABLE_SMP

If enabled, append to XENOMAI_CONF_OPTS in xenomai.mk.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/xenomai/Config.in  | 11 +++++++++++
 package/xenomai/xenomai.mk |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 32c5124ef..ce88f6185 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,6 +51,17 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
 	  Kernel -> Linux Kernel Extensions menu.
 
+config BR2_PACKAGE_XENOMAI_ENABLE_SMP
+	bool "Enable SMP configuration"
+	help
+	  Manually enable SMP in Xenomai. If left empty, the default
+	  SMP will be disabled.
+
+	  Make sure that in your kernel config you also have SMP
+	  enabled. If configuration will differ regarding this
+	  config between Xenomai package and the Linux kernel
+	  you will not be able to run Xenomai testsuite
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 28875b944..aed459809 100644
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
2.12.0
