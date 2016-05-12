From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 12 May 2016 15:13:01 -0700
Subject: [Buildroot] [PATCH v3] Add Xen 4.6
Message-ID: <1463091181-22886-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to compile Xen 4.6 and Xen tools for arm32 and arm64
targets.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
I wasn't able to get x86 targets to build correctly and I don't know
enough about them to dig into it deeply.

package/Config.in     |  1 +
 package/xen/Config.in | 42 ++++++++++++++++++++++++++++++++++++++
 package/xen/xen.hash  |  2 ++
 package/xen/xen.mk    | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 package/xen/Config.in
 create mode 100644 package/xen/xen.hash
 create mode 100644 package/xen/xen.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..a970555 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1684,6 +1684,7 @@ endif
 	source "package/tpm-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/xen/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/xen/Config.in b/package/xen/Config.in
new file mode 100644
index 0000000..52d185c
--- /dev/null
+++ b/package/xen/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_XEN
+	bool "xen"
+	# Xen in buildroot only supports these architectures
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2, util-linux
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_YAJL
+	help
+	  This builds the Xen hypervisor and toolstack.
+
+	  http://www.xenproject.org/
+
+comment "Xen needs a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
+if BR2_PACKAGE_XEN
+
+config BR2_PACKAGE_XEN_HYPERVISOR
+	bool "Build the Xen hypervisor"
+	default y
+	help
+	  The Xen binaries are avaliable in /usr/lib/xen/
+	  See http://wiki.xenproject.org/wiki/Getting_Started for using the
+	  Xen hypervisor.
+
+config BR2_PACKAGE_XEN_TOOLS
+	bool "Build the Xen tools"
+	depends on !BR2_STATIC_LIBS # dtc (libfdt)
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The Xen tools can be accessed by the xl command.
+
+endif
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
new file mode 100644
index 0000000..c124b3a
--- /dev/null
+++ b/package/xen/xen.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478e80909 xen-4.6.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
new file mode 100644
index 0000000..a4a5ed9
--- /dev/null
+++ b/package/xen/xen.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# Xen
+#
+################################################################################
+
+XEN_VERSION = 4.6.0
+XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
+XEN_LICENSE = GPLv2
+XEN_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
+XEN_INSTALL_IMAGES = YES
+endif
+
+XEN_DEPENDENCIES += libaio libglib2 ncurses openssl pixman yajl
+
+XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
+XEN_ARCH=$(ARCH)
+
+# Overwrite some architectures to match what Xen expects
+ifeq ($(ARCH),aarch64)
+XEN_ARCH="arm64"
+endif
+ifeq ($(ARCH),arm)
+XEN_ARCH="arm32"
+endif
+
+XEN_CONF_OPTS += --disable-ocamltools
+XEN_MAKE_ENV += XEN_TARGET_ARCH=$(XEN_ARCH) CROSS_COMPILE=$(TARGET_CROSS) $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
+XEN_MAKE_OPTS += dist-xen
+
+define XEN_INSTALL_IMAGES_CMDS
+	cp $(@D)/xen/xen $(BINARIES_DIR)
+endef
+else
+XEN_CONF_OPTS += --disable-xen
+endif
+
+ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
+XEN_DEPENDENCIES += dtc util-linux
+XEN_INSTALL_TARGET_OPTS += install-tools
+XEN_MAKE_OPTS += dist-tools
+
+define XEN_INSTALL_INIT_SYSV
+	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
+	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
+	mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
+endef
+else
+XEN_CONF_OPTS += --disable-tools
+endif
+
+$(eval $(autotools-package))
-- 
2.7.4
