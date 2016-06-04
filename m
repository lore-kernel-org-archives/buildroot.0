From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  4 Jun 2016 15:34:03 +0200
Subject: [Buildroot] [PATCH 2/2] python-meson: new package
In-Reply-To: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1465047243-1169-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides the Meson Build System, an open source build
system meant to be both extremely fast, and as user friendly as
possible.

More precisely, Meson creates configuration files for the Ninja build
system.

The host variant is also provided, which, besides building Meson,
generates a cross-compilation configuration file:
'$(HOST_DIR)/etc/meson/cross-compilation.conf'.

To be able to perform checks when cross-compiling, the host variant
depends on host-qemu.

To cross-compile a Meson-based project for the target, its package
should:

 - depend on host-python-meson
 - invoke the host variant of Meson with the
   *--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf* option.
 - invoke host variant of Ninja to perform the actual build.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                              |  1 +
 package/python-meson/Config.in                 |  9 +++++
 package/python-meson/cross-compilation.conf.in | 19 +++++++++
 package/python-meson/meson-exe-wrapper.in      |  3 ++
 package/python-meson/python-meson.hash         |  1 +
 package/python-meson/python-meson.mk           | 55 ++++++++++++++++++++++++++
 6 files changed, 88 insertions(+)
 create mode 100644 package/python-meson/Config.in
 create mode 100644 package/python-meson/cross-compilation.conf.in
 create mode 100755 package/python-meson/meson-exe-wrapper.in
 create mode 100644 package/python-meson/python-meson.hash
 create mode 100644 package/python-meson/python-meson.mk

diff --git a/package/Config.in b/package/Config.in
index 4146bf9..b81954a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -688,6 +688,7 @@ menu "External python modules"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
+	source "package/python-meson/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-netaddr/Config.in"
diff --git a/package/python-meson/Config.in b/package/python-meson/Config.in
new file mode 100644
index 0000000..b4e0529
--- /dev/null
+++ b/package/python-meson/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_MESON
+	bool "python-meson"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_NINJA
+	help
+	  Meson is an open source build system meant to be both extremely
+	  fast, and, even more importantly, as user friendly as possible.
+
+	  http://mesonbuild.com
diff --git a/package/python-meson/cross-compilation.conf.in b/package/python-meson/cross-compilation.conf.in
new file mode 100644
index 0000000..b3da294
--- /dev/null
+++ b/package/python-meson/cross-compilation.conf.in
@@ -0,0 +1,19 @@
+[host_machine]
+system = 'linux'
+cpu_family = 'x86'
+cpu = 'generic'
+endian = 'little'
+
+[target_machine]
+system = 'linux'
+cpu_family ='@TARGET_ARCH@'
+cpu = 'generic'
+endian = '@TARGET_ENDIAN@'
+
+[binaries]
+c = '@TARGET_CROSS at gcc'
+cpp = '@TARGET_CROSS at g++'
+ar = '@TARGET_CROSS at ar'
+strip = '@TARGET_CROSS at strip'
+exe_wrapper = '@HOST_DIR@/usr/bin/meson-exe-wrapper'
+pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
diff --git a/package/python-meson/meson-exe-wrapper.in b/package/python-meson/meson-exe-wrapper.in
new file mode 100755
index 0000000..5e4415c
--- /dev/null
+++ b/package/python-meson/meson-exe-wrapper.in
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+ at HOST_DIR@/usr/bin/qemu- at TARGET_ARCH@ -L @TARGET_DIR@ "$@"
diff --git a/package/python-meson/python-meson.hash b/package/python-meson/python-meson.hash
new file mode 100644
index 0000000..7af56c5
--- /dev/null
+++ b/package/python-meson/python-meson.hash
@@ -0,0 +1 @@
+none xxx python-meson-0.31.0.tar.gz
diff --git a/package/python-meson/python-meson.mk b/package/python-meson/python-meson.mk
new file mode 100644
index 0000000..d4ba4dd
--- /dev/null
+++ b/package/python-meson/python-meson.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# python-meson
+#
+################################################################################
+
+PYTHON_MESON_VERSION = 0.31.0
+PYTHON_MESON_SITE = $(call github,mesonbuild,meson,$(PYTHON_MESON_VERSION))
+PYTHON_MESON_LICENSE = Apache-2.0
+PYTHON_MESON_LICENSE_FILES = COPYING
+PYTHON_MESON_SETUP_TYPE = setuptools
+
+define PYTHON_MESON_REMOVE_GUI_TOOL
+	rm -f $(TARGET_DIR)/usr/bin/mesongui.py
+endef
+
+PYTHON_MESON_POST_INSTALL_TARGET_HOOKS += PYTHON_MESON_REMOVE_GUI_TOOL
+
+HOST_PYTHON_MESON_DEPENDENCIES = host-qemu
+HOST_PYTHON_MESON_NEEDS_HOST_PYTHON = python3
+
+HOST_PYTHON_MESON_TARGET_ARCH = $(call qstrip,$(BR2_ARCH))
+HOST_PYTHON_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')
+
+define HOST_PYTHON_MESON_REMOVE_GUI_TOOL
+	rm -f $(HOST_DIR)/usr/bin/mesongui.py
+endef
+
+define HOST_PYTHON_MESON_INSTALL_CROSS_CONF
+	$(INSTALL) -D -m 0644 package/python-meson/cross-compilation.conf.in \
+		$(HOST_DIR)/etc/meson/cross-compilation.conf
+	$(SED) 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
+		-e 's;@TARGET_ARCH@;$(HOST_PYTHON_MESON_TARGET_ARCH);g' \
+		-e 's;@TARGET_ENDIAN@;$(HOST_PYTHON_MESON_TARGET_ENDIAN);g' \
+		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
+		$(HOST_DIR)/etc/meson/cross-compilation.conf
+endef
+
+define HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
+	$(INSTALL) -D -m 0755 package/python-meson/meson-exe-wrapper.in \
+		$(HOST_DIR)/usr/bin/meson-exe-wrapper
+	$(SED) 's;@TARGET_ARCH@;$(HOST_PYTHON_MESON_TARGET_ARCH);g' \
+		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
+		-e 's;@TARGET_DIR@;$(TARGET_DIR);g' \
+		$(HOST_DIR)/usr/bin/meson-exe-wrapper
+endef
+
+HOST_PYTHON_MESON_POST_INSTALL_HOOKS += \
+	HOST_PYTHON_MESON_REMOVE_GUI_TOOL \
+	HOST_PYTHON_MESON_INSTALL_CROSS_CONF \
+	HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
+
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.4.11
