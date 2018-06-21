From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 21 Jun 2018 13:33:43 -0300
Subject: [Buildroot] [PATCH 1/2] pamtester: new package
In-Reply-To: <20180621163344.24552-1-casantos@datacom.com.br>
References: <20180621163344.24552-1-casantos@datacom.com.br>
Message-ID: <20180621163344.24552-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Utility for testing pluggable authentication modules (PAM) facility.

While specifically designed to help PAM module authors to test their
modules, that might also be handy for system administrators interested
in building a centralised authentication system using common standards
such as NIS, SASL and LDAP.

Pull a patch from Debian, rename it and add an SOB to match Buildroot
conventions.

Put it along with the PAM modules libpam-{radius-auth,tacplus} in the
configuration menu, since alphabetical order is already slightly broken
and grouping the packages makes sense.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/Config.in                                |  1 +
 package/pamtester/0001-fix-spelling-errors.patch | 19 +++++++++++++++++++
 package/pamtester/Config.in                      | 11 +++++++++++
 package/pamtester/pamtester.hash                 |  2 ++
 package/pamtester/pamtester.mk                   | 13 +++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/pamtester/0001-fix-spelling-errors.patch
 create mode 100644 package/pamtester/Config.in
 create mode 100644 package/pamtester/pamtester.hash
 create mode 100644 package/pamtester/pamtester.mk

diff --git a/package/Config.in b/package/Config.in
index a5ecfecbf9..36e1c2a412 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1568,6 +1568,7 @@ menu "Other"
 	source "package/linux-pam/Config.in"
 	source "package/llvm/Config.in"
 if BR2_PACKAGE_LINUX_PAM
+	source "package/pamtester/Config.in"
 comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
diff --git a/package/pamtester/0001-fix-spelling-errors.patch b/package/pamtester/0001-fix-spelling-errors.patch
new file mode 100644
index 0000000000..5f79754e34
--- /dev/null
+++ b/package/pamtester/0001-fix-spelling-errors.patch
@@ -0,0 +1,19 @@
+Description: Fix spelling error in pamtester
+Origin: vendor
+Bug: https://sourceforge.net/tracker/?func=detail&aid=3599109&group_id=135111&atid=731890
+Forwarded: yes
+Author: Salvatore Bonaccorso <carnil@debian.org>
+Last-Update: 2013-01-01
+Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
+
+--- a/src/app.c
++++ b/src/app.c
+@@ -373,7 +373,7 @@
+ 				err_msg = xstrdup(pam_strerror(pamh, err));
+ 				goto out;
+ 			} else {
+-				printf("%s: sucessfully opened a session\n", params->app_name);
++				printf("%s: successfully opened a session\n", params->app_name);
+ 			}
+ 		} else if (!strcasecmp(op->name, "close_session")) {
+ 			int flag = 0;
diff --git a/package/pamtester/Config.in b/package/pamtester/Config.in
new file mode 100644
index 0000000000..0be55ca739
--- /dev/null
+++ b/package/pamtester/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PAMTESTER
+	bool "pamtester"
+	help
+	  A tiny utility for testing pluggable authentication modules
+	  (PAM) facility. While specifically designed to help PAM module
+	  authors to test their modules, that might also be handy for
+	  system administrators interested in building a centralised
+	  authentication system using common standards such as NIS, SASL
+	  and LDAP.
+
+	  http://pamtester.sourceforge.net/
diff --git a/package/pamtester/pamtester.hash b/package/pamtester/pamtester.hash
new file mode 100644
index 0000000000..6ce187f19f
--- /dev/null
+++ b/package/pamtester/pamtester.hash
@@ -0,0 +1,2 @@
+# from https://sourceforge.net/projects/pamtester/files/pamtester/0.1.2/
+sha1 33bcc610d7f208b50a0a23c144bdbd1e2cae4ac6  pamtester-0.1.2.tar.gz
diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
new file mode 100644
index 0000000000..b09e4d1cc0
--- /dev/null
+++ b/package/pamtester/pamtester.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# pamtester
+#
+################################################################################
+
+PAMTESTER_VERSION = 0.1.2
+PAMTESTER_SITE = https://download.sourceforge.net/project/pamtester/pamtester/$(PAMTESTER_VERSION)
+PAMTESTER_DEPENDENCIES = linux-pam
+PAMTESTER_LICENSE = BSD-3-Clause
+PAMTESTER_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
2.14.4
