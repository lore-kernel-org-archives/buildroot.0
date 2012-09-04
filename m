From: Dmitry <golubovsky@gmail.com>
Date: Mon,  3 Sep 2012 23:28:41 -0400
Subject: [Buildroot] [PATCH 1/2] PAM support in Busybox if linux-pam is built
Message-ID: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/busybox/Config.in  |   11 +++++++++++
 package/busybox/busybox.mk |   12 ++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index dedcf18..2a9cbf1 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -62,6 +62,17 @@ config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	  Install the watchdog daemon startup script,
 	  that just start at the boot the busybox watchdog daemon.
 
+config BR2_PACKAGE_BUSYBOX_PAM
+	bool "Enable PAM support in Busybox"
+	default n
+	depends on BR2_PACKAGE_LINUX_PAM
+	help
+	  If this item is selected, Busybox login will use the PAM stack
+	  for local logins. Local logins with null password are allowed
+	  for users with records in /etc/passwd ("default" and "root").
+	  The default PAM configuration file requires user accounts with
+	  nonzero length passwords.
+
 if BR2_PACKAGE_BUSYBOX_WATCHDOG
 
 config BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 33f8633..21942c6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -164,6 +164,17 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_PAM),y)
+BUSYBOX_DEPENDENCIES += linux-pam
+define BUSYBOX_ENABLE_PAM
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
+endef
+else
+define BUSYBOX_ENABLE_PAM
+	$(call KCONFIG_DISABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -179,6 +190,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_DISABLE_MMU_APPLETS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_ENABLE_PAM)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 endef
-- 
1.7.2.5
