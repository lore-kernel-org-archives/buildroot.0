From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2020 17:47:15 +0100
Subject: [Buildroot] [git commit] package/linux-pam: replace second patch by
 upstream patch
Message-ID: <20200127163929.8E93783C76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c1e1a3c7c2007aeedc16958c111d437860fe549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tionally-compile-per-ruserok-availability.patch | 49 --------------
 ...ither-ruserok-nor-ruserok_af-is-available.patch | 77 ++++++++++++++++++++++
 2 files changed, 77 insertions(+), 49 deletions(-)

diff --git a/package/linux-pam/0002-Conditionally-compile-per-ruserok-availability.patch b/package/linux-pam/0002-Conditionally-compile-per-ruserok-availability.patch
deleted file mode 100644
index cec642d845..0000000000
--- a/package/linux-pam/0002-Conditionally-compile-per-ruserok-availability.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-ruserok is not available/functional in uclibc, provide conditions
-for compilation where needed.
-
-Patch originally by Dmitry Golubovsky <golubovsky@gmail.com> -
-porting to linux-pam 1.2.1.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-
-Upstream-status: pending
-
----
- configure.ac                    | 2 +-
- modules/pam_rhosts/pam_rhosts.c | 6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 08e4530..fd2fd23 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -542,7 +542,7 @@ AC_CHECK_FUNCS(fseeko getdomainname gethostname gettimeofday lckpwdf mkdir selec
- AC_CHECK_FUNCS(strcspn strdup strspn strstr strtol uname)
- AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r)
- AC_CHECK_FUNCS(getgrouplist getline getdelim)
--AC_CHECK_FUNCS(inet_ntop inet_pton innetgr ruserok_af)
-+AC_CHECK_FUNCS(inet_ntop inet_pton innetgr ruserok_af ruserok)
- 
- AC_CHECK_FUNCS(unshare, [UNSHARE=yes], [UNSHARE=no])
- AM_CONDITIONAL([HAVE_UNSHARE], [test "$UNSHARE" = yes])
-diff --git a/modules/pam_rhosts/pam_rhosts.c b/modules/pam_rhosts/pam_rhosts.c
-index bc9e76f..909db29 100644
---- a/modules/pam_rhosts/pam_rhosts.c
-+++ b/modules/pam_rhosts/pam_rhosts.c
-@@ -114,8 +114,12 @@ int pam_sm_authenticate (pam_handle_t *pamh, int flags, int argc,
- #ifdef HAVE_RUSEROK_AF
-     retval = ruserok_af (rhost, as_root, ruser, luser, PF_UNSPEC);
- #else
-+  #ifdef HAVE_RUSEROK
-     retval = ruserok (rhost, as_root, ruser, luser);
--#endif
-+  #else
-+    retval = -1;
-+  #endif  /* HAVE_RUSEROK */
-+#endif  /*HAVE_RUSEROK_AF */
-     if (retval != 0) {
-       if (!opt_silent || opt_debug)
- 	pam_syslog(pamh, LOG_WARNING, "denied access to %s@%s as %s",
--- 
-2.4.3
-
diff --git a/package/linux-pam/0002-build-ignore-pam_rhosts-if-neither-ruserok-nor-ruserok_af-is-available.patch b/package/linux-pam/0002-build-ignore-pam_rhosts-if-neither-ruserok-nor-ruserok_af-is-available.patch
new file mode 100644
index 0000000000..8e9710c799
--- /dev/null
+++ b/package/linux-pam/0002-build-ignore-pam_rhosts-if-neither-ruserok-nor-ruserok_af-is-available.patch
@@ -0,0 +1,77 @@
+From 1d1d3b59af50c40efcc74f9c3f37b446a921e83e Mon Sep 17 00:00:00 2001
+From: Yousong Zhou <yszhou4tech@gmail.com>
+Date: Wed, 17 Jun 2015 18:19:23 +0800
+Subject: [PATCH] build: ignore pam_rhosts if neither ruserok nor ruserok_af is
+ available.
+
+* configure.ac: check for ruserok and ruserok_af
+* modules/Makefile.am: ignore pam_rhosts/ if it's disabled
+* modules/pam_rhosts/pam_rhosts.c: include stdlib.h for malloc and free
+
+Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/1d1d3b59af50c40efcc74f9c3f37b446a921e83e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac                    |  5 ++++-
+ modules/Makefile.am             | 11 ++++++++---
+ modules/pam_rhosts/pam_rhosts.c |  1 +
+ 3 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3012ceb5..69748614 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -532,7 +532,10 @@ AC_CHECK_FUNCS(fseeko getdomainname gethostname gettimeofday lckpwdf mkdir selec
+ AC_CHECK_FUNCS(strcspn strdup strspn strstr strtol uname)
+ AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r)
+ AC_CHECK_FUNCS(getgrouplist getline getdelim)
+-AC_CHECK_FUNCS(inet_ntop inet_pton innetgr ruserok_af)
++AC_CHECK_FUNCS(inet_ntop inet_pton innetgr)
++AC_CHECK_FUNCS([ruserok_af ruserok], [break])
++
++AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes -o "$ac_cv_func_ruserok" = yes])
+ 
+ AC_CHECK_FUNCS(unshare, [UNSHARE=yes], [UNSHARE=no])
+ AM_CONDITIONAL([HAVE_UNSHARE], [test "$UNSHARE" = yes])
+diff --git a/modules/Makefile.am b/modules/Makefile.am
+index 0c80cea9..9ad26a9b 100644
+--- a/modules/Makefile.am
++++ b/modules/Makefile.am
+@@ -2,16 +2,21 @@
+ # Copyright (c) 2005, 2006, 2008 Thorsten Kukuk <kukuk@thkukuk.de>
+ #
+ 
+-SUBDIRS = pam_access pam_cracklib pam_debug pam_deny pam_echo \
++if COND_BUILD_PAM_RHOSTS
++	MAYBE_PAM_RHOSTS = pam_rhosts
++endif
++
++SUBDIRS := pam_access pam_cracklib pam_debug pam_deny pam_echo \
+ 	pam_env pam_exec pam_faildelay pam_filter pam_ftp \
+ 	pam_group pam_issue pam_keyinit pam_lastlog pam_limits \
+ 	pam_listfile pam_localuser pam_loginuid pam_mail \
+ 	pam_mkhomedir pam_motd pam_namespace pam_nologin \
+-	pam_permit pam_pwhistory pam_rhosts pam_rootok pam_securetty \
++	pam_permit pam_pwhistory pam_rootok pam_securetty \
+ 	pam_selinux pam_sepermit pam_shells pam_stress \
+ 	pam_succeed_if pam_tally pam_tally2 pam_time pam_timestamp \
+ 	pam_tty_audit pam_umask \
+-	pam_unix pam_userdb pam_warn pam_wheel pam_xauth
++	pam_unix pam_userdb pam_warn pam_wheel pam_xauth \
++	$(MAYBE_PAM_RHOSTS)
+ 
+ CLEANFILES = *~
+ 
+diff --git a/modules/pam_rhosts/pam_rhosts.c b/modules/pam_rhosts/pam_rhosts.c
+index ed98d630..60c9e854 100644
+--- a/modules/pam_rhosts/pam_rhosts.c
++++ b/modules/pam_rhosts/pam_rhosts.c
+@@ -35,6 +35,7 @@
+ #include <pwd.h>
+ #include <netdb.h>
+ #include <string.h>
++#include <stdlib.h>
+ #include <syslog.h>
+ 
+ #define PAM_SM_AUTH  /* only defines this management group */
