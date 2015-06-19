From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 19 Jun 2015 13:19:12 -0400
Subject: [Buildroot] [PATCH 1/1] sudo: enable pam support
Message-ID: <1434734352-6500-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure the sudo utility to support PAM if the framework is enabled.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/sudo/sudo.mk  | 13 ++++++++++++-
 package/sudo/sudo.pam | 12 ++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 package/sudo/sudo.pam

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a1a8328..9fa1cd6 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -16,9 +16,20 @@ SUDO_CONF_OPTS = \
 	--without-umask \
 	--with-logging=syslog \
 	--without-interfaces \
-	--without-pam \
 	--with-env-editor
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define SUDO_INSTALL_PAM_CONF
+	$(INSTALL) -m 0644 package/sudo/sudo.pam $(TARGET_DIR)/etc/pam.d/sudo
+endef
+
+SUDO_DEPENDENCIES += linux-pam
+SUDO_CONF_OPTS += --with-pam
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_INSTALL_PAM_CONF
+else
+SUDO_CONF_OPTS += --without-pam
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
diff --git a/package/sudo/sudo.pam b/package/sudo/sudo.pam
new file mode 100644
index 0000000..c6e6f20
--- /dev/null
+++ b/package/sudo/sudo.pam
@@ -0,0 +1,12 @@
+auth        sufficient   pam_rootok.so
+auth        required     pam_wheel.so use_uid
+auth        required     pam_env.so
+auth        required     pam_unix.so nullok
+
+account     required     pam_unix.so
+
+password    required     pam_unix.so nullok
+
+session     required     pam_limits.so
+session     required     pam_env.so
+session     required     pam_unix.so
-- 
1.9.5.msysgit.1
