From: giovanni.zantedeschi <giovanni.zantedeschi@datacom.ind.br>
Date: Wed, 19 Aug 2015 12:53:06 -0300
Subject: [Buildroot] [PATCH 1/1] Added libpam-tacplus and libpam-radius-auth
	modules.
Message-ID: <1439999586-6811-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>

Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
---
 package/Config.in                                |  2 ++
 package/libpam-radius-auth/Config.in             |  6 ++++++
 package/libpam-radius-auth/libpam-radius-auth.mk | 25 ++++++++++++++++++++++++
 package/libpam-tacplus/Config.in                 |  5 +++++
 package/libpam-tacplus/libpam-tacplus.mk         | 18 +++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/libpam-radius-auth/Config.in
 create mode 100644 package/libpam-radius-auth/libpam-radius-auth.mk
 create mode 100644 package/libpam-tacplus/Config.in
 create mode 100644 package/libpam-tacplus/libpam-tacplus.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..e45e639 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,8 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libpam-radius-auth/Config.in"
+	source "package/libpam-tacplus/Config.in"
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
diff --git a/package/libpam-tacplus/Config.in b/package/libpam-tacplus/Config.in
new file mode 100644
index 0000000..88d10ff
--- /dev/null
+++ b/package/libpam-tacplus/Config.in
@@ -0,0 +1,5 @@
+ config BR2_PACKAGE_LIBPAM_TACPLUS
+        bool "libpam-tacplus"
+        help
+          Lib needed to use pam-tacplus
+
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
new file mode 100644
index 0000000..f788f47
--- /dev/null
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libpam-tacplus
+#
+################################################################################
+
+LIBPAM_TACPLUS_VERSION = 1.3.9
+LIBPAM_TACPLUS_SITE = https://github.com/jeroennijhof/pam_tacplus.git
+LIBPAM_TACPLUS_SITE_METHOD = git
+
+LIBPAM_TACPLUS_INSTALL_STAGING = YES
+LIBPAM_TACPLUS_AUTORECONF = YES
+LIBPAM_TACPLUS_CONF_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+LIBPAM_TACPLUS_AUTORECONF_OPTS = -I m4
+LIBPAM_TACPLUS_LICENSE = GPLv2+
+LIBPAM_TACPLUS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
