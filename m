From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 13:13:52 +0200
Subject: [Buildroot] [git commit] core/pkg-kernel-module: ensure linux
	supports modules
Message-ID: <20150904111726.68DAA81F79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7c32c98bc810b88e0391117f225658f82b44995
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a package wants to build a kernel module, we should ensure that the
kernel does support modules.

This patch does it automatically for packages using the kernel-module
infrastructure.

Packages that do not use it will have to set it manually (to be done in
a followup patch).

Suggested-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: No?? Rubinstein <noe.rubinstein@gmail.com>
Cc: Jan Viktorin <viktorin@rehivetech.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk               |    2 ++
 package/pkg-kernel-module.mk |    5 +++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 48f9c74..bbcc54b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -175,6 +175,8 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 
 define LINUX_KCONFIG_FIXUP_CMDS
+	$(if $(LINUX_NEEDS_MODULES),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 6fb7704..f6730b8 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -44,6 +44,11 @@
 
 define inner-kernel-module
 
+# If the package is enabled, ensure the kernel will support modules
+ifeq ($$(BR2_PACKAGE_$(2)),y)
+LINUX_NEEDS_MODULES = y
+endif
+
 # The kernel must be built first.
 $(2)_DEPENDENCIES += linux
 
