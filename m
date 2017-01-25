From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:05:20 +1300
Subject: [Buildroot] [git commit] util-linux: add selinux support
Message-ID: <20170125100542.7D05481F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=373b7efdb308fcb7607cbef63ee4d2644b46136f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
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
index 53a6d9b..84c4f0e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -75,6 +75,19 @@ endif
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
 
@@ -192,6 +205,7 @@ define UTIL_LINUX_INSTALL_PAMFILES
 		$(TARGET_DIR)/etc/pam.d/su
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
+	$(UTIL_LINUX_SELINUX_PAMFILES_TWEAK)
 endef
 endif
 
