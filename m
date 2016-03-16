From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Wed, 16 Mar 2016 17:15:35 +0530
Subject: [Buildroot] [ PATCH Selinux v11] linux-pam: add optional libselinux
	and audit dependencies
Message-ID: <1458128735-14925-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan <niranjan.reddy@rockwellcollins.com>

This patch adds optional libselinux and audit packages
to linux-pam package.

Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

---
Changes v10 -> v11:
  - Removed host-linux-pam related config options as it is not related to this patch.

Changes v9 -> v10:
  - New patch created for selinux audit dependencies.
  - Added comment to justify that host-linux-pam is needed for creating pam conf files.
  - Updated Indentation and modified as per comments (suggested by Thomas)

Changes v1 -> v9:
  - Did not exist
---
 package/linux-pam/linux-pam.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 26b627e..55a1024 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -26,6 +26,20 @@ LINUX_PAM_DEPENDENCIES += gettext
 LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LINUX_PAM_CONF_OPTS += --enable-selinux
+LINUX_PAM_DEPENDENCIES += libselinux
+else
+LINUX_PAM_CONF_OPTS += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+LINUX_PAM_CONF_OPTS += --enable-audit
+LINUX_PAM_DEPENDENCIES += audit
+else
+LINUX_PAM_CONF_OPTS += --disable-audit
+endif
+
 # Install default pam config (deny everything)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
-- 
2.5.0
