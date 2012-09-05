From: Dmitry <golubovsky@gmail.com>
Date: Tue,  4 Sep 2012 23:16:28 -0400
Subject: [Buildroot] [PATCH 1/2] Provide PAM default configuration files
	when building linux-pam package
Message-ID: <1346814989-17138-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmitry <golubovsky@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-pam/default      |    8 ++++++++
 package/linux-pam/linux-pam.mk |    7 +++++++
 package/linux-pam/login        |    9 +++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/linux-pam/default
 create mode 100644 package/linux-pam/login

diff --git a/package/linux-pam/default b/package/linux-pam/default
new file mode 100644
index 0000000..0bd5ba0
--- /dev/null
+++ b/package/linux-pam/default
@@ -0,0 +1,8 @@
+#
+# default; standard UN*X access
+#
+auth     required       pam_unix.so
+account  required       pam_unix.so
+password required       pam_unix.so
+session  required       pam_unix.so
+
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 48cb073..2807bc1 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -24,4 +24,11 @@ ifeq ($(BR2_PACKAGE_LIBINTL),y)
 	LINUX_PAM_MAKE_OPT += LIBS=-lintl
 endif
 
+define LINUX_PAM_CONFFILES
+	$(INSTALL) -D -m 0644 package/linux-pam/default $(TARGET_DIR)/etc/pam.d/default
+	$(INSTALL) -D -m 0644 package/linux-pam/login $(TARGET_DIR)/etc/pam.d/login
+endef
+
+LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFFILES
+
 $(eval $(autotools-package))
diff --git a/package/linux-pam/login b/package/linux-pam/login
new file mode 100644
index 0000000..d65a9d4
--- /dev/null
+++ b/package/linux-pam/login
@@ -0,0 +1,9 @@
+#
+# login: allow local logins to users with entries in /etc/passwd and
+# /etc/shadow even with null password
+#
+auth      required       pam_unix.so nullok
+account   required       pam_unix.so nullok
+password  required       pam_unix.so nullok
+session   required       pam_unix.so nullok
+
-- 
1.7.2.5
