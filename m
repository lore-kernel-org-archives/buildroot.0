From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:57:25 +0200
Subject: [Buildroot] [git commit] xen: new package
Message-ID: <20160612165932.F14E4818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a95f85fc72a6b10c56ea3341b6007deabc3f9e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support to compile Xen 4.6 and Xen tools for arm32 and arm64
targets.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
[Thomas:
 - Remove all "select" from the main Xen option, since the hypervisor
   can build fine without any additional library. The dependencies have
   been moved to the "tools" sub-option.
 - Make sure that at least one of the sub-option is enabled by selecting
   the hypervisor sub-option if the tools sub-option is not enabled.
 - Add a Config.in comment about the dependencies of the Xen tools.
 - Add missing dependency on argp-standalone in the .mk file.
 - Simplify the handling of XEN_INSTALL_TARGET_OPTS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |  1 +
 package/xen/Config.in | 44 ++++++++++++++++++++++++++++++++++++++++++
 package/xen/xen.hash  |  2 ++
 package/xen/xen.mk    | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 03c67ce..2f42038 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1711,6 +1711,7 @@ endif
 	source "package/tpm-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/xen/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/xen/Config.in b/package/xen/Config.in
new file mode 100644
index 0000000..7254a07
--- /dev/null
+++ b/package/xen/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_XEN
+	bool "xen"
+	# needs "dmb" on ARM, so ARM >= v7
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64
+	select BR2_PACKAGE_XEN_HYPERVISOR if !BR2_PACKAGE_XEN_TOOLS
+	help
+	  This package builds the Xen hypervisor and toolstack.
+
+	  http://www.xenproject.org/
+
+if BR2_PACKAGE_XEN
+
+config BR2_PACKAGE_XEN_HYPERVISOR
+	bool "Xen hypervisor"
+	help
+	  The Xen binaries are avaliable in /usr/lib/xen/
+	  See http://wiki.xenproject.org/wiki/Getting_Started for using the
+	  Xen hypervisor.
+
+config BR2_PACKAGE_XEN_TOOLS
+	bool "Xen tools"
+	depends on !BR2_STATIC_LIBS # dtc (libfdt)
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2, util-linux
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_YAJL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The Xen tools can be accessed by the xl command.
+
+comment "xen tools need a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
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
index 0000000..759667a
--- /dev/null
+++ b/package/xen/xen.mk
@@ -0,0 +1,53 @@
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
+# Calculate XEN_ARCH
+ifeq ($(ARCH),aarch64)
+XEN_ARCH = arm64
+else ifeq ($(ARCH),arm)
+XEN_ARCH = arm32
+endif
+
+XEN_CONF_OPTS = --disable-ocamltools
+XEN_MAKE_ENV = \
+	XEN_TARGET_ARCH=$(XEN_ARCH) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
+XEN_MAKE_OPTS += dist-xen
+XEN_INSTALL_IMAGES = YES
+define XEN_INSTALL_IMAGES_CMDS
+	cp $(@D)/xen/xen $(BINARIES_DIR)
+endef
+else
+XEN_CONF_OPTS += --disable-xen
+endif
+
+ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
+XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+XEN_DEPENDENCIES += argp-standalone
+endif
+XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
+XEN_MAKE_OPTS += dist-tools
+
+define XEN_INSTALL_INIT_SYSV
+	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
+	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
+	mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
+endef
+else
+XEN_INSTALL_TARGET = NO
+XEN_CONF_OPTS += --disable-tools
+endif
+
+$(eval $(autotools-package))
