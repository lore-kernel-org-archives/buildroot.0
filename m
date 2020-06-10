From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 22:37:27 +0200
Subject: [Buildroot] [git commit] package/linux-pam: bump to version 1.4.0
Message-ID: <20200610203627.EC4518232C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1708169e9a361a11e27cb074b3c1f1b6e807f69a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch, not needed since
  https://github.com/linux-pam/linux-pam/commit/4dd9b97b762cc73816cb867d49c9d0d0b91d642c
- Drop other patches (already in version)
- Drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-pam/0001-doc-makefile-am.patch       |  34 ---
 ...ither-ruserok-nor-ruserok_af-is-available.patch |  77 ------
 .../0003-Replace-strndupa-with-strncpy.patch       |  75 -----
 ...pam_lastlog-when-logwtmp-is-not-available.patch |  60 ----
 ...ISO-C99-uintX_t-types-instead-of-u_intX_t.patch | 307 ---------------------
 package/linux-pam/linux-pam.hash                   |   4 +-
 package/linux-pam/linux-pam.mk                     |   3 +-
 7 files changed, 3 insertions(+), 557 deletions(-)

diff --git a/package/linux-pam/0001-doc-makefile-am.patch b/package/linux-pam/0001-doc-makefile-am.patch
deleted file mode 100644
index ac3ff2b223..0000000000
--- a/package/linux-pam/0001-doc-makefile-am.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Disable generation of documentation
-
-Generation of documentation is not necessary in Buildroot, disable it completely.
-
-Signed-off-by: Dmitry Golubovsky <golubovsky@gmail.com>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-
-Upstream-status: inappropriate
-
-diff -urN a/doc/Makefile.am b/doc/Makefile.am
---- a/doc/Makefile.am	2012-08-15 06:08:43.000000000 -0500
-+++ b/doc/Makefile.am	2013-07-17 09:54:53.000000000 -0500
-@@ -2,8 +2,6 @@
- # Copyright (c) 2005, 2006 Thorsten Kukuk <kukuk@suse.de>
- #
- 
--SUBDIRS = man specs sag adg mwg
--
- CLEANFILES = *~
- 
- dist_html_DATA = index.html
-@@ -11,11 +9,4 @@
- #######################################################
- 
- releasedocs: all
--	$(mkinstalldirs) $(top_builddir)/Linux-PAM-$(VERSION)/doc/specs
--	cp -av specs/draft-morgan-pam-current.txt \
--		$(top_builddir)/Linux-PAM-$(VERSION)/doc/specs/
--	cp -av $(srcdir)/specs/rfc86.0.txt \
--		$(top_builddir)/Linux-PAM-$(VERSION)/doc/specs/
--	make -C sag releasedocs
--	make -C adg releasedocs
--	make -C mwg releasedocs
-+	/bin/true
diff --git a/package/linux-pam/0002-build-ignore-pam_rhosts-if-neither-ruserok-nor-ruserok_af-is-available.patch b/package/linux-pam/0002-build-ignore-pam_rhosts-if-neither-ruserok-nor-ruserok_af-is-available.patch
deleted file mode 100644
index 8e9710c799..0000000000
--- a/package/linux-pam/0002-build-ignore-pam_rhosts-if-neither-ruserok-nor-ruserok_af-is-available.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 1d1d3b59af50c40efcc74f9c3f37b446a921e83e Mon Sep 17 00:00:00 2001
-From: Yousong Zhou <yszhou4tech@gmail.com>
-Date: Wed, 17 Jun 2015 18:19:23 +0800
-Subject: [PATCH] build: ignore pam_rhosts if neither ruserok nor ruserok_af is
- available.
-
-* configure.ac: check for ruserok and ruserok_af
-* modules/Makefile.am: ignore pam_rhosts/ if it's disabled
-* modules/pam_rhosts/pam_rhosts.c: include stdlib.h for malloc and free
-
-Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/1d1d3b59af50c40efcc74f9c3f37b446a921e83e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac                    |  5 ++++-
- modules/Makefile.am             | 11 ++++++++---
- modules/pam_rhosts/pam_rhosts.c |  1 +
- 3 files changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3012ceb5..69748614 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -532,7 +532,10 @@ AC_CHECK_FUNCS(fseeko getdomainname gethostname gettimeofday lckpwdf mkdir selec
- AC_CHECK_FUNCS(strcspn strdup strspn strstr strtol uname)
- AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r)
- AC_CHECK_FUNCS(getgrouplist getline getdelim)
--AC_CHECK_FUNCS(inet_ntop inet_pton innetgr ruserok_af)
-+AC_CHECK_FUNCS(inet_ntop inet_pton innetgr)
-+AC_CHECK_FUNCS([ruserok_af ruserok], [break])
-+
-+AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes -o "$ac_cv_func_ruserok" = yes])
- 
- AC_CHECK_FUNCS(unshare, [UNSHARE=yes], [UNSHARE=no])
- AM_CONDITIONAL([HAVE_UNSHARE], [test "$UNSHARE" = yes])
-diff --git a/modules/Makefile.am b/modules/Makefile.am
-index 0c80cea9..9ad26a9b 100644
---- a/modules/Makefile.am
-+++ b/modules/Makefile.am
-@@ -2,16 +2,21 @@
- # Copyright (c) 2005, 2006, 2008 Thorsten Kukuk <kukuk@thkukuk.de>
- #
- 
--SUBDIRS = pam_access pam_cracklib pam_debug pam_deny pam_echo \
-+if COND_BUILD_PAM_RHOSTS
-+	MAYBE_PAM_RHOSTS = pam_rhosts
-+endif
-+
-+SUBDIRS := pam_access pam_cracklib pam_debug pam_deny pam_echo \
- 	pam_env pam_exec pam_faildelay pam_filter pam_ftp \
- 	pam_group pam_issue pam_keyinit pam_lastlog pam_limits \
- 	pam_listfile pam_localuser pam_loginuid pam_mail \
- 	pam_mkhomedir pam_motd pam_namespace pam_nologin \
--	pam_permit pam_pwhistory pam_rhosts pam_rootok pam_securetty \
-+	pam_permit pam_pwhistory pam_rootok pam_securetty \
- 	pam_selinux pam_sepermit pam_shells pam_stress \
- 	pam_succeed_if pam_tally pam_tally2 pam_time pam_timestamp \
- 	pam_tty_audit pam_umask \
--	pam_unix pam_userdb pam_warn pam_wheel pam_xauth
-+	pam_unix pam_userdb pam_warn pam_wheel pam_xauth \
-+	$(MAYBE_PAM_RHOSTS)
- 
- CLEANFILES = *~
- 
-diff --git a/modules/pam_rhosts/pam_rhosts.c b/modules/pam_rhosts/pam_rhosts.c
-index ed98d630..60c9e854 100644
---- a/modules/pam_rhosts/pam_rhosts.c
-+++ b/modules/pam_rhosts/pam_rhosts.c
-@@ -35,6 +35,7 @@
- #include <pwd.h>
- #include <netdb.h>
- #include <string.h>
-+#include <stdlib.h>
- #include <syslog.h>
- 
- #define PAM_SM_AUTH  /* only defines this management group */
diff --git a/package/linux-pam/0003-Replace-strndupa-with-strncpy.patch b/package/linux-pam/0003-Replace-strndupa-with-strncpy.patch
deleted file mode 100644
index 9793f8caf1..0000000000
--- a/package/linux-pam/0003-Replace-strndupa-with-strncpy.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 91d4678388b2a7d768ee2ec8cc569e11fc223ffd Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Sun, 15 Jul 2018 20:43:44 -0700
-Subject: [PATCH] Replace strndupa with strncpy
-
-glibc only. A static string is better.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/91d4678388b2a7d768ee2ec8cc569e11fc223ffd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/pam_exec/pam_exec.c | 31 +++++++++++--------------------
- 1 file changed, 11 insertions(+), 20 deletions(-)
-
-diff --git a/modules/pam_exec/pam_exec.c b/modules/pam_exec/pam_exec.c
-index 52dc6818..6cad16e4 100644
---- a/modules/pam_exec/pam_exec.c
-+++ b/modules/pam_exec/pam_exec.c
-@@ -102,7 +102,7 @@ call_exec (const char *pam_type, pam_handle_t *pamh,
-   int use_stdout = 0;
-   int optargc;
-   const char *logfile = NULL;
--  const char *authtok = NULL;
-+  char authtok[PAM_MAX_RESP_SIZE] = {};
-   pid_t pid;
-   int fds[2];
-   int stdout_fds[2];
-@@ -180,12 +180,12 @@ call_exec (const char *pam_type, pam_handle_t *pamh,
- 	      if (resp)
- 		{
- 		  pam_set_item (pamh, PAM_AUTHTOK, resp);
--		  authtok = strndupa (resp, PAM_MAX_RESP_SIZE);
-+		  strncpy (authtok, resp, sizeof(authtok) - 1);
- 		  _pam_drop (resp);
- 		}
- 	    }
- 	  else
--	    authtok = strndupa (void_pass, PAM_MAX_RESP_SIZE);
-+	    strncpy (authtok, void_pass, sizeof(authtok) - 1);
- 
- 	  if (pipe(fds) != 0)
- 	    {
-@@ -225,23 +225,14 @@ call_exec (const char *pam_type, pam_handle_t *pamh,
- 
-       if (expose_authtok) /* send the password to the child */
- 	{
--	  if (authtok != NULL)
--	    {            /* send the password to the child */
--	      if (debug)
--		pam_syslog (pamh, LOG_DEBUG, "send password to child");
--	      if (write(fds[1], authtok, strlen(authtok)+1) == -1)
--		pam_syslog (pamh, LOG_ERR,
--			    "sending password to child failed: %m");
--	      authtok = NULL;
--	    }
--	  else
--	    {
--	      if (write(fds[1], "", 1) == -1)   /* blank password */
--		pam_syslog (pamh, LOG_ERR,
--			    "sending password to child failed: %m");
--	    }
--        close(fds[0]);       /* close here to avoid possible SIGPIPE above */
--        close(fds[1]);
-+	  if (debug)
-+	    pam_syslog (pamh, LOG_DEBUG, "send password to child");
-+	  if (write(fds[1], authtok, strlen(authtok)) == -1)
-+	    pam_syslog (pamh, LOG_ERR,
-+			      "sending password to child failed: %m");
-+
-+          close(fds[0]);       /* close here to avoid possible SIGPIPE above */
-+          close(fds[1]);
- 	}
- 
-       if (use_stdout)
diff --git a/package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch b/package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch
deleted file mode 100644
index 8ff0ac155a..0000000000
--- a/package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 73bf6d25ddb7a2cb73bceda3d880174b1d1e4a26 Mon Sep 17 00:00:00 2001
-From: Yousong Zhou <yszhou4tech@gmail.com>
-Date: Wed, 17 Jun 2015 21:18:05 +0800
-Subject: [PATCH] build: ignore pam_lastlog when logwtmp is not available.
-
-* configure.ac: check logwtmp and set COND_BUILD_PAM_LASTLOG
-* modules/pam_lastlog/Makefile.am: check COND_BUILD_PAM_LASTLOG
-
-Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/73bf6d25ddb7a2cb73bceda3d880174b1d1e4a26]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac        | 2 ++
- modules/Makefile.am | 8 ++++++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 69748614..4d1b1965 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -534,8 +534,10 @@ AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r
- AC_CHECK_FUNCS(getgrouplist getline getdelim)
- AC_CHECK_FUNCS(inet_ntop inet_pton innetgr)
- AC_CHECK_FUNCS([ruserok_af ruserok], [break])
-+AC_CHECK_FUNCS([logwtmp])
- 
- AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes -o "$ac_cv_func_ruserok" = yes])
-+AM_CONDITIONAL([COND_BUILD_PAM_LASTLOG], [test "$ac_cv_func_logwtmp" = yes])
- 
- AC_CHECK_FUNCS(unshare, [UNSHARE=yes], [UNSHARE=no])
- AM_CONDITIONAL([HAVE_UNSHARE], [test "$UNSHARE" = yes])
-diff --git a/modules/Makefile.am b/modules/Makefile.am
-index 9ad26a9b..b98dc5c8 100644
---- a/modules/Makefile.am
-+++ b/modules/Makefile.am
-@@ -6,9 +6,13 @@ if COND_BUILD_PAM_RHOSTS
- 	MAYBE_PAM_RHOSTS = pam_rhosts
- endif
- 
-+if COND_BUILD_PAM_LASTLOG
-+	MAYBE_PAM_LASTLOG = pam_lastlog
-+endif
-+
- SUBDIRS := pam_access pam_cracklib pam_debug pam_deny pam_echo \
- 	pam_env pam_exec pam_faildelay pam_filter pam_ftp \
--	pam_group pam_issue pam_keyinit pam_lastlog pam_limits \
-+	pam_group pam_issue pam_keyinit pam_limits \
- 	pam_listfile pam_localuser pam_loginuid pam_mail \
- 	pam_mkhomedir pam_motd pam_namespace pam_nologin \
- 	pam_permit pam_pwhistory pam_rootok pam_securetty \
-@@ -16,7 +20,7 @@ SUBDIRS := pam_access pam_cracklib pam_debug pam_deny pam_echo \
- 	pam_succeed_if pam_tally pam_tally2 pam_time pam_timestamp \
- 	pam_tty_audit pam_umask \
- 	pam_unix pam_userdb pam_warn pam_wheel pam_xauth \
--	$(MAYBE_PAM_RHOSTS)
-+	$(MAYBE_PAM_RHOSTS) $(MAYBE_PAM_LASTLOG)
- 
- CLEANFILES = *~
- 
diff --git a/package/linux-pam/0005-libpamc-Use-ISO-C99-uintX_t-types-instead-of-u_intX_t.patch b/package/linux-pam/0005-libpamc-Use-ISO-C99-uintX_t-types-instead-of-u_intX_t.patch
deleted file mode 100644
index 12a1f44910..0000000000
--- a/package/linux-pam/0005-libpamc-Use-ISO-C99-uintX_t-types-instead-of-u_intX_t.patch
+++ /dev/null
@@ -1,307 +0,0 @@
-From 5956cf525bfb53ed0c5cade3b58f18fde4f85c42 Mon Sep 17 00:00:00 2001
-From: TBK <tbk@jjtc.eu>
-Date: Wed, 26 Feb 2020 00:24:39 +0100
-Subject: [PATCH] libpamc: Use ISO C99 uintX_t types instead of u_intX_t
-
-u_intX_t is a glibcism this fixes the issue of compiling against musl libc.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/5956cf525bfb53ed0c5cade3b58f18fde4f85c42]
----
- libpamc/include/security/pam_client.h | 21 ++++++------
- libpamc/libpamc.h                     |  1 +
- libpamc/pamc_converse.c               |  8 ++---
- libpamc/test/regress/test.libpamc.c   |  3 +-
- modules/pam_timestamp/sha1.c          | 46 +++++++++++++--------------
- modules/pam_timestamp/sha1.h          |  5 +--
- 6 files changed, 44 insertions(+), 40 deletions(-)
-
-diff --git a/libpamc/include/security/pam_client.h b/libpamc/include/security/pam_client.h
-index 86672a2e..41f83da6 100644
---- a/libpamc/include/security/pam_client.h
-+++ b/libpamc/include/security/pam_client.h
-@@ -16,6 +16,7 @@ extern "C" {
- #include <unistd.h>
- #include <string.h>
- #include <stdio.h>
-+#include <stdint.h>
- #include <sys/types.h>
- 
- /* opaque agent handling structure */
-@@ -23,7 +24,7 @@ extern "C" {
- typedef struct pamc_handle_s *pamc_handle_t;
- 
- /* binary prompt structure pointer */
--typedef struct { u_int32_t length; u_int8_t control; } *pamc_bp_t;
-+typedef struct { uint32_t length; uint8_t control; } *pamc_bp_t;
- 
- /*
-  * functions provided by libpamc
-@@ -90,10 +91,10 @@ char **pamc_list_agents(pamc_handle_t pch);
- # define PAM_BP_FREE        free
- #endif /* PAM_BP_FREE */
- 
--#define __PAM_BP_WOCTET(x,y)  (*((y) + (u_int8_t *)(x)))
--#define __PAM_BP_ROCTET(x,y)  (*((y) + (const u_int8_t *)(x)))
-+#define __PAM_BP_WOCTET(x,y)  (*((y) + (uint8_t *)(x)))
-+#define __PAM_BP_ROCTET(x,y)  (*((y) + (const uint8_t *)(x)))
- 
--#define PAM_BP_MIN_SIZE       (sizeof(u_int32_t) + sizeof(u_int8_t))
-+#define PAM_BP_MIN_SIZE       (sizeof(uint32_t) + sizeof(uint8_t))
- #define PAM_BP_MAX_LENGTH     0x20000                   /* an advisory limit */
- #define PAM_BP_WCONTROL(x)    (__PAM_BP_WOCTET(x,4))
- #define PAM_BP_RCONTROL(x)    (__PAM_BP_ROCTET(x,4))
-@@ -102,8 +103,8 @@ char **pamc_list_agents(pamc_handle_t pch);
- 			       (__PAM_BP_ROCTET(x,2)<< 8)+      \
- 			       (__PAM_BP_ROCTET(x,3)    ))
- #define PAM_BP_LENGTH(x)      (PAM_BP_SIZE(x) - PAM_BP_MIN_SIZE)
--#define PAM_BP_WDATA(x)       (PAM_BP_MIN_SIZE + (u_int8_t *) (x))
--#define PAM_BP_RDATA(x)       (PAM_BP_MIN_SIZE + (const u_int8_t *) (x))
-+#define PAM_BP_WDATA(x)       (PAM_BP_MIN_SIZE + (uint8_t *) (x))
-+#define PAM_BP_RDATA(x)       (PAM_BP_MIN_SIZE + (const uint8_t *) (x))
- 
- /* Note, this macro always '\0' terminates renewed packets */
- 
-@@ -111,13 +112,13 @@ char **pamc_list_agents(pamc_handle_t pch);
- do {                                                                       \
-     if ((old_p) != NULL) {                                                 \
- 	if (*(old_p)) {                                                    \
--	    u_int32_t __size;                                              \
-+	    uint32_t __size;                                              \
-             __size = PAM_BP_SIZE(*(old_p));                                \
- 	    memset(*(old_p), 0, __size);                                   \
- 	    PAM_BP_FREE(*(old_p));                                         \
- 	}                                                                  \
- 	if (cntrl) {                                                       \
--	    u_int32_t __size;                                              \
-+	    uint32_t __size;                                              \
-                                                                            \
- 	    __size = PAM_BP_MIN_SIZE + data_length;                        \
- 	    if ((*(old_p) = PAM_BP_CALLOC(1, 1+__size))) {                 \
-@@ -140,7 +141,7 @@ do {                                                                       \
- #define PAM_BP_FILL(prmpt, offset, length, data)                           \
- do {                                                                       \
-     size_t bp_length;                                                      \
--    u_int8_t *prompt = (u_int8_t *) (prmpt);                               \
-+    uint8_t *prompt = (uint8_t *) (prmpt);                               \
-     bp_length = PAM_BP_LENGTH(prompt);                                     \
-     if (bp_length < ((length)+(offset))) {                                 \
- 	PAM_BP_ASSERT("attempt to write over end of prompt");              \
-@@ -151,7 +152,7 @@ do {                                                                       \
- #define PAM_BP_EXTRACT(prmpt, offset, length, data)                        \
- do {                                                                       \
-     size_t __bp_length;                                                    \
--    const u_int8_t *__prompt = (const u_int8_t *) (prmpt);                 \
-+    const uint8_t *__prompt = (const uint8_t *) (prmpt);                 \
-     __bp_length = PAM_BP_LENGTH(__prompt);                                 \
-     if (((offset) < 0) || (__bp_length < ((length)+(offset)))              \
- 	|| ((length) < 0)) {                                               \
-diff --git a/libpamc/libpamc.h b/libpamc/libpamc.h
-index 93c833c6..a22f52ea 100644
---- a/libpamc/libpamc.h
-+++ b/libpamc/libpamc.h
-@@ -16,6 +16,7 @@
- #include <sys/types.h>
- #include <dirent.h>
- #include <sys/wait.h>
-+#include <stdint.h>
- #include <stdlib.h>
- #include <errno.h>
- #include <ctype.h>
-diff --git a/libpamc/pamc_converse.c b/libpamc/pamc_converse.c
-index bb9c6dfd..f8f60edf 100644
---- a/libpamc/pamc_converse.c
-+++ b/libpamc/pamc_converse.c
-@@ -34,8 +34,8 @@ static int __pamc_select_agent(pamc_handle_t pch, char *agent_id)
- 
- int pamc_converse(pamc_handle_t pch, pamc_bp_t *prompt_p)
- {
--    u_int32_t size, offset=0;
--    u_int8_t control, raw[PAM_BP_MIN_SIZE];
-+    uint32_t size, offset=0;
-+    uint8_t control, raw[PAM_BP_MIN_SIZE];
- 
-     D(("called"));
- 
-@@ -110,7 +110,7 @@ int pamc_converse(pamc_handle_t pch, pamc_bp_t *prompt_p)
-     /* pump all of the prompt into the agent */
-     do {
- 	int rval = write(pch->current->writer,
--			 offset + (const u_int8_t *) (*prompt_p),
-+			 offset + (const uint8_t *) (*prompt_p),
- 			 size - offset);
- 	if (rval == -1) {
- 	    switch (errno) {
-@@ -172,7 +172,7 @@ int pamc_converse(pamc_handle_t pch, pamc_bp_t *prompt_p)
-        value from the previous loop */
- 
-     while (offset < size) {
--	int rval = read(pch->current->reader, offset + (u_int8_t *) *prompt_p,
-+	int rval = read(pch->current->reader, offset + (uint8_t *) *prompt_p,
- 			size-offset);
- 
- 	if (rval == -1) {
-diff --git a/libpamc/test/regress/test.libpamc.c b/libpamc/test/regress/test.libpamc.c
-index b0fff9c6..4251b4fa 100644
---- a/libpamc/test/regress/test.libpamc.c
-+++ b/libpamc/test/regress/test.libpamc.c
-@@ -5,6 +5,7 @@
-  */
- 
- #include <stdio.h>
-+#include <stdint.h>
- #include <string.h>
- #include <security/pam_client.h>
- #include <ctype.h>
-@@ -157,7 +158,7 @@ char *create_digest(int length, const char *raw)
-     return temp_packet.buffer;
- }
- 
--void packet_to_prompt(pamc_bp_t *prompt_p, u_int8_t control,
-+void packet_to_prompt(pamc_bp_t *prompt_p, uint8_t control,
- 		      struct internal_packet *packet)
- {
-     PAM_BP_RENEW(prompt_p, control, packet->at);
-diff --git a/modules/pam_timestamp/sha1.c b/modules/pam_timestamp/sha1.c
-index 576b4b41..af3ccb97 100644
---- a/modules/pam_timestamp/sha1.c
-+++ b/modules/pam_timestamp/sha1.c
-@@ -56,34 +56,34 @@ padding[SHA1_BLOCK_SIZE] = {
- 	   0, 0, 0, 0, 0, 0, 0, 0,     0, 0, 0, 0, 0, 0, 0, 0,
- };
- 
--static u_int32_t
--F(u_int32_t b, u_int32_t c, u_int32_t d)
-+static uint32_t
-+F(uint32_t b, uint32_t c, uint32_t d)
- {
- 	return (b & c) | ((~b) & d);
- }
- 
--static u_int32_t
--G(u_int32_t b, u_int32_t c, u_int32_t d)
-+static uint32_t
-+G(uint32_t b, uint32_t c, uint32_t d)
- {
- 	return b ^ c ^ d;
- }
- 
--static u_int32_t
--H(u_int32_t b, u_int32_t c, u_int32_t d)
-+static uint32_t
-+H(uint32_t b, uint32_t c, uint32_t d)
- {
- 	return (b & c) | (b & d) | (c & d);
- }
- 
--static u_int32_t
--RL(u_int32_t n, u_int32_t s)
-+static uint32_t
-+RL(uint32_t n, uint32_t s)
- {
- 	return (n << s) | (n >> (32 - s));
- }
- 
--static u_int32_t
--sha1_round(u_int32_t (*FUNC)(u_int32_t, u_int32_t, u_int32_t),
--      u_int32_t a, u_int32_t b, u_int32_t c, u_int32_t d, u_int32_t e,
--      u_int32_t i, u_int32_t n)
-+static uint32_t
-+sha1_round(uint32_t (*FUNC)(uint32_t, uint32_t, uint32_t),
-+      uint32_t a, uint32_t b, uint32_t c, uint32_t d, uint32_t e,
-+      uint32_t i, uint32_t n)
- {
- 	return RL(a, 5) + FUNC(b, c, d) + e + i + n;
- }
-@@ -100,10 +100,10 @@ sha1_init(struct sha1_context *ctx)
- }
- 
- static void
--sha1_process(struct sha1_context *ctx, u_int32_t buffer[SHA1_BLOCK_SIZE / 4])
-+sha1_process(struct sha1_context *ctx, uint32_t buffer[SHA1_BLOCK_SIZE / 4])
- {
--	u_int32_t a, b, c, d, e, temp;
--	u_int32_t data[80];
-+	uint32_t a, b, c, d, e, temp;
-+	uint32_t data[80];
- 	int i;
- 
- 	for (i = 0; i < 16; i++) {
-@@ -150,14 +150,14 @@ void
- sha1_update(struct sha1_context *ctx, const unsigned char *data, size_t length)
- {
- 	size_t i = 0, l = length, c, t;
--	u_int32_t count = 0;
-+	uint32_t count = 0;
- 
- 	/* Process any pending + data blocks. */
- 	while (l + ctx->pending_count >= SHA1_BLOCK_SIZE) {
- 		c = ctx->pending_count;
- 		t = SHA1_BLOCK_SIZE - c;
- 		memcpy(ctx->pending + c, &data[i], t);
--		sha1_process(ctx, (u_int32_t*) ctx->pending);
-+		sha1_process(ctx, (uint32_t*) ctx->pending);
- 		i += t;
- 		l -= t;
- 		ctx->pending_count = 0;
-@@ -188,7 +188,7 @@ sha1_output(struct sha1_context *ctx, unsigned char *out)
- 
- 	/* Output the sum. */
- 	if (out != NULL) {
--		u_int32_t c;
-+		uint32_t c;
- 		memcpy(&ctx2, ctx, sizeof(ctx2));
- 
- 		/* Pad this block. */
-@@ -197,10 +197,10 @@ sha1_output(struct sha1_context *ctx, unsigned char *out)
- 		       padding, SHA1_BLOCK_SIZE - c);
- 
- 		/* Do we need to process two blocks now? */
--		if (c >= (SHA1_BLOCK_SIZE - (sizeof(u_int32_t) * 2))) {
-+		if (c >= (SHA1_BLOCK_SIZE - (sizeof(uint32_t) * 2))) {
- 			/* Process this block. */
- 			sha1_process(&ctx2,
--				    (u_int32_t*) ctx2.pending);
-+				    (uint32_t*) ctx2.pending);
- 			/* Set up another block. */
- 			ctx2.pending_count = 0;
- 			memset(ctx2.pending, 0, SHA1_BLOCK_SIZE);
-@@ -218,10 +218,10 @@ sha1_output(struct sha1_context *ctx, unsigned char *out)
- 		ctx2.counts[0] = htonl(ctx2.counts[0]);
- 		ctx2.counts[1] = htonl(ctx2.counts[1]);
- 		memcpy(ctx2.pending + 56,
--		       &ctx2.counts[1], sizeof(u_int32_t));
-+		       &ctx2.counts[1], sizeof(uint32_t));
- 		memcpy(ctx2.pending + 60,
--		       &ctx2.counts[0], sizeof(u_int32_t));
--		sha1_process(&ctx2, (u_int32_t*) ctx2.pending);
-+		       &ctx2.counts[0], sizeof(uint32_t));
-+		sha1_process(&ctx2, (uint32_t*) ctx2.pending);
- 
- 		/* Output the data. */
- 		out[ 3] = (ctx2.a >>  0) & 0xff;
-diff --git a/modules/pam_timestamp/sha1.h b/modules/pam_timestamp/sha1.h
-index 667b87ca..a445e4e6 100644
---- a/modules/pam_timestamp/sha1.h
-+++ b/modules/pam_timestamp/sha1.h
-@@ -38,6 +38,7 @@
- #ifndef pam_timestamp_sha1_h
- #define pam_timestamp_sha1_h
- 
-+#include <stdint.h>
- #include <sys/types.h>
- 
- #define SHA1_BLOCK_SIZE 64
-@@ -45,9 +46,9 @@
- struct sha1_context {
- 	size_t count;
- 	unsigned char pending[SHA1_BLOCK_SIZE];
--	u_int32_t counts[2];
-+	uint32_t counts[2];
- 	size_t pending_count;
--	u_int32_t a, b, c, d, e;
-+	uint32_t a, b, c, d, e;
- };
- 
- #define SHA1_OUTPUT_SIZE 20
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index cfe58ce28e..608908cb00 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.3.1/Linux-PAM-1.3.1.tar.xz.asc
+# https://github.com/linux-pam/linux-pam/releases/download/v1.4.0/Linux-PAM-1.4.0.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db  Linux-PAM-1.3.1.tar.xz
+sha256  cd6d928c51e64139be3bdb38692c68183a509b83d4f2c221024ccd4bcddfd034  Linux-PAM-1.4.0.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 63610fcc57..8f8d575102 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.3.1
+LINUX_PAM_VERSION = 1.4.0
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES
@@ -18,7 +18,6 @@ LINUX_PAM_CONF_OPTS = \
 	--libdir=/lib
 LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
-LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
