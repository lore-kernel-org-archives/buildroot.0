From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:28 +0200
Subject: [Buildroot] [git commit] linux: allow packages to set kernel config
 options
Message-ID: <20200501133530.CA83790D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aed4c2dae76f28ca7a868e31622873222c410e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the linux kernel will apply some fixups on its .config file,
based on whether some packages are enabled or not. That list of
conditional fixups is getting bigger and bigger with each new package
that needs such fixups, culminating with the pending firewalld one [0].

Furthermore, these fixups are not accessible to packages in br2-external
trees.

Add a new per-package variable, that packages may set to the commands to
run to fixup the kernel .config file, which is added at the end of the
linux' own fixups.

This opens the possibility to write things like;

    define FOO_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,BLA)
    endef

Of course, it also opens the way to run arbitrary commands in there, but
any alternative that would be declarative only, such as a list of
options to enable or disable (as an example):

    FOO_LINUX_CONFIG_FIXUPS = +BAR -FOO +BUZ="value"

.. is not very nice either, and such lists fall flat when a value would
have a space.

For packages that we have in-tree, we can ensure they won't play foul
with their _LINUX_CONFIG_FIXUPS. For packages in br2-external trees,
there's nothing we can do; users already have the opportunity to hack
into the linux configure process by providing LINUX_PRE_CONFIGURE_HOOKS
or LINUX_POST_CONFIGURE_HOOKS anyway...

.. which brings the question of why we don't use that to implement the
per-package fixups. We don't, because _PRE or _POST_CONFIGURE_HOOKS are
run after we run 'make oldconfig' to sanitise the mangled .config.

[0] http://lists.busybox.net/pipermail/buildroot/2020-March/278683.html

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 8 ++++++++
 linux/linux.mk                          | 1 +
 package/pkg-generic.mk                  | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index ed1e6acf57..568daaeb8d 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -577,6 +577,14 @@ different steps of the build process.
   This is seldom used, as packages rarely have custom rules. *Do not use
   this variable*, unless you really know that you need to print help.
 
+* +LIBFOO_LINUX_CONFIG_FIXUPS+ lists the Linux kernel configuration
+  options that are needed to build and use this package, and without
+  which the package is fundamentally broken. This shall be a set of
+  calls to one of the kconfig tweaking option: `KCONFIG_ENABLE_OPT`,
+  `KCONFIG_DISABLE_OPT`, or `KCONFIG_SET_OPT`.
+  This is seldom used, as package usually have no strict requirements on
+  the kernel options.
+
 The preferred way to define these variables is:
 
 ----------------------
diff --git a/linux/linux.mk b/linux/linux.mk
index 9a618db0e0..eb13920d57 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -421,6 +421,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX))
+	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8cd5a7ff62..946dc6d561 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1083,6 +1083,9 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+ifneq ($$($(2)_LINUX_CONFIG_FIXUPS),)
+PACKAGES_LINUX_CONFIG_FIXUPS += $$($(2)_LINUX_CONFIG_FIXUPS)$$(sep)
+endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
 KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
