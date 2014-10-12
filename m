From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 15:51:38 +0200
Subject: [Buildroot] [git commit] system: add option to choose what /bin/sh
	points to
Message-ID: <20141012135442.0BB36B2623@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02e5cef14c6a3bb2ecca05e6f29302ab7f24bf48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not all our shells do install a pointer to /bin/sh. Besides, between
those that do and multiple ones are enabled, the last one to install
wins the the symlink.

Add a new config choice in the system sub-menu that allows the user to
explicitly select the shell to provide /bin/sh. If busybox is not
enabled, default to using dash, a POSIX shell.

Remove the symlink creation from bash.mk at the same time.

Note: for every shell, we select them, except busybox, on which we
depend, on the assumption that we do not want to force busybox in case
the user decided not to enable it.

[Peter: remove redundant !BR2_PACKAGE_BUSYBOX dependency]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash.mk |    1 -
 system/Config.in     |   44 ++++++++++++++++++++++++++++++++++++++++++++
 system/system.mk     |   12 ++++++++++++
 3 files changed, 56 insertions(+), 1 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 6510af5..34a3a73 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -35,7 +35,6 @@ define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
 	rm -f $(TARGET_DIR)/bin/bashbug
-	ln -sf bash $(TARGET_DIR)/bin/sh
 endef
 
 $(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index e7e146a..2465f79 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -211,6 +211,50 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  in the build log! Avoid using a valuable password if either the
 	  .config file or the build log may be distributed!
 
+choice
+	bool "/bin/sh"
+	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
+	help
+	  Select which shell will provide /bin/sh.
+
+# busybox has shells that work on noMMU
+config BR2_SYSTEM_BIN_SH_BUSYBOX
+	bool "busybox' default shell"
+	depends on BR2_PACKAGE_BUSYBOX
+
+config BR2_SYSTEM_BIN_SH_BASH
+	bool "bash"
+	depends on BR2_USE_MMU # bash
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_BASH
+
+config BR2_SYSTEM_BIN_SH_DASH
+	bool "dash"
+	depends on BR2_USE_MMU # dash
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_DASH
+
+config BR2_SYSTEM_BIN_SH_ZSH
+	bool "zsh"
+	depends on BR2_USE_MMU # zsh
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_ZSH
+
+comment "bash, dash, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
+	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS && BR2_PACKAGE_BUSYBOX
+
+config BR2_SYSTEM_BIN_SH_NONE
+	bool "none"
+
+endchoice # /bin/sh
+
+config BR2_SYSTEM_BIN_SH
+	string
+	default "/bin/busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
+	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
+	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
+	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
+
 config BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
 	default y
diff --git a/system/system.mk b/system/system.mk
index b614615..5802e2d 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -2,6 +2,7 @@ TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
 TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
@@ -46,6 +47,17 @@ define SYSTEM_ROOT_PASSWD
 endef
 TARGET_FINALIZE_HOOKS += SYSTEM_ROOT_PASSWD
 
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+define SYSTEM_BIN_SH
+	rm -f $(TARGET_DIR)/bin/sh
+endef
+else
+define SYSTEM_BIN_SH
+	ln -sf $(TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
+endef
+endif
+TARGET_FINALIZE_HOOKS += SYSTEM_BIN_SH
+
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
