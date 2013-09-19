From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:15:30 +0200
Subject: [Buildroot] [git commit] linux-pam: bump to version 1.1.7
Message-ID: <20130919193857.B1D419B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17e761efc450328fb1a7be52b73613d998cb68f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix build breakage with newer automake versions (mkdir_p
deprecation).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...onfigure.patch => linux-pam-01-configure.patch} |    0
 ...am.patch => linux-pam-02-doc-makefile-am.patch} |    0
 ...ux-pam-group.patch => linux-pam-03-group.patch} |    0
 package/linux-pam/linux-pam-04-mkdir.patch         |   17 +++++++++
 ...am-succeed.patch => linux-pam-05-succeed.patch} |    0
 ...inux-pam-time.patch => linux-pam-06-time.patch} |    0
 ...-pam-rhosts.patch => linux-pam-07-rhosts.patch} |    0
 ...pam_unix-fix-build-in-enable-selinux-mode.patch |   37 --------------------
 package/linux-pam/linux-pam.mk                     |    2 +-
 9 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/package/linux-pam/linux-pam-configure.patch b/package/linux-pam/linux-pam-01-configure.patch
similarity index 100%
rename from package/linux-pam/linux-pam-configure.patch
rename to package/linux-pam/linux-pam-01-configure.patch
diff --git a/package/linux-pam/linux-pam-doc-makefile-am.patch b/package/linux-pam/linux-pam-02-doc-makefile-am.patch
similarity index 100%
rename from package/linux-pam/linux-pam-doc-makefile-am.patch
rename to package/linux-pam/linux-pam-02-doc-makefile-am.patch
diff --git a/package/linux-pam/linux-pam-group.patch b/package/linux-pam/linux-pam-03-group.patch
similarity index 100%
rename from package/linux-pam/linux-pam-group.patch
rename to package/linux-pam/linux-pam-03-group.patch
diff --git a/package/linux-pam/linux-pam-04-mkdir.patch b/package/linux-pam/linux-pam-04-mkdir.patch
new file mode 100644
index 0000000..00056da
--- /dev/null
+++ b/package/linux-pam/linux-pam-04-mkdir.patch
@@ -0,0 +1,17 @@
+$(mkdir_p) is obsolete for newer automake, use $(MKDIR_P) instead.
+Upstream should really gettextize with a newer version before packing up.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura Linux-PAM-1.1.7.orig/po/Makefile.in.in Linux-PAM-1.1.7/po/Makefile.in.in
+--- Linux-PAM-1.1.7.orig/po/Makefile.in.in	2013-09-11 20:45:16.610770002 -0300
++++ Linux-PAM-1.1.7/po/Makefile.in.in	2013-09-11 20:45:28.030145316 -0300
+@@ -31,7 +31,7 @@
+ INSTALL = @INSTALL@
+ INSTALL_DATA = @INSTALL_DATA@
+ mkinstalldirs = $(SHELL) @install_sh@ -d
+-mkdir_p = @mkdir_p@
++mkdir_p = @MKDIR_P@
+ 
+ GMSGFMT_ = @GMSGFMT@
+ GMSGFMT_no = @GMSGFMT@
diff --git a/package/linux-pam/linux-pam-succeed.patch b/package/linux-pam/linux-pam-05-succeed.patch
similarity index 100%
rename from package/linux-pam/linux-pam-succeed.patch
rename to package/linux-pam/linux-pam-05-succeed.patch
diff --git a/package/linux-pam/linux-pam-time.patch b/package/linux-pam/linux-pam-06-time.patch
similarity index 100%
rename from package/linux-pam/linux-pam-time.patch
rename to package/linux-pam/linux-pam-06-time.patch
diff --git a/package/linux-pam/linux-pam-rhosts.patch b/package/linux-pam/linux-pam-07-rhosts.patch
similarity index 100%
rename from package/linux-pam/linux-pam-rhosts.patch
rename to package/linux-pam/linux-pam-07-rhosts.patch
diff --git a/package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch b/package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch
deleted file mode 100644
index 550e02e..0000000
--- a/package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Wed, 10 Oct 2012 18:13:07 +0000
-Subject: [PATCH] pam_unix: fix build in --enable-selinux mode
-
-glibc's <sys/wait.h> starting with commit
-http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=glibc-2.15-231-gd94a467
-does not include <sys/resource.h> for POSIX 2008 conformance reasons, so
-when pam is being built with SELinux support enabled, pam_unix_passwd.c
-uses getrlimit(2) and therefore should include <sys/resource.h> without
-relying on other headers.
-
-* modules/pam_unix/pam_unix_passwd.c: Include <sys/resource.h>.
-
-Reported-by: Guido Trentalancia <guido@trentalancia.com>
-Reported-by: "Jory A. Pratt" <anarchy@gentoo.org>
-Reported-by: Diego Elio Petten?? <flameeyes@flameeyes.eu>
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-[This patch is in linux-pam 1.1.6]
----
- modules/pam_unix/pam_unix_passwd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/pam_unix/pam_unix_passwd.c b/modules/pam_unix/pam_unix_passwd.c
-index 9e1302d..94bc3ec 100644
---- a/modules/pam_unix/pam_unix_passwd.c
-+++ b/modules/pam_unix/pam_unix_passwd.c
-@@ -58,6 +58,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <sys/wait.h>
-+#include <sys/resource.h>
- 
- #include <security/_pam_macros.h>
- 
--- 
-1.8.2.1
-
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 4472cd4..6d57593 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 # 
 ################################################################################
 
-LINUX_PAM_VERSION = 1.1.6
+LINUX_PAM_VERSION = 1.1.7
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library/
 LINUX_PAM_INSTALL_STAGING = YES
