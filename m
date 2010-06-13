From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:13 +0200
Subject: [Buildroot] [PATCH 09/10] linux: add support for
	linux26-{menuconfig, xconfig, gconfig} targets
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b2f230dbbfbfa6c03094ee66bbe37d436316d392.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These targets allow the user to customize the configuration of the
Linux kernel. After changing the kernel configuration, the next time
the user runs "make", the kernel is rebuilt to take into account the
new configuration (not rebuilt from scratch).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4cdc304..05a95af 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -104,8 +104,9 @@ endif
 	yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig 2>&1 >/dev/null
 	$(Q)touch $@
 
-# Compilation
-$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
+# Compilation. We make sure the kernel gets rebuilt when the
+# configuration has changed.
+$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config
 	@$(call MESSAGE,"Compiling kernel")
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D)
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
@@ -127,6 +128,9 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
+linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
+
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
 endif
\ No newline at end of file
-- 
1.7.0.4
