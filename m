From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 21 Nov 2014 21:59:06 +0100
Subject: [Buildroot] [PATCH 1/1] mcelog: new package
Message-ID: <1416603546-9701-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in        |  1 +
 package/mcelog/Config.in |  9 +++++++++
 package/mcelog/mcelog.mk | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 package/mcelog/Config.in
 create mode 100644 package/mcelog/mcelog.mk

diff --git a/package/Config.in b/package/Config.in
index a6977ce..a2167ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -76,6 +76,7 @@ endif
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
 	source "package/oprofile/Config.in"
diff --git a/package/mcelog/Config.in b/package/mcelog/Config.in
new file mode 100644
index 0000000..f3ccc71
--- /dev/null
+++ b/package/mcelog/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MCELOG
+	bool "mcelog"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU # fork()
+	help
+	  mcelog processes machine checks (in particular memory and CPU hardware
+	  errors) on modern x86 Linux systems.
+
+	  http://www.mcelog.org/
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
new file mode 100644
index 0000000..15bac77
--- /dev/null
+++ b/package/mcelog/mcelog.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# mcelog
+#
+################################################################################
+
+MCELOG_VERSION = v105
+MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
+MCELOG_SITE_METHOD = git
+MCELOG_LICENSE = GPLv2
+MCELOG_LICENSE_FILES = README
+
+MCELOG_TRIGGERS = cache-error-trigger \
+	dimm-error-trigger \
+	page-error-trigger \
+	socket-memory-error-trigger \
+	bus-error-trigger \
+	iomca-error-trigger \
+	unknown-error-trigger
+
+define MCELOG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	-C $(@D) all
+endef
+
+define MCELOG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/mcelog $(TARGET_DIR)/usr/sbin/mcelog; \
+	$(INSTALL) -D -m 644 $(@D)/mcelog.conf $(TARGET_DIR)/etc/mcelog/mcelog.conf; \
+	for i in ${MCELOG_TRIGGERS} ; do \
+		$(INSTALL) -m 755 $(@D)/triggers/$$i $(TARGET_DIR)/etc/mcelog; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.9.3
