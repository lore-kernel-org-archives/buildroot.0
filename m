From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  4 Jun 2016 15:34:02 +0200
Subject: [Buildroot] [PATCH 1/2] ninja: new package
In-Reply-To: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1465047243-1169-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides Ninja, a small build system with a focus on
speed.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in        |  1 +
 package/ninja/Config.in  | 11 +++++++++++
 package/ninja/ninja.hash |  1 +
 package/ninja/ninja.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/ninja/Config.in
 create mode 100644 package/ninja/ninja.hash
 create mode 100644 package/ninja/ninja.mk

diff --git a/package/Config.in b/package/Config.in
index 9f6e0d9..4146bf9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -148,6 +148,7 @@ endif
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
 	source "package/make/Config.in"
+	source "package/ninja/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/patch/Config.in"
 endif
diff --git a/package/ninja/Config.in b/package/ninja/Config.in
new file mode 100644
index 0000000..a8eba2e
--- /dev/null
+++ b/package/ninja/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NINJA
+	bool "ninja"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Ninja is a small build system with a focus on speed.
+
+	  https://ninja-build.org/
+
+comment "ninja needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
new file mode 100644
index 0000000..e5908f3
--- /dev/null
+++ b/package/ninja/ninja.hash
@@ -0,0 +1 @@
+none xxx ninja-v1.7.1.tar.gz
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
new file mode 100644
index 0000000..ae9251c
--- /dev/null
+++ b/package/ninja/ninja.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# ninja
+#
+################################################################################
+
+NINJA_VERSION = v1.7.1
+NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
+NINJA_LICENSE = Apache-2.0
+NINJA_LICENSE_FILES = COPYING
+
+NINJA_DEPENDENCIES = host-ninja
+
+NINJA_MAKE_OPTS = CXX="$(TARGET_CXX)" AR="$(TARGET_AR)"
+
+define NINJA_CONFIGURE_CMDS
+	(cd $(@D); $(NINJA_MAKE_OPTS) ./configure.py)
+endef
+
+define NINJA_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/ninja)
+endef
+
+define NINJA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/ninja $(TARGET_DIR)/usr/bin/ninja
+endef
+
+HOST_NINJA_DEPENDENCIES = host-python
+
+define HOST_NINJA_BUILD_CMDS
+	(cd $(@D); ./configure.py --bootstrap)
+endef
+
+define HOST_NINJA_INSTALL_CMDS
+	$(INSTALL) -m 0755 $(@D)/ninja $(HOST_DIR)/usr/bin/ninja
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.4.11
