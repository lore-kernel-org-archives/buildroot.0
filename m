From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:35 +0200
Subject: [Buildroot] [PATCH 11/13] package/openrc: add support to set
 terminal encoding
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-11-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When openrc init is enabled, user can chose to set terminal
encoding to ascii, utf-8 or to keep default settings.

* system/Config.in
  New kconfig choice BR2_TARGET_GENERIC_TERMENCODING_* to
  choose terminal encoding. Depends on openrc init.

* package/openrc/openrc.mk
  monitors BR2_TARGET_GENERIC_TERMENCODING_* choice and
  make proper changes on TARGET_DIR to enable/disable
  terminal encoding set.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 package/openrc/openrc.mk | 19 +++++++++++++++++++
 system/Config.in         | 17 +++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index f0aa014256..23b33b65f4 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -56,4 +56,23 @@ endef
 OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY
 endif # BR2_TARGET_GENERIC_GETTY
 
+ifeq ($(BR2_TARGET_GENERIC_TERMENCODING_KEEP),y)
+# openrc by default installs service to set terminal encoding, if we want to
+# keep default encoding we need to remove service from boot.
+define OPENRC_TERMENCODING
+	$(RM) $(TARGET_DIR)/etc/runlevels/boot/{termencoding,save-termencoding}
+	$(RM) $(TARGET_DIR)/etc/conf.d/termencoding
+endef
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_TERMENCODING
+else
+ifeq ($(BR2_TARGET_GENERIC_TERMENCODING_UTF8),y)
+# By default openrc will set terminal encoding to ASCII, if we want encoding
+# to be utf8, we need to set it.
+define OPENRC_TERMENCODING
+	echo "unicode=\"yes\"" > $(TARGET_DIR)/etc/conf.d/termencoding
+endef
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_TERMENCODING
+endif # BR2_TARGET_GENERIC_TERMENCODING_UTF8
+endif # BR2_TARGET_GENERIC_TERMENCODING_KEEP
+
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 32c502e310..08bcb517e4 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -390,6 +390,23 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 		BR2_PACKAGE_SYSTEMD_NETWORKD) && !BR2_PACKAGE_OPENRC) || \
 		BR2_PACKAGE_OPENRC_NETIFRC)
 
+choice
+	prompt "Terminal encoding"
+	default BR2_TARGET_GENERIC_TERMENCODING_KEEP
+	depends on BR2_INIT_OPENRC
+	help
+	  Set terminal encoding. This makes sense only when you are going to
+	  use virtual terminals with external monitor (or qemu) that uses
+	  /dev/tty[1-12].
+
+config BR2_TARGET_GENERIC_TERMENCODING_KEEP
+	bool "keep default"
+config BR2_TARGET_GENERIC_TERMENCODING_ASCII
+	bool "ascii"
+config BR2_TARGET_GENERIC_TERMENCODING_UTF8
+	bool "utf-8"
+endchoice
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
-- 
2.18.1
