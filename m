From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Feb 2016 16:19:29 -0800
Subject: [Buildroot] [PATCH 2/2] Add Xen 4.6
In-Reply-To: <1454717969-30723-1-git-send-email-alistair.francis@xilinx.com>
References: <1454717969-30723-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <1454717969-30723-3-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to compile Xen 4.6 and Xen tools.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 package/Config.in     |  1 +
 package/xen/Config.in | 31 +++++++++++++++++++++++++++++++
 package/xen/xen.hash  |  2 ++
 package/xen/xen.mk    | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 package/xen/Config.in
 create mode 100644 package/xen/xen.hash
 create mode 100644 package/xen/xen.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..4227195 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1616,6 +1616,7 @@ endif
 	source "package/tpm-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/xen/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/xen/Config.in b/package/xen/Config.in
new file mode 100644
index 0000000..28da69c
--- /dev/null
+++ b/package/xen/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_XEN
+ bool "xen"
+ depends on BR2_arm || BR2_aarch64 || \
+ BR2_i386 || BR2_x86_64
+ depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+ depends on !BR2_STATIC_LIBS # dtc (libfdt)
+ depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+ depends on BR2_USE_WCHAR # libglib2, util-linux
+ select BR2_PACKAGE_DTC
+ select BR2_PACKAGE_LIBAIO
+ select BR2_PACKAGE_LIBGLIB2
+ select BR2_PACKAGE_NCURSES
+ select BR2_PACKAGE_OPENSSL
+ select BR2_PACKAGE_PIXMAN
+ select BR2_PACKAGE_UTIL_LINUX
+ select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+ select BR2_PACKAGE_YAJL
+ help
+  This builds the Xen hypervisor and toolstack
+
+  http://www.xenproject.org/
+
+if BR2_PACKAGE_XEN
+
+config BR2_PACKAGE_XEN_HYPERVISOR
+ bool "Build the Xen hypervisor"
+
+config BR2_PACKAGE_XEN_TOOLS
+ bool "Build the Xen tools"
+endif
+
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
index 0000000..4331136
--- /dev/null
+++ b/package/xen/xen.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# Xen
+#
+################################################################################
+
+XEN_VERSION = 4.6.0
+XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
+XEN_INSTALL_IMAGES = YES
+
+XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
+
+XEN_MAKE_ENV = \
+ XEN_TARGET_ARCH=arm64 \
+ CROSS_COMPILE=$(TARGET_CROSS) \
+ CXXFLAGS="$(TARGET_CXXFLAGS) -D_FILE_OFFSET_BITS=64" \
+ CFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64" \
+ PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)
+
+XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
+XEN_MAKE_OPTS += dist-xen
+
+define XEN_INSTALL_IMAGES_CMDS
+ cp $(@D)/xen/xen $(BINARIES_DIR)
+endef
+else
+XEN_CONF_OPTS += --disable-xen
+endif
+
+XEN_CONF_OPTS += --disable-ocamltools
+
+ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
+XEN_MAKE_OPTS += dist-tools
+XEN_INSTALL_TARGET_OPTS += install-tools
+
+define XEN_RENAME_INIT_SCRIPTS
+ mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
+ mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
+ mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
+endef
+else
+XEN_CONF_OPTS += --disable-tools
+endif
+
+XEN_POST_INSTALL_TARGET_HOOKS += XEN_RENAME_INIT_SCRIPTS
+
+$(eval $(autotools-package))
-- 
2.5.0
