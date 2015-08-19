From: giovanni.zantedeschi <giovanni.zantedeschi@datacom.ind.br>
Date: Wed, 19 Aug 2015 17:46:48 -0300
Subject: [Buildroot] [PATCH 1/1] libpam-radius-auth: new package
Message-ID: <1440017208-14421-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>

Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
---
 package/Config.in                                |  1 +
 package/libpam-radius-auth/Config.in             |  6 ++++++
 package/libpam-radius-auth/libpam-radius-auth.mk | 25 ++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/libpam-radius-auth/Config.in
 create mode 100644 package/libpam-radius-auth/libpam-radius-auth.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..a4e9e13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libpam-radius-auth/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libpam-radius-auth/Config.in b/package/libpam-radius-auth/Config.in
new file mode 100644
index 0000000..f77fc1a
--- /dev/null
+++ b/package/libpam-radius-auth/Config.in
@@ -0,0 +1,6 @@
+ config BR2_PACKAGE_LIBPAM_RADIUS_AUTH
+        bool "libpam-radius-auth"
+        help
+          Lib needed to use pam-radius and FreeRadius
+
+          http://freeradius.org/pam_radius_auth/
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
new file mode 100644
index 0000000..8603903
--- /dev/null
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libpam-radius-auth
+#
+################################################################################
+
+LIBPAM_RADIUS_AUTH_VERSION = release_1_4_0
+LIBPAM_RADIUS_AUTH_SITE = https://github.com/FreeRADIUS/pam_radius.git
+LIBPAM_RADIUS_AUTH_SITE_METHOD = git
+
+LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
+LIBPAM_RADIUS_AUTH_AUTORECONF = YES
+LIBPAM_RADIUS_AUTH_LICENSE = GPLv2+
+LIBPAM_RADIUS_AUTH_LICENSE_FILES = LICENSE
+LIBPAM_RADIUS_AUTH_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+
+define LIBPAM_RADIUS_AUTH_INSTALL_STAGING_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/pam_radius_auth.so* $(STAGING_DIR)/lib/security/
+endef
+
+define LIBPAM_RADIUS_AUTH_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/pam_radius_auth.so* $(TARGET_DIR)/lib/security/
+endef
+
+$(eval $(autotools-package))
-- 
1.9.1
