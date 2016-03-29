From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 02:46:31 +0200
Subject: [Buildroot] [git commit] linux-pam: install login.pam from here
Message-ID: <20160329004641.CAFFB8185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b71a0176c4ca8952c364aad693136c69a268915f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of installing login.pam (/etc/pam.d/login) from util-linux
conditionally do so unconditionally from linux-pam.
If busybox login is pam-enabled (linux-pam package enabled) it will be
required, otherwise it will lead to a system where login won't work, and
if util-linux is enabled it will supercede busybox login and will be
necesarry regardless.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/linux-pam.mk              | 4 +++-
 package/{util-linux => linux-pam}/login.pam | 0
 package/util-linux/util-linux.mk            | 2 --
 3 files changed, 3 insertions(+), 3 deletions(-)

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
