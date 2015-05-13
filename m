From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:28 -0500
Subject: [Buildroot] [PATCH v5 15/24] util-linux: selinux, audit,
	and pam support
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-16-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v4 -> v5:
  - New patch
  - Added pam file tweaks for selinux support (Clayton S.)
---
 package/util-linux/util-linux.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3ca147a..259334f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -59,6 +59,20 @@ ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
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
 
@@ -146,9 +160,22 @@ define UTIL_LINUX_INSTALL_PAMFILES
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
 endef
+
+# Add the required hooks to the pam files if SELinux is enabled
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
1.9.1
