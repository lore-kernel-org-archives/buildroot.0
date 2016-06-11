From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 11 Jun 2016 21:47:37 +0200
Subject: [Buildroot] [Patch v2 2/3] python-meson: new package
In-Reply-To: <1465674458-31928-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1465674458-31928-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1465674458-31928-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides the host variant of the Meson Build System, an
open source build system meant to be both extremely fast, and as user
friendly as possible.

More precisely, Meson creates configuration files for the Ninja build
system.

Besides building Meson, it generates a cross-compilation configuration
file ("$(HOST_DIR)/etc/meson/cross-compilation.conf") as well as a
wrapper for QEMU ("$(HOST_DIR)/usr/bin/meson-exe-wrapper"), used to
perform checks when cross-compiling (hence the dependency on host-qemu).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/python-meson/cross-compilation.conf.in | 19 ++++++++++++
 package/python-meson/meson-exe-wrapper.in      |  3 ++
 package/python-meson/python-meson.hash         |  2 ++
 package/python-meson/python-meson.mk           | 41 ++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/python-meson/cross-compilation.conf.in
 create mode 100755 package/python-meson/meson-exe-wrapper.in
 create mode 100644 package/python-meson/python-meson.hash
 create mode 100644 package/python-meson/python-meson.mk

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
index 0000000..2aa2cfb
--- /dev/null
+++ b/package/python-meson/python-meson.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 3d59a8e31d96838916e0e1c7581ed1e3013c3e9e93252ea7eb0b7f7908103bae python-meson-0.31.0.tar.gz
diff --git a/package/python-meson/python-meson.mk b/package/python-meson/python-meson.mk
new file mode 100644
index 0000000..145df72
--- /dev/null
+++ b/package/python-meson/python-meson.mk
@@ -0,0 +1,41 @@
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
+HOST_PYTHON_MESON_DEPENDENCIES = host-qemu
+HOST_PYTHON_MESON_NEEDS_HOST_PYTHON = python3
+
+HOST_PYTHON_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')
+
+define HOST_PYTHON_MESON_INSTALL_CROSS_CONF
+	$(INSTALL) -D -m 0644 package/python-meson/cross-compilation.conf.in \
+		$(HOST_DIR)/etc/meson/cross-compilation.conf
+	$(SED) 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
+		-e 's;@TARGET_ARCH@;$(ARCH);g' \
+		-e 's;@TARGET_ENDIAN@;$(HOST_PYTHON_MESON_TARGET_ENDIAN);g' \
+		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
+		$(HOST_DIR)/etc/meson/cross-compilation.conf
+endef
+
+define HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
+	$(INSTALL) -D -m 0755 package/python-meson/meson-exe-wrapper.in \
+		$(HOST_DIR)/usr/bin/meson-exe-wrapper
+	$(SED) 's;@TARGET_ARCH@;$(ARCH);g' \
+		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
+		-e 's;@TARGET_DIR@;$(TARGET_DIR);g' \
+		$(HOST_DIR)/usr/bin/meson-exe-wrapper
+endef
+
+HOST_PYTHON_MESON_POST_INSTALL_HOOKS += \
+	HOST_PYTHON_MESON_INSTALL_CROSS_CONF \
+	HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
+
+$(eval $(host-python-package))
-- 
2.4.11
