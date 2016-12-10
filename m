From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 10 Dec 2016 20:20:49 +0100
Subject: [Buildroot] [Patch v2 8/9] s6-linux-utils: new package
In-Reply-To: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1481397650-14664-9-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-linux-utils, a set of minimalistic
Linux-specific system utilities.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                          |  1 +
 package/s6-linux-utils/Config.in           |  9 ++++++++
 package/s6-linux-utils/s6-linux-utils.hash |  2 ++
 package/s6-linux-utils/s6-linux-utils.mk   | 34 ++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/s6-linux-utils/Config.in
 create mode 100644 package/s6-linux-utils/s6-linux-utils.hash
 create mode 100644 package/s6-linux-utils/s6-linux-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 54d3219..e7035b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1751,6 +1751,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
diff --git a/package/s6-linux-utils/Config.in b/package/s6-linux-utils/Config.in
new file mode 100644
index 0000000..4624b50
--- /dev/null
+++ b/package/s6-linux-utils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_S6_LINUX_UTILS
+	bool "s6-linux-utils"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  s6-linux-utils is a set of minimalistic Linux-specific system
+	  utilities.
+
+	  http://skarnet.org/software/s6-linux-utils/
diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
new file mode 100644
index 0000000..600c5fc
--- /dev/null
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 587745abfbf2cc631bb54dd2b3fd29f39b723e3c50e28165138a85c98fda35f9 s6-linux-utils-2.2.0.0.tar.gz
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
new file mode 100644
index 0000000..04ce688
--- /dev/null
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# s6-linux-utils
+#
+################################################################################
+
+S6_LINUX_UTILS_VERSION = 2.2.0.0
+S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
+S6_LINUX_UTILS_LICENSE = ISC
+S6_LINUX_UTILS_LICENSE_FILES = COPYING
+S6_LINUX_UTILS_DEPENDENCIES = skalibs
+
+S6_LINUX_UTILS_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_LINUX_UTILS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_UTILS_CONF_OPTS))
+endef
+
+define S6_LINUX_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_LINUX_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.5.5
