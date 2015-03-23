From: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
Date: Tue, 24 Mar 2015 00:30:35 +0100
Subject: [Buildroot] [PATCH v2] Restructure root password handling
In-Reply-To: <20150323184831.GC4214@free.fr>
References: <20150323184831.GC4214@free.fr>
Message-ID: <1427153435-31605-1-git-send-email-lorenzo@sancho.ccd.uniroma2.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Created a top level boolean entry to enable/disable root login

Allow choosing the root password input format only if root login
is enabled.

Signed-off-by: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
---
 system/Config.in | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 system/system.mk | 25 +++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 9973cc2..f3d67ed 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -188,6 +188,44 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_TARGET_ENABLE_ROOT_LOGIN
+	bool "Enable root login"
+        default "y"
+	help
+	  Enable root login password
+
+if BR2_TARGET_ENABLE_ROOT_LOGIN
+
+choice
+	prompt "Root password input"
+
+config BR2_TARGET_PLAINTEXT_ROOT_PASSWORD
+	bool "cleartext format"
+	help
+	  Set the root password from plaintext input
+
+	  WARNING! WARNING!
+	  The password appears in clear in the .config file, and may appear
+	  in the build log! Avoid using a valuable password if either the
+	  .config file or the build log may be distributed!
+
+config BR2_TARGET_HASHED_ROOT_PASSWORD
+	bool "hashed format"
+	help
+	  Set the root password from prehashed input
+
+	  WARNING! WARNING!
+	  The password's hash appears in the .config file, and may appear
+	  in the build log! Avoid using a valuable password if either
+	  the .config file or the build log may be distributed, or at the
+	  very least use a strong cryptographic hash for your password!
+
+endchoice
+
+endif
+
+if BR2_TARGET_PLAINTEXT_ROOT_PASSWORD
+
 config BR2_TARGET_GENERIC_ROOT_PASSWD
 	string "Root password"
 	default ""
@@ -208,6 +246,34 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  The password appears in clear in the .config file, and may appear
 	  in the build log! Avoid using a valuable password if either the
 	  .config file or the build log may be distributed!
+endif
+
+if BR2_TARGET_HASHED_ROOT_PASSWORD
+
+config BR2_TARGET_GENERIC_ROOT_PASSWD_HASH
+	string "Hashed root password"
+	default ""
+	help
+	  Set the crypt(3) encoded root password hash.
+
+	  If set to empty (the default), then no root password will be set,
+	  and root will need no password to log in.
+
+	  An hashed root password of "*" will disable root logins.
+
+	  "$" signs in the hashed password must be doubled.
+
+	  For example, the MD5 hash for the password "mypass" salted with
+	  the string "longsalt" is "$1$longsalt$v35DIIeMo4yUfI23yditq0",
+	  which must be written as "$$1$$longsalt$$v35DIIeMo4yUfI23yditq0"
+
+	  WARNING! WARNING!
+	  The password's hash appears in the .config file, and may appear
+	  in the build log! Avoid using a valuable password if either
+	  the .config file or the build log may be distributed, or at the
+	  very least use a strong cryptographic hash for your password!
+
+endif
 
 choice
 	bool "/bin/sh"
diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..5cf3faf 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,6 +1,10 @@
 TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+TARGET_ENABLE_ROOT_LOGIN = $(call qstrip, $(BR2_TARGET_ENABLE_ROOT_LOGIN))
+TARGET_PLAINTEXT_ROOT_PASSWORD = $(call qstrip, $(BR2_TARGET_PLAINTEXT_ROOT_PASSWORD))
+TARGET_HASHED_ROOT_PASSWORD = $(call qstrip, $(BR2_TARGET_HASHED_ROOT_PASSWORD))
 TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+TARGET_GENERIC_ROOT_PASSWD_HASH = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD_HASH))
 TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
 TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
 TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
@@ -69,11 +73,32 @@ TARGET_FINALIZE_HOOKS += SET_NETWORK
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 
+ifeq ($(TARGET_ENABLE_ROOT_LOGIN),y)
+
+ifeq ($(BR2_TARGET_PLAINTEXT_ROOT_PASSWORD),y)
+
 define SYSTEM_ROOT_PASSWD
 	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
 		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
 	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
 endef
+
+else ifeq ($(BR2_TARGET_HASHED_ROOT_PASSWORD),y)
+
+define SYSTEM_ROOT_PASSWD
+	$(SED) 's,^root:[^:]*:,root:$(TARGET_GENERIC_ROOT_PASSWD_HASH):,' $(TARGET_DIR)/etc/shadow
+endef
+
+endif
+
+else
+
+define SYSTEM_ROOT_PASSWD
+	$(SED) 's,^root:[^:]*:,root:*:,' $(TARGET_DIR)/etc/shadow
+endef
+
+endif
+
 TARGET_FINALIZE_HOOKS += SYSTEM_ROOT_PASSWD
 
 ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
-- 
2.1.4
