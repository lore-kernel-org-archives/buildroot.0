From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:34 -0500
Subject: [Buildroot] [PATCH v2 14/17] shadow: new package
In-Reply-To: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378936777-28308-15-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.

 package/Config.in        |    3 ++
 package/shadow/Config.in |   13 ++++++++++++
 package/shadow/shadow.mk |   49 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.mk

diff --git a/package/Config.in b/package/Config.in
index b5b4a6e..b9b0d3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -929,6 +929,9 @@ source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/logsurfer/Config.in"
 source "package/screen/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/shadow/Config.in"
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
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000..8783533
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# shadow
+#
+################################################################################
+
+SHADOW_VERSION = 4.1.5.1
+SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.bz2
+SHADOW_SITE = http://pkg-shadow.alioth.debian.org/releases/
+SHADOW_LICENSE = BSD
+SHADOW_LICENSE_FILES = COPYING
+SHADOW_DEPENDENCIES = acl attr busybox
+
+SHADOW_INSTALL_STAGING = NO
+
+SHADOW_CONF_OPT = --disable-nls
+
+# Shadow configuration to support audit
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+SHADOW_DEPENDENCIES += audit
+SHADOW_CONF_OPT += --with-audit=yes
+endif
+
+# Shawdow with linux-pam support
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y) 
+SHADOW_DEPENDENCIES += linux-pam
+SHADOW_CONF_OPT += --with-libpam=yes
+endif
+
+# Shadow with selinux support
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SHADOW_DEPENDENCIES += libselinux libsemanage
+SHADOW_CONF_OPT += --with-selinux=yes
+endif
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
+
+SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_LOGIN_CONFIGURATION
+
+$(eval $(autotools-package))
-- 
1.7.1
