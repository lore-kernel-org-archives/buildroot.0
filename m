From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 12 May 2019 21:55:49 +0200
Subject: [Buildroot] [PATCH v2 12/13] package/openrc: add support for
 setting terminal keymap
In-Reply-To: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
Message-ID: <20190512195550.24457-12-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When openrc init is enabled, user can chose to set terminal
keymap or keep default settings.

* system/Config.in
  New config BR2_TARGET_GENERIC_TERM_KEYMAP which is available
  only when openrc is selected and kbd package is installed.
  Used to set keymap from /usr/share/keymaps

* package/openrc/openrc.mk
  monitors BR2_TARGET_GENERIC_TERM_KEYMAP and configures init
  to use specified keymap. It will also check if keymap exists
  in the system

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2
  Own initiative:
  - fix "kdb" typo in system/Config.in (should be kbd)
---
 package/openrc/openrc.mk | 28 ++++++++++++++++++++++++++++
 system/Config.in         | 12 ++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 8d5e6ec381..0498c9c95f 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -74,4 +74,32 @@ OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_TERMENCODING
 endif # BR2_TARGET_GENERIC_TERMENCODING_UTF8
 endif # BR2_TARGET_GENERIC_TERMENCODING_KEEP
 
+OPENRC_TERM_KEYMAP = $(call qstrip,$(BR2_TARGET_GENERIC_TERM_KEYMAP))
+ifneq ($(OPENRC_TERM_KEYMAP),)
+OPENRC_DEPENDENCIES += kbd
+# 1) check if passed kaymap exists in the installed system
+# 2) set keymap value in /etc/conf.d/keymaps
+# 3) set keyboard mode to same encoding as terminal encoding
+define OPENRC_SET_TERM_KEYMAP
+	if ! find $(TARGET_DIR)/usr/share/keymaps -name "*$(OPENRC_TERM_KEYMAP).map*" | grep -q ".*"; then \
+		echo "keymap $(OPENRC_TERM_KEYMAP) not found in $(TARGET_DIR)/usr/share/keymaps"; \
+		exit 1; \
+	fi
+	echo "keymap=\"$(OPENRC_TERM_KEYMAP)\"" > $(TARGET_DIR)/etc/conf.d/keymaps
+	if test -f $(TARGET_DIR)/etc/conf.d/termencoding; then \
+		grep "unicode=" $(TARGET_DIR)/etc/conf.d/termencoding >> $(TARGET_DIR)/etc/conf.d/keymaps; \
+	fi
+endef
+else
+# openrc installs keymaps service by default, so if keymap is not set (like
+# because kbd is not installed) we need to remove keymaps service from boot
+# so there are no errors about missing programs. If kbd is installed, but
+# keymap config is empty value, we also remove service to keep default values.
+define OPENRC_SET_TERM_KEYMAP
+	$(RM) $(TARGET_DIR)/etc/runlevels/boot/{keymaps,save-keymaps}
+	$(RM) $(TARGET_DIR)/etc/conf.d/keymaps
+endef
+endif # OPENRC_TERM_KEYMAP
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_TERM_KEYMAP
+
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 08bcb517e4..e0421d8dff 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -407,6 +407,18 @@ config BR2_TARGET_GENERIC_TERMENCODING_UTF8
 	bool "utf-8"
 endchoice
 
+config BR2_TARGET_GENERIC_TERM_KEYMAP
+	string "Set terminal keymap"
+	default "us"
+	depends on BR2_INIT_OPENRC && BR2_PACKAGE_KBD
+	help
+	  Configures all virtual terminals (on /dev/tty[1-12]) to use
+	  specified keymap. List of keymaps are installed in /usr/share/keymaps.
+	  Set to empty, to keep default keymap.
+
+comment "Setting terminal keymap requires OpenRC and kbd package"
+	depends on !(BR2_INIT_OPENRC && BR2_PACKAGE_KBD)
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
-- 
2.18.1
