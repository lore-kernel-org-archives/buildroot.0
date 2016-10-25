From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 25 Oct 2016 14:26:05 -0500
Subject: [Buildroot] [PATCH v13 3/8] linux-pam: add system auth file and
	host variant
In-Reply-To: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <1477423570-15694-3-git-send-email-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan <niranjan.reddy@rockwellcollins.com>

This patch creates system-auth.pamd file for pam services
and adds host-linux-pam variant for creating pam.d files.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

---
Changes v12 -> v13:
  - No changes

Changes v11 -> v12:
  - No changes

Changes v10 -> v11:
  - Added host-linux-pam variant as it is the dependency for creating pam_conv1 files.
  - Removed semicolon at the end of if condition (after fi).
  - Merged system auth patch with host selinux dependencies patch

Changes v9 -> v10:
  - Dropped host linux-pam variant,optional selinux and audit dependencies and created seperate
    Patches (Suggedted by Thomas).

Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - Removed sub-shell around the config file install block and
    refactored the block to use absolute paths for the copying
    (Suggested by Samuel)
  - Changed the enable-db=no configure option to disable-db to be
    consistent with the rest of the configure options (Suggested by
    Samuel)

Changes v6 -> v7:
  - Added missing host-pkgconf dependency and removed unneeded
    host-autoconf dependency(Clayton S.)

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - Dropping unneeded patch (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 package/linux-pam/linux-pam.mk     | 41 +++++++++++++++++++++++++++++++++++++-
 package/linux-pam/system-auth.pamd | 15 ++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 package/linux-pam/system-auth.pamd

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 6ce3839..57c2be2 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -8,15 +8,18 @@ LINUX_PAM_VERSION = 1.3.0
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
+# disable cracklib in linux pam config options
 LINUX_PAM_CONF_OPTS = \
 	--disable-prelude \
 	--disable-isadir \
 	--disable-nis \
 	--disable-db \
+	--disable-cracklib \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
+# host-linux-pam is needed for creating pam conf files
+LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf host-linux-pam
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
@@ -48,6 +51,42 @@ define LINUX_PAM_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/pam.d/other
 endef
 
+# Use the host-pam pam_conv1 app to create the pam.d files
+define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
+	if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
+		mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
+	fi
+	cd $(TARGET_DIR)/etc/ && cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1; \
+	if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
+		cp -a $(TARGET_DIR)/etc/pam.d/* $(TARGET_DIR)/etc/pam.d.orig/; \
+		rm -rf $(TARGET_DIR)/etc/pam.d/; \
+		mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/; \
+	fi
+	$(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd $(TARGET_DIR)/etc/pam.d/system-auth
+endef
+
+LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
 LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
 
+HOST_LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf
+
+HOST_LINUX_PAM_CONF_OPTS = \
+	--disable-rpath \
+	--enable-read-both-confs \
+	--disable-regenerate-docu \
+	--disable-isadir \
+	--disable-nis \
+	--enable-securedir=/lib/security \
+	--disable-prelude \
+	--disable-cracklib \
+	--disable-lckpwdf \
+	--disable-db \
+	--disable-selinux \
+	--disable-audit \
+
+define HOST_LINUX_PAM_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/conf/pam_conv1/pam_conv1 $(HOST_DIR)/usr/bin/pam_conv1
+endef
+
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
