From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 11:52:54 +0200
Subject: [Buildroot] [git commit] linux-pam: bump to version 1.1.6
Message-ID: <20130905134646.B1C778B917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10e10bbf54825b444b95a1a6f45435e32c994180
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...iables-are-no-longer-defined-unless-you-e.patch |   28 --------------------
 package/linux-pam/linux-pam-configure.patch        |    9 +++---
 package/linux-pam/linux-pam-doc-makefile-am.patch  |   10 +++----
 package/linux-pam/linux-pam.mk                     |    6 ++--
 4 files changed, 11 insertions(+), 42 deletions(-)

diff --git a/package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch b/package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch
deleted file mode 100644
index a73ada6..0000000
--- a/package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Date: Mon, 9 Jul 2012 09:43:11 +0200
-Subject: [PATCH] RLIMIT_* variables are no longer defined unless you
- explicitly include sys/resource.h.
-
-Signed-off-by: Diego Elio Petten?? <flameeyes@flameeyes.eu>
-
-modules/pam_unix/pam_unix_acct.c: Include sys/resource.h.
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-[This patch is in linux-pam 1.1.6]
----
- modules/pam_unix/pam_unix_acct.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/pam_unix/pam_unix_acct.c b/modules/pam_unix/pam_unix_acct.c
-index 8e90cc9..4a362f8 100644
---- a/modules/pam_unix/pam_unix_acct.c
-+++ b/modules/pam_unix/pam_unix_acct.c
-@@ -41,6 +41,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
-+#include <sys/resource.h>
- #include <syslog.h>
- #include <pwd.h>
- #include <shadow.h>
--- 
-1.8.2.1
-
diff --git a/package/linux-pam/linux-pam-configure.patch b/package/linux-pam/linux-pam-configure.patch
index 0b2326b..d39261f 100644
--- a/package/linux-pam/linux-pam-configure.patch
+++ b/package/linux-pam/linux-pam-configure.patch
@@ -5,11 +5,10 @@ where needed.
 
 Signed-off-by: Dmitry Golubovsky <golubovsky@gmail.com>
 
-Index: linux-pam-1.1.4/configure.in
-============================================================================
---- linux-pam-1.1.4/configure.in	2011-06-24 06:46:33.000000000 -0400
-+++ linux-pam-1.1.4/configure.in	2012-08-09 21:14:11.000000000 -0400
-@@ -522,7 +522,7 @@
+diff -urN a/configure.in b/configure.in
+--- a/configure.in	2012-08-17 03:48:24.000000000 -0500
++++ b/configure.in	2013-07-17 09:49:23.760254684 -0500
+@@ -526,7 +526,7 @@
  AC_CHECK_FUNCS(strcspn strdup strspn strstr strtol uname)
  AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r)
  AC_CHECK_FUNCS(getgrouplist getline getdelim)
diff --git a/package/linux-pam/linux-pam-doc-makefile-am.patch b/package/linux-pam/linux-pam-doc-makefile-am.patch
index f08d349..8fa2dda 100644
--- a/package/linux-pam/linux-pam-doc-makefile-am.patch
+++ b/package/linux-pam/linux-pam-doc-makefile-am.patch
@@ -4,10 +4,9 @@ Generation of documentation is not necessary in Buildroot, disable it completely
 
 Signed-off-by: Dmitry Golubovsky <golubovsky@gmail.com>
 
-Index: linux-pam-1.1.4/doc/Makefile.am
-============================================================================
---- linux-pam-1.1.4/doc/Makefile.am	2011-06-21 05:04:56.000000000 -0400
-+++ linux-pam-1.1.4/doc/Makefile.am	2012-08-09 05:59:23.000000000 -0400
+diff -urN a/doc/Makefile.am b/doc/Makefile.am
+--- a/doc/Makefile.am	2012-08-15 06:08:43.000000000 -0500
++++ b/doc/Makefile.am	2013-07-17 09:54:53.000000000 -0500
 @@ -2,8 +2,6 @@
  # Copyright (c) 2005, 2006 Thorsten Kukuk <kukuk@suse.de>
  #
@@ -17,7 +16,7 @@ Index: linux-pam-1.1.4/doc/Makefile.am
  CLEANFILES = *~
  
  dist_html_DATA = index.html
-@@ -11,12 +9,4 @@
+@@ -11,11 +9,4 @@
  #######################################################
  
  releasedocs: all
@@ -29,5 +28,4 @@ Index: linux-pam-1.1.4/doc/Makefile.am
 -	make -C sag releasedocs
 -	make -C adg releasedocs
 -	make -C mwg releasedocs
--	
 +	/bin/true
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index aa9fa36..4472cd4 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 # 
 ################################################################################
 
-LINUX_PAM_VERSION = 1.1.4
+LINUX_PAM_VERSION = 1.1.6
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library/
 LINUX_PAM_INSTALL_STAGING = YES
@@ -16,13 +16,13 @@ LINUX_PAM_CONF_OPT = \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
-	flex host-flex
+LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+	LINUX_PAM_DEPENDENCIES += gettext
 	LINUX_PAM_MAKE_OPT += LIBS=-lintl
 endif
 
