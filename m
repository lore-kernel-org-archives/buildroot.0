From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Dec 2016 21:27:04 +0100
Subject: [Buildroot] [PATCH 2/2] util-linux: add selinux support
In-Reply-To: <1481056025-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1477423570-15694-3-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1481056025-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1481056025-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

This patch adds optional libselinux support to the util-linux package,
and also tweaks the PAM files instealled by util-linux to work properly
in an SELinux context.

Like was done for linux-pam, the tweak is done by having the SELinux
related lines commented out in the original PAM file, and uncommented
when SELinux support is enabled.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/su.pam        |  2 ++
 package/util-linux/util-linux.mk | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/util-linux/su.pam b/package/util-linux/su.pam
index f000c39..84b1860 100644
--- a/package/util-linux/su.pam
+++ b/package/util-linux/su.pam
@@ -7,7 +7,9 @@ account		required	pam_unix.so
 
 password	required	pam_unix.so nullok
 
+# session	required	pam_selinux.so close
 session		required	pam_limits.so
 session		required	pam_env.so
 session		required	pam_unix.so
 session		optional	pam_lastlog.so
+# session	required	pam_selinux.so open
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cf03fd4..7140554 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -63,6 +63,19 @@ endif
 UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
 UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+UTIL_LINUX_DEPENDENCIES += libselinux
+UTIL_LINUX_CONF_OPTS += --with-selinux
+define UTIL_LINUX_SELINUX_PAMFILES_TWEAK
+	$(foreach f,su su-l,
+		$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
+			$(TARGET_DIR)/etc/pam.d/$(f)
+	)
+endef
+else
+UTIL_LINUX_CONF_OPTS += --without-selinux
+endif
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
@@ -179,6 +192,7 @@ define UTIL_LINUX_INSTALL_PAMFILES
 		$(TARGET_DIR)/etc/pam.d/su
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
+	$(UTIL_LINUX_SELINUX_PAMFILES_TWEAK)
 endef
 endif
 
-- 
2.7.4
