From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 22:59:07 -0500
Subject: [Buildroot] [PATCH v4] inetutils: new package for random network
	tools
In-Reply-To: <1290145160-21033-1-git-send-email-vapier@gentoo.org>
References: <1290145160-21033-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290225547-9728-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v4
	- add inetd/telnet/tftp config options
	- move back to older autotool helpers
	- control ipv6

 package/Config.in                                  |    1 +
 package/inetutils/Config.in                        |   52 +++++++++
 ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |   27 +++++
 ...rgp-fix-program_invocation_name-detection.patch |   51 +++++++++
 package/inetutils/inetutils-1.8-0003-wchar.patch   |   12 ++
 ...me-ruserpass-to-avoid-C-library-collision.patch |   58 +++++++++++
 ...detect-__rcmd_errstr-support-in-the-C-lib.patch |   57 ++++++++++
 ...e-daemon-from-the-C-library-when-possible.patch |   42 ++++++++
 .../inetutils-1.8-1004-detect-fork-support.patch   |   54 ++++++++++
 ...-1.8-1005-ftpd-add-daemon-D-nommu-support.patch |  109 ++++++++++++++++++++
 package/inetutils/inetutils.mk                     |   43 ++++++++
 11 files changed, 506 insertions(+), 0 deletions(-)
 create mode 100644 package/inetutils/Config.in
 create mode 100644 package/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
 create mode 100644 package/inetutils/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
 create mode 100644 package/inetutils/inetutils-1.8-0003-wchar.patch
 create mode 100644 package/inetutils/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
 create mode 100644 package/inetutils/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
 create mode 100644 package/inetutils/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
 create mode 100644 package/inetutils/inetutils-1.8-1004-detect-fork-support.patch
 create mode 100644 package/inetutils/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
 create mode 100644 package/inetutils/inetutils.mk

diff --git a/package/Config.in b/package/Config.in
index d3629ff..0b131a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
+source "package/inetutils/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/inetutils/Config.in b/package/inetutils/Config.in
new file mode 100644
index 0000000..fe2397e
--- /dev/null
+++ b/package/inetutils/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_INETUTILS
+	bool "inetutils"
+	help
+	  Inetutils is a collection of common network programs.
+
+	  http://www.gnu.org/software/inetutils/
+
+if BR2_PACKAGE_INETUTILS
+
+config BR2_PACKAGE_INETUTILS_FTP
+	bool "ftp"
+
+config BR2_PACKAGE_INETUTILS_FTPD
+	bool "ftpd"
+
+config BR2_PACKAGE_INETUTILS_INETD
+	bool "inetd"
+
+config BR2_PACKAGE_INETUTILS_RCP
+	bool "rcp"
+
+config BR2_PACKAGE_INETUTILS_REXEC
+	bool "rexec"
+
+config BR2_PACKAGE_INETUTILS_REXECD
+	bool "rexecd"
+
+config BR2_PACKAGE_INETUTILS_RLOGIN
+	bool "rlogin"
+
+config BR2_PACKAGE_INETUTILS_RLOGIND
+	bool "rlogind"
+
+config BR2_PACKAGE_INETUTILS_RSH
+	bool "rsh"
+
+config BR2_PACKAGE_INETUTILS_RSHD
+	bool "rshd"
+
+config BR2_PACKAGE_INETUTILS_TELNET
+	bool "telnet"
+
+config BR2_PACKAGE_INETUTILS_TELNETD
+	bool "telnetd"
+
+config BR2_PACKAGE_INETUTILS_TFTP
+	bool "tftp"
+
+config BR2_PACKAGE_INETUTILS_TFTPD
+	bool "tftpd"
+
+endif
diff --git a/package/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/package/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
new file mode 100644
index 0000000..b69ab96
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
@@ -0,0 +1,27 @@
+From 552a7d64ad4a7188a9b7cd89933ae7caf7ebfe90 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 18 Nov 2010 16:59:14 -0500
+Subject: [PATCH gnulib] printf-parse: pull in features.h for __GLIBC__
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ lib/printf-parse.h |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/lib/printf-parse.h b/lib/printf-parse.h
+index 67a4a2a..3bd6152 100644
+--- a/lib/printf-parse.h
++++ b/lib/printf-parse.h
+@@ -25,6 +25,9 @@
+ 
+ #include "printf-args.h"
+ 
++#ifdef HAVE_FEATURES_H
++# include <features.h>	/* for __GLIBC__ */
++#endif
+ 
+ /* Flags */
+ #define FLAG_GROUP       1      /* ' flag */
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch b/package/inetutils/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
new file mode 100644
index 0000000..c2e2362
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
@@ -0,0 +1,51 @@
+From 93dbd3319232613ff8f5f3f08bf5f57b21980ef1 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 18 Nov 2010 17:14:21 -0500
+Subject: [PATCH gnulib] argp: fix program_invocation_name detection
+
+The current program_invocation_name symbol detection fails if the argp.h
+header is missing.  So check for the header first before detecting if the
+symbol exists.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ m4/argp.m4 |   15 +++++++++++++--
+ 1 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/m4/argp.m4 b/m4/argp.m4
+index d3ca5ba..efa562c 100644
+--- a/m4/argp.m4
++++ b/m4/argp.m4
+@@ -31,8 +31,14 @@ AC_DEFUN([gl_ARGP],
+   # are defined elsewhere. It is improbable that only one of them will
+   # be defined and other not, I prefer to stay on the safe side and to
+   # test each one separately.
++  AC_CHECK_HEADERS_ONCE([argp.h])
+   AC_MSG_CHECKING([whether program_invocation_name is defined])
+-  AC_TRY_LINK([#include <argp.h>],
++  AC_TRY_LINK([
++#include <errno.h>
++#ifdef HAVE_ARGP_H
++# include <argp.h>
++#endif
++],
+               [ program_invocation_name = "test"; ],
+               [ AC_DEFINE([HAVE_PROGRAM_INVOCATION_NAME], [1],
+                  [Define if program_invocation_name is defined])
+@@ -40,7 +46,12 @@ AC_DEFUN([gl_ARGP],
+               [ AC_MSG_RESULT([no])] )
+ 
+   AC_MSG_CHECKING([whether program_invocation_short_name is defined])
+-  AC_TRY_LINK([#include <argp.h>],
++  AC_TRY_LINK([
++#include <errno.h>
++#ifdef HAVE_ARGP_H
++# include <argp.h>
++#endif
++],
+               [ program_invocation_short_name = "test"; ],
+               [ AC_DEFINE([HAVE_PROGRAM_INVOCATION_SHORT_NAME], [1],
+                  [Define if program_invocation_short_name is defined])
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils-1.8-0003-wchar.patch b/package/inetutils/inetutils-1.8-0003-wchar.patch
new file mode 100644
index 0000000..21635a7
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-0003-wchar.patch
@@ -0,0 +1,12 @@
+--- inetutils-1.8/lib/wchar.in.h
++++ inetutils-1.8/lib/wchar.in.h
+@@ -70,6 +70,9 @@
+ /* The include_next requires a split double-inclusion guard.  */
+ #if @HAVE_WCHAR_H@
+ # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
++#else
++# include <stddef.h>
++# define MB_CUR_MAX 1
+ #endif
+ 
+ #undef _GL_ALREADY_INCLUDING_WCHAR_H
diff --git a/package/inetutils/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch b/package/inetutils/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
new file mode 100644
index 0000000..8c5c7d9
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
@@ -0,0 +1,58 @@
+From 4f890adb39b52bc43c578966071625004988e3b8 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 18 Nov 2010 22:11:48 -0500
+Subject: [PATCH] ftp: rename ruserpass to avoid C library collision
+
+The C library itself defines a "ruserpass" function.  When linking
+statically, it is possible to hit a symbol collision linker error.
+So rename the local ftp version to "remote_userpass".
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ ftp/extern.h    |    2 +-
+ ftp/ftp.c       |    2 +-
+ ftp/ruserpass.c |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ftp/extern.h b/ftp/extern.h
+index 8cdb8aa..037cb61 100644
+--- a/ftp/extern.h
++++ b/ftp/extern.h
+@@ -119,7 +119,7 @@ void reset (int, char **);
+ void restart (int, char **);
+ void rmthelp (int, char **);
+ void rmtstatus (int, char **);
+-int ruserpass (char *, char **, char **, char **);
++int remote_userpass (char *, char **, char **, char **);
+ void sendrequest (char *, char *, char *, int);
+ void setascii (int, char **);
+ void setbell (int, char **);
+diff --git a/ftp/ftp.c b/ftp/ftp.c
+index c20ba41..95675cc 100644
+--- a/ftp/ftp.c
++++ b/ftp/ftp.c
+@@ -251,7 +251,7 @@ login (char *host)
+   int n, aflag = 0;
+ 
+   user = pass = acct = 0;
+-  if (ruserpass (host, &user, &pass, &acct) < 0)
++  if (remote_userpass (host, &user, &pass, &acct) < 0)
+     {
+       code = -1;
+       return (0);
+diff --git a/ftp/ruserpass.c b/ftp/ruserpass.c
+index 8572b95..c08fbc0 100644
+--- a/ftp/ruserpass.c
++++ b/ftp/ruserpass.c
+@@ -111,7 +111,7 @@ static struct toktab
+ };
+ 
+ int
+-ruserpass (char *host, char **aname, char **apass, char **aacct)
++remote_userpass (char *host, char **aname, char **apass, char **aacct)
+ {
+   char *hdir, buf[BUFSIZ], *tmp;
+   char *myname = 0, *mydomain;
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch b/package/inetutils/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
new file mode 100644
index 0000000..77ef62e
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
@@ -0,0 +1,57 @@
+From 730015f060fe76eee615f361a65eb719cdf22eef Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 18 Nov 2010 22:20:39 -0500
+Subject: [PATCH] rshd: detect __rcmd_errstr support in the C lib
+
+Not all C libraries support __rcmd_errstr, so add a configure test for it.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ configure.ac |    2 +-
+ src/rshd.c   |    4 ++++
+ 2 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1ac270..79d655c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -587,7 +587,7 @@ AC_CHECK_FUNCS(cfsetspeed cgetent dirfd fchdir flock \
+                setsid setregid setreuid setresgid setresuid setutent_r \
+                sigaction sigvec strchr setproctitle tcgetattr tzset utimes \
+                utime uname \
+-               updwtmp updwtmpx vhangup wait3 wait4 opendir2)
++               updwtmp updwtmpx vhangup wait3 wait4 opendir2 __rcmd_errstr)
+ 
+ dnl Functions that we will define if necessary.
+ AC_REPLACE_FUNCS(getpass getusershell memcmp memcpy memmove memset \
+diff --git a/src/rshd.c b/src/rshd.c
+index d49facd..9301ef2 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -284,7 +284,9 @@ extern char **environ;
+ void
+ doit (int sockfd, struct sockaddr_in *fromp)
+ {
++#ifdef HAVE___RCMD_ERRSTR
+   extern char *__rcmd_errstr;	/* syslog hook from libc/net/rcmd.c. */
++#endif
+   struct hostent *hp;
+   struct passwd *pwd;
+   u_short port;
+@@ -757,11 +759,13 @@ doit (int sockfd, struct sockaddr_in *fromp)
+                      && (iruserok (fromp->sin_addr.s_addr, pwd->pw_uid == 0,
+                                    remuser, locuser)) < 0))
+     {
++#ifdef HAVE___RCMD_ERRSTR
+       if (__rcmd_errstr)
+ 	syslog (LOG_INFO | LOG_AUTH,
+ 		"%s@%s as %s: permission denied (%s). cmd='%.80s'",
+ 		remuser, hostname, locuser, __rcmd_errstr, cmdbuf);
+       else
++#endif
+ 	syslog (LOG_INFO | LOG_AUTH,
+ 		"%s@%s as %s: permission denied. cmd='%.80s'",
+ 		remuser, hostname, locuser, cmdbuf);
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch b/package/inetutils/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
new file mode 100644
index 0000000..518860c
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
@@ -0,0 +1,42 @@
+From 3b9f64c6a668849b37b884a7826885c70b95787b Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 18 Nov 2010 22:24:06 -0500
+Subject: [PATCH] use daemon from the C library when possible
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ configure.ac          |    2 +-
+ libinetutils/daemon.c |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 79d655c..25cc3db 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -579,7 +579,7 @@ AC_FUNC_MMAP
+ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ 
+-AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent dirfd fchdir flock \
++AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent daemon dirfd fchdir flock \
+                fpathconf ftruncate \
+ 	       getcwd getmsg getspnam initgroups initsetproctitle killpg \
+                mkstemp ptsname \
+diff --git a/libinetutils/daemon.c b/libinetutils/daemon.c
+index 2156af4..9beb255 100644
+--- a/libinetutils/daemon.c
++++ b/libinetutils/daemon.c
+@@ -197,8 +197,10 @@ waitdaemon (int nochdir, int noclose, int maxwait)
+   return ppid;
+ }
+ 
++#ifndef HAVE_DAEMON
+ int
+ daemon (int nochdir, int noclose)
+ {
+   return (waitdaemon (nochdir, noclose, 0) == -1) ? -1 : 0;
+ }
++#endif
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils-1.8-1004-detect-fork-support.patch b/package/inetutils/inetutils-1.8-1004-detect-fork-support.patch
new file mode 100644
index 0000000..d3ca91f
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-1004-detect-fork-support.patch
@@ -0,0 +1,54 @@
+From 0acaed0d4b2bf9495e71ec4c898733bed2a86be0 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 18 Nov 2010 22:27:55 -0500
+Subject: [PATCH] detect fork() support
+
+Linux/nommu systems cannot support a fork(), so add a configure test for
+it so apps can pick that or vfork().
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ configure.ac                |    2 +-
+ libinetutils/libinetutils.h |    9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 25cc3db..98196f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,7 +580,7 @@ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ 
+ AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent daemon dirfd fchdir flock \
+-               fpathconf ftruncate \
++               fork fpathconf ftruncate \
+ 	       getcwd getmsg getspnam initgroups initsetproctitle killpg \
+                mkstemp ptsname \
+                setegid seteuid setpgid \
+diff --git a/libinetutils/libinetutils.h b/libinetutils/libinetutils.h
+index 19bbde5..86365b0 100644
+--- a/libinetutils/libinetutils.h
++++ b/libinetutils/libinetutils.h
+@@ -17,6 +17,8 @@
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
+ 
++#include <config.h>
++
+ #include "argp-version-etc.h"
+ 
+ void utmp_init (char *line, char *user, char *id);
+@@ -32,3 +34,10 @@ extern const char *default_program_authors[];
+ #define iu_argp_init(name, authors)				\
+   argp_program_bug_address = "<" PACKAGE_BUGREPORT ">";		\
+   argp_version_setup (name, authors);
++
++#ifdef HAVE_FORK
++# define fork_exit(s) exit(s)
++#else
++# define fork() vfork()
++# define fork_exit(s) _exit(s)
++#endif
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch b/package/inetutils/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
new file mode 100644
index 0000000..57ee4d4
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
@@ -0,0 +1,109 @@
+From 1dee55b90d2971859377156e6210efdfdf1bac84 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 19 Nov 2010 20:26:48 -0500
+Subject: [PATCH] ftpd: add daemon (-D) nommu support
+
+The current daemon design of ftpd is to:
+	- loop in server_mode() waiting for a connection
+	- fork a child and return to main() to process like inetd
+	- have parent continue looping in server_mode()
+
+On a nommu system where we can only vfork(), the child returning
+from server_mode() corrupts the stack and messes up the the parent.
+So rather than having the child return, exec a new ftpd process in
+the normal inetd mode.  This also fixes the problem in nommu where
+a vfork-ed child pauses the parent until it either exits or execs
+something.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ ftpd/extern.h      |    3 ++-
+ ftpd/ftpd.c        |   17 ++++++++++++++---
+ ftpd/server_mode.c |    9 ++++++++-
+ 3 files changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/ftpd/extern.h b/ftpd/extern.h
+index 2483fe6..81182e0 100644
+--- a/ftpd/extern.h
++++ b/ftpd/extern.h
+@@ -110,7 +110,8 @@ extern char tmpline[];
+ extern off_t restart_point;
+ 
+ /* Exported from server_mode.c.  */
+-extern int server_mode (const char *pidfile, struct sockaddr_in *phis_addr);
++extern int server_mode (const char *pidfile, struct sockaddr_in *phis_addr,
++			char *argv[]);
+ 
+ /* Credential for the request.  */
+ struct credentials
+diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
+index aed74e6..c5c4c90 100644
+--- a/ftpd/ftpd.c
++++ b/ftpd/ftpd.c
+@@ -424,8 +424,7 @@ main (int argc, char *argv[], char **envp)
+   argp_parse (&argp, argc, argv, 0, &index, NULL);
+   
+   /* Bail out, wrong usage */
+-  argc -= index;
+-  if (argc != 0)
++  if (argc - index != 0)
+     error (1, 0, "surplus arguments; try `%s --help' for more info",
+ 	   program_name);
+ 
+@@ -438,7 +437,19 @@ main (int argc, char *argv[], char **envp)
+      fd = accept(). tcpd is check if compile with the support  */
+   if (daemon_mode)
+     {
+-      if (server_mode (pid_file, &his_addr) < 0)
++#ifndef HAVE_FORK
++      /* Shift out the daemon option in subforks  */
++      int i;
++      for (i = 0; i < argc; ++i)
++	if (strcmp (argv[i], "-D") == 0)
++	  {
++	    int j;
++	    for (j = i; j < argc; ++j)
++	      argv[j] = argv[j + 1];
++	    argv[--argc] = NULL;
++	  }
++#endif
++      if (server_mode (pid_file, &his_addr, argv) < 0)
+ 	exit (1);
+     }
+   else
+diff --git a/ftpd/server_mode.c b/ftpd/server_mode.c
+index 3d3a498..605e13e 100644
+--- a/ftpd/server_mode.c
++++ b/ftpd/server_mode.c
+@@ -37,6 +37,8 @@
+ # include <tcpd.h>
+ #endif
+ 
++#include <libinetutils.h>
++
+ static void reapchild (int);
+ 
+ #define DEFPORT 21
+@@ -92,7 +94,7 @@ reapchild (int signo ARG_UNUSED)
+ }
+ 
+ int
+-server_mode (const char *pidfile, struct sockaddr_in *phis_addr)
++server_mode (const char *pidfile, struct sockaddr_in *phis_addr, char *argv[])
+ {
+   int ctl_sock, fd;
+   struct servent *sv;
+@@ -176,5 +178,10 @@ server_mode (const char *pidfile, struct sockaddr_in *phis_addr)
+   if (!check_host ((struct sockaddr *) phis_addr))
+     return -1;
+ #endif
++
++#ifndef HAVE_FORK
++  _exit(execvp(argv[0], argv));
++#endif
++
+   return fd;
+ }
+-- 
+1.7.3.2
+
diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
new file mode 100644
index 0000000..dba4858
--- /dev/null
+++ b/package/inetutils/inetutils.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# inetutils
+#
+#############################################################
+
+INETUTILS_VERSION = 1.8
+INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.gz
+INETUTILS_SITE = $(BR2_GNU_MIRROR)/inetutils/
+# patches update many autotool files, and then we need to touch all
+# the man pages to keep from `help2man` running on the binaries
+INETUTILS_AUTORECONF = YES
+define INETUTILS_AUTORECONF_HOOK
+	touch $(INETUTILS_SRCDIR)/*/*.[0-9]
+endef
+INETUTILS_CONF_OPT = \
+	--libexecdir=/usr/sbin \
+	--program-transform-name= \
+	--without-included-regex \
+	--disable-libls \
+	--disable-servers --disable-clients \
+	$(call USE_ENABLE,INET_IPV6,ipv6) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_FTP,ftp) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_FTPD,ftpd) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_INETD,inetd) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_RCP,rcp) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_REXEC,rexec) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_REXECD,rexecd) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_RLOGIN,rlogin) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_RLOGIND,rlogind) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_RSH,rsh) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_RSHD,rshd) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_TELNET,telnet) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_TELNETD,telnetd) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_TFTP,tftp) \
+	$(call USE_ENABLE,PACKAGE_INETUTILS_TFTPD,tftpd)
+
+$(eval $(call AUTOTARGETS,package,inetutils))
+
+# append after autotools generation so we get autoreconf then touch
+INETUTILS_PRE_CONFIGURE_HOOKS += INETUTILS_AUTORECONF_HOOK
+
+INETUTILS_INSTALL_TARGET_OPT += SUIDMODE="-m 4775"
-- 
1.7.3.2
