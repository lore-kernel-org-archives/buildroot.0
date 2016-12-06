From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Dec 2016 21:27:03 +0100
Subject: [Buildroot] [PATCH 1/2] linux-pam: adjust login pam file for SELinux
In-Reply-To: <1477423570-15694-3-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-3-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <1481056025-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When SELinux support is enabled, the login pam file installed by
linux-pam should be adjusted to use the pam_selinux.so module.

To achieve this in a reasonably simple manner, we introduce the SELinux
related lines in login.pam as comments, and if SELinux support is
enabled, turn those commented lines into real lines.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/linux-pam.mk | 5 +++++
 package/linux-pam/login.pam    | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 6ce3839..c8ba30f 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -29,6 +29,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
 LINUX_PAM_DEPENDENCIES += libselinux
+define LINUX_PAM_SELINUX_PAMFILE_TWEAK
+	$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
+		$(TARGET_DIR)/etc/pam.d/login
+endef
 else
 LINUX_PAM_CONF_OPTS += --disable-selinux
 endif
@@ -46,6 +50,7 @@ define LINUX_PAM_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/pam.d/login
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
 		$(TARGET_DIR)/etc/pam.d/other
+	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
 endef
 
 LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
diff --git a/package/linux-pam/login.pam b/package/linux-pam/login.pam
index 01f5632..5df7db6 100644
--- a/package/linux-pam/login.pam
+++ b/package/linux-pam/login.pam
@@ -4,7 +4,9 @@ account		required	pam_unix.so
 
 password	required	pam_unix.so nullok
 
+# session	required	pam_selinux.so close
 session		required	pam_limits.so
 session		required	pam_env.so
 session		required	pam_unix.so
 session		optional	pam_lastlog.so
+# session	required	pam_selinux.so open
-- 
2.7.4
