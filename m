From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 14 Mar 2018 13:12:18 -0400
Subject: [Buildroot] [PATCH v4 1/4] qemu: cleanup for gobject-introspection
Message-ID: <20180314171221.10856-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS which will be referenced by the
gobject-introspection package. This also has the added benefit of making the
config file conform to other package standards such as Valgrind.

Add depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970 to
Config.in.host as these are not currently supported cpus by qemu.

Add a new variable in qemu.mk: HOST_QEMU_CPU_TUNE. When qemu-$(ARCH) is
called, some architectures require a -cpu flag to be passed, or else a
segfault may occure when building .gir files.
For PowerPC, many of these cpu's need a specific CPU flag to be passed
via the command line.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add patch to series.

 package/qemu/Config.in.host | 11 ++++++++---
 package/qemu/qemu.mk        | 31 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index f14bcec6d6..0ef4c700b0 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,11 +1,16 @@
-config BR2_PACKAGE_HOST_QEMU
-	bool "host qemu"
-	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
+config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb       || BR2_aarch64      || \
 		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
+	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
+
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
 		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 345ef52668..62cb517628 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -70,6 +70,37 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+
+# Add cpu specific callouts for qemu.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed 
+# For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+ifeq ($(BR2_x86_64),y)
+HOST_QEMU_CPU_TUNE = -cpu Nehalem,check=false
+endif
+
+# PowerPC architecture. Currently, the 620, 630, and 970 are not supported.
+ifeq ($(BR2_powerpc_e5500),y)
+HOST_QEMU_CPU_TUNE = -cpu e5500
+endif
+
+ifeq ($(BR2_powerpc_e6500),y)
+HOST_QEMU_CPU_TUNE = -cpu e6500
+endif
+
+ifeq ($(BR2_powerpc_power7),y)
+HOST_QEMU_CPU_TUNE = -cpu 7400
+endif
+
+ifeq ($(BR2_powerpc64)$(BR2_powerpc_e5500),yy)
+HOST_QEMU_CPU_TUNE = -cpu e500mc
+endif
+
+ifeq ($(BR2_powerpc64)$(BR2_powerpc_e6500),yy)
+HOST_QEMU_CPU_TUNE = -cpu e500mc
+endif
+
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
-- 
2.14.3
