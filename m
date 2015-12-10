From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 19:53:13 +0100
Subject: [Buildroot] [PATCH 1/7] linux: add blind kconfig option to require
	kernel modules
In-Reply-To: <cover.1449771844.git.yann.morin.1998@free.fr>
References: <cover.1449771844.git.yann.morin.1998@free.fr>
Message-ID: <ea2708973539054f813d0b4835e1eb2ddf287e05.1449771844.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, packages that need the kernel to have support for laodable
modules have two ways to require it:

  - either the use the kernel-module infra, which does it automatically,

  - or they do not use it, and they need to requrie it manually, by
    setting the corresponding Makefile variable; however, they must only
    set it when they are actually enabled, which makes for a slightly
    cumbersome and ugly code, like:

        ifeq ($(BR2_PACKAGE_FOO),y)
        LINUX_NEEDS_MODULES = y
        endif

Introduce a nw blind Kconfig option that packages can select to signify
they need kernel modules. That Kconfig option is then used to set the
Makefile variable.

It makes it cleaner:

  - code is simpler (one Kconfig line instead of a Makefile if-block,

  - this is handled at the Kconfig level, which is where we usually
    handle such dependencies.

Packages will be updated in follow-up commits.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 6 ++++++
 linux/linux.mk  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index dfb9453..55c548f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,6 +8,12 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
+# Packages that need to have a kernel with support for loadable modules,
+# but do not use the kernel-modules infrastructure, should select that
+# option.
+config BR2_LINUX_NEEDS_MODULES
+	bool
+
 #
 # Version selection. We provide the choice between:
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 9507837..ea07efc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -178,6 +178,9 @@ LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 
+# If no package has yet set it, set it from the Kconfig option
+LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
+
 define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
-- 
1.9.1
