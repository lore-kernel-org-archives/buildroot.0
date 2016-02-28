From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:19:26 +0100
Subject: [Buildroot] [git commit] screen: bump to version 4.3.1
Message-ID: <20160302202758.AEA267FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7e8994ec380b9aabd74e5c0881158ee47945eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch files 0001 to 0005 were rebased.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/screen/0001-compiler-sanity-checks.patch   | 16 +++++-----
 package/screen/0002-no-memcpy-fallback.patch       | 18 +++++++-----
 .../screen/0003-cross-compilation-AC_TRY_RUN.patch | 34 ++++++++++++----------
 .../0004-cross-compilation-ignore-host-fs.patch    | 30 ++++++++++---------
 .../screen/0005-avoid-identifying-as-SVR4.patch    | 14 +++++----
 package/screen/screen.hash                         |  2 +-
 package/screen/screen.mk                           |  2 +-
 7 files changed, 63 insertions(+), 53 deletions(-)

diff --git a/package/screen/0001-compiler-sanity-checks.patch b/package/screen/0001-compiler-sanity-checks.patch
index 19d13c6..fe6c3fd 100644
--- a/package/screen/0001-compiler-sanity-checks.patch
+++ b/package/screen/0001-compiler-sanity-checks.patch
@@ -6,15 +6,17 @@ AC_PROG_CC already performs sanity checks. And unlike the removed
 checks, it does so in a way that supports cross compilation.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Ricardo: rebase on top of 4.3.1]
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 ---
- configure.in | 27 ---------------------------
+ configure.ac | 27 ---------------------------
  1 file changed, 27 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index 87fd43b..572c2a3 100644
---- a/configure.in
-+++ b/configure.in
-@@ -47,31 +47,6 @@ AC_PROG_GCC_TRADITIONAL
+diff --git a/configure.ac b/configure.ac
+index ffe2e37..27690a6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,31 +48,6 @@ AC_PROG_GCC_TRADITIONAL
  AC_ISC_POSIX
  AC_USE_SYSTEM_EXTENSIONS
  
@@ -46,7 +48,7 @@ index 87fd43b..572c2a3 100644
  AC_PROG_AWK
  
  AC_PROG_INSTALL
-@@ -1299,8 +1274,6 @@ fi
+@@ -1300,8 +1275,6 @@ fi
  dnl Ptx bug workaround -- insert -lc after -ltermcap
  test -n "$seqptx" && LIBS="-ltermcap -lc -lsocket -linet -lnsl -lsec -lseq"
  
diff --git a/package/screen/0002-no-memcpy-fallback.patch b/package/screen/0002-no-memcpy-fallback.patch
index 0f5a099..f3a6a70 100644
--- a/package/screen/0002-no-memcpy-fallback.patch
+++ b/package/screen/0002-no-memcpy-fallback.patch
@@ -12,9 +12,11 @@ for the case that bcopy and memmove are unusable, removing the memcpy
 option should not break any systems.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Ricardo: rebase on top of 4.3.1]
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 ---
  acconfig.h   |  3 +--
- configure.in | 18 +-----------------
+ configure.ac | 18 +-----------------
  os.h         |  8 ++------
  osdef.h.in   | 10 +---------
  4 files changed, 5 insertions(+), 34 deletions(-)
@@ -40,11 +42,11 @@ index 2e46985..9b0b9d4 100644
  #undef USEMEMMOVE
  
  /*
-diff --git a/configure.in b/configure.in
-index 572c2a3..ff9606d 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1144,7 +1144,7 @@ AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
+diff --git a/configure.ac b/configure.ac
+index 27690a6..b8e3bec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1145,7 +1145,7 @@ AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
  AC_CHECKING(fdwalk)
  AC_TRY_LINK([#include <stdlib.h>], [fdwalk(NULL, NULL);],AC_DEFINE(HAVE_FDWALK))
  
@@ -53,7 +55,7 @@ index 572c2a3..ff9606d 100644
  AC_TRY_RUN([
  main() {
    char buf[10];
-@@ -1174,22 +1174,6 @@ main() {
+@@ -1175,22 +1175,6 @@ main() {
    exit(0); /* libc version works properly.  */
  }], AC_DEFINE(USEMEMMOVE))
  
@@ -77,7 +79,7 @@ index 572c2a3..ff9606d 100644
  
  AC_MSG_CHECKING(for vsprintf)
 diff --git a/os.h b/os.h
-index 55de249..6838ec0 100644
+index e827ac9..0b41fb9 100644
 --- a/os.h
 +++ b/os.h
 @@ -142,12 +142,8 @@ extern int errno;
diff --git a/package/screen/0003-cross-compilation-AC_TRY_RUN.patch b/package/screen/0003-cross-compilation-AC_TRY_RUN.patch
index b908301..eafe3d5 100644
--- a/package/screen/0003-cross-compilation-AC_TRY_RUN.patch
+++ b/package/screen/0003-cross-compilation-AC_TRY_RUN.patch
@@ -3,15 +3,17 @@ Date: Sat, 13 Sep 2014 12:04:41 +0200
 Subject: Provide cross compilation alternatives for all AC_TRY_RUN uses
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Ricardo: rebase on top of 4.3.1]
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 ---
- configure.in | 30 +++++++++++++++++++-----------
+ configure.ac | 30 +++++++++++++++++++-----------
  1 file changed, 19 insertions(+), 11 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index ff9606d..d53a079 100644
---- a/configure.in
-+++ b/configure.in
-@@ -347,7 +347,8 @@ main()
+diff --git a/configure.ac b/configure.ac
+index b8e3bec..c4b7cd4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -348,7 +348,8 @@ main()
    exit(0);
  }
  ], AC_NOTE(- your fifos are usable) fifo=1,
@@ -21,7 +23,7 @@ index ff9606d..d53a079 100644
  rm -f /tmp/conftest*
  
  if test -n "$fifo"; then
-@@ -395,7 +396,8 @@ main()
+@@ -396,7 +397,8 @@ main()
    exit(0);
  }
  ], AC_NOTE(- your implementation is ok), 
@@ -31,7 +33,7 @@ index ff9606d..d53a079 100644
  rm -f /tmp/conftest*
  fi
  
-@@ -457,7 +459,8 @@ main()
+@@ -458,7 +460,8 @@ main()
    exit(0);
  }
  ], AC_NOTE(- your sockets are usable) sock=1,
@@ -41,7 +43,7 @@ index ff9606d..d53a079 100644
  rm -f /tmp/conftest*
  
  if test -n "$sock"; then
-@@ -496,7 +499,8 @@ main()
+@@ -497,7 +500,8 @@ main()
  }
  ],AC_NOTE(- you are normal),
  AC_NOTE(- unix domain sockets are not kept in the filesystem)
@@ -51,7 +53,7 @@ index ff9606d..d53a079 100644
  rm -f /tmp/conftest*
  fi
  
-@@ -623,7 +627,8 @@ main()
+@@ -624,7 +628,8 @@ main()
    exit(0);
  }
  ],AC_NOTE(- select is ok),
@@ -61,7 +63,7 @@ index ff9606d..d53a079 100644
  
  dnl
  dnl    ****  termcap or terminfo  ****
-@@ -665,7 +670,8 @@ main()
+@@ -666,7 +671,8 @@ main()
  {
   exit(strcmp(tgoto("%p1%d", 0, 1), "1") ? 0 : 1);
  }], AC_NOTE(- you use the termcap database),
@@ -71,7 +73,7 @@ index ff9606d..d53a079 100644
  AC_CHECKING(ospeed)
  AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
  
-@@ -800,7 +806,8 @@ main()
+@@ -801,7 +807,8 @@ main()
      else
        AC_NOTE(- can't determine - assume ptys are world accessable)
      fi
@@ -81,7 +83,7 @@ index ff9606d..d53a079 100644
  )
  rm -f conftest_grp
  fi
-@@ -884,7 +891,7 @@ AC_EGREP_CPP(yes,
+@@ -885,7 +892,7 @@ AC_EGREP_CPP(yes,
  #endif
  ], load=1)
  fi
@@ -90,7 +92,7 @@ index ff9606d..d53a079 100644
  AC_CHECKING(for kernelfile)
  for core in /unix /vmunix /dynix /hp-ux /xelos /dev/ksyms /kernel/unix /kernel/genunix /unicos /mach /netbsd /386bsd /dgux /bsd /stand/vmunix; do
    if test -f $core || test -c $core; then
-@@ -1077,7 +1084,7 @@ main()
+@@ -1078,7 +1085,7 @@ main()
  #endif
    exit(0);
  }
@@ -99,7 +101,7 @@ index ff9606d..d53a079 100644
  
  fi
  
-@@ -1157,7 +1164,7 @@ main() {
+@@ -1158,7 +1165,7 @@ main() {
    if (strncmp(buf, "cdedef", 6))
      exit(1);
    exit(0); /* libc version works properly.  */
@@ -108,7 +110,7 @@ index ff9606d..d53a079 100644
  
  AC_TRY_RUN([
  #define bcopy(s,d,l) memmove(d,s,l)
-@@ -1172,7 +1179,8 @@ main() {
+@@ -1173,7 +1180,8 @@ main() {
    if (strncmp(buf, "cdedef", 6))
      exit(1);
    exit(0); /* libc version works properly.  */
diff --git a/package/screen/0004-cross-compilation-ignore-host-fs.patch b/package/screen/0004-cross-compilation-ignore-host-fs.patch
index aeacfb1..fa698ef 100644
--- a/package/screen/0004-cross-compilation-ignore-host-fs.patch
+++ b/package/screen/0004-cross-compilation-ignore-host-fs.patch
@@ -3,15 +3,17 @@ Date: Sun, 14 Sep 2014 07:10:59 +0200
 Subject: When cross-compiling, skip checks that look in the host file system
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Ricardo: rebase on top of 4.3.1]
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 ---
- configure.in | 23 +++++++++++++++++++----
+ configure.ac | 23 +++++++++++++++++++----
  1 file changed, 19 insertions(+), 4 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index d53a079..79aa56d 100644
---- a/configure.in
-+++ b/configure.in
-@@ -84,7 +84,7 @@ AC_ARG_ENABLE(socket-dir,
+diff --git a/configure.ac b/configure.ac
+index c4b7cd4..9cf7cee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -85,7 +85,7 @@ AC_ARG_ENABLE(socket-dir,
  dnl
  dnl    ****  special unix variants  ****
  dnl
@@ -20,7 +22,7 @@ index d53a079..79aa56d 100644
    AC_DEFINE(ISC) LIBS="$LIBS -linet"
  fi
  
-@@ -95,10 +95,11 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
+@@ -96,10 +96,11 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
  dnl fi
  dnl fi
  
@@ -33,7 +35,7 @@ index d53a079..79aa56d 100644
  AC_CHECKING(for MIPS)
  if test -f /lib/libmld.a || test -f /usr/lib/libmld.a || test -f /usr/lib/cmplrs/cc/libmld.a; then
  oldlibs="$LIBS"
-@@ -122,6 +123,7 @@ AC_DEFINE(USE_WAIT2) LIBS="$LIBS -lbsd" ; CC="$CC -I/usr/include/bsd"
+@@ -123,6 +124,7 @@ AC_DEFINE(USE_WAIT2) LIBS="$LIBS -lbsd" ; CC="$CC -I/usr/include/bsd"
  ))
  fi
  fi
@@ -41,7 +43,7 @@ index d53a079..79aa56d 100644
  
  
  AC_CHECKING(for Ultrix)
-@@ -131,7 +133,7 @@ AC_EGREP_CPP(yes,
+@@ -132,7 +134,7 @@ AC_EGREP_CPP(yes,
  #endif
  ], ULTRIX=1)
  
@@ -50,7 +52,7 @@ index d53a079..79aa56d 100644
  oldlibs="$LIBS"
  LIBS="$LIBS -lpyr"
  AC_CHECKING(Pyramid OSX)
-@@ -678,17 +680,21 @@ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
+@@ -679,17 +681,21 @@ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
  dnl
  dnl    ****  PTY specific things  ****
  dnl
@@ -72,7 +74,7 @@ index d53a079..79aa56d 100644
  
  AC_CHECK_FUNCS(getpt)
  
-@@ -698,6 +704,7 @@ AC_CHECK_FUNCS(openpty,,
+@@ -699,6 +705,7 @@ AC_CHECK_FUNCS(openpty,,
  [AC_CHECK_LIB(util,openpty, [AC_DEFINE(HAVE_OPENPTY)] [LIBS="$LIBS -lutil"])])
  fi
  
@@ -80,7 +82,7 @@ index d53a079..79aa56d 100644
  AC_CHECKING(for ptyranges)
  if test -d /dev/ptym ; then
  pdir='/dev/ptym'
-@@ -721,6 +728,7 @@ p1=`echo $ptys | tr ' ' '\012' | sed -e 's/^.*\(.\)$/\1/g'  | sort -u | tr -d '\
+@@ -722,6 +729,7 @@ p1=`echo $ptys | tr ' ' '\012' | sed -e 's/^.*\(.\)$/\1/g'  | sort -u | tr -d '\
  AC_DEFINE_UNQUOTED(PTYRANGE0,"$p0")
  AC_DEFINE_UNQUOTED(PTYRANGE1,"$p1")
  fi
@@ -88,7 +90,7 @@ index d53a079..79aa56d 100644
  
  dnl    ****  pty mode/group handling ****
  dnl
-@@ -868,14 +876,16 @@ fi
+@@ -869,14 +877,16 @@ fi
  dnl
  dnl    ****  loadav  ****
  dnl
@@ -106,7 +108,7 @@ index d53a079..79aa56d 100644
  olibs="$LIBS"
  LIBS="$LIBS -lkvm"
  AC_CHECKING(getloadavg with -lkvm)
-@@ -1093,13 +1103,18 @@ dnl    ****  libraries  ****
+@@ -1094,13 +1104,18 @@ dnl    ****  libraries  ****
  dnl
  
  AC_CHECKING(for crypt and sec libraries)
diff --git a/package/screen/0005-avoid-identifying-as-SVR4.patch b/package/screen/0005-avoid-identifying-as-SVR4.patch
index 10c08d2..745ef41 100644
--- a/package/screen/0005-avoid-identifying-as-SVR4.patch
+++ b/package/screen/0005-avoid-identifying-as-SVR4.patch
@@ -12,15 +12,17 @@ workaround was added for, so all I could do is make an educated guess
 at the #defines its compiler would be likely to set.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Ricardo: rebase on top of 4.3.1]
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 ---
- configure.in | 14 ++++++++++++--
+ configure.ac | 14 ++++++++++++--
  1 file changed, 12 insertions(+), 2 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index f78f81f..181b7f9 100644
---- a/configure.in
-+++ b/configure.in
-@@ -178,14 +178,24 @@ AC_EGREP_CPP(yes,
+diff --git a/configure.ac b/configure.ac
+index 9cf7cee..e09e4cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -179,14 +179,24 @@ AC_EGREP_CPP(yes,
  #endif
  ], LIBS="$LIBS -lsocket -linet";seqptx=1)
  
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 1b20458..10ba214 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5468545047e301d2b3579f9d9ce00466d14a7eec95ce806e3834a3d6b0b9b080	screen-4.2.1.tar.gz
+sha256	fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63	screen-4.3.1.tar.gz
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 827e776..45689d3 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.2.1
+SCREEN_VERSION = 4.3.1
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPLv3+
 SCREEN_LICENSE_FILES = COPYING
