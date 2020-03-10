From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Date: Tue, 10 Mar 2020 15:56:56 +0100
Subject: [Buildroot] [PATCH v2] package/coreutils: bump to v8.32
Message-ID: <20200310145656.4000-1-joaomarcos.costa@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The update to version 8.32 removes the need for an extra patch [1]
(which was added in upstream) but requires another one [2] to fix a new
build issue related to the file 'src/ls.c'.
[1]: 0001-strtod_fix_clash_with_strtold.patch
[2]: 0001-ls-restore-8.31-behavior-on-removed-directories.patch

The license file 'COPYING' was modified since its last version, which
justifies the difference between the hash codes at 'coreutils.hash',
even though there are nothing but changes in links, as shown by
the diff:

--- ./coreutils-8.31/COPYING	2018-07-21 22:36:23.000000000 +0200
+++ ./coreutils-8.32/COPYING	2019-03-16 21:32:05.000000000 +0100

- Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>

-along with this program.  If not, see <http://www.gnu.org/licenses/>.
+along with this program.  If not, see <https://www.gnu.org/licenses/>.

-<http://www.gnu.org/licenses/>.
+<https://www.gnu.org/licenses/>.

-<http://www.gnu.org/philosophy/why-not-lgpl.html>.
+<https://www.gnu.org/licenses/why-not-lgpl.html>.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
...8.31-behavior-on-removed-directories.patch | 117 ++++++++++++++++++
 .../0001-strtod_fix_clash_with_strtold.patch  |  64 ----------
 package/coreutils/coreutils.hash              |   4 +-
 package/coreutils/coreutils.mk                |   2 +-
 4 files changed, 120 insertions(+), 67 deletions(-)
 create mode 100644 package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
 delete mode 100644 package/coreutils/0001-strtod_fix_clash_with_strtold.patch

diff --git a/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch b/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
new file mode 100644
index 0000000000..ae74641b79
--- /dev/null
+++ b/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
@@ -0,0 +1,117 @@
+From 10fcb97bd728f09d4a027eddf8ad2900f0819b0a Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 5 Mar 2020 17:25:29 -0800
+Subject: [PATCH] ls: restore 8.31 behavior on removed directories
+
+* NEWS: Mention this.
+* src/ls.c: Do not include <sys/sycall.h>
+(print_dir): Don't worry about whether the directory is removed.
+* tests/ls/removed-directory.sh: Adjust to match new (i.e., old)
+behavior.
+---
+ NEWS                          |  6 ++++++
+ src/ls.c                      | 22 ----------------------
+ tests/ls/removed-directory.sh | 10 ++--------
+ 3 files changed, 8 insertions(+), 30 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index fdc8bf5db..653e7178b 100644
+--- a/NEWS
++++ b/NEWS
+@@ -2,6 +2,12 @@ GNU coreutils NEWS                                    -*- outline -*-
+ 
+ * Noteworthy changes in release ?.? (????-??-??) [?]
+ 
++** Changes in behavior
++
++  On GNU/Linux systems, ls no longer issues an error message on
++  directory merely because it was removed.  This reverts a change
++  that was made in release 8.32.
++
+ 
+ * Noteworthy changes in release 8.32 (2020-03-05) [stable]
+ 
+diff --git a/src/ls.c b/src/ls.c
+index 24b983287..4acf5f44d 100644
+--- a/src/ls.c
++++ b/src/ls.c
+@@ -49,10 +49,6 @@
+ # include <sys/ptem.h>
+ #endif
+ 
+-#ifdef __linux__
+-# include <sys/syscall.h>
+-#endif
+-
+ #include <stdio.h>
+ #include <assert.h>
+ #include <setjmp.h>
+@@ -2896,7 +2892,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
+   struct dirent *next;
+   uintmax_t total_blocks = 0;
+   static bool first = true;
+-  bool found_any_entries = false;
+ 
+   errno = 0;
+   dirp = opendir (name);
+@@ -2972,7 +2967,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
+       next = readdir (dirp);
+       if (next)
+         {
+-          found_any_entries = true;
+           if (! file_ignored (next->d_name))
+             {
+               enum filetype type = unknown;
+@@ -3018,22 +3012,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
+           if (errno != EOVERFLOW)
+             break;
+         }
+-#ifdef __linux__
+-      else if (! found_any_entries)
+-        {
+-          /* If readdir finds no directory entries at all, not even "." or
+-             "..", then double check that the directory exists.  */
+-          if (syscall (SYS_getdents, dirfd (dirp), NULL, 0) == -1
+-              && errno != EINVAL)
+-            {
+-              /* We exclude EINVAL as that pertains to buffer handling,
+-                 and we've passed NULL as the buffer for simplicity.
+-                 ENOENT is returned if appropriate before buffer handling.  */
+-              file_failure (command_line_arg, _("reading directory %s"), name);
+-            }
+-          break;
+-        }
+-#endif
+       else
+         break;
+ 
+diff --git a/tests/ls/removed-directory.sh b/tests/ls/removed-directory.sh
+index e8c835dab..fe8f929a1 100755
+--- a/tests/ls/removed-directory.sh
++++ b/tests/ls/removed-directory.sh
+@@ -26,20 +26,14 @@ case $host_triplet in
+   *) skip_ 'non linux kernel' ;;
+ esac
+ 
+-LS_FAILURE=2
+-
+-cat <<\EOF >exp-err || framework_failure_
+-ls: reading directory '.': No such file or directory
+-EOF
+-
+ cwd=$(pwd)
+ mkdir d || framework_failure_
+ cd d || framework_failure_
+ rmdir ../d || framework_failure_
+ 
+-returns_ $LS_FAILURE ls >../out 2>../err || fail=1
++ls >../out 2>../err || fail=1
+ cd "$cwd" || framework_failure_
+ compare /dev/null out || fail=1
+-compare exp-err err || fail=1
++compare /dev/null err || fail=1
+ 
+ Exit $fail
+-- 
+2.17.1
+
diff --git a/package/coreutils/0001-strtod_fix_clash_with_strtold.patch b/package/coreutils/0001-strtod_fix_clash_with_strtold.patch
deleted file mode 100644
index 7033d3b856..0000000000
--- a/package/coreutils/0001-strtod_fix_clash_with_strtold.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 0562b040fa17f1722ba2b3096067b45d0582ca53 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 11 Mar 2019 16:40:29 -0700
-Subject: [PATCH] strtod: fix clash with strtold
-
-Problem reported for RHEL 5 by Jesse Caldwell (Bug#34817).
-* lib/strtod.c (compute_minus_zero, minus_zero):
-Simplify by remving the macro / external variable,
-and having just a function.  User changed.  This avoids
-the need for an external variable that might clash.
-
-Upstream-Status: Backport [rhel5]
-
-Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-
-Downloaded from
-http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
-
-This patch was committed to gnulib:
-http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=patch;h=3bd82a82cf4ba693d2c31c7b95aaec4e56dc92a4
-and will be included in the next release of coreutils.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ChangeLog    |  9 +++++++++
- lib/strtod.c | 11 +++++------
- 2 files changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/lib/strtod.c b/lib/strtod.c
-index b9eaa51b4..69b1564e1 100644
---- a/lib/strtod.c
-+++ b/lib/strtod.c
-@@ -294,16 +294,15 @@ parse_number (const char *nptr,
-    ICC 10.0 has a bug when optimizing the expression -zero.
-    The expression -MIN * MIN does not work when cross-compiling
-    to PowerPC on Mac OS X 10.5.  */
--#if defined __hpux || defined __sgi || defined __ICC
- static DOUBLE
--compute_minus_zero (void)
-+minus_zero (void)
- {
-+#if defined __hpux || defined __sgi || defined __ICC
-   return -MIN * MIN;
--}
--# define minus_zero compute_minus_zero ()
- #else
--DOUBLE minus_zero = -0.0;
-+  return -0.0;
- #endif
-+}
- 
- /* Convert NPTR to a DOUBLE.  If ENDPTR is not NULL, a pointer to the
-    character after the last one used in the number is put in *ENDPTR.  */
-@@ -479,6 +478,6 @@ STRTOD (const char *nptr, char **endptr)
-   /* Special case -0.0, since at least ICC miscompiles negation.  We
-      can't use copysign(), as that drags in -lm on some platforms.  */
-   if (!num && negative)
--    return minus_zero;
-+    return minus_zero ();
-   return negative ? -num : num;
- }
--- 
-2.20.1
-
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 31dfbd73a9..54cdf4c551 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd  coreutils-8.31.tar.xz
+sha256 4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa  coreutils-8.32.tar.xz
 # Locally computed
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index c1420b2602..3866b76243 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.31
+COREUTILS_VERSION = 8.32
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.17.1
