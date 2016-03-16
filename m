From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Wed, 16 Mar 2016 17:16:31 +0530
Subject: [Buildroot] [ PATCH Selinux v11] util-linux: selinux, audit,
	and pam support
Message-ID: <1458128791-15061-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

This patch adds optional libselinux ,audit and pam support to linux utilities.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

---
Changes v10 -> v11:
  - Comment added to explain how the SED expression writes to pam files.

Changes v9 -> v10:
  - No changes

Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - No changes

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
 - Update the selinux busybox config to the latest version of busybox
    (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 package/util-linux/util-linux.mk | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f6e5d62..a5feea0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -58,6 +58,20 @@ ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 UTIL_LINUX_DEPENDENCIES += libcap-ng
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+UTIL_LINUX_DEPENDENCIES += libselinux
+UTIL_LINUX_CONF_OPTS += --with-selinux
+else
+UTIL_LINUX_CONF_OPTS += --without-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+UTIL_LINUX_DEPENDENCIES += audit
+UTIL_LINUX_CONF_OPTS += --with-audit
+else
+UTIL_LINUX_CONF_OPTS += --without-audit
+endif
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
@@ -158,9 +172,25 @@ define UTIL_LINUX_INSTALL_PAMFILES
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
 endef
+
+# Add the required hooks to the pam files if SELinux is enabled
+# SED expression adds these lines to /etc/pam.d/login,/etc/pam.d/su-l and /etc/pam.d/su files
+#   session		required	pam_selinux.so close
+#   session		required	pam_selinux.so open
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+define UTIL_LINUX_FIXUP_PAMFILES
+	for file in login su su-l ; do \
+		$(SED) '/selinux/d' $(TARGET_DIR)/etc/pam.d/$${file}; \
+		$(SED) '0,/session/s/session/session		required	pam_selinux.so close\nsession/' $(TARGET_DIR)/etc/pam.d/$${file}; \
+		echo "session		required	pam_selinux.so open" >> $(TARGET_DIR)/etc/pam.d/$${file}; \
+	done
+endef
+endif
+
 endif
 
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
+UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_FIXUP_PAMFILES
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
-- 
2.5.0
