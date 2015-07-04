From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 16:13:26 +0200
Subject: [Buildroot] [git commit] kvmtool: new package
Message-ID: <20150704142748.7B6C2803FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=447916b26efc1389706811bfc41eb6c959dae16a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/kvmtool/Config.in  |   31 +++++++++++++++++++++++++
 package/kvmtool/kvmtool.mk |   53 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 13a7e74..23858ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1407,6 +1407,7 @@ endif
 	source "package/irqbalance/Config.in"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
+	source "package/kvmtool/Config.in"
 	source "package/lxc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/kvmtool/Config.in b/package/kvmtool/Config.in
new file mode 100644
index 0000000..f047c75
--- /dev/null
+++ b/package/kvmtool/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_KVMTOOL
+	bool "kvmtool"
+	depends on BR2_USE_MMU # guest simple init fork()
+	# No MADV_HUGEPAGE define in uClibc(-ng)
+	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	# Only mips big-endian seems to be supported (build breaks)
+	# Should work on powerpc64 but the build breaks with missing types
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
+		BR2_mips || BR2_x86_64
+	# libfdt is only required for DT architectures...
+	# ...but it's not able to build for static targets
+	depends on !(BR2_STATIC_LIBS && (BR2_aarch64 || BR2_arm || BR2_armeb))
+	select BR2_PACKAGE_DTC if BR2_aarch64 || BR2_arm || BR2_armeb
+	help
+	  kvmtool is a lightweight tool for hosting KVM guests.
+	  As a pure virtualization tool it only supports guests using
+	  the same architecture, though it supports running 32-bit guests
+	  on those 64-bit architectures that allow this.
+
+	  https://git.kernel.org/cgit/linux/kernel/git/will/kvmtool.git/tree/README
+
+comment "kvmtool needs a (e)glibc or musl toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_i386 || BR2_mips || BR2_x86_64
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+comment "kvmtool needs a (e)glibc or musl toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		BR2_STATIC_LIBS
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
new file mode 100644
index 0000000..7f682db
--- /dev/null
+++ b/package/kvmtool/kvmtool.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# kvmtool
+#
+################################################################################
+
+KVMTOOL_VERSION = 372f583d359a5bdcbbe7268809c8d1dc179c64d2
+KVMTOOL_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/will/kvmtool.git
+KVMTOOL_SITE_METHOD = git
+KVMTOOL_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
+	$(if $(BR2_PACKAGE_DTC),dtc) \
+	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
+	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
+	$(if $(BR2_PACKAGE_LIBVNCSERVER),libvncserver) \
+	$(if $(BR2_PACKAGE_SDL),sdl) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+KVMTOOL_LICENSE = GPLv2
+KVMTOOL_LICENSE_FILES = COPYING
+
+# This is required to convert a static binary (init helper) back into
+# object-file format, and in multilib toolchains like CS 2012.09 for x86
+# the default is i386, hence when building for x86_64 things break since
+# LD doesn't autodetect the input file format.
+# GCC-as-linker can't accomplish this feat easily either since it's mixing
+# static content (guest_init.o) with dynamic one (lkvm) making
+# a relocatable output file.
+# The purpose of this trick is to embed the init helper into the main
+# binary to help users in guest system startup, which would otherwise
+# require more complex guest images.
+# This needs revisiting if/when X32 ABI support is added.
+#
+# If more packages need this (unlikely) an ld wrapper might be a better
+# solution, using gcc -dumpspecs information.
+KVMTOOL_EXTRA_LDFLAGS = \
+	$(if $(BR2_x86_64),-m elf_x86_64)
+
+# Disable -Werror, otherwise musl is not happy
+KVMTOOL_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
+	WERROR=0
+
+define KVMTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
+endef
+
+define KVMTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) \
+		$(KVMTOOL_MAKE_OPTS) install DESTDIR=$(TARGET_DIR) prefix=/usr
+endef
+
+$(eval $(generic-package))
