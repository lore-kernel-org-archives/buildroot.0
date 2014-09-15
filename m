From: Maarten ter Huurne <maarten@treewalker.org>
Date: Mon, 15 Sep 2014 04:39:49 +0200
Subject: [Buildroot] [PATCH] screen: bump to version 4.2.1
Message-ID: <1410748789-4094-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I re-did the patches: one patch per change, patch configure.in instead
of the configure script itself, a few more issues fixed. This should
hopefully make the patches acceptable for upstream, or at least make it
easier to migrate them on version bumps.

This also fixes compilation with musl libc.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
Patches have been submitted upstream as well:
https://savannah.gnu.org/bugs/?43222 (0002)
https://savannah.gnu.org/bugs/?43223 (0001,0003-0005)
https://savannah.gnu.org/bugs/?43224 (0006-0009)
https://savannah.gnu.org/bugs/?43225 (0010)

 .../screen-0001-compiler-sanity-checks.patch       |  60 +++
 .../screen/screen-0002-no-memcpy-fallback.patch    | 122 +++++
 .../screen-0003-cross-compilation-AC_TRY_RUN.patch | 123 +++++
 ...een-0004-cross-compilation-ignore-host-fs.patch | 130 +++++
 .../screen-0005-avoid-identifying-as-SVR4.patch    |  52 ++
 .../screen-0006-install-no-backup-binary.patch     |  39 ++
 .../screen/screen-0007-install-always-chmod.patch  |  29 ++
 .../screen-0008-install-nonversioned-binary.patch  |  31 ++
 .../screen-0009-install-dir-dependency.patch       |  43 ++
 package/screen/screen-0010-rename-sched_h.patch    | 142 ++++++
 package/screen/screen-cross_compile_fix.patch      | 524 ---------------------
 package/screen/screen-install-fix.patch            |  21 -
 package/screen/screen.mk                           |   8 +-
 13 files changed, 775 insertions(+), 549 deletions(-)
 create mode 100644 package/screen/screen-0001-compiler-sanity-checks.patch
 create mode 100644 package/screen/screen-0002-no-memcpy-fallback.patch
 create mode 100644 package/screen/screen-0003-cross-compilation-AC_TRY_RUN.patch
 create mode 100644 package/screen/screen-0004-cross-compilation-ignore-host-fs.patch
 create mode 100644 package/screen/screen-0005-avoid-identifying-as-SVR4.patch
 create mode 100644 package/screen/screen-0006-install-no-backup-binary.patch
 create mode 100644 package/screen/screen-0007-install-always-chmod.patch
 create mode 100644 package/screen/screen-0008-install-nonversioned-binary.patch
 create mode 100644 package/screen/screen-0009-install-dir-dependency.patch
 create mode 100644 package/screen/screen-0010-rename-sched_h.patch
 delete mode 100644 package/screen/screen-cross_compile_fix.patch
 delete mode 100644 package/screen/screen-install-fix.patch

diff --git a/package/screen/screen-0001-compiler-sanity-checks.patch b/package/screen/screen-0001-compiler-sanity-checks.patch
new file mode 100644
index 0000000..19d13c6
--- /dev/null
+++ b/package/screen/screen-0001-compiler-sanity-checks.patch
@@ -0,0 +1,60 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Sat, 13 Sep 2014 10:27:27 +0200
+Subject: Removed redundant compiler sanity checks
+
+AC_PROG_CC already performs sanity checks. And unlike the removed
+checks, it does so in a way that supports cross compilation.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ configure.in | 27 ---------------------------
+ 1 file changed, 27 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 87fd43b..572c2a3 100644
+--- a/configure.in
++++ b/configure.in
+@@ -47,31 +47,6 @@ AC_PROG_GCC_TRADITIONAL
+ AC_ISC_POSIX
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+-AC_TRY_RUN(main(){exit(0);},,[
+-if test $CC != cc ; then
+-AC_NOTE(Your $CC failed - restarting with CC=cc)
+-AC_NOTE()
+-CC=cc
+-export CC
+-exec $0 $configure_args
+-fi
+-])
+-
+-AC_TRY_RUN(main(){exit(0);},,
+-exec 5>&2
+-eval $ac_link
+-AC_NOTE(CC=$CC; CFLAGS=$CFLAGS; LIBS=$LIBS;)
+-AC_NOTE($ac_compile)
+-AC_MSG_ERROR(Can't run the compiler - sorry))
+-
+-AC_TRY_RUN([
+-main()
+-{
+-  int __something_strange_();
+-  __something_strange_(0);
+-}
+-],AC_MSG_ERROR(Your compiler does not set the exit status - sorry))
+-
+ AC_PROG_AWK
+ 
+ AC_PROG_INSTALL
+@@ -1299,8 +1274,6 @@ fi
+ dnl Ptx bug workaround -- insert -lc after -ltermcap
+ test -n "$seqptx" && LIBS="-ltermcap -lc -lsocket -linet -lnsl -lsec -lseq"
+ 
+-AC_TRY_RUN(main(){exit(0);},,AC_MSG_ERROR(Can't run the compiler - internal error. Sorry.))
+-
+ ETCSCREENRC=
+ AC_MSG_CHECKING(for the global screenrc file)
+ AC_ARG_WITH(sys-screenrc, [  --with-sys-screenrc=path to the global screenrc file], [ ETCSCREENRC="${withval}" ])
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0002-no-memcpy-fallback.patch b/package/screen/screen-0002-no-memcpy-fallback.patch
new file mode 100644
index 0000000..0f5a099
--- /dev/null
+++ b/package/screen/screen-0002-no-memcpy-fallback.patch
@@ -0,0 +1,122 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Sat, 13 Sep 2014 11:37:59 +0200
+Subject: Do not use memcpy as an alternative for bcopy/memmove
+
+The configure script runs a small test program to check whether
+memcpy can handle overlapping memory areas. However, it is not valid
+to conclude that if a single case of overlapping memory is handled
+correctly, all cases will be handled correctly.
+
+Since screen already has its own bcopy implementation as a fallback
+for the case that bcopy and memmove are unusable, removing the memcpy
+option should not break any systems.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ acconfig.h   |  3 +--
+ configure.in | 18 +-----------------
+ os.h         |  8 ++------
+ osdef.h.in   | 10 +---------
+ 4 files changed, 5 insertions(+), 34 deletions(-)
+
+diff --git a/acconfig.h b/acconfig.h
+index 2e46985..9b0b9d4 100644
+--- a/acconfig.h
++++ b/acconfig.h
+@@ -476,7 +476,7 @@
+ #undef GETTTYENT
+ 
+ /*
+- * Define USEBCOPY if the bcopy/memcpy from your system's C library
++ * Define USEBCOPY if the bcopy from your system's C library
+  * supports the overlapping of source and destination blocks.  When
+  * undefined, screen uses its own (probably slower) version of bcopy().
+  * 
+@@ -487,7 +487,6 @@
+  * Their memove fails the test in the configure script. Sigh. (Juergen)
+  */
+ #undef USEBCOPY
+-#undef USEMEMCPY
+ #undef USEMEMMOVE
+ 
+ /*
+diff --git a/configure.in b/configure.in
+index 572c2a3..ff9606d 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1144,7 +1144,7 @@ AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
+ AC_CHECKING(fdwalk)
+ AC_TRY_LINK([#include <stdlib.h>], [fdwalk(NULL, NULL);],AC_DEFINE(HAVE_FDWALK))
+ 
+-AC_CHECKING(whether memcpy/memmove/bcopy handles overlapping arguments)
++AC_CHECKING(whether memmove/bcopy handles overlapping arguments)
+ AC_TRY_RUN([
+ main() {
+   char buf[10];
+@@ -1174,22 +1174,6 @@ main() {
+   exit(0); /* libc version works properly.  */
+ }], AC_DEFINE(USEMEMMOVE))
+ 
+-
+-AC_TRY_RUN([
+-#define bcopy(s,d,l) memcpy(d,s,l)
+-main() {
+-  char buf[10];
+-  strcpy(buf, "abcdefghi");
+-  bcopy(buf, buf + 2, 3);
+-  if (strncmp(buf, "ababcf", 6))
+-    exit(1);
+-  strcpy(buf, "abcdefghi");
+-  bcopy(buf + 2, buf, 3);
+-  if (strncmp(buf, "cdedef", 6))
+-    exit(1);
+-  exit(0); /* libc version works properly.  */
+-}], AC_DEFINE(USEMEMCPY))
+-
+ AC_SYS_LONG_FILE_NAMES
+ 
+ AC_MSG_CHECKING(for vsprintf)
+diff --git a/os.h b/os.h
+index 55de249..6838ec0 100644
+--- a/os.h
++++ b/os.h
+@@ -142,12 +142,8 @@ extern int errno;
+ # ifdef USEMEMMOVE
+ #  define bcopy(s,d,len) memmove(d,s,len)
+ # else
+-#  ifdef USEMEMCPY
+-#   define bcopy(s,d,len) memcpy(d,s,len)
+-#  else
+-#   define NEED_OWN_BCOPY
+-#   define bcopy xbcopy
+-#  endif
++#  define NEED_OWN_BCOPY
++#  define bcopy xbcopy
+ # endif
+ #endif
+ 
+diff --git a/osdef.h.in b/osdef.h.in
+index 8687b60..e4057a0 100644
+--- a/osdef.h.in
++++ b/osdef.h.in
+@@ -58,16 +58,8 @@ extern int   bcmp __P((char *, char *, int));
+ extern int   killpg __P((int, int));
+ #endif
+ 
+-#ifndef USEBCOPY
+-# ifdef USEMEMCPY
+-extern void  memcpy __P((char *, char *, int));
+-# else
+-#  ifdef USEMEMMOVE
++#if defined(USEMEMMOVE) && !defined(USEBCOPY)
+ extern void  memmove __P((char *, char *, int));
+-#  else
+-extern void  bcopy __P((char *, char *, int));
+-#  endif
+-# endif
+ #else
+ extern void  bcopy __P((char *, char *, int));
+ #endif
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0003-cross-compilation-AC_TRY_RUN.patch b/package/screen/screen-0003-cross-compilation-AC_TRY_RUN.patch
new file mode 100644
index 0000000..b908301
--- /dev/null
+++ b/package/screen/screen-0003-cross-compilation-AC_TRY_RUN.patch
@@ -0,0 +1,123 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Sat, 13 Sep 2014 12:04:41 +0200
+Subject: Provide cross compilation alternatives for all AC_TRY_RUN uses
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ configure.in | 30 +++++++++++++++++++-----------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ff9606d..d53a079 100644
+--- a/configure.in
++++ b/configure.in
+@@ -347,7 +347,8 @@ main()
+   exit(0);
+ }
+ ], AC_NOTE(- your fifos are usable) fifo=1,
+-AC_NOTE(- your fifos are not usable))
++AC_NOTE(- your fifos are not usable),
++AC_NOTE(- skipping check because we are cross compiling; assuming fifos are usable) fifo=1)
+ rm -f /tmp/conftest*
+ 
+ if test -n "$fifo"; then
+@@ -395,7 +396,8 @@ main()
+   exit(0);
+ }
+ ], AC_NOTE(- your implementation is ok), 
+-AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1)
++AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1,
++AC_NOTE(- skipping check because we are cross compiling; assuming fifo implementation is ok))
+ rm -f /tmp/conftest*
+ fi
+ 
+@@ -457,7 +459,8 @@ main()
+   exit(0);
+ }
+ ], AC_NOTE(- your sockets are usable) sock=1,
+-AC_NOTE(- your sockets are not usable))
++AC_NOTE(- your sockets are not usable),
++AC_NOTE(- skipping check because we are cross compiling; assuming sockets are usable) sock=1)
+ rm -f /tmp/conftest*
+ 
+ if test -n "$sock"; then
+@@ -496,7 +499,8 @@ main()
+ }
+ ],AC_NOTE(- you are normal),
+ AC_NOTE(- unix domain sockets are not kept in the filesystem)
+-AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1)
++AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1,
++AC_NOTE(- skipping check because we are cross compiling; assuming sockets are normal))
+ rm -f /tmp/conftest*
+ fi
+ 
+@@ -623,7 +627,8 @@ main()
+   exit(0);
+ }
+ ],AC_NOTE(- select is ok),
+-AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN))
++AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN),
++AC_NOTE(- skipping check because we are cross compiling; assuming select is ok))
+ 
+ dnl
+ dnl    ****  termcap or terminfo  ****
+@@ -665,7 +670,8 @@ main()
+ {
+  exit(strcmp(tgoto("%p1%d", 0, 1), "1") ? 0 : 1);
+ }], AC_NOTE(- you use the termcap database),
+-AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO))
++AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO),
++AC_NOTE(- skipping check because we are cross compiling; assuming terminfo database is used) AC_DEFINE(TERMINFO))
+ AC_CHECKING(ospeed)
+ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
+ 
+@@ -800,7 +806,8 @@ main()
+     else
+       AC_NOTE(- can't determine - assume ptys are world accessable)
+     fi
+-  ]
++  ],
++  AC_NOTE(- skipping check because we are cross compiling; assuming ptys are world accessable)
+ )
+ rm -f conftest_grp
+ fi
+@@ -884,7 +891,7 @@ AC_EGREP_CPP(yes,
+ #endif
+ ], load=1)
+ fi
+-if test -z "$load" ; then
++if test -z "$load" && test "$cross_compiling" = no ; then
+ AC_CHECKING(for kernelfile)
+ for core in /unix /vmunix /dynix /hp-ux /xelos /dev/ksyms /kernel/unix /kernel/genunix /unicos /mach /netbsd /386bsd /dgux /bsd /stand/vmunix; do
+   if test -f $core || test -c $core; then
+@@ -1077,7 +1084,7 @@ main()
+ #endif
+   exit(0);
+ }
+-],,AC_DEFINE(SYSVSIGS))
++],,AC_DEFINE(SYSVSIGS),:)
+ 
+ fi
+ 
+@@ -1157,7 +1164,7 @@ main() {
+   if (strncmp(buf, "cdedef", 6))
+     exit(1);
+   exit(0); /* libc version works properly.  */
+-}], AC_DEFINE(USEBCOPY))
++}], AC_DEFINE(USEBCOPY),,:)
+ 
+ AC_TRY_RUN([
+ #define bcopy(s,d,l) memmove(d,s,l)
+@@ -1172,7 +1179,8 @@ main() {
+   if (strncmp(buf, "cdedef", 6))
+     exit(1);
+   exit(0); /* libc version works properly.  */
+-}], AC_DEFINE(USEMEMMOVE))
++}], AC_DEFINE(USEMEMMOVE),,
++  AC_NOTE(- skipping check because we are cross compiling; use memmove) AC_DEFINE(USEMEMMOVE))
+ 
+ AC_SYS_LONG_FILE_NAMES
+ 
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0004-cross-compilation-ignore-host-fs.patch b/package/screen/screen-0004-cross-compilation-ignore-host-fs.patch
new file mode 100644
index 0000000..aeacfb1
--- /dev/null
+++ b/package/screen/screen-0004-cross-compilation-ignore-host-fs.patch
@@ -0,0 +1,130 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Sun, 14 Sep 2014 07:10:59 +0200
+Subject: When cross-compiling, skip checks that look in the host file system
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ configure.in | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index d53a079..79aa56d 100644
+--- a/configure.in
++++ b/configure.in
+@@ -84,7 +84,7 @@ AC_ARG_ENABLE(socket-dir,
+ dnl
+ dnl    ****  special unix variants  ****
+ dnl
+-if test -n "$ISC"; then
++if test "$cross_compiling" = no && test -n "$ISC" ; then
+   AC_DEFINE(ISC) LIBS="$LIBS -linet"
+ fi
+ 
+@@ -95,10 +95,11 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
+ dnl fi
+ dnl fi
+ 
+-if test -f /sysV68 ; then
++if test "$cross_compiling" = no && test -f /sysV68 ; then
+ AC_DEFINE(sysV68)
+ fi
+ 
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for MIPS)
+ if test -f /lib/libmld.a || test -f /usr/lib/libmld.a || test -f /usr/lib/cmplrs/cc/libmld.a; then
+ oldlibs="$LIBS"
+@@ -122,6 +123,7 @@ AC_DEFINE(USE_WAIT2) LIBS="$LIBS -lbsd" ; CC="$CC -I/usr/include/bsd"
+ ))
+ fi
+ fi
++fi
+ 
+ 
+ AC_CHECKING(for Ultrix)
+@@ -131,7 +133,7 @@ AC_EGREP_CPP(yes,
+ #endif
+ ], ULTRIX=1)
+ 
+-if test -f /usr/lib/libpyr.a ; then
++if test "$cross_compiling" = no && test -f /usr/lib/libpyr.a ; then
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lpyr"
+ AC_CHECKING(Pyramid OSX)
+@@ -678,17 +680,21 @@ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
+ dnl
+ dnl    ****  PTY specific things  ****
+ dnl
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for /dev/ptc)
+ if test -r /dev/ptc; then
+ AC_DEFINE(HAVE_DEV_PTC)
+ fi
++fi
+ 
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for SVR4 ptys)
+ sysvr4ptys=
+ if test -c /dev/ptmx ; then
+ AC_TRY_LINK([],[ptsname(0);grantpt(0);unlockpt(0);],[AC_DEFINE(HAVE_SVR4_PTYS)
+ sysvr4ptys=1])
+ fi
++fi
+ 
+ AC_CHECK_FUNCS(getpt)
+ 
+@@ -698,6 +704,7 @@ AC_CHECK_FUNCS(openpty,,
+ [AC_CHECK_LIB(util,openpty, [AC_DEFINE(HAVE_OPENPTY)] [LIBS="$LIBS -lutil"])])
+ fi
+ 
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for ptyranges)
+ if test -d /dev/ptym ; then
+ pdir='/dev/ptym'
+@@ -721,6 +728,7 @@ p1=`echo $ptys | tr ' ' '\012' | sed -e 's/^.*\(.\)$/\1/g'  | sort -u | tr -d '\
+ AC_DEFINE_UNQUOTED(PTYRANGE0,"$p0")
+ AC_DEFINE_UNQUOTED(PTYRANGE1,"$p1")
+ fi
++fi
+ 
+ dnl    ****  pty mode/group handling ****
+ dnl
+@@ -868,14 +876,16 @@ fi
+ dnl
+ dnl    ****  loadav  ****
+ dnl
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for libutil(s))
+ test -f /usr/lib/libutils.a && LIBS="$LIBS -lutils"
+ test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
++fi
+ 
+ AC_CHECKING(getloadavg)
+ AC_TRY_LINK(,[getloadavg((double *)0, 0);],
+ AC_DEFINE(LOADAV_GETLOADAVG) load=1,
+-if test -f /usr/lib/libkvm.a ; then
++if test "$cross_compiling" = no && test -f /usr/lib/libkvm.a ; then
+ olibs="$LIBS"
+ LIBS="$LIBS -lkvm"
+ AC_CHECKING(getloadavg with -lkvm)
+@@ -1093,13 +1103,18 @@ dnl    ****  libraries  ****
+ dnl
+ 
+ AC_CHECKING(for crypt and sec libraries)
++if test "$cross_compiling" = no ; then
+ test -f /lib/libcrypt_d.a || test -f /usr/lib/libcrypt_d.a && LIBS="$LIBS -lcrypt_d"
++fi
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lcrypt"
+ AC_CHECKING(crypt)
+ AC_TRY_LINK(,,,LIBS="$oldlibs")
++if test "$cross_compiling" = no ; then
+ test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
+ test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
++fi
++
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lsun"
+ AC_CHECKING(IRIX sun library)
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0005-avoid-identifying-as-SVR4.patch b/package/screen/screen-0005-avoid-identifying-as-SVR4.patch
new file mode 100644
index 0000000..10c08d2
--- /dev/null
+++ b/package/screen/screen-0005-avoid-identifying-as-SVR4.patch
@@ -0,0 +1,52 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Sun, 14 Sep 2014 11:16:58 +0200
+Subject: Avoid mis-identifying systems as SVR4
+
+My openSUSE 13.1 Linux system was detected as SVR4 because it had
+libelf installed. This leads to linking with libelf, even though no
+symbols from that library were actually used, and to a workaround for
+a buggy getlogin() being enabled.
+
+It is not documented which exact SVR4 system had the bug that the
+workaround was added for, so all I could do is make an educated guess
+at the #defines its compiler would be likely to set.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ configure.in | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index f78f81f..181b7f9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -178,14 +178,24 @@ AC_EGREP_CPP(yes,
+ #endif
+ ], LIBS="$LIBS -lsocket -linet";seqptx=1)
+ 
++AC_CHECKING(SVR4)
++AC_EGREP_CPP(yes,
++[main () {
++#if defined(SVR4) || defined(__SVR4)
++  yes;
++#endif
++], AC_NOTE(- you have a SVR4 system) AC_DEFINE(SVR4) svr4=1)
++if test -n "$svr4" ; then
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lelf"
+ AC_CHECKING(SVR4)
+ AC_TRY_LINK([#include <utmpx.h>
+ ],,
+-[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN),
+-[AC_CHECK_HEADER(elf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN))])]
++[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(BUGGYGETLOGIN),
++[AC_CHECK_HEADER(elf.h, AC_DEFINE(BUGGYGETLOGIN))])]
+ ,LIBS="$oldlibs")
++fi
++
+ AC_CHECK_HEADERS([stropts.h string.h strings.h])
+ 
+ AC_CHECKING(for Solaris 2.x)
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0006-install-no-backup-binary.patch b/package/screen/screen-0006-install-no-backup-binary.patch
new file mode 100644
index 0000000..504862a
--- /dev/null
+++ b/package/screen/screen-0006-install-no-backup-binary.patch
@@ -0,0 +1,39 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Sun, 14 Sep 2014 23:58:34 +0200
+Subject: Do not create backup of old installed binary
+
+This is a rather unusual feature that packagers will not expect.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ Makefile.in | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 187a69b..65549e9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -83,12 +83,9 @@ screen: $(OFILES)
+ 	    $(OPTIONS) $(CFLAGS) $<
+ 
+ install_bin: .version screen
+-	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
+-		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
+ 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
+ 	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
+ # This doesn't work if $(bindir)/screen is a symlink
+-	-if [ -f $(DESTDIR)$(bindir)/screen ] && [ ! -f $(DESTDIR)$(bindir)/screen.old ]; then mv $(DESTDIR)$(bindir)/screen $(DESTDIR)$(bindir)/screen.old; fi
+ 	rm -f $(DESTDIR)$(bindir)/screen
+ 	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
+ 	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
+@@ -113,7 +110,6 @@ installdirs:
+ uninstall: .version
+ 	rm -f $(DESTDIR)$(bindir)/$(SCREEN)
+ 	rm -f $(DESTDIR)$(bindir)/screen
+-	-mv $(DESTDIR)$(bindir)/screen.old $(DESTDIR)$(bindir)/screen
+ 	rm -f $(DESTDIR)$(ETCSCREENRC)
+ 	cd doc; $(MAKE) uninstall
+ 
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0007-install-always-chmod.patch b/package/screen/screen-0007-install-always-chmod.patch
new file mode 100644
index 0000000..0aa7690
--- /dev/null
+++ b/package/screen/screen-0007-install-always-chmod.patch
@@ -0,0 +1,29 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Mon, 15 Sep 2014 00:03:05 +0200
+Subject: Change binary permission flags even if chown fails
+
+Typically when creating a package, the build is not run as root, so
+the chown will fail. But the chmod can still be done.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 65549e9..3c12fdb 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -84,7 +84,8 @@ screen: $(OFILES)
+ 
+ install_bin: .version screen
+ 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
+-	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
++	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
++	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
+ # This doesn't work if $(bindir)/screen is a symlink
+ 	rm -f $(DESTDIR)$(bindir)/screen
+ 	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0008-install-nonversioned-binary.patch b/package/screen/screen-0008-install-nonversioned-binary.patch
new file mode 100644
index 0000000..ecbbd65
--- /dev/null
+++ b/package/screen/screen-0008-install-nonversioned-binary.patch
@@ -0,0 +1,31 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Mon, 15 Sep 2014 00:06:20 +0200
+Subject: Support overriding SCREEN to get a non-versioned binary
+
+If a packager runs "make install SCREEN=screen", do not create
+"screen" as a symlink to itself.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ Makefile.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3c12fdb..860f351 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -86,9 +86,11 @@ install_bin: .version screen
+ 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
+ 	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
+ 	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
++ifneq (${SCREEN},screen)
+ # This doesn't work if $(bindir)/screen is a symlink
+ 	rm -f $(DESTDIR)$(bindir)/screen
+ 	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
++endif
+ 	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
+ 
+ ###############################################################################
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0009-install-dir-dependency.patch b/package/screen/screen-0009-install-dir-dependency.patch
new file mode 100644
index 0000000..9016cb9
--- /dev/null
+++ b/package/screen/screen-0009-install-dir-dependency.patch
@@ -0,0 +1,43 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Mon, 15 Sep 2014 02:27:09 +0200
+Subject: Ensure that installation dirs exist before copying files into them
+
+Since the "install_bin" target requires the installation directories
+to exist, it should depend on the "installdirs" target. The previous
+approach of having "install" depend on "installdirs" is not reliable.
+
+For example, in a parallel build, there was no guarantee that
+"installdirs" would be finished before "install_bin" runs. Also if
+the user requested only "install_bin" to be made, "installdirs" would
+be skipped altogether.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 860f351..f0fe08d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -82,7 +82,7 @@ screen: $(OFILES)
+ 	$(CC) -c -I. -I$(srcdir) $(M_CFLAGS) $(CPPFLAGS) $(DEFS) \
+ 	    $(OPTIONS) $(CFLAGS) $<
+ 
+-install_bin: .version screen
++install_bin: .version screen installdirs
+ 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
+ 	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
+ 	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
+@@ -94,7 +94,7 @@ endif
+ 	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
+ 
+ ###############################################################################
+-install: installdirs install_bin
++install: install_bin
+ 	cd doc ; $(MAKE) install
+ 	-if [ -d /usr/lib/terminfo ]; then \
+ 		PATH="$$PATH:/usr/5bin" tic ${srcdir}/terminfo/screeninfo.src; \
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-0010-rename-sched_h.patch b/package/screen/screen-0010-rename-sched_h.patch
new file mode 100644
index 0000000..cdbb033
--- /dev/null
+++ b/package/screen/screen-0010-rename-sched_h.patch
@@ -0,0 +1,142 @@
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Mon, 15 Sep 2014 00:24:41 +0200
+Subject: Renamed sched.h to eventqueue.h
+
+There is a <sched.h> system header that got shadowed by "sched.h".
+While Screen itself doesn't include <sched.h>, other system headers
+might include it indirectly. This broke the build when using uClibc
+with pthread support.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ eventqueue.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
+ sched.h      | 48 ------------------------------------------------
+ screen.h     |  2 +-
+ 3 files changed, 49 insertions(+), 49 deletions(-)
+ create mode 100644 eventqueue.h
+ delete mode 100644 sched.h
+
+diff --git a/eventqueue.h b/eventqueue.h
+new file mode 100644
+index 0000000..fdc3fc4
+--- /dev/null
++++ b/eventqueue.h
+@@ -0,0 +1,48 @@
++/* Copyright (c) 2008, 2009
++ *      Juergen Weigert (jnweiger at immd4.informatik.uni-erlangen.de)
++ *      Michael Schroeder (mlschroe at immd4.informatik.uni-erlangen.de)
++ *      Micah Cowan (micah at cowan.name)
++ *      Sadrul Habib Chowdhury (sadrul at users.sourceforge.net)
++ * Copyright (c) 1993-2002, 2003, 2005, 2006, 2007
++ *      Juergen Weigert (jnweiger at immd4.informatik.uni-erlangen.de)
++ *      Michael Schroeder (mlschroe at immd4.informatik.uni-erlangen.de)
++ * Copyright (c) 1987 Oliver Laumann
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 3, or (at your option)
++ * any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program (see the file COPYING); if not, see
++ * http://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
++ * 51 Franklin Street, Fifth Floor, Boston, MA  02111-1301  USA
++ *
++ ****************************************************************
++ * $Id$ GNU
++ */
++
++struct event
++{
++  struct event *next;
++  void (*handler) __P((struct event *, char *));
++  char *data;
++  int fd;
++  int type;
++  int pri;
++  struct timeval timeout;
++  int queued;		/* in evs queue */
++  int active;		/* in fdset */
++  int *condpos;		/* only active if condpos - condneg > 0 */
++  int *condneg;
++};
++
++#define EV_TIMEOUT	0
++#define EV_READ		1
++#define EV_WRITE	2
++#define EV_ALWAYS	3
+diff --git a/sched.h b/sched.h
+deleted file mode 100644
+index fdc3fc4..0000000
+--- a/sched.h
++++ /dev/null
+@@ -1,48 +0,0 @@
+-/* Copyright (c) 2008, 2009
+- *      Juergen Weigert (jnweiger at immd4.informatik.uni-erlangen.de)
+- *      Michael Schroeder (mlschroe at immd4.informatik.uni-erlangen.de)
+- *      Micah Cowan (micah at cowan.name)
+- *      Sadrul Habib Chowdhury (sadrul at users.sourceforge.net)
+- * Copyright (c) 1993-2002, 2003, 2005, 2006, 2007
+- *      Juergen Weigert (jnweiger at immd4.informatik.uni-erlangen.de)
+- *      Michael Schroeder (mlschroe at immd4.informatik.uni-erlangen.de)
+- * Copyright (c) 1987 Oliver Laumann
+- *
+- * This program is free software; you can redistribute it and/or modify
+- * it under the terms of the GNU General Public License as published by
+- * the Free Software Foundation; either version 3, or (at your option)
+- * any later version.
+- *
+- * This program is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- * GNU General Public License for more details.
+- *
+- * You should have received a copy of the GNU General Public License
+- * along with this program (see the file COPYING); if not, see
+- * http://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
+- * 51 Franklin Street, Fifth Floor, Boston, MA  02111-1301  USA
+- *
+- ****************************************************************
+- * $Id$ GNU
+- */
+-
+-struct event
+-{
+-  struct event *next;
+-  void (*handler) __P((struct event *, char *));
+-  char *data;
+-  int fd;
+-  int type;
+-  int pri;
+-  struct timeval timeout;
+-  int queued;		/* in evs queue */
+-  int active;		/* in fdset */
+-  int *condpos;		/* only active if condpos - condneg > 0 */
+-  int *condneg;
+-};
+-
+-#define EV_TIMEOUT	0
+-#define EV_READ		1
+-#define EV_WRITE	2
+-#define EV_ALWAYS	3
+diff --git a/screen.h b/screen.h
+index 603ca3f..34238c8 100644
+--- a/screen.h
++++ b/screen.h
+@@ -43,7 +43,7 @@
+ #include "osdef.h"
+ 
+ #include "ansi.h"
+-#include "sched.h"
++#include "eventqueue.h"
+ #include "acls.h"
+ #include "comm.h"
+ #include "layer.h"
+-- 
+1.8.4.5
+
diff --git a/package/screen/screen-cross_compile_fix.patch b/package/screen/screen-cross_compile_fix.patch
deleted file mode 100644
index 17f05e5..0000000
--- a/package/screen/screen-cross_compile_fix.patch
+++ /dev/null
@@ -1,524 +0,0 @@
---- a/configure.orig	2003-12-05 14:46:53.000000000 +0100
-+++ b/configure	2007-07-28 12:45:19.000000000 +0200
-@@ -124,7 +124,7 @@
-   fi
-   if test ! -f "$as_myself"; then
-     { echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2
--   { (exit 1); exit 1; }; }
-+    }
-   fi
-   case $CONFIG_SHELL in
-   '')
-@@ -174,7 +174,7 @@
-     ' >$as_me.lineno &&
-   chmod +x $as_me.lineno ||
-     { echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2
--   { (exit 1); exit 1; }; }
-+    }
- 
-   # Don't try to exec as it changes $[0], causing all sort of problems
-   # (the dirname of $[0] is not the place where we might find the
-@@ -397,7 +397,7 @@
-     # Reject names that are not valid shell variable names.
-     expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-       { echo "$as_me: error: invalid feature name: $ac_feature" >&2
--   { (exit 1); exit 1; }; }
-+    }
-     ac_feature=`echo $ac_feature | sed 's/-/_/g'`
-     eval "enable_$ac_feature=no" ;;
- 
-@@ -406,7 +406,7 @@
-     # Reject names that are not valid shell variable names.
-     expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-       { echo "$as_me: error: invalid feature name: $ac_feature" >&2
--   { (exit 1); exit 1; }; }
-+    }
-     ac_feature=`echo $ac_feature | sed 's/-/_/g'`
-     case $ac_option in
-       *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
-@@ -588,7 +588,7 @@
-     # Reject names that are not valid shell variable names.
-     expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-       { echo "$as_me: error: invalid package name: $ac_package" >&2
--   { (exit 1); exit 1; }; }
-+    }
-     ac_package=`echo $ac_package| sed 's/-/_/g'`
-     case $ac_option in
-       *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
-@@ -601,7 +601,7 @@
-     # Reject names that are not valid shell variable names.
-     expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-       { echo "$as_me: error: invalid package name: $ac_package" >&2
--   { (exit 1); exit 1; }; }
-+    }
-     ac_package=`echo $ac_package | sed 's/-/_/g'`
-     eval "with_$ac_package=no" ;;
- 
-@@ -625,7 +625,7 @@
- 
-   -*) { echo "$as_me: error: unrecognized option: $ac_option
- Try \`$0 --help' for more information." >&2
--   { (exit 1); exit 1; }; }
-+    }
-     ;;
- 
-   *=*)
-@@ -633,7 +633,7 @@
-     # Reject names that are not valid shell variable names.
-     expr "x$ac_envvar" : ".*[^_$as_cr_alnum]" >/dev/null &&
-       { echo "$as_me: error: invalid variable name: $ac_envvar" >&2
--   { (exit 1); exit 1; }; }
-+    }
-     ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`
-     eval "$ac_envvar='$ac_optarg'"
-     export $ac_envvar ;;
-@@ -652,7 +652,7 @@
- if test -n "$ac_prev"; then
-   ac_option=--`echo $ac_prev | sed 's/_/-/g'`
-   { echo "$as_me: error: missing argument to $ac_option" >&2
--   { (exit 1); exit 1; }; }
-+    }
- fi
- 
- # Be sure to have absolute paths.
-@@ -662,7 +662,7 @@
-   case $ac_val in
-     [\\/$]* | ?:[\\/]* | NONE | '' ) ;;
-     *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
--   { (exit 1); exit 1; }; };;
-+    };;
-   esac
- done
- 
-@@ -674,7 +674,7 @@
-   case $ac_val in
-     [\\/$]* | ?:[\\/]* ) ;;
-     *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
--   { (exit 1); exit 1; }; };;
-+    };;
-   esac
- done
- 
-@@ -728,15 +728,15 @@
- if test ! -r $srcdir/$ac_unique_file; then
-   if test "$ac_srcdir_defaulted" = yes; then
-     { echo "$as_me: error: cannot find sources ($ac_unique_file) in $ac_confdir or .." >&2
--   { (exit 1); exit 1; }; }
-+    }
-   else
-     { echo "$as_me: error: cannot find sources ($ac_unique_file) in $srcdir" >&2
--   { (exit 1); exit 1; }; }
-+    }
-   fi
- fi
- (cd $srcdir && test -r ./$ac_unique_file) 2>/dev/null ||
-   { echo "$as_me: error: sources are in $srcdir, but \`cd $srcdir' does not work" >&2
--   { (exit 1); exit 1; }; }
-+    }
- srcdir=`echo "$srcdir" | sed 's%\([^\\/]\)[\\/]*$%\1%'`
- ac_env_build_alias_set=${build_alias+set}
- ac_env_build_alias_value=$build_alias
-@@ -1243,7 +1243,7 @@
- echo "$as_me: error: changes in the environment can compromise the build" >&2;}
-   { { echo "$as_me:$LINENO: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&5
- echo "$as_me: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- 
- ac_ext=c
-@@ -1734,7 +1734,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: no acceptable C compiler found in \$PATH
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- 
- # Provide some information about the compiler.
- echo "$as_me:$LINENO:" \
-@@ -1856,7 +1856,7 @@
- echo "$as_me: error: cannot run C compiled programs.
- If you meant to cross compile, use \`--host'.
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
-     fi
-   fi
- fi
-@@ -1898,7 +1898,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot compute suffix of executables: cannot compile and link
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- 
- rm -f conftest$ac_cv_exeext
-@@ -1950,7 +1950,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot compute suffix of object files: cannot compile
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- 
- rm -f conftest.$ac_cv_objext conftest.$ac_ext
-@@ -2514,7 +2514,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: C preprocessor \"$CPP\" fails sanity check
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- 
- ac_ext=c
-@@ -2704,7 +2704,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -2753,7 +2753,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+  }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -2790,7 +2790,7 @@
- 
- { { echo "$as_me:$LINENO: error: Can't run the compiler - sorry" >&5
- echo "$as_me: error: Can't run the compiler - sorry" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- rm -f core core.* *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
- fi
-@@ -2800,7 +2800,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+  }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -2830,7 +2830,7 @@
-   (exit $ac_status); }; }; then
-   { { echo "$as_me:$LINENO: error: Your compiler does not set the exit status - sorry" >&5
- echo "$as_me: error: Your compiler does not set the exit status - sorry" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   echo "$as_me: program exited with status $ac_status" >&5
- echo "$as_me: failed program was:" >&5
-@@ -2900,7 +2900,7 @@
- if test -z "$ac_aux_dir"; then
-   { { echo "$as_me:$LINENO: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&5
- echo "$as_me: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- ac_config_guess="$SHELL $ac_aux_dir/config.guess"
- ac_config_sub="$SHELL $ac_aux_dir/config.sub"
-@@ -4149,7 +4149,7 @@
- 
- { { echo "$as_me:$LINENO: error: !!! no select - no screen" >&5
- echo "$as_me: error: !!! no select - no screen" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
- 
-@@ -4163,7 +4163,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+  }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -4272,7 +4272,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+  }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -4365,7 +4365,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+  }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -4460,7 +4460,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+  }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -4562,7 +4562,7 @@
- else
-   { { echo "$as_me:$LINENO: error: you have neither usable sockets nor usable pipes -> no screen" >&5
- echo "$as_me: error: you have neither usable sockets nor usable pipes -> no screen" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- 
- 
-@@ -4573,7 +4573,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -4898,7 +4898,7 @@
- 
- { { echo "$as_me:$LINENO: error: !!! no tgetent - no screen" >&5
- echo "$as_me: error: !!! no tgetent - no screen" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
- fi
-@@ -4915,7 +4915,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -5359,7 +5359,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -6206,7 +6206,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -6482,7 +6482,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -6598,8 +6598,6 @@
- LIBS="$oldlibs"
- fi
- rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
--test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
--test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
- oldlibs="$LIBS"
- LIBS="$LIBS -lsun"
- { echo "$as_me:$LINENO: checking IRIX sun library..." >&5
-@@ -7004,7 +7002,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -7056,7 +7054,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -7110,7 +7108,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -7951,7 +7949,7 @@
- See \`config.log' for more details." >&5
- echo "$as_me: error: cannot run test program while cross compiling
- See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- else
-   cat >conftest.$ac_ext <<_ACEOF
- #line $LINENO "configure"
-@@ -7982,7 +7980,7 @@
- ( exit $ac_status )
- { { echo "$as_me:$LINENO: error: Can't run the compiler - internal error. Sorry." >&5
- echo "$as_me: error: Can't run the compiler - internal error. Sorry." >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- fi
- rm -f core core.* *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
- fi
-@@ -8251,7 +8249,7 @@
-   if test ! -f "$as_myself"; then
-     { { echo "$as_me:$LINENO: error: cannot find myself; rerun with an absolute path" >&5
- echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
-   fi
-   case $CONFIG_SHELL in
-   '')
-@@ -8302,7 +8300,7 @@
-   chmod +x $as_me.lineno ||
-     { { echo "$as_me:$LINENO: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&5
- echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
- 
-   # Don't try to exec as it changes $[0], causing all sort of problems
-   # (the dirname of $[0] is not the place where we might find the
-@@ -8494,7 +8492,7 @@
- Try \`$0 --help' for more information." >&5
- echo "$as_me: error: ambiguous option: $1
- Try \`$0 --help' for more information." >&2;}
--   { (exit 1); exit 1; }; };;
-+    };;
-   --help | --hel | -h )
-     echo "$ac_cs_usage"; exit 0 ;;
-   --debug | --d* | -d )
-@@ -8516,7 +8514,7 @@
- Try \`$0 --help' for more information." >&5
- echo "$as_me: error: unrecognized option: $1
- Try \`$0 --help' for more information." >&2;}
--   { (exit 1); exit 1; }; } ;;
-+    } ;;
- 
-   *) ac_config_targets="$ac_config_targets $1" ;;
- 
-@@ -8555,7 +8553,7 @@
-   "config.h" ) CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
-   *) { { echo "$as_me:$LINENO: error: invalid argument: $ac_config_target" >&5
- echo "$as_me: error: invalid argument: $ac_config_target" >&2;}
--   { (exit 1); exit 1; }; };;
-+    };;
-   esac
- done
- 
-@@ -8750,7 +8748,7 @@
-     test ! -n "$as_dirs" || mkdir $as_dirs
-   fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
- echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
--   { (exit 1); exit 1; }; }; }
-+    }; }
- 
-   ac_builddir=.
- 
-@@ -8816,7 +8814,7 @@
-          # Absolute (can't be DOS-style, as IFS=:)
-          test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
- echo "$as_me: error: cannot find input file: $f" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
-          echo $f;;
-       *) # Relative
-          if test -f "$f"; then
-@@ -8829,7 +8827,7 @@
-            # /dev/null tree
-            { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
- echo "$as_me: error: cannot find input file: $f" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
-          fi;;
-       esac
-     done` || { (exit 1); exit 1; }
-@@ -8907,7 +8905,7 @@
-          # Absolute (can't be DOS-style, as IFS=:)
-          test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
- echo "$as_me: error: cannot find input file: $f" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
-          echo $f;;
-       *) # Relative
-          if test -f "$f"; then
-@@ -8920,7 +8918,7 @@
-            # /dev/null tree
-            { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
- echo "$as_me: error: cannot find input file: $f" >&2;}
--   { (exit 1); exit 1; }; }
-+    }
-          fi;;
-       esac
-     done` || { (exit 1); exit 1; }
-@@ -9073,7 +9071,7 @@
-     test ! -n "$as_dirs" || mkdir $as_dirs
-   fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
- echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
--   { (exit 1); exit 1; }; }; }
-+    }; }
- 
-       rm -f $ac_file
-       mv $tmp/config.h $ac_file
---- a/pty.c.orig	2003-09-08 16:26:18.000000000 +0200
-+++ b/pty.c	2007-07-28 12:45:19.000000000 +0200
-@@ -34,9 +34,9 @@
- #endif
- 
- /* for solaris 2.1, Unixware (SVR4.2) and possibly others */
--#ifdef HAVE_SVR4_PTYS
--# include <sys/stropts.h>
--#endif
-+//#ifdef HAVE_SVR4_PTYS
-+//# include <sys/stropts.h>
-+//#endif
- 
- #if defined(sun) && defined(LOCKPTY) && !defined(TIOCEXCL)
- # include <sys/ttold.h>
---- a/sched.h.orig	2002-01-08 16:42:43.000000000 +0100
-+++ b/sched.h	2007-07-28 12:45:19.000000000 +0200
-@@ -22,6 +22,11 @@
-  * $Id: sched.h,v 1.1.1.1 1993/06/16 23:51:13 jnweiger Exp $ FAU
-  */
- 
-+#ifndef __SCHED_H
-+#define __SCHED_H
-+
-+#include <sys/time.h>
-+
- struct event
- {
-   struct event *next;
-@@ -41,3 +46,5 @@
- #define EV_READ		1
- #define EV_WRITE	2
- #define EV_ALWAYS	3
-+
-+#endif
diff --git a/package/screen/screen-install-fix.patch b/package/screen/screen-install-fix.patch
deleted file mode 100644
index a2fa35d..0000000
--- a/package/screen/screen-install-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -ru screen-4.0.2_vanilla/Makefile.in screen-4.0.2_install-fixup/Makefile.in
---- screen-4.0.2_vanilla/Makefile.in	2003-12-05 13:59:39.000000000 +0000
-+++ screen-4.0.2_install-fixup/Makefile.in	2009-01-03 15:20:22.000000000 +0000
-@@ -71,14 +71,9 @@
- 	$(CC) -c -I. -I$(srcdir) $(M_CFLAGS) $(DEFS) $(OPTIONS) $(CFLAGS) $<
- 
- install_bin: .version screen
--	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
--		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
--	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
--	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
--# This doesn't work if $(bindir)/screen is a symlink
--	-if [ -f $(DESTDIR)$(bindir)/screen ] && [ ! -f $(DESTDIR)$(bindir)/screen.old ]; then mv $(DESTDIR)$(bindir)/screen $(DESTDIR)$(bindir)/screen.old; fi
--	rm -f $(DESTDIR)$(bindir)/screen
--	(cd $(DESTDIR)$(bindir) && ln -sf $(SCREEN) screen)
-+	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/screen
-+	-chmod 4755 $(DESTDIR)$(bindir)/screen
-+	mkdir -p $(DESTDIR)$(SCREENENCODINGS)
- 	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
- 
- ###############################################################################
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 9fd04c7..fd37d88 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.0.3
+SCREEN_VERSION = 4.2.1
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
-SCREEN_LICENSE = GPLv2+
+SCREEN_LICENSE = GPLv3+
 SCREEN_LICENSE_FILES = COPYING
 SCREEN_DEPENDENCIES = ncurses
-SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no \
-	CFLAGS="$(TARGET_CFLAGS) -DTERMINFO"
+SCREEN_AUTORECONF = YES
+SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_MAKE = $(MAKE1)
 SCREEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
-- 
1.8.4.5
