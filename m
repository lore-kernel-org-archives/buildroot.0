From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 23 Jan 2015 00:44:27 +0100
Subject: [Buildroot] [PATCH 1/3] package/infozip: fix LARGE_FILE_SUPPORT
	check
Message-ID: <1421970269-31287-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LARGE_FILE_SUPPORT check was dropped in commit cc4dedd9.

Since then there is a runtime error:
zip warning : Not supported (uzoff_t not same size as zoff_t)

So remove the previous patch and rework and split each
cross-compilation fixes to differents patches.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...emove-Check-C-compiler-type-optimization-.patch | 130 +++++++++++
 .../0002-configure-Don-t-use-host-CPP.patch        |  37 ++++
 ...003-Makefile-Use-CFLAGS-from-command-line.patch |  30 +++
 ...4-configure-use-LDFLAGS-from-command-line.patch |  35 +++
 .../infozip-0001-configure-fix-cross-build.patch   | 237 ---------------------
 5 files changed, 232 insertions(+), 237 deletions(-)
 create mode 100644 package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
 create mode 100644 package/infozip/0002-configure-Don-t-use-host-CPP.patch
 create mode 100644 package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch
 create mode 100644 package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch
 delete mode 100644 package/infozip/infozip-0001-configure-fix-cross-build.patch

diff --git a/package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch b/package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
new file mode 100644
index 0000000..8722b50
--- /dev/null
+++ b/package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
@@ -0,0 +1,130 @@
+From 0f5e1658c05746b17f05a1bade263cad19b37e79 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 22 Jan 2015 15:20:25 +0100
+Subject: [PATCH 1/4] configure: Remove "Check C compiler type (optimization
+ options)"
+
+This test force optimization to -O3
+while it is already set in CFLAGS
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ unix/configure | 98 ----------------------------------------------------------
+ 1 file changed, 98 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 73ba803..4185fee 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -22,108 +22,10 @@ LFLAGS1=''
+ LFLAGS2=''
+ LN="ln -s"
+ 
+-CFLAGS_OPT=''
+-
+ # bzip2
+ IZ_BZIP2=${3-}
+ CFLAGS_BZ=''
+ 
+-
+-echo 'Check C compiler type (optimization options)'
+-# Sun C?
+-cat > conftest.c << _EOF_
+-int main()
+-{
+-#ifndef __SUNPRO_C
+-   bad code
+-#endif
+-   return 0;
+-}
+-_EOF_
+-$CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
+-if test $? -eq 0; then
+-  CFLAGS_OPT='-xO3'
+-  echo "  Sun C ($CFLAGS_OPT)"
+-else
+-  # Tru64 DEC/Compaq/HP C?
+-  cat > conftest.c << _EOF_
+-int main()
+-{
+-#ifndef __DECC
+-   bad code
+-#endif
+-   return 0;
+-}
+-_EOF_
+-  $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
+-  if test $? -eq 0; then
+-    CFLAGS_OPT='-O3'
+-    echo "  DEC C ($CFLAGS_OPT)"
+-  else
+-    # HP-UX HP C?
+-    cat > conftest.c << _EOF_
+-int main()
+-{
+-#ifdef __GNUC__
+-   bad code
+-#endif
+-#ifndef __hpux
+-   bad code
+-#endif
+-   return 0;
+-}
+-_EOF_
+-    $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
+-    if test $? -eq 0; then
+-      # HP-UX, not GCC.  Lame bundled or real ANSI compiler?
+-      CFLAGS_OPT_TRY="+O3 +Onolimit"
+-      $CC $CFLAGS $CFLAGS_OPT_TRY -c conftest.c 2>&1 | \
+-       grep '(Bundled)' > /dev/null
+-      if test $? -ne 0; then
+-        CFLAGS_OPT="$CFLAGS_OPT_TRY"
+-        echo "  HP-UX ANSI C ($CFLAGS_OPT)"
+-      else
+-        echo '  HP-UX Bundled C (no opt)'
+-      fi
+-    else
+-      # GNU C?
+-      cat > conftest.c << _EOF_
+-int main()
+-{
+-#ifndef __GNUC__
+-   bad code
+-#endif
+-   return 0;
+-}
+-_EOF_
+-      $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
+-      if test $? -eq 0; then
+-        CFLAGS_OPT='-O3'
+-        echo "  GNU C ($CFLAGS_OPT)"
+-        # Special Mac OS X shared library "ld" option?
+-        if test ` uname -s 2> /dev/null ` = 'Darwin'; then
+-          lf='-Wl,-search_paths_first'
+-          $CC $CFLAGS $lf conftest.c > /dev/null 2>/dev/null
+-          if test $? -eq 0; then
+-            LFLAGS2="${LFLAGS2} ${lf}"
+-          fi
+-          rm -f conftest
+-        fi
+-      else
+-        CFLAGS_OPT='-O'
+-        echo "  Other-unknown C ($CFLAGS_OPT)"
+-      fi
+-    fi
+-  fi
+-fi
+-
+-# optimization flags
+-if test -n "${CFLAGS_OPT}"; then
+-  CFLAGS="${CFLAGS} ${CFLAGS_OPT}"
+-  CFLAGS_BZ="${CFLAGS_BZ} ${CFLAGS_OPT}"
+-fi
+-
+-
+ # bzip2
+ 
+ echo "Check bzip2 support"
+-- 
+1.9.3
+
diff --git a/package/infozip/0002-configure-Don-t-use-host-CPP.patch b/package/infozip/0002-configure-Don-t-use-host-CPP.patch
new file mode 100644
index 0000000..bddb6f4
--- /dev/null
+++ b/package/infozip/0002-configure-Don-t-use-host-CPP.patch
@@ -0,0 +1,37 @@
+From fc5c889131ff6270e1028cc7edd87e7f10a7da6d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 22 Jan 2015 15:21:31 +0100
+Subject: [PATCH 2/4] configure: Don't use host CPP
+
+CPP is redefined if a cpp binary (/lib/cpp) is found on the host.
+
+Use the CPP="${CC} -E" allows to pass the following checks:
+Check if we can use asm code (for -DASMV)
+Check if compiler generates underlines (for -DASM_CRC)
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ unix/configure | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 4185fee..489009f 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -122,13 +122,6 @@ fi
+ echo Check for the C preprocessor
+ # on SVR4, cc -E does not produce correct assembler files. Need /lib/cpp.
+ CPP="${CC} -E"
+-# solaris as(1) needs -P, maybe others as well ?
+-[ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
+-[ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
+-[ -f /lib/cpp ] && CPP=/lib/cpp
+-[ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
+-[ -f /xenix ] && CPP="${CC} -E"
+-[ -f /lynx.os ] && CPP="${CC} -E"
+ 
+ echo "#include <stdio.h>" > conftest.c
+ $CPP conftest.c >/dev/null 2>/dev/null || CPP="${CC} -E"
+-- 
+1.9.3
+
diff --git a/package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch b/package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch
new file mode 100644
index 0000000..3e8aec1
--- /dev/null
+++ b/package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch
@@ -0,0 +1,30 @@
+From 93189390de7322da78bc5b807f4cadaff46393c9 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 22 Jan 2015 22:45:30 +0100
+Subject: [PATCH 3/4] Makefile: Use CFLAGS from command line
+
+Replace CFLAGS_NOOPT by CFLAGS when calling unix/configure script
+to create 'flags' file which contains all variables used to build
+zip binary.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ unix/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unix/Makefile b/unix/Makefile
+index abd0c44..db62368 100644
+--- a/unix/Makefile
++++ b/unix/Makefile
+@@ -177,7 +177,7 @@ uninstall:
+ 
+ 
+ flags:  unix/configure
+-	sh unix/configure "${CC}" "${CFLAGS_NOOPT}" "${IZ_BZIP2}"
++	sh unix/configure "${CC}" "${CFLAGS}" "${IZ_BZIP2}"
+ 
+ # These symbols, when #defined using -D have these effects on compilation:
+ # ZMEM                  - includes C language versions of memset(), memcpy(),
+-- 
+1.9.3
+
diff --git a/package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch b/package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch
new file mode 100644
index 0000000..7f7c239
--- /dev/null
+++ b/package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch
@@ -0,0 +1,35 @@
+From 82c40cd63198bfd04264427d8d2a2f71fc780d85 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 22 Jan 2015 23:47:55 +0100
+Subject: [PATCH 4/4] configure: use LDFLAGS from command line
+
+The bzip2 support may not enabled due to a build error
+during the checking for bzip2 library.
+The library path (-L) to bzip2 library is missing.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ unix/configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 489009f..de9fd68 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -106,11 +106,11 @@ int main()
+   return 0;
+ }
+ _EOF_
+-      $CC $CFLAGS -o conftest conftest.c -lbz2 > /dev/null 2>/dev/null
++      $CC $CFLAGS $LDFLAGS -o conftest conftest.c -lbz2 > /dev/null 2>/dev/null
+       if test $? -eq 0; then
+         echo "-- OS supports bzip2 - linking in bzip2"
+         CFLAGS="${CFLAGS} -DBZIP2_SUPPORT"
+-        LFLAGS2="${LFLAGS2} -lbz2"
++        LFLAGS2="${LFLAGS2} ${LDFLAGS} -lbz2"
+       else
+         echo "-- Either bzlib.h or libbz2.a not found - no bzip2"
+       fi
+-- 
+1.9.3
+
diff --git a/package/infozip/infozip-0001-configure-fix-cross-build.patch b/package/infozip/infozip-0001-configure-fix-cross-build.patch
deleted file mode 100644
index 0b939b3..0000000
--- a/package/infozip/infozip-0001-configure-fix-cross-build.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From 941c322e4378e0ef09f21bfd7b2a337b8f812629 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Mon, 27 Jan 2014 22:42:53 +0100
-Subject: [PATCH 1/1] configure: fix cross-compilation issues
-
-- Use CFLAGS from command line
-
-- Remove "Check C compiler type (optimization options)"
-  This test force optimization to -O3
-  while it is already set in CFLAGS
-
-- Don't use host CPP
-
-- Remove "Check for Large File Support"
-  LFS support is already set in CFLAGS
-
-Note: configure script still use host nm
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- unix/Makefile  |   4 +-
- unix/configure | 161 +--------------------------------------------------------
- 2 files changed, 3 insertions(+), 162 deletions(-)
-
-diff --git a/unix/Makefile b/unix/Makefile
-index abd0c44..8388c74 100644
---- a/unix/Makefile
-+++ b/unix/Makefile
-@@ -58,7 +58,7 @@ IZ_OUR_BZIP2_DIR = bzip2
- #   LFLAGS1   flags after output file spec, before obj file list
- #   LFLAGS2   flags after obj file list (libraries, etc)
- CFLAGS_NOOPT = -I. -DUNIX $(LOCAL_ZIP)
--CFLAGS = -O2 $(CFLAGS_NOOPT)
-+CFLAGS ?= -O2 $(CFLAGS_NOOPT)
- LFLAGS1 =
- LFLAGS2 = -s
- 
-@@ -177,7 +177,7 @@ uninstall:
- 
- 
- flags:  unix/configure
--	sh unix/configure "${CC}" "${CFLAGS_NOOPT}" "${IZ_BZIP2}"
-+	sh unix/configure "${CC}" "${CFLAGS}" "${IZ_BZIP2}"
- 
- # These symbols, when #defined using -D have these effects on compilation:
- # ZMEM                  - includes C language versions of memset(), memcpy(),
-diff --git a/unix/configure b/unix/configure
-index 73ba803..57272db 100644
---- a/unix/configure
-+++ b/unix/configure
-@@ -22,109 +22,9 @@ LFLAGS1=''
- LFLAGS2=''
- LN="ln -s"
- 
--CFLAGS_OPT=''
--
- # bzip2
- IZ_BZIP2=${3-}
--CFLAGS_BZ=''
--
--
--echo 'Check C compiler type (optimization options)'
--# Sun C?
--cat > conftest.c << _EOF_
--int main()
--{
--#ifndef __SUNPRO_C
--   bad code
--#endif
--   return 0;
--}
--_EOF_
--$CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
--if test $? -eq 0; then
--  CFLAGS_OPT='-xO3'
--  echo "  Sun C ($CFLAGS_OPT)"
--else
--  # Tru64 DEC/Compaq/HP C?
--  cat > conftest.c << _EOF_
--int main()
--{
--#ifndef __DECC
--   bad code
--#endif
--   return 0;
--}
--_EOF_
--  $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
--  if test $? -eq 0; then
--    CFLAGS_OPT='-O3'
--    echo "  DEC C ($CFLAGS_OPT)"
--  else
--    # HP-UX HP C?
--    cat > conftest.c << _EOF_
--int main()
--{
--#ifdef __GNUC__
--   bad code
--#endif
--#ifndef __hpux
--   bad code
--#endif
--   return 0;
--}
--_EOF_
--    $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
--    if test $? -eq 0; then
--      # HP-UX, not GCC.  Lame bundled or real ANSI compiler?
--      CFLAGS_OPT_TRY="+O3 +Onolimit"
--      $CC $CFLAGS $CFLAGS_OPT_TRY -c conftest.c 2>&1 | \
--       grep '(Bundled)' > /dev/null
--      if test $? -ne 0; then
--        CFLAGS_OPT="$CFLAGS_OPT_TRY"
--        echo "  HP-UX ANSI C ($CFLAGS_OPT)"
--      else
--        echo '  HP-UX Bundled C (no opt)'
--      fi
--    else
--      # GNU C?
--      cat > conftest.c << _EOF_
--int main()
--{
--#ifndef __GNUC__
--   bad code
--#endif
--   return 0;
--}
--_EOF_
--      $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
--      if test $? -eq 0; then
--        CFLAGS_OPT='-O3'
--        echo "  GNU C ($CFLAGS_OPT)"
--        # Special Mac OS X shared library "ld" option?
--        if test ` uname -s 2> /dev/null ` = 'Darwin'; then
--          lf='-Wl,-search_paths_first'
--          $CC $CFLAGS $lf conftest.c > /dev/null 2>/dev/null
--          if test $? -eq 0; then
--            LFLAGS2="${LFLAGS2} ${lf}"
--          fi
--          rm -f conftest
--        fi
--      else
--        CFLAGS_OPT='-O'
--        echo "  Other-unknown C ($CFLAGS_OPT)"
--      fi
--    fi
--  fi
--fi
--
--# optimization flags
--if test -n "${CFLAGS_OPT}"; then
--  CFLAGS="${CFLAGS} ${CFLAGS_OPT}"
--  CFLAGS_BZ="${CFLAGS_BZ} ${CFLAGS_OPT}"
--fi
--
--
--# bzip2
-+CFLAGS_BZ="${CFLAGS}"
- 
- echo "Check bzip2 support"
- CC_BZ="${CC}"
-@@ -220,13 +120,6 @@ fi
- echo Check for the C preprocessor
- # on SVR4, cc -E does not produce correct assembler files. Need /lib/cpp.
- CPP="${CC} -E"
--# solaris as(1) needs -P, maybe others as well ?
--[ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
--[ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
--[ -f /lib/cpp ] && CPP=/lib/cpp
--[ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
--[ -f /xenix ] && CPP="${CC} -E"
--[ -f /lynx.os ] && CPP="${CC} -E"
- 
- echo "#include <stdio.h>" > conftest.c
- $CPP conftest.c >/dev/null 2>/dev/null || CPP="${CC} -E"
-@@ -398,58 +291,6 @@ else
-   fi
- fi
- 
--
--# Now we set the 64-bit file environment and check the size of off_t
--# Added 11/4/2003 EG
--# Revised 8/12/2004 EG
--
--echo Check for Large File Support
--cat > conftest.c << _EOF_
--# define _LARGEFILE_SOURCE       /* some OSes need this for fseeko */
--# define _LARGEFILE64_SOURCE
--# define _FILE_OFFSET_BITS 64       /* select default interface as 64 bit */
--# define _LARGE_FILES        /* some OSes need this for 64-bit off_t */
--#include <sys/types.h>
--#include <sys/stat.h>
--#include <unistd.h>
--#include <stdio.h>
--int main()
--{
--  off_t offset;
--  struct stat s;
--  /* see if have 64-bit off_t */
--  if (sizeof(offset) < 8)
--    return 1;
--  printf("  off_t is %d bytes\n", sizeof(off_t));
--  /* see if have 64-bit stat */
--  if (sizeof(s.st_size) < 8) {
--    printf("  s.st_size is %d bytes\n", sizeof(s.st_size));
--    return 2;
--  }
--  return 3;
--}
--_EOF_
--# compile it
--$CC -o conftest conftest.c >/dev/null 2>/dev/null
--if [ $? -ne 0 ]; then
--  echo -- no Large File Support
--else
--# run it
--  ./conftest
--  r=$?
--  if [ $r -eq 1 ]; then
--    echo -- no Large File Support - no 64-bit off_t
--  elif [ $r -eq 2 ]; then
--    echo -- no Large File Support - no 64-bit stat
--  elif [ $r -eq 3 ]; then
--    echo -- yes we have Large File Support!
--    CFLAGS="${CFLAGS} -DLARGE_FILE_SUPPORT"
--  else
--    echo -- no Large File Support - conftest returned $r
--  fi
--fi
--
--
- # Check for wide char for Unicode support
- # Added 11/24/2005 EG
- 
--- 
-1.8.5.3
-
-- 
1.9.3
