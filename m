From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sat, 29 Oct 2016 14:03:38 -0400
Subject: [Buildroot] [PATCH 4/5] lttng-modules: bump to version 2.8.3
In-Reply-To: <20161029180339.24535-1-eeppeliteloop@gmail.com>
References: <20161029180339.24535-1-eeppeliteloop@gmail.com>
Message-ID: <20161029180339.24535-5-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-modules/lttng-modules.hash |  8 ++++++--
 package/lttng-modules/lttng-modules.mk   | 27 +++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 2d50287..6114dfe 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,2 +1,6 @@
-# from http://lttng.org/files/lttng-tools/lttng-modules-2.7.1.tar.bz2.sha1
-sha1  38c42ec89b4966c7a4cc04aea75f5841634d8d66  lttng-modules-2.7.1.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.8.3.tar.bz2.md5
+md5   424354c4834d20235dacd9a1fd7653b6  lttng-modules-2.8.3.tar.bz2
+
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.8.3.tar.bz2.sha1
+sha1  862705784a54962f70226004f1fd0bf77f73f10f  lttng-modules-2.8.3.tar.bz2
+
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 5d0c422..34bb0fb 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,11 +4,34 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.7.1
+LTTNG_MODULES_VERSION = 2.8.3
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
+LTTNG_MODULES_DEPENDENCIES = linux
+
+ifeq ($(BR2_PACKAGE_LTTNG_MODULES),y)
+LINUX_NEEDS_MODULES = y
+endif
+
+LTTNG_MODULES_MAKE_OPTS = \
+	KERNELDIR="$(LINUX_DIR)" \
+	ARCH="$(KERNEL_ARCH)" \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
+define LTTNG_MODULES_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) -C $(@D)
+endef
+
+define LTTNG_MODULES_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) \
+		INSTALL_MOD_PATH="$(STAGING_DIR)" -C $(@D) modules_install
+endef
+
+define LTTNG_MODULES_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) \
+		INSTALL_MOD_PATH="$(TARGET_DIR)" -C $(@D) modules_install
+endef
 
-$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.9.3
