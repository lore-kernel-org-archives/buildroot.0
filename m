From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 May 2018 22:37:45 +0200
Subject: [Buildroot] [PATCH RFC] linux: disable attribute alias with gcc >=
 8.1
Message-ID: <20180531203745.4799-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-8 started warning about function aliases that have a non-matching
prototype. This seems rather useful in general, but it causes tons of
warnings in the Linux kernel, where we rely on abusing those aliases
for system call entry points, in order to sanitze the arguments passed
from user space in registers.

See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435

Add a new conditional patch that disable the attribute-alias warning
introduced by gcc-8 by adding -Wno-attribute-alias to KBUILD_CFLAGS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---

Fixes most of build errors reported by toolchains-builder on Gitlab.
https://gitlab.com/free-electrons/toolchains-builder/pipelines/22921464
---
 ...e-attribute-alias-for-gcc-8.1.patch.conditional | 33 ++++++++++++++++++++++
 linux/linux.mk                                     | 14 +++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 linux/0002-Makefile-disable-attribute-alias-for-gcc-8.1.patch.conditional

diff --git a/linux/0002-Makefile-disable-attribute-alias-for-gcc-8.1.patch.conditional b/linux/0002-Makefile-disable-attribute-alias-for-gcc-8.1.patch.conditional
new file mode 100644
index 0000000000..23ce8a12b5
--- /dev/null
+++ b/linux/0002-Makefile-disable-attribute-alias-for-gcc-8.1.patch.conditional
@@ -0,0 +1,33 @@
+From f238848ce07b9b033847278ccafabc817634e650 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 31 May 2018 20:56:37 +0200
+Subject: [PATCH] Makefile: disable attribute-alias for gcc >= 8.1
+
+gcc-8 started warning about function aliases that have a non-matching
+prototype. This seems rather useful in general, but it causes tons of
+warnings in the Linux kernel, where we rely on abusing those aliases
+for system call entry points, in order to sanitze the arguments passed
+from user space in registers.
+
+See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 56ba070..b54e19a6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -641,6 +641,7 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
+ KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
+ KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
+ KBUILD_CFLAGS	+= $(call cc-disable-warning, int-in-bool-context)
++KBUILD_CFLAGS	+= $(call cc-disable-warning, attribute-alias)
+ 
+ ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
+ KBUILD_CFLAGS	+= $(call cc-option,-Oz,-Os)
+-- 
+2.7.4
+
diff --git a/linux/linux.mk b/linux/linux.mk
index b6b91391b6..3af72f819e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -226,6 +226,20 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+# gcc-8 started warning about function aliases that have a non-matching prototype.
+# This seems rather useful in general, but it causes tons of warnings in the Linux kernel,
+# where we rely on abusing those aliases for system call entry points, in order to sanitze
+# the arguments passed from user space in registers.
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+define LINUX_TRY_PATCH_NO_ATTRIBUTE_ALIAS
+	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0002-Makefile-disable-attribute-alias-for-gcc-8.1.patch.conditional >/dev/null ; then \
+		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0002-Makefile-disable-attribute-alias-for-gcc-8.1.patch.conditional ; \
+	fi
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_NO_ATTRIBUTE_ALIAS
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
-- 
2.14.3
