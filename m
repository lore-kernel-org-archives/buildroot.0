From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:09:37 +0100
Subject: [Buildroot] [git commit] meson: new package
Message-ID: <20171228222027.5E28E837BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cd8afbdfc2d55545aa8d1c4026688c2edaac642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides the host variant of the Meson Build System, an
open source build system meant to be both extremely fast, and as user
friendly as possible.

More precisely, Meson creates configuration files for the Ninja build
system.

Besides building Meson, it generates a configuration file
("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
cross-compiling a Meson-based project.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                              |  1 +
 package/meson/cross-compilation.conf.in | 23 ++++++++++++++++++++++
 package/meson/meson.hash                |  3 +++
 package/meson/meson.mk                  | 35 +++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f4f282..368d6a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -542,6 +542,7 @@ F:	package/eudev/
 F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
+F:	package/meson/
 F:	package/ninja/
 F:	package/s6/
 F:	package/s6-dns/
diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
new file mode 100644
index 0000000..0eec740
--- /dev/null
+++ b/package/meson/cross-compilation.conf.in
@@ -0,0 +1,23 @@
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
+[properties]
+c_args = [@TARGET_CFLAGS@]
+c_link_args = [@TARGET_LDFLAGS@]
+cpp_args = [@TARGET_CXXFLAGS@]
+cpp_link_args = [@TARGET_LDFLAGS@]
+
+[host_machine]
+system = 'linux'
+cpu_family ='@TARGET_ARCH@'
+cpu = '@TARGET_CPU@'
+endian = '@TARGET_ENDIAN@'
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
new file mode 100644
index 0000000..412c10e
--- /dev/null
+++ b/package/meson/meson.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+# https://github.com/mesonbuild/meson/releases/download/0.43.0/meson-0.43.0.tar.gz.asc
+sha256 c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340  meson-0.43.0.tar.gz
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
new file mode 100644
index 0000000..55ce84d
--- /dev/null
+++ b/package/meson/meson.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# meson
+#
+################################################################################
+
+MESON_VERSION = 0.43.0
+MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
+MESON_LICENSE = Apache-2.0
+MESON_LICENSE_FILES = COPYING
+MESON_SETUP_TYPE = setuptools
+
+HOST_MESON_DEPENDENCIES = host-ninja
+HOST_MESON_NEEDS_HOST_PYTHON = python3
+
+HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
+HOST_MESON_TARGET_CPU = $(call qstrip,$(BR2_GCC_TARGET_CPU))
+
+define HOST_MESON_INSTALL_CROSS_CONF
+	mkdir -p $(HOST_DIR)/etc/meson
+	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
+	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
+	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
+	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
+	    -e "s%@TARGET_CFLAGS@%`printf '"%s", ' $(TARGET_CFLAGS)`%g" \
+	    -e "s%@TARGET_LDFLAGS@%`printf '"%s", ' $(TARGET_LDFLAGS)`%g" \
+	    -e "s%@TARGET_CXXFLAGS@%`printf '"%s", ' $(TARGET_CXXFLAGS)`%g" \
+	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
+endef
+
+HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
+
+$(eval $(host-python-package))
