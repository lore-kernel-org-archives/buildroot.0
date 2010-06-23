From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] linux: add support for
	linux26-{menuconfig, xconfig, gconfig} targets
Message-ID: <20100623092837.0FE6781886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4944e8c883efd0e11cc9e7585905e89941eb825b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These targets allow the user to customize the configuration of the
Linux kernel. After changing the kernel configuration, the next time
the user runs "make", the kernel is rebuilt to take into account the
new configuration (not rebuilt from scratch).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 71d9616..d1f1842 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -98,8 +98,9 @@ endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 	$(Q)touch $@
 
-# Compilation
-$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
+# Compilation. We make sure the kernel gets rebuilt when the
+# configuration has changed.
+$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config
 	@$(call MESSAGE,"Compiling kernel")
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
@@ -123,6 +124,9 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
+linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
+
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
 endif
-- 
1.7.1
