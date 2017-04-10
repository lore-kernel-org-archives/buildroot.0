From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 19:26:03 +0200
Subject: [Buildroot] [PATCH v4 2/2] xenomai: Add config for
	enabling/disabling SMP
In-Reply-To: <20170410172603.6427-1-sikor6@gmail.com>
References: <20170410172603.6427-1-sikor6@gmail.com>
Message-ID: <20170410172603.6427-2-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option for enabling/disabling SMP
in Xenomai userspace in version 3.x

Enabled by default.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v3 -> v4:
  - No changes, just merging in series with 'core Cobalt/Mercury' patch

 package/xenomai/Config.in  | 17 +++++++++++++++++
 package/xenomai/xenomai.mk |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 324f5025a..efb504b35 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -78,6 +78,23 @@ config BR2_PACKAGE_XENOMAI_COBALT
 	  in the Linux Kernel Extensions menu.
 endchoice
 
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
index 73d9617b1..bd147a9ec 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -29,6 +29,12 @@ else
 XENOMAI_CONF_OPTS += --with-core=cobalt
 endif
 
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
