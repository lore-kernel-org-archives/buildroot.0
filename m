From: Arni <arni@arni.lv>
Date: Thu, 05 Jun 2014 14:21:28 +0100
Subject: [Buildroot] Patch to add Tilera tilegx platform support
Message-ID: <53906ED8.90500@arni.lv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm working on porting Tilera tilegx platform to OpenWRT project, but
I'm sure you are also interested in it.
Patch is very simple, hope someone will find it usefull. Here is the patch :

diff --git a/arch/Config.in b/arch/Config.in
index 1f60f81..4152267 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -201,6 +201,13 @@ config BR2_xtensa
          http://en.wikipedia.org/wiki/Xtensa
          http://www.tensilica.com/
 
+config BR2_tilegx
+       bool "Tile-GX"
+#      select BR2_ARCH_IS_64
+       help
+         tilera tileGX
+
+
 endchoice
 
 # The following string values are defined by the individual
@@ -360,4 +367,8 @@ if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
 
+if BR2_tilegx
+source "arch/Config.in.tilegx"
+endif
+
 endmenu # Target options
diff --git a/arch/Config.in.tilegx b/arch/Config.in.tilegx
new file mode 100644
index 0000000..bdecf64
--- /dev/null
+++ b/arch/Config.in.tilegx
@@ -0,0 +1,15 @@
+
+#config BR2_GCC_TARGET_ARCH
+#      default "tilegx"
+
+config BR2_ENDIAN
+       default "LITTLE"
+
+config BR2_ARCH
+       default "tilegx"
+
+#config BR2_GCC_TARGET_ABI
+#      default "64"
+
+#config BR2_GCC_TARGET_CPU
+#      default "tilegx"
diff --git a/linux/linux.mk b/linux/linux.mk
index bd3f2ac..5fb9b40 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -120,6 +120,8 @@ ifeq ($(KERNEL_ARCH),i386)
 KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
 KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
+else ifeq ($(KERNEL_ARCH),tilegx)
+KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/tile
 else
 KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif


Regards,
Arni
