From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:05 +0200
Subject: [Buildroot] [PATCH 05/16] package/systemd: apply locale settings in
	user shells
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-6-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add /etc/profile.d/locale.sh script from Arch Linux to apply systemd
locale settings in user shells.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/systemd/locale.sh  | 26 ++++++++++++++++++++++++++
 package/systemd/systemd.mk |  7 +++++++
 2 files changed, 33 insertions(+)
 create mode 100644 package/systemd/locale.sh

diff --git a/package/systemd/locale.sh b/package/systemd/locale.sh
new file mode 100644
index 0000000..b665872
--- /dev/null
+++ b/package/systemd/locale.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+if [ -z "$LANG" ]; then
+  if [ -n "$XDG_CONFIG_HOME" ] && [ -r "$XDG_CONFIG_HOME/locale.conf" ]; then
+    . "$XDG_CONFIG_HOME/locale.conf"
+  elif [ -n $HOME ] && [ -r $HOME/.config/locale.conf ]; then
+    . "$HOME/.config/locale.conf"
+  elif [ -r /etc/locale.conf ]; then
+    . /etc/locale.conf
+  fi
+fi
+
+LANG=${LANG:-C}
+export LANG
+[ -n "$LC_CTYPE" ]          && export LC_CTYPE
+[ -n "$LC_NUMERIC" ]        && export LC_NUMERIC
+[ -n "$LC_TIME" ]           && export LC_TIME
+[ -n "$LC_COLLATE" ]        && export LC_COLLATE
+[ -n "$LC_MONETARY" ]       && export LC_MONETARY
+[ -n "$LC_MESSAGES" ]       && export LC_MESSAGES
+[ -n "$LC_PAPER" ]          && export LC_PAPER
+[ -n "$LC_NAME" ]           && export LC_NAME
+[ -n "$LC_ADDRESS" ]        && export LC_ADDRESS
+[ -n "$LC_TELEPHONE" ]      && export LC_TELEPHONE
+[ -n "$LC_MEASUREMENT" ]    && export LC_MEASUREMENT
+[ -n "$LC_IDENTIFICATION" ] && export LC_IDENTIFICATION
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 92f99c2..ef14c76 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -158,6 +158,12 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
+define SYSTEMD_INSTALL_LOCALE_SH_HOOK
+	mkdir -p $(TARGET_DIR)/etc/profile.d
+	$(INSTALL) -D -m 644 package/systemd/locale.sh \
+		$(TARGET_DIR)/etc/profile.d/locale.sh
+endef
+
 define SYSTEMD_SANITIZE_PATH_IN_UNITS
 	find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
@@ -172,6 +178,7 @@ endef
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
+	SYSTEMD_INSTALL_LOCALE_SH_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
 	SYSTEMD_DISABLE_LDCONFIG_SERVICE_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
-- 
2.2.1
