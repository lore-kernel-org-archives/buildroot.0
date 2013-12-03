From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2013 09:05:10 +0100
Subject: [Buildroot] [git commit] util-linux: install PAM configuration files
Message-ID: <20131203081319.B187E9BEEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33e3245e047858cd89223cf5b4afbf4cb32318b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install PAM configuration files for su (with "su -" variant) and login
when the tools are enabled.
This finally fixes bug #5366 and now we can login with an util-linux
/bin/login.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/login.pam     |   11 +++++++++++
 package/util-linux/su.pam        |   13 +++++++++++++
 package/util-linux/util-linux.mk |   14 ++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/login.pam b/package/util-linux/login.pam
new file mode 100644
index 0000000..1d9cd70
--- /dev/null
+++ b/package/util-linux/login.pam
@@ -0,0 +1,11 @@
+auth		required	pam_securetty.so
+auth		required	pam_unix.so nullok
+
+account		required	pam_unix.so
+
+password	required	pam_unix.so nullok
+
+session		required	pam_limits.so
+session		required	pam_env.so
+session		required	pam_unix.so
+session		optional	pam_lastlog.so
diff --git a/package/util-linux/su.pam b/package/util-linux/su.pam
new file mode 100644
index 0000000..f000c39
--- /dev/null
+++ b/package/util-linux/su.pam
@@ -0,0 +1,13 @@
+auth		sufficient	pam_rootok.so
+auth		required	pam_wheel.so use_uid
+auth		required	pam_env.so
+auth		required	pam_unix.so nullok
+
+account		required	pam_unix.so
+
+password	required	pam_unix.so nullok
+
+session		required	pam_limits.so
+session		required	pam_env.so
+session		required	pam_unix.so
+session		optional	pam_lastlog.so
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a694f3d..0925ab3 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -98,6 +98,20 @@ endef
 UTIL_LINUX_PRE_PATCH_HOOKS += UTIL_LINUX_DISABLE_TOOLS
 endif
 
+# Install PAM configuration files
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
+define UTIL_LINUX_INSTALL_PAMFILES
+	$(INSTALL) -m 0644 package/util-linux/login.pam \
+		$(TARGET_DIR)/etc/pam.d/login
+	$(INSTALL) -m 0644 package/util-linux/su.pam \
+		$(TARGET_DIR)/etc/pam.d/su
+	$(INSTALL) -m 0644 package/util-linux/su.pam \
+		$(TARGET_DIR)/etc/pam.d/su-l
+endef
+endif
+
+UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
