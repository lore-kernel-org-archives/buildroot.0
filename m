From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:19 -0500
Subject: [Buildroot] [PATCH 05/10] linux-pam: add support for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-6-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added patches to fix issues with linux-pam's audit support and to
correctly install pam_sepermit.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 ...t_log_acct_message_return_value_check_fix.patch |   16 ++++++++++++++++
 ...inux-pam-sepermit-install-path-correction.patch |   11 +++++++++++
 package/linux-pam/linux-pam.mk                     |   14 ++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/linux-pam/linux-pam-audit_log_acct_message_return_value_check_fix.patch
 create mode 100644 package/linux-pam/linux-pam-sepermit-install-path-correction.patch

diff --git a/package/linux-pam/linux-pam-audit_log_acct_message_return_value_check_fix.patch b/package/linux-pam/linux-pam-audit_log_acct_message_return_value_check_fix.patch
new file mode 100644
index 0000000..d819f08
--- /dev/null
+++ b/package/linux-pam/linux-pam-audit_log_acct_message_return_value_check_fix.patch
@@ -0,0 +1,16 @@
+--- a/libpam/pam_audit.c	2011-06-21 04:04:56.000000000 -0500
++++ b/libpam/pam_audit.c	2012-09-12 08:55:26.000000000 -0500
+@@ -41,11 +41,11 @@
+      an official errno number, but must not. It can also be a audit
+      internal error code. Which makes errno useless :-((. Try the
+      best to fix it. */
+-  errno = -rc;
++  errno = rc;
+ 
+   pamh->audit_state |= PAMAUDIT_LOGGED;
+ 
+-  if (rc < 0) {
++  if (rc <= 0) {
+       if (rc == -EPERM && getuid() != 0)
+           return 0;
+       if (errno != old_errno) {
diff --git a/package/linux-pam/linux-pam-sepermit-install-path-correction.patch b/package/linux-pam/linux-pam-sepermit-install-path-correction.patch
new file mode 100644
index 0000000..23b6ff8
--- /dev/null
+++ b/package/linux-pam/linux-pam-sepermit-install-path-correction.patch
@@ -0,0 +1,11 @@
+--- a/modules/pam_sepermit/Makefile.am	2012-08-15 06:08:43.000000000 -0500
++++ b/modules/pam_sepermit/Makefile.am	2013-08-22 15:53:22.792515096 -0500
+@@ -35,7 +35,7 @@
+   securelib_LTLIBRARIES = pam_sepermit.la
+ 
+ install-data-local:
+-	mkdir -p $(sepermitlockdir)
++	mkdir -p $(DESTDIR)/$(sepermitlockdir)
+ endif
+ if ENABLE_REGENERATE_MAN
+ noinst_DATA = README pam_sepermit.8 sepermit.conf.5
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 4472cd4..022031b 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -26,4 +26,18 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 	LINUX_PAM_MAKE_OPT += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+	PAM_CONF_OPT += --enable-selinux
+	PAM_DEPENDENCIES += libselinux
+else
+	PAM_CONF_OPT += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+	PAM_DEPENDENCIES += audit
+	PAM_CONF_OPT += --enable-audit
+else
+	PAM_CONF_OPT += --disable-audit
+endif
+
 $(eval $(autotools-package))
-- 
1.7.1
