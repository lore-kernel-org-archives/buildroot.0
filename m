From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:36:07 +0200
Subject: [Buildroot] [git commit] package/screen: bump version to 4.7.0
Message-ID: <20191021193207.8C0F483908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=134b9518ff878024553981a461dd5aac40f3ba2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2019-10/msg00000.html

Removed patches applied upstream:

- 0001-compiler-sanity-checks.patch
https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=6b320186db7df1e58fdd2c836af54c86cc596981

- 0003-cross-compilation-AC_TRY_RUN.patch
https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=abba47ce4206506c49858d944e904fff86ae65cc

- 0004-cross-compilation-ignore-host-fs.patch
https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=c573b89139e7a068f5573abd565605bed60f293f

- 0005-avoid-identifying-as-SVR4.patch
https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=ec90292592dd2c9d5c108390841e3df24e377ed5

Rebased 0001-no-memcpy-fallback.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/screen/0001-compiler-sanity-checks.patch   |  62 ----------
 ...allback.patch => 0001-no-memcpy-fallback.patch} |   4 +-
 ...y.patch => 0002-install-no-backup-binary.patch} |   0
 .../screen/0003-cross-compilation-AC_TRY_RUN.patch | 125 -------------------
 ...chmod.patch => 0003-install-always-chmod.patch} |   0
 .../0004-cross-compilation-ignore-host-fs.patch    | 132 ---------------------
 ...atch => 0004-install-nonversioned-binary.patch} |   0
 .../screen/0005-avoid-identifying-as-SVR4.patch    |  54 ---------
 ...ame-sched_h.patch => 0005-rename-sched_h.patch} |   0
 ...tch => 0006-comm-h-now-depends-on-term-h.patch} |   0
 ...mm.h-needed-for-list_-display-generic-.o.patch} |   0
 package/screen/screen.hash                         |   4 +-
 package/screen/screen.mk                           |   2 +-
 13 files changed, 6 insertions(+), 377 deletions(-)

diff --git a/package/screen/0001-compiler-sanity-checks.patch b/package/screen/0001-compiler-sanity-checks.patch
deleted file mode 100644
index fe6c3fdbc1..0000000000
--- a/package/screen/0001-compiler-sanity-checks.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Sat, 13 Sep 2014 10:27:27 +0200
-Subject: Removed redundant compiler sanity checks
-
-AC_PROG_CC already performs sanity checks. And unlike the removed
-checks, it does so in a way that supports cross compilation.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-[Ricardo: rebase on top of 4.3.1]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- configure.ac | 27 ---------------------------
- 1 file changed, 27 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ffe2e37..27690a6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,31 +48,6 @@ AC_PROG_GCC_TRADITIONAL
- AC_ISC_POSIX
- AC_USE_SYSTEM_EXTENSIONS
- 
--AC_TRY_RUN(main(){exit(0);},,[
--if test $CC != cc ; then
--AC_NOTE(Your $CC failed - restarting with CC=cc)
--AC_NOTE()
--CC=cc
--export CC
--exec $0 $configure_args
--fi
--])
--
--AC_TRY_RUN(main(){exit(0);},,
--exec 5>&2
--eval $ac_link
--AC_NOTE(CC=$CC; CFLAGS=$CFLAGS; LIBS=$LIBS;)
--AC_NOTE($ac_compile)
--AC_MSG_ERROR(Can't run the compiler - sorry))
--
--AC_TRY_RUN([
--main()
--{
--  int __something_strange_();
--  __something_strange_(0);
--}
--],AC_MSG_ERROR(Your compiler does not set the exit status - sorry))
--
- AC_PROG_AWK
- 
- AC_PROG_INSTALL
-@@ -1300,8 +1275,6 @@ fi
- dnl Ptx bug workaround -- insert -lc after -ltermcap
- test -n "$seqptx" && LIBS="-ltermcap -lc -lsocket -linet -lnsl -lsec -lseq"
- 
--AC_TRY_RUN(main(){exit(0);},,AC_MSG_ERROR(Can't run the compiler - internal error. Sorry.))
--
- ETCSCREENRC=
- AC_MSG_CHECKING(for the global screenrc file)
- AC_ARG_WITH(sys-screenrc, [  --with-sys-screenrc=path to the global screenrc file], [ ETCSCREENRC="${withval}" ])
--- 
-1.8.4.5
-
diff --git a/package/screen/0002-no-memcpy-fallback.patch b/package/screen/0001-no-memcpy-fallback.patch
similarity index 96%
rename from package/screen/0002-no-memcpy-fallback.patch
rename to package/screen/0001-no-memcpy-fallback.patch
index f3a6a70d2a..2137907199 100644
--- a/package/screen/0002-no-memcpy-fallback.patch
+++ b/package/screen/0001-no-memcpy-fallback.patch
@@ -14,6 +14,8 @@ option should not break any systems.
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 [Ricardo: rebase on top of 4.3.1]
 Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+[Bernd: rebase on top of 4.7.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  acconfig.h   |  3 +--
  configure.ac | 18 +-----------------
@@ -73,7 +75,7 @@ index 27690a6..b8e3bec 100644
 -  if (strncmp(buf, "cdedef", 6))
 -    exit(1);
 -  exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEMEMCPY))
+-}], AC_DEFINE(USEMEMCPY),,:)
 -
  AC_SYS_LONG_FILE_NAMES
  
diff --git a/package/screen/0006-install-no-backup-binary.patch b/package/screen/0002-install-no-backup-binary.patch
similarity index 100%
rename from package/screen/0006-install-no-backup-binary.patch
rename to package/screen/0002-install-no-backup-binary.patch
diff --git a/package/screen/0003-cross-compilation-AC_TRY_RUN.patch b/package/screen/0003-cross-compilation-AC_TRY_RUN.patch
deleted file mode 100644
index eafe3d5ad1..0000000000
--- a/package/screen/0003-cross-compilation-AC_TRY_RUN.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Sat, 13 Sep 2014 12:04:41 +0200
-Subject: Provide cross compilation alternatives for all AC_TRY_RUN uses
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-[Ricardo: rebase on top of 4.3.1]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- configure.ac | 30 +++++++++++++++++++-----------
- 1 file changed, 19 insertions(+), 11 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b8e3bec..c4b7cd4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -348,7 +348,8 @@ main()
-   exit(0);
- }
- ], AC_NOTE(- your fifos are usable) fifo=1,
--AC_NOTE(- your fifos are not usable))
-+AC_NOTE(- your fifos are not usable),
-+AC_NOTE(- skipping check because we are cross compiling; assuming fifos are usable) fifo=1)
- rm -f /tmp/conftest*
- 
- if test -n "$fifo"; then
-@@ -396,7 +397,8 @@ main()
-   exit(0);
- }
- ], AC_NOTE(- your implementation is ok), 
--AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1)
-+AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1,
-+AC_NOTE(- skipping check because we are cross compiling; assuming fifo implementation is ok))
- rm -f /tmp/conftest*
- fi
- 
-@@ -458,7 +460,8 @@ main()
-   exit(0);
- }
- ], AC_NOTE(- your sockets are usable) sock=1,
--AC_NOTE(- your sockets are not usable))
-+AC_NOTE(- your sockets are not usable),
-+AC_NOTE(- skipping check because we are cross compiling; assuming sockets are usable) sock=1)
- rm -f /tmp/conftest*
- 
- if test -n "$sock"; then
-@@ -497,7 +500,8 @@ main()
- }
- ],AC_NOTE(- you are normal),
- AC_NOTE(- unix domain sockets are not kept in the filesystem)
--AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1)
-+AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1,
-+AC_NOTE(- skipping check because we are cross compiling; assuming sockets are normal))
- rm -f /tmp/conftest*
- fi
- 
-@@ -624,7 +628,8 @@ main()
-   exit(0);
- }
- ],AC_NOTE(- select is ok),
--AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN))
-+AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN),
-+AC_NOTE(- skipping check because we are cross compiling; assuming select is ok))
- 
- dnl
- dnl    ****  termcap or terminfo  ****
-@@ -666,7 +671,8 @@ main()
- {
-  exit(strcmp(tgoto("%p1%d", 0, 1), "1") ? 0 : 1);
- }], AC_NOTE(- you use the termcap database),
--AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO))
-+AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO),
-+AC_NOTE(- skipping check because we are cross compiling; assuming terminfo database is used) AC_DEFINE(TERMINFO))
- AC_CHECKING(ospeed)
- AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
- 
-@@ -801,7 +807,8 @@ main()
-     else
-       AC_NOTE(- can't determine - assume ptys are world accessable)
-     fi
--  ]
-+  ],
-+  AC_NOTE(- skipping check because we are cross compiling; assuming ptys are world accessable)
- )
- rm -f conftest_grp
- fi
-@@ -885,7 +892,7 @@ AC_EGREP_CPP(yes,
- #endif
- ], load=1)
- fi
--if test -z "$load" ; then
-+if test -z "$load" && test "$cross_compiling" = no ; then
- AC_CHECKING(for kernelfile)
- for core in /unix /vmunix /dynix /hp-ux /xelos /dev/ksyms /kernel/unix /kernel/genunix /unicos /mach /netbsd /386bsd /dgux /bsd /stand/vmunix; do
-   if test -f $core || test -c $core; then
-@@ -1078,7 +1085,7 @@ main()
- #endif
-   exit(0);
- }
--],,AC_DEFINE(SYSVSIGS))
-+],,AC_DEFINE(SYSVSIGS),:)
- 
- fi
- 
-@@ -1158,7 +1165,7 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEBCOPY))
-+}], AC_DEFINE(USEBCOPY),,:)
- 
- AC_TRY_RUN([
- #define bcopy(s,d,l) memmove(d,s,l)
-@@ -1173,7 +1180,8 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEMEMMOVE))
-+}], AC_DEFINE(USEMEMMOVE),,
-+  AC_NOTE(- skipping check because we are cross compiling; use memmove) AC_DEFINE(USEMEMMOVE))
- 
- AC_SYS_LONG_FILE_NAMES
- 
--- 
-1.8.4.5
-
diff --git a/package/screen/0007-install-always-chmod.patch b/package/screen/0003-install-always-chmod.patch
similarity index 100%
rename from package/screen/0007-install-always-chmod.patch
rename to package/screen/0003-install-always-chmod.patch
diff --git a/package/screen/0004-cross-compilation-ignore-host-fs.patch b/package/screen/0004-cross-compilation-ignore-host-fs.patch
deleted file mode 100644
index fa698ef1f7..0000000000
--- a/package/screen/0004-cross-compilation-ignore-host-fs.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Sun, 14 Sep 2014 07:10:59 +0200
-Subject: When cross-compiling, skip checks that look in the host file system
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-[Ricardo: rebase on top of 4.3.1]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- configure.ac | 23 +++++++++++++++++++----
- 1 file changed, 19 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c4b7cd4..9cf7cee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -85,7 +85,7 @@ AC_ARG_ENABLE(socket-dir,
- dnl
- dnl    ****  special unix variants  ****
- dnl
--if test -n "$ISC"; then
-+if test "$cross_compiling" = no && test -n "$ISC" ; then
-   AC_DEFINE(ISC) LIBS="$LIBS -linet"
- fi
- 
-@@ -96,10 +96,11 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
- dnl fi
- dnl fi
- 
--if test -f /sysV68 ; then
-+if test "$cross_compiling" = no && test -f /sysV68 ; then
- AC_DEFINE(sysV68)
- fi
- 
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for MIPS)
- if test -f /lib/libmld.a || test -f /usr/lib/libmld.a || test -f /usr/lib/cmplrs/cc/libmld.a; then
- oldlibs="$LIBS"
-@@ -123,6 +124,7 @@ AC_DEFINE(USE_WAIT2) LIBS="$LIBS -lbsd" ; CC="$CC -I/usr/include/bsd"
- ))
- fi
- fi
-+fi
- 
- 
- AC_CHECKING(for Ultrix)
-@@ -132,7 +134,7 @@ AC_EGREP_CPP(yes,
- #endif
- ], ULTRIX=1)
- 
--if test -f /usr/lib/libpyr.a ; then
-+if test "$cross_compiling" = no && test -f /usr/lib/libpyr.a ; then
- oldlibs="$LIBS"
- LIBS="$LIBS -lpyr"
- AC_CHECKING(Pyramid OSX)
-@@ -679,17 +681,21 @@ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
- dnl
- dnl    ****  PTY specific things  ****
- dnl
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for /dev/ptc)
- if test -r /dev/ptc; then
- AC_DEFINE(HAVE_DEV_PTC)
- fi
-+fi
- 
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for SVR4 ptys)
- sysvr4ptys=
- if test -c /dev/ptmx ; then
- AC_TRY_LINK([],[ptsname(0);grantpt(0);unlockpt(0);],[AC_DEFINE(HAVE_SVR4_PTYS)
- sysvr4ptys=1])
- fi
-+fi
- 
- AC_CHECK_FUNCS(getpt)
- 
-@@ -699,6 +705,7 @@ AC_CHECK_FUNCS(openpty,,
- [AC_CHECK_LIB(util,openpty, [AC_DEFINE(HAVE_OPENPTY)] [LIBS="$LIBS -lutil"])])
- fi
- 
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for ptyranges)
- if test -d /dev/ptym ; then
- pdir='/dev/ptym'
-@@ -722,6 +729,7 @@ p1=`echo $ptys | tr ' ' '\012' | sed -e 's/^.*\(.\)$/\1/g'  | sort -u | tr -d '\
- AC_DEFINE_UNQUOTED(PTYRANGE0,"$p0")
- AC_DEFINE_UNQUOTED(PTYRANGE1,"$p1")
- fi
-+fi
- 
- dnl    ****  pty mode/group handling ****
- dnl
-@@ -869,14 +877,16 @@ fi
- dnl
- dnl    ****  loadav  ****
- dnl
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for libutil(s))
- test -f /usr/lib/libutils.a && LIBS="$LIBS -lutils"
- test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
-+fi
- 
- AC_CHECKING(getloadavg)
- AC_TRY_LINK(,[getloadavg((double *)0, 0);],
- AC_DEFINE(LOADAV_GETLOADAVG) load=1,
--if test -f /usr/lib/libkvm.a ; then
-+if test "$cross_compiling" = no && test -f /usr/lib/libkvm.a ; then
- olibs="$LIBS"
- LIBS="$LIBS -lkvm"
- AC_CHECKING(getloadavg with -lkvm)
-@@ -1094,13 +1104,18 @@ dnl    ****  libraries  ****
- dnl
- 
- AC_CHECKING(for crypt and sec libraries)
-+if test "$cross_compiling" = no ; then
- test -f /lib/libcrypt_d.a || test -f /usr/lib/libcrypt_d.a && LIBS="$LIBS -lcrypt_d"
-+fi
- oldlibs="$LIBS"
- LIBS="$LIBS -lcrypt"
- AC_CHECKING(crypt)
- AC_TRY_LINK(,,,LIBS="$oldlibs")
-+if test "$cross_compiling" = no ; then
- test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
- test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
-+fi
-+
- oldlibs="$LIBS"
- LIBS="$LIBS -lsun"
- AC_CHECKING(IRIX sun library)
--- 
-1.8.4.5
-
diff --git a/package/screen/0008-install-nonversioned-binary.patch b/package/screen/0004-install-nonversioned-binary.patch
similarity index 100%
rename from package/screen/0008-install-nonversioned-binary.patch
rename to package/screen/0004-install-nonversioned-binary.patch
diff --git a/package/screen/0005-avoid-identifying-as-SVR4.patch b/package/screen/0005-avoid-identifying-as-SVR4.patch
deleted file mode 100644
index 745ef41931..0000000000
--- a/package/screen/0005-avoid-identifying-as-SVR4.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Sun, 14 Sep 2014 11:16:58 +0200
-Subject: Avoid mis-identifying systems as SVR4
-
-My openSUSE 13.1 Linux system was detected as SVR4 because it had
-libelf installed. This leads to linking with libelf, even though no
-symbols from that library were actually used, and to a workaround for
-a buggy getlogin() being enabled.
-
-It is not documented which exact SVR4 system had the bug that the
-workaround was added for, so all I could do is make an educated guess
-at the #defines its compiler would be likely to set.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-[Ricardo: rebase on top of 4.3.1]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9cf7cee..e09e4cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -179,14 +179,24 @@ AC_EGREP_CPP(yes,
- #endif
- ], LIBS="$LIBS -lsocket -linet";seqptx=1)
- 
-+AC_CHECKING(SVR4)
-+AC_EGREP_CPP(yes,
-+[main () {
-+#if defined(SVR4) || defined(__SVR4)
-+  yes;
-+#endif
-+], AC_NOTE(- you have a SVR4 system) AC_DEFINE(SVR4) svr4=1)
-+if test -n "$svr4" ; then
- oldlibs="$LIBS"
- LIBS="$LIBS -lelf"
- AC_CHECKING(SVR4)
- AC_TRY_LINK([#include <utmpx.h>
- ],,
--[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN),
--[AC_CHECK_HEADER(elf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN))])]
-+[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(BUGGYGETLOGIN),
-+[AC_CHECK_HEADER(elf.h, AC_DEFINE(BUGGYGETLOGIN))])]
- ,LIBS="$oldlibs")
-+fi
-+
- AC_CHECK_HEADERS([stropts.h string.h strings.h])
- 
- AC_CHECKING(for Solaris 2.x)
--- 
-1.8.4.5
-
diff --git a/package/screen/0009-rename-sched_h.patch b/package/screen/0005-rename-sched_h.patch
similarity index 100%
rename from package/screen/0009-rename-sched_h.patch
rename to package/screen/0005-rename-sched_h.patch
diff --git a/package/screen/0010-comm-h-now-depends-on-term-h.patch b/package/screen/0006-comm-h-now-depends-on-term-h.patch
similarity index 100%
rename from package/screen/0010-comm-h-now-depends-on-term-h.patch
rename to package/screen/0006-comm-h-now-depends-on-term-h.patch
diff --git a/package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch b/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
similarity index 100%
rename from package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch
rename to package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 0e1613b28a..b09ac34700 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-4.6.2.tar.gz.sig
-sha256 1b6922520e6a0ce5e28768d620b0f640a6631397f95ccb043b70b91bb503fa3a  screen-4.6.2.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-4.7.0.tar.gz.sig
+sha256 da775328fa783bd2a787d722014dbd99c6093effc11f337827604c2efc5d20c1  screen-4.7.0.tar.gz
 # Locally calculated
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 37d43366c2..91aa7c3a7a 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.6.2
+SCREEN_VERSION = 4.7.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
