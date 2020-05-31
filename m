From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 23:08:44 +0200
Subject: [Buildroot] [git commit branch/next] package/linux-tools/perf: bear
 the kernel options munging
Message-ID: <20200531211031.B93AE85F1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5587f366cde8fb6b8393c7ce3670f548dc8e5fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

perf by itself is not a standalone package; instead, it is part of a
bigger package, linux-tools.

Even though perf is the only one to need kernel .config fixups, we still
do it in a generic way, as it blends nicely in the existing variables,
which all use a loop over all the tools.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                            | 2 --
 package/linux-tools/linux-tool-perf.mk.in | 4 ++++
 package/linux-tools/linux-tools.mk        | 7 +++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 69bbad99e1..60dc343efa 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,8 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB))
 	$(if $(LINUX_KERNEL_CUSTOM_LOGO_PATH),
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 7106b622cb..53b7c5b9cd 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -158,3 +158,7 @@ define PERF_INSTALL_TARGET_CMDS
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
+
+define PERF_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
+endef
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 65d9e850e0..81b1fbc176 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -42,6 +42,13 @@ LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
 
+define LINUX_TOOLS_LINUX_CONFIG_FIXUPS
+	$(foreach tool,$(LINUX_TOOLS),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$($(call UPPERCASE,$(tool))_LINUX_CONFIG_FIXUPS))
+	)
+endef
+
 define LINUX_TOOLS_INSTALL_INIT_SYSTEMD
 	$(foreach tool,$(LINUX_TOOLS),\
 		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
