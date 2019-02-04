From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  4 Feb 2019 08:33:55 -0600
Subject: [Buildroot] [PATCH v5] package/pamtester: new package
Message-ID: <1549290835-14995-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.com.br>

Utility for testing pluggable authentication modules (PAM) facility.

While specifically designed to help PAM module authors to test their
modules, that might also be handy for system administrators interested
in building a centralised authentication system using common standards
such as NIS, SASL and LDAP.

One patch was included from the Debian bugtracker which fixes a
spelling error.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v4 -> v5
 - fixed title of patch to be package/
 - Added signed-offs in Debian patch
 - Added license file hash
 - Spelling of pamtester in kconfig comment
 - DEVELOPERS entry needed fixup
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/pamtester/0001-fix-spelling-errors.patch | 21 +++++++++++++++++++++
 package/pamtester/Config.in                      | 15 +++++++++++++++
 package/pamtester/pamtester.hash                 |  3 +++
 package/pamtester/pamtester.mk                   | 13 +++++++++++++
 6 files changed, 54 insertions(+)
 create mode 100644 package/pamtester/0001-fix-spelling-errors.patch
 create mode 100644 package/pamtester/Config.in
 create mode 100644 package/pamtester/pamtester.hash
 create mode 100644 package/pamtester/pamtester.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3703b3f..893d2aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -426,6 +426,7 @@ F:	package/intel-microcode/
 F:	package/libpam-radius-auth/
 F:	package/libpam-tacplus/
 F:	package/modem-manager/
+F:	package/pamtester/
 F:	package/pcm-tools/
 F:	package/perl-file-util/
 F:	package/skeleton-custom/
diff --git a/package/Config.in b/package/Config.in
index 9082ed9..bca61f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2163,6 +2163,7 @@ menu "System tools"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
 	source "package/openvmtools/Config.in"
+	source "package/pamtester/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/pamtester/0001-fix-spelling-errors.patch b/package/pamtester/0001-fix-spelling-errors.patch
new file mode 100644
index 0000000..05e737c
--- /dev/null
+++ b/package/pamtester/0001-fix-spelling-errors.patch
@@ -0,0 +1,21 @@
+Description: Fix spelling error in pamtester
+Origin: vendor
+Bug: https://sourceforge.net/tracker/?func=detail&aid=3599109&group_id=135111&atid=731890
+Forwarded: yes
+Author: Salvatore Bonaccorso <carnil@debian.org>
+Last-Update: 2013-01-01
+Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
index 0000000..19b76d3
--- /dev/null
+++ b/package/pamtester/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PAMTESTER
+	bool "pamtester"
+	depends on BR2_PACKAGE_LINUX_PAM
+	help
+	  A tiny utility for testing pluggable authentication modules
+	  (PAM) facility. While specifically designed to help PAM module
+	  authors to test their modules, that might also be handy for
+	  system administrators interested in building a centralised
+	  authentication system using common standards such as NIS, SASL
+	  and LDAP.
+
+	  http://pamtester.sourceforge.net/
+
+comment "pamtester depends on linux-pam"
+	depends on !BR2_PACKAGE_LINUX_PAM
diff --git a/package/pamtester/pamtester.hash b/package/pamtester/pamtester.hash
new file mode 100644
index 0000000..17497e3
--- /dev/null
+++ b/package/pamtester/pamtester.hash
@@ -0,0 +1,3 @@
+# from https://sourceforge.net/projects/pamtester/files/pamtester/0.1.2/
+sha1   33bcc610d7f208b50a0a23c144bdbd1e2cae4ac6  pamtester-0.1.2.tar.gz
+sha256 1e3922a8ab0907c1f3bcc3e00005ef88930e50d0890f40a6a39f5f83b05f05cc LICENSE
diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
new file mode 100644
index 0000000..b09e4d1
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
1.9.1
