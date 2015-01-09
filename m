From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:12 -0600
Subject: [Buildroot] [PATCH v4 11/27] shadow: new package
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-12-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
[Matt W:
  - added hash
  - bumped version

 package/Config.in          |  3 +++
 package/shadow/Config.in   | 13 ++++++++++
 package/shadow/shadow.hash |  2 ++
 package/shadow/shadow.mk   | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.hash
 create mode 100644 package/shadow/shadow.mk

diff --git a/package/Config.in b/package/Config.in
index d6d88e9..4fcd164 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1233,6 +1233,9 @@ comment "Utilities"
 	source "package/logsurfer/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/screen/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/shadow/Config.in"
+endif
 	source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/time/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000..5692ac6
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SHADOW
+	bool "shadow"
+	help
+	  The shadow-utils package includes the necessary programs for
+	  converting UNIX password files to the shadow password format, plus
+	  programs for managing user and group accounts. The pwconv command
+	  converts passwords to the shadow password format. The pwunconv command
+	  unconverts shadow passwords and generates an npasswd file (a standard
+	  UNIX password file). The pwck command checks the integrity of password
+	  and shadow files. The lastlog command prints out the last login times
+	  for all users. The useradd, userdel, and usermod commands are used for
+	  managing user accounts. The groupadd, groupdel, and groupmod commands
+	  are used for managing group accounts.
diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
new file mode 100644
index 0000000..efb1b60
--- /dev/null
+++ b/package/shadow/shadow.hash
@@ -0,0 +1,2 @@
+#Locally computed
+sha256 aa32333748d68b58ed3a83625f0165e0f6b9dc4639e6377c9300c6bf4fe978fb  shadow-4.1.5.1.tar.bz2
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000..fc11f3a
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# shadow
+#
+################################################################################
+
+SHADOW_VERSION = 4.2.1
+SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
+SHADOW_SITE = http://pkg-shadow.alioth.debian.org/releases/
+SHADOW_LICENSE = BSD-3c
+SHADOW_LICENSE_FILES = COPYING
+SHADOW_DEPENDENCIES = acl attr busybox
+
+SHADOW_INSTALL_STAGING = NO
+
+# --enable-subordinate-ids=no is to disable a test program build
+# The setting of ENABLE_SUBIDS in config.h re-enables this option.
+SHADOW_CONF_OPTS = --disable-nls --enable-subordinate-ids=no
+
+define SHADOW_POST_PATCH_DISABLE_SUID
+	# Disable setting suid bit when installing
+	$(SED) 's/\(^suidu*bins = \).*/\1/' $(@D)/src/Makefile.in
+endef
+SHADOW_POST_PATCH_HOOKS += SHADOW_POST_PATCH_DISABLE_SUID
+
+define SHADOW_POST_CONFIGURE_ENABLE_SUBIDS
+	echo "#define ENABLE_SUBIDS 1" >> $(@D)/config.h
+endef
+SHADOW_POST_CONFIGURE_HOOKS += SHADOW_POST_CONFIGURE_ENABLE_SUBIDS
+
+# Shadow configuration to support audit
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+SHADOW_DEPENDENCIES += audit
+SHADOW_CONF_OPTS += --with-audit=yes
+endif
+
+# Shadow with linux-pam support
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+SHADOW_DEPENDENCIES += linux-pam
+SHADOW_CONF_OPTS += --with-libpam=yes
+
+# Comment out all config entries that conflict with using PAM
+define SHADOW_LOGIN_CONFIGURATION
+	for FUNCTION in FAIL_DELAY FAILLOG_ENAB LASTLOG_ENAB MAIL_CHECK_ENAB \
+		OBSCURE_CHECKS_ENAB PORTTIME_CHECKS_ENAB QUOTAS_ENAB CONSOLE MOTD_FILE \
+		FTMP_FILE NOLOGINS_FILE ENV_HZ PASS_MIN_LEN SU_WHEEL_ONLY CRACKLIB_DICTPATH \
+		PASS_CHANGE_TRIES PASS_ALWAYS_WARN CHFN_AUTH ENCRYPT_METHOD ENVIRON_FILE ; \
+	do \
+		sed -i "s/^$${FUNCTION}/# &/" $(TARGET_DIR)/etc/login.defs ; \
+	done
+endef
+SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_LOGIN_CONFIGURATION
+endif
+
+# Shadow with selinux support
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SHADOW_DEPENDENCIES += libselinux libsemanage
+SHADOW_CONF_OPTS += --with-selinux=yes
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
