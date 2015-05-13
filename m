From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:23 -0500
Subject: [Buildroot] [PATCH v5 10/24] linux-pam: selinux support
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-11-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v4 -> v5:
  - Dropping unneeded patch (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 package/linux-pam/linux-pam.mk     | 58 +++++++++++++++++++++++++++++++++++++-
 package/linux-pam/system-auth.pamd | 15 ++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 package/linux-pam/system-auth.pamd

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 26b627e..8a28f78 100644
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
@@ -26,12 +31,63 @@ LINUX_PAM_DEPENDENCIES += gettext
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
