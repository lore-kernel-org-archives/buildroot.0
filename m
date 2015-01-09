From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:18 -0600
Subject: [Buildroot] [PATCH v4 17/27] linux-pam: selinux support
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-18-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../linux-pam-08-audit-log-acct_message_ret.patch  | 16 ++++++
 package/linux-pam/linux-pam.mk                     | 58 +++++++++++++++++++++-
 package/linux-pam/system-auth.pamd                 | 15 ++++++
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 package/linux-pam/linux-pam-08-audit-log-acct_message_ret.patch
 create mode 100644 package/linux-pam/system-auth.pamd

diff --git a/package/linux-pam/linux-pam-08-audit-log-acct_message_ret.patch b/package/linux-pam/linux-pam-08-audit-log-acct_message_ret.patch
new file mode 100644
index 0000000..d819f08
--- /dev/null
+++ b/package/linux-pam/linux-pam-08-audit-log-acct_message_ret.patch
@@ -0,0 +1,16 @@
+--- a/libpam/pam_audit.c	2011-06-21 04:04:56.000000000 -0500
++++ b/libpam/pam_audit.c	2012-09-12 08:55:26.000000000 -0500
+@@ -41,11 +41,11 @@
+      an official errno number, but must not. It can also be a audit
+      internal error code. Which makes errno useless :-((. Try the
+      best to fix it. */
+-  errno = -rc;
++  errno = rc;
+ 
+   pamh->audit_state |= PAMAUDIT_LOGGED;
+ 
+-  if (rc < 0) {
++  if (rc <= 0) {
+       if (rc == -EPERM && getuid() != 0)
+           return 0;
+       if (errno != old_errno) {
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 3dce25c..db6161d 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -8,6 +8,9 @@ LINUX_PAM_VERSION = 1.1.8
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
+
+# lckpwdf is included with shadow
+# cracklib and libdb are not currently present in buildroot
 LINUX_PAM_CONF_OPTS = \
 	--disable-prelude \
 	--disable-isadir \
@@ -15,8 +18,10 @@ LINUX_PAM_CONF_OPTS = \
 	--disable-db \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
+	--disable-cracklib \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
+
+LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf host-linux-pam
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
@@ -26,12 +31,63 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 	LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+	LINUX_PAM_CONF_OPTS += --enable-selinux
+	LINUX_PAM_DEPENDENCIES += libselinux
+else
+	LINUX_PAM_CONF_OPTS += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+	LINUX_PAM_CONF_OPTS += --enable-audit
+	LINUX_PAM_DEPENDENCIES += audit
+else
+	LINUX_PAM_CONF_OPTS += --disable-audit
+endif
+
 # Install default pam config (deny everything)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
 		$(TARGET_DIR)/etc/pam.d/other
 endef
 
+# Use the host-pam pam_conv1 app to create the pam.d files
+define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
+	( \
+		if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
+			mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
+		fi; \
+		cd $(TARGET_DIR)/etc/ && \
+		cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1; \
+		if [ -d pam.d.orig ]; then \
+			cp -a pam.d/* pam.d.orig/; \
+			rm -rf pam.d/; \
+			mv pam.d.orig/ pam.d/; \
+		fi; \
+	)
+	$(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd $(TARGET_DIR)/etc/pam.d/system-auth
+endef
+
+LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
 LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
 
+HOST_LINUX_PAM_DEPENDENCIES = host-autoconf host-flex
+
+HOST_LINUX_PAM_CONF_OPTS = --disable-rpath \
+               --enable-read-both-confs \
+               --disable-regenerate-docu \
+               --disable-isadir \
+               --disable-nis \
+               --enable-securedir=/lib/security \
+               --disable-prelude \
+               --disable-cracklib \
+               --disable-lckpwdf \
+               --enable-db=no \
+               --disable-selinux \
+               --disable-audit \
+
+define HOST_LINUX_PAM_INSTALL_CMDS
+	$(INSTALL) -m 755 $(@D)/conf/pam_conv1/pam_conv1 $(HOST_DIR)/usr/bin/
+endef
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/linux-pam/system-auth.pamd b/package/linux-pam/system-auth.pamd
new file mode 100644
index 0000000..2fa116a
--- /dev/null
+++ b/package/linux-pam/system-auth.pamd
@@ -0,0 +1,15 @@
+#%PAM-1.0
+auth        required      pam_env.so
+auth        sufficient    pam_unix.so
+auth        required      pam_deny.so
+
+account     required      pam_unix.so
+
+#password    required      pam_cracklib.so try_first_pass retry=3
+password    sufficient    pam_unix.so md5 shadow try_first_pass
+password    required      pam_deny.so
+
+session     optional      pam_keyinit.so revoke
+session     required      pam_limits.so
+session     [success=1 default=ignore] pam_succeed_if.so service in crond quiet use_uid
+session     required      pam_unix.so
-- 
1.9.1
