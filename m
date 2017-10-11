From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 11 Oct 2017 08:50:04 +0200
Subject: [Buildroot] [Patch v3 1/2] meson: new package
In-Reply-To: <20171011065005.9235-1-eric.le.bihan.dev@free.fr>
References: <20171011065005.9235-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171011065005.9235-2-eric.le.bihan.dev@free.fr>
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

Besides building Meson, it generates a configuration file
("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
cross-compiling a Meson-based project.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/meson/cross-compilation.conf.in | 17 +++++++++++++++++
 package/meson/meson.hash                |  2 ++
 package/meson/meson.mk                  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/meson/cross-compilation.conf.in
 create mode 100644 package/meson/meson.hash
 create mode 100644 package/meson/meson.mk

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
new file mode 100644
index 0000000000..84b399f51f
--- /dev/null
+++ b/package/meson/cross-compilation.conf.in
@@ -0,0 +1,17 @@
+# Note: Buildroot's and Meson's terminologies differ about the meaning
+# of 'build', 'host' and 'target':
+# - Buildroot's 'host' is Meson's 'build'
+# - Buildroot's 'target' is Meson's 'host'
+
+[binaries]
+c = '@TARGET_CROSS at gcc'
+cpp = '@TARGET_CROSS at g++'
+ar = '@TARGET_CROSS at ar'
+strip = '@TARGET_CROSS at strip'
+pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
+
+[host_machine]
+system = 'linux'
+cpu_family ='@TARGET_ARCH@'
+cpu = '@TARGET_CPU@'
+endian = '@TARGET_ENDIAN@'
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
new file mode 100644
index 0000000000..cdb7d1b9ef
--- /dev/null
+++ b/package/meson/meson.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 324894427dcd29f6156fe06b046c6ad1b998470714debd7c5705902f21aaaa73  meson-0.43.0.tar.gz
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
new file mode 100644
index 0000000000..e4bff229a6
--- /dev/null
+++ b/package/meson/meson.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# meson
+#
+################################################################################
+
+MESON_VERSION = 0.43.0
+MESON_SITE = $(call github,mesonbuild,meson,$(MESON_VERSION))
+MESON_LICENSE = Apache-2.0
+MESON_LICENSE_FILES = COPYING
+MESON_SETUP_TYPE = setuptools
+
+HOST_MESON_DEPENDENCIES = host-ninja
+HOST_MESON_NEEDS_HOST_PYTHON = python3
+
+HOST_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')
+
+define HOST_MESON_INSTALL_CROSS_CONF
+	mkdir -p $(HOST_DIR)/etc/meson
+	sed -e 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
+	    -e 's;@TARGET_ARCH@;$(ARCH);g' \
+	    -e 's;@TARGET_CPU@;$(BR2_GCC_TARGET_CPU);g' \
+	    -e 's;@TARGET_ENDIAN@;$(HOST_MESON_TARGET_ENDIAN);g' \
+	    -e 's;@HOST_DIR@;$(HOST_DIR);g' \
+	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
+endef
+
+HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
+
+$(eval $(host-python-package))
-- 
2.13.6
