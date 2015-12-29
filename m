From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:50:11 +0100
Subject: [Buildroot] [git commit] linux: add blind kconfig option to require
	kernel modules
Message-ID: <20151229225703.29006826DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5471bac7483d0c315830b38ae252de3cd47c1853
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, packages that need the kernel to have support for laodable
modules have two ways to require it:

  - either the use the kernel-module infra, which does it automatically,

  - or they do not use it, and they need to require it manually by
    setting the corresponding Makefile variable; however, they must only
    set it when they are actually enabled, which makes for a slightly
    cumbersome and ugly code, like:

        ifeq ($(BR2_PACKAGE_FOO),y)
        LINUX_NEEDS_MODULES = y
        endif

Introduce a new blind Kconfig option that packages can select to signify
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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 6 ++++++
 linux/linux.mk  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 8faf1c8..4e2db47 100644
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
index 69a09aa..045294b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -196,6 +196,9 @@ LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 
+# If no package has yet set it, set it from the Kconfig option
+LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
+
 define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
