From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 14:22:26 -0300
Subject: [Buildroot] [PATCH 1/2] linux-pam: install default config
Message-ID: <1385659347-32073-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install default "other" configuration file that denies everything not
handled by other specific configurations.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-pam/linux-pam.mk | 10 +++++++++-
 package/linux-pam/other.pam    |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 package/linux-pam/other.pam

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 7d2cbd3..6aa83e1 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -1,7 +1,7 @@
 ################################################################################
 #
 # linux-pam
-# 
+#
 ################################################################################
 
 LINUX_PAM_VERSION = 1.1.8
@@ -26,4 +26,12 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 	LINUX_PAM_MAKE_OPT += LIBS=-lintl
 endif
 
+# Install default pam config (deny everything)
+define LINUX_PAM_INSTALL_CONFIG
+	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
+		$(TARGET_DIR)/etc/pam.d/other
+endef
+
+LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
+
 $(eval $(autotools-package))
diff --git a/package/linux-pam/other.pam b/package/linux-pam/other.pam
new file mode 100644
index 0000000..a198aa2
--- /dev/null
+++ b/package/linux-pam/other.pam
@@ -0,0 +1,7 @@
+auth		required	pam_deny.so
+
+account		required	pam_deny.so
+
+password	required	pam_deny.so
+
+session		required	pam_deny.so
-- 
1.8.3.2
