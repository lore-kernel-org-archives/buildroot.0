From: Dmitry <golubovsky@gmail.com>
Date: Tue, 14 Aug 2012 23:33:23 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
	when building linux-pam package
In-Reply-To: <1345001603-16774-1-git-send-email-golubovsky@gmail.com>
References: <1345001603-16774-1-git-send-email-golubovsky@gmail.com>
Message-ID: <1345001603-16774-2-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/linux-pam/default      |    8 ++++++++
 package/linux-pam/linux-pam.mk |    8 ++++++++
 package/linux-pam/login        |    9 +++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
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
index 48cb073..99161c6 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -24,4 +24,12 @@ ifeq ($(BR2_PACKAGE_LIBINTL),y)
 	LINUX_PAM_MAKE_OPT += LIBS=-lintl
 endif
 
+define LINUX_PAM_CONFFILES
+	mkdir -p $(TARGET_DIR)/etc/pam.d
+	cp $($(PKG)_DIR_PREFIX)/$(RAWNAME)/default $(TARGET_DIR)/etc/pam.d
+	cp $($(PKG)_DIR_PREFIX)/$(RAWNAME)/login $(TARGET_DIR)/etc/pam.d
+endef
+
+LINUX_PAM_POST_PATCH_HOOKS = LINUX_PAM_CONFFILES
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
