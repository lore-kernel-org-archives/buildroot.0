From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 21:39:56 -0300
Subject: [Buildroot] [PATCH] linux-pam: install login.pam from here
Message-ID: <1459211996-30192-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of installing login.pam (/etc/pam.d/login) from util-linux
conditionally do so unconditionally from linux-pam.
If busybox login is pam-enabled (linux-pam package enabled) it will be
required, otherwise it will lead to a system where login won't work, and
if util-linux is enabled it will supercede busybox login and will be
necesarry regardless.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-pam/linux-pam.mk              | 4 +++-
 package/{util-linux => linux-pam}/login.pam | 0
 package/util-linux/util-linux.mk            | 2 --
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename package/{util-linux => linux-pam}/login.pam (100%)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index cf1b5b7..71c5490 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -26,8 +26,10 @@ LINUX_PAM_DEPENDENCIES += gettext
 LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
-# Install default pam config (deny everything)
+# Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
+	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
+		$(TARGET_DIR)/etc/pam.d/login
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
 		$(TARGET_DIR)/etc/pam.d/other
 endef
diff --git a/package/util-linux/login.pam b/package/linux-pam/login.pam
similarity index 100%
rename from package/util-linux/login.pam
rename to package/linux-pam/login.pam
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 141dffd..a055d17 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -153,8 +153,6 @@ endif
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
-	$(INSTALL) -m 0644 package/util-linux/login.pam \
-		$(TARGET_DIR)/etc/pam.d/login
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
-- 
2.7.3
