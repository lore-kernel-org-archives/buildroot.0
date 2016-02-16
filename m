From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:48:19 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 04/11] linux-pam: selinux
	host dependencies
In-Reply-To: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <1455603506-26138-4-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan <niranjan.reddy@rockwellcollins.com>

Signed-off-by: Niranjan <niranjan.reddy@rockwellcollins.com>

---
Changes v9 -> v10:
  - New Patch created for selinux host dependencies.

Changes v1 -> v9:
 - Did not exist
---
 package/linux-pam/linux-pam.mk | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index c2897df..e253c37 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -49,6 +49,41 @@ define LINUX_PAM_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/pam.d/other
 endef
 
+# Use the host-pam pam_conv1 app to create the pam.d files
+define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
+	if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
+		mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
+	fi; \
+	cd $(TARGET_DIR)/etc/ && cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1; \
+	if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
+		cp -a $(TARGET_DIR)/etc/pam.d/* $(TARGET_DIR)/etc/pam.d.orig/; \
+		rm -rf $(TARGET_DIR)/etc/pam.d/; \
+		mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/; \
+	fi;
+	$(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd $(TARGET_DIR)/etc/pam.d/system-auth
+endef
+
+LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
 LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
 
+HOST_LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf
+
+HOST_LINUX_PAM_CONF_OPTS = 
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
+	$(INSTALL) -D -m 755 $(@D)/conf/pam_conv1/pam_conv1 $(HOST_DIR)/usr/bin/
+endef
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.5.0
