From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:30:46 +0200
Subject: [Buildroot] [git commit] package/linux-pam: enable back on musl
Message-ID: <20200421061631.3E3998F6CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f89ca996b6deb660b53c33196b8b309fac659bf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two upstream patches to fix build on musl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Replace-strndupa-with-strncpy.patch       | 75 ++++++++++++++++++++++
 ...pam_lastlog-when-logwtmp-is-not-available.patch | 60 +++++++++++++++++
 package/linux-pam/Config.in                        |  5 +-
 package/nodm/Config.in                             |  5 +-
 package/openvmtools/Config.in                      |  5 +-
 package/python-pam/Config.in                       |  6 +-
 package/rsh-redone/Config.in                       | 10 ++-
 package/util-linux/Config.in                       |  5 +-
 8 files changed, 149 insertions(+), 22 deletions(-)

diff --git a/package/linux-pam/0003-Replace-strndupa-with-strncpy.patch b/package/linux-pam/0003-Replace-strndupa-with-strncpy.patch
new file mode 100644
index 0000000000..9793f8caf1
--- /dev/null
+++ b/package/linux-pam/0003-Replace-strndupa-with-strncpy.patch
@@ -0,0 +1,75 @@
+From 91d4678388b2a7d768ee2ec8cc569e11fc223ffd Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Sun, 15 Jul 2018 20:43:44 -0700
+Subject: [PATCH] Replace strndupa with strncpy
+
+glibc only. A static string is better.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/91d4678388b2a7d768ee2ec8cc569e11fc223ffd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/pam_exec/pam_exec.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/modules/pam_exec/pam_exec.c b/modules/pam_exec/pam_exec.c
+index 52dc6818..6cad16e4 100644
+--- a/modules/pam_exec/pam_exec.c
++++ b/modules/pam_exec/pam_exec.c
+@@ -102,7 +102,7 @@ call_exec (const char *pam_type, pam_handle_t *pamh,
+   int use_stdout = 0;
+   int optargc;
+   const char *logfile = NULL;
+-  const char *authtok = NULL;
++  char authtok[PAM_MAX_RESP_SIZE] = {};
+   pid_t pid;
+   int fds[2];
+   int stdout_fds[2];
+@@ -180,12 +180,12 @@ call_exec (const char *pam_type, pam_handle_t *pamh,
+ 	      if (resp)
+ 		{
+ 		  pam_set_item (pamh, PAM_AUTHTOK, resp);
+-		  authtok = strndupa (resp, PAM_MAX_RESP_SIZE);
++		  strncpy (authtok, resp, sizeof(authtok) - 1);
+ 		  _pam_drop (resp);
+ 		}
+ 	    }
+ 	  else
+-	    authtok = strndupa (void_pass, PAM_MAX_RESP_SIZE);
++	    strncpy (authtok, void_pass, sizeof(authtok) - 1);
+ 
+ 	  if (pipe(fds) != 0)
+ 	    {
+@@ -225,23 +225,14 @@ call_exec (const char *pam_type, pam_handle_t *pamh,
+ 
+       if (expose_authtok) /* send the password to the child */
+ 	{
+-	  if (authtok != NULL)
+-	    {            /* send the password to the child */
+-	      if (debug)
+-		pam_syslog (pamh, LOG_DEBUG, "send password to child");
+-	      if (write(fds[1], authtok, strlen(authtok)+1) == -1)
+-		pam_syslog (pamh, LOG_ERR,
+-			    "sending password to child failed: %m");
+-	      authtok = NULL;
+-	    }
+-	  else
+-	    {
+-	      if (write(fds[1], "", 1) == -1)   /* blank password */
+-		pam_syslog (pamh, LOG_ERR,
+-			    "sending password to child failed: %m");
+-	    }
+-        close(fds[0]);       /* close here to avoid possible SIGPIPE above */
+-        close(fds[1]);
++	  if (debug)
++	    pam_syslog (pamh, LOG_DEBUG, "send password to child");
++	  if (write(fds[1], authtok, strlen(authtok)) == -1)
++	    pam_syslog (pamh, LOG_ERR,
++			      "sending password to child failed: %m");
++
++          close(fds[0]);       /* close here to avoid possible SIGPIPE above */
++          close(fds[1]);
+ 	}
+ 
+       if (use_stdout)
diff --git a/package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch b/package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch
new file mode 100644
index 0000000000..8ff0ac155a
--- /dev/null
+++ b/package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch
@@ -0,0 +1,60 @@
+From 73bf6d25ddb7a2cb73bceda3d880174b1d1e4a26 Mon Sep 17 00:00:00 2001
+From: Yousong Zhou <yszhou4tech@gmail.com>
+Date: Wed, 17 Jun 2015 21:18:05 +0800
+Subject: [PATCH] build: ignore pam_lastlog when logwtmp is not available.
+
+* configure.ac: check logwtmp and set COND_BUILD_PAM_LASTLOG
+* modules/pam_lastlog/Makefile.am: check COND_BUILD_PAM_LASTLOG
+
+Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/73bf6d25ddb7a2cb73bceda3d880174b1d1e4a26]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac        | 2 ++
+ modules/Makefile.am | 8 ++++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 69748614..4d1b1965 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -534,8 +534,10 @@ AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r
+ AC_CHECK_FUNCS(getgrouplist getline getdelim)
+ AC_CHECK_FUNCS(inet_ntop inet_pton innetgr)
+ AC_CHECK_FUNCS([ruserok_af ruserok], [break])
++AC_CHECK_FUNCS([logwtmp])
+ 
+ AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes -o "$ac_cv_func_ruserok" = yes])
++AM_CONDITIONAL([COND_BUILD_PAM_LASTLOG], [test "$ac_cv_func_logwtmp" = yes])
+ 
+ AC_CHECK_FUNCS(unshare, [UNSHARE=yes], [UNSHARE=no])
+ AM_CONDITIONAL([HAVE_UNSHARE], [test "$UNSHARE" = yes])
+diff --git a/modules/Makefile.am b/modules/Makefile.am
+index 9ad26a9b..b98dc5c8 100644
+--- a/modules/Makefile.am
++++ b/modules/Makefile.am
+@@ -6,9 +6,13 @@ if COND_BUILD_PAM_RHOSTS
+ 	MAYBE_PAM_RHOSTS = pam_rhosts
+ endif
+ 
++if COND_BUILD_PAM_LASTLOG
++	MAYBE_PAM_LASTLOG = pam_lastlog
++endif
++
+ SUBDIRS := pam_access pam_cracklib pam_debug pam_deny pam_echo \
+ 	pam_env pam_exec pam_faildelay pam_filter pam_ftp \
+-	pam_group pam_issue pam_keyinit pam_lastlog pam_limits \
++	pam_group pam_issue pam_keyinit pam_limits \
+ 	pam_listfile pam_localuser pam_loginuid pam_mail \
+ 	pam_mkhomedir pam_motd pam_namespace pam_nologin \
+ 	pam_permit pam_pwhistory pam_rootok pam_securetty \
+@@ -16,7 +20,7 @@ SUBDIRS := pam_access pam_cracklib pam_debug pam_deny pam_echo \
+ 	pam_succeed_if pam_tally pam_tally2 pam_time pam_timestamp \
+ 	pam_tty_audit pam_umask \
+ 	pam_unix pam_userdb pam_warn pam_wheel pam_xauth \
+-	$(MAYBE_PAM_RHOSTS)
++	$(MAYBE_PAM_RHOSTS) $(MAYBE_PAM_LASTLOG)
+ 
+ CLEANFILES = *~
+ 
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 1396549366..84aee5cdd4 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FLEX
 	help
@@ -11,6 +10,6 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
-comment "linux-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS
diff --git a/package/nodm/Config.in b/package/nodm/Config.in
index 38171e8dcf..2dd6f1e1cf 100644
--- a/package/nodm/Config.in
+++ b/package/nodm/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_NODM
 	depends on BR2_PACKAGE_XORG7
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LINUX_PAM
@@ -18,7 +17,7 @@ config BR2_PACKAGE_NODM
 
 	  https://github.com/spanezz/nodm/
 
-comment "nodm needs a glibc or uClibc toolchain w/ wchar, locale, dynamic library"
+comment "nodm needs a toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_XORG7
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 1a077a2a47..a50b6b9b3e 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -27,13 +27,12 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs a glibc toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+comment "PAM support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS
 	bool "resolutionkms support"
diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
index 02865d00d6..92ba105ebf 100644
--- a/package/python-pam/Config.in
+++ b/package/python-pam/Config.in
@@ -1,7 +1,6 @@
-comment "python-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "python-pam needs a toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PYTHON_PAM
 	bool "python-pam"
@@ -10,7 +9,6 @@ config BR2_PACKAGE_PYTHON_PAM
 	depends on BR2_USE_WCHAR # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  PAM (Pluggable Authentication Module) bindings for Python.
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 1335c85739..5647d7edef 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -17,13 +17,12 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	bool "rlogind"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "rlogind needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
@@ -32,12 +31,11 @@ config BR2_PACKAGE_RSH_REDONE_RSHD
 	bool "rshd"
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rshd needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "rshd needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS
 
 endif
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 996f0cd7fa..aa3c1a5f76 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -84,15 +84,14 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
-comment "chfn/chsh needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
