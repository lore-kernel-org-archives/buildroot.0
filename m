From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 15:42:36 +0100
Subject: [Buildroot] [git commit] valgrind: bump version to 3.11.0
Message-ID: <20151031144753.9BC6F81922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a24893ceeef515396362f50e65411d4e90fdc9ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rebase patch 0001-workaround-SIGSEGV-on-PPC.patch
- remove upstream applied patches
  0002-Fix-configure-for-Linux-kernel-4.0-rc1.patch
  0004-configure.ac-Generalize-glibc-version-check.patch
- rebase 0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
  (convert to git patch format, rename to
  0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch)
- remove legacy VALGRIND_AUTORECONF=YES (no more patch touching confgure.ac)
- add '--disable-ubsan' for new undefined behaviour sanitiser option

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../valgrind/0001-workaround-SIGSEGV-on-PPC.patch  |   10 +-
 ...E_GETSIGINFO-on-PowerPC-when-not-availab.patch} |   23 ++-
 ...02-Fix-configure-for-Linux-kernel-4.0-rc1.patch |   48 ----
 ...nfigure.ac-Generalize-glibc-version-check.patch |  228 --------------------
 package/valgrind/valgrind.hash                     |    2 +-
 package/valgrind/valgrind.mk                       |    5 +-
 6 files changed, 24 insertions(+), 292 deletions(-)

diff --git a/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
index 1c5966b..8a6003c 100644
--- a/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
+++ b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
@@ -1,7 +1,7 @@
-From bd9d2af89e45081132c150e5e4bdf9a12dfca693 Mon Sep 17 00:00:00 2001
+From ff29b837f21a69c79289c3a87b03f8c23e05616e Mon Sep 17 00:00:00 2001
 From: Pierre Habouzit <madcoder@debian.org>
 Date: Tue, 10 May 2011 23:11:45 +0200
-Subject: [PATCH 1/2] workaround SIGSEGV on PPC.
+Subject: [PATCH] workaround SIGSEGV on PPC.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,7 +13,7 @@ Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
  1 file changed, 4 insertions(+)
 
 diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
-index 42d8ce8..3c9900f 100644
+index 6110c93..298a00e 100644
 --- a/coregrind/m_machine.c
 +++ b/coregrind/m_machine.c
 @@ -27,6 +27,10 @@
@@ -26,7 +26,7 @@ index 42d8ce8..3c9900f 100644
 +
  #include "pub_core_basics.h"
  #include "pub_core_vki.h"
- #include "pub_core_libcsetjmp.h"   // setjmp facilities
+ #include "pub_core_threadstate.h"
 -- 
-1.9.1
+2.1.4
 
diff --git a/package/valgrind/0003-add-missing-ptrace-getsiginfo-on-powerpc.patch b/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
similarity index 52%
rename from package/valgrind/0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
rename to package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
index f663825..44adfc4 100644
--- a/package/valgrind/0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
+++ b/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
@@ -1,4 +1,7 @@
-Define PTRACE_GETSIGINFO on PowerPC when not available
+From 7311686d6286972ff97cc18b2416a4cdd7fc5c7e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 31 Oct 2015 12:15:24 +0100
+Subject: [PATCH] Define PTRACE_GETSIGINFO on PowerPC when not available
 
 uClibc 0.9.33.2 does not define PTRACE_GETSIGINFO in PowerPC. Even
 though Buildroot has a uClibc patch doing that, it doesn't solve the
@@ -8,12 +11,15 @@ PTRACE_GETSIGINFO on PowerPC to the right value, when such definition
 is not available from the C library.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ coregrind/vgdb-invoker-ptrace.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
-Index: b/coregrind/vgdb-invoker-ptrace.c
-===================================================================
+diff --git a/coregrind/vgdb-invoker-ptrace.c b/coregrind/vgdb-invoker-ptrace.c
+index d65f59a..bdefac2 100644
 --- a/coregrind/vgdb-invoker-ptrace.c
 +++ b/coregrind/vgdb-invoker-ptrace.c
-@@ -71,6 +71,12 @@
+@@ -72,6 +72,12 @@
  #   endif
  #endif
  
@@ -23,6 +29,9 @@ Index: b/coregrind/vgdb-invoker-ptrace.c
 +# endif
 +#endif
 +
- #if VEX_HOST_WORDSIZE == 8
- typedef Addr64 CORE_ADDR;
- #elif VEX_HOST_WORDSIZE == 4
+ // 32-bit or 64-bit wide, depending on primary architecture.
+ typedef Addr  CORE_ADDR;
+ typedef Addr  PTRACE_XFER_TYPE;
+-- 
+2.1.4
+
diff --git a/package/valgrind/0002-Fix-configure-for-Linux-kernel-4.0-rc1.patch b/package/valgrind/0002-Fix-configure-for-Linux-kernel-4.0-rc1.patch
deleted file mode 100644
index 1d0ba26..0000000
--- a/package/valgrind/0002-Fix-configure-for-Linux-kernel-4.0-rc1.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8e958577f01e2e877fb1dbdca09718ef6ea0c748 Mon Sep 17 00:00:00 2001
-From: cborntra <cborntra@a5019735-40e9-0310-863c-91ae7b9d1cf9>
-Date: Mon, 23 Feb 2015 20:19:03 +0000
-Subject: [PATCH] Fix configure for Linux kernel >= 4.0-rc1 In addition raise
- the minimal Linux version to 2.6 as there is almost no test coverage for 2.4
- and 2.6 was released in 2003.
-
-Signed-off-by: Christian Artin <christian@gridshowsystems.com>
-
-git-svn-id: svn://svn.valgrind.org/valgrind/trunk at 14955 a5019735-40e9-0310-863c-91ae7b9d1cf9
----
- configure.ac | 18 ++++++------------
- 1 file changed, 6 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bdf5f22..136f49a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -325,20 +325,14 @@ case "${host_os}" in
-         kernel=`uname -r`
- 
-         case "${kernel}" in
--             2.6.*|3.*) 
--        	    AC_MSG_RESULT([2.6.x/3.x family (${kernel})])
--        	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x or Linux 3.x])
--        	    ;;
--
--             2.4.*) 
--        	    AC_MSG_RESULT([2.4 family (${kernel})])
--        	    AC_DEFINE([KERNEL_2_4], 1, [Define to 1 if you're using Linux 2.4.x])
--        	    ;;
--
--             *) 
-+             0.*|1.*|2.0.*|2.1.*|2.2.*|2.3.*|2.4.*|2.5.*) 
-         	    AC_MSG_RESULT([unsupported (${kernel})])
--        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
-+        	    AC_MSG_ERROR([Valgrind needs a Linux kernel >= 2.6])
-         	    ;;
-+
-+             *)
-+        	    AC_MSG_RESULT([2.6 or later (${kernel})])
-+                    ;;
-         esac
- 
-         ;;
--- 
-2.3.7
-
diff --git a/package/valgrind/0004-configure.ac-Generalize-glibc-version-check.patch b/package/valgrind/0004-configure.ac-Generalize-glibc-version-check.patch
deleted file mode 100644
index 5b1d07b..0000000
--- a/package/valgrind/0004-configure.ac-Generalize-glibc-version-check.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From 4f3062b90b12f3e031a1c949c50a79e0d13de485 Mon Sep 17 00:00:00 2001
-From: bart <bart@a5019735-40e9-0310-863c-91ae7b9d1cf9>
-Date: Sat, 13 Sep 2014 10:53:00 +0000
-Subject: [PATCH] configure.ac: Generalize glibc version check
-
-git-svn-id: svn://svn.valgrind.org/valgrind/trunk at 14530 a5019735-40e9-0310-863c-91ae7b9d1cf9
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac        | 139 +++++++---------------------------------------------
- coregrind/m_redir.c |  11 ++---
- 2 files changed, 22 insertions(+), 128 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ba11ec6..863cd7e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -875,141 +875,41 @@ AC_EGREP_CPP([BIONIC_LIBC], [
- GLIBC_VERSION="bionic")
- 
- 
--AC_MSG_CHECKING([the GLIBC_VERSION version])
-+AC_MSG_CHECKING([the glibc version])
- 
- case "${GLIBC_VERSION}" in
-      2.2)
--	AC_MSG_RESULT(2.2 family)
--	AC_DEFINE([GLIBC_2_2], 1, [Define to 1 if you're using glibc 2.2.x])
-+	AC_MSG_RESULT(${GLIBC_VERSION} family)
- 	DEFAULT_SUPP="glibc-2.2.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
--
--     2.3)
--	AC_MSG_RESULT(2.3 family)
--	AC_DEFINE([GLIBC_2_3], 1, [Define to 1 if you're using glibc 2.3.x])
--	DEFAULT_SUPP="glibc-2.3.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--
--     2.4)
--	AC_MSG_RESULT(2.4 family)
--	AC_DEFINE([GLIBC_2_4], 1, [Define to 1 if you're using glibc 2.4.x])
--	DEFAULT_SUPP="glibc-2.4.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--
--     2.5)
--	AC_MSG_RESULT(2.5 family)
--	AC_DEFINE([GLIBC_2_5], 1, [Define to 1 if you're using glibc 2.5.x])
--	DEFAULT_SUPP="glibc-2.5.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.6)
--	AC_MSG_RESULT(2.6 family)
--	AC_DEFINE([GLIBC_2_6], 1, [Define to 1 if you're using glibc 2.6.x])
--	DEFAULT_SUPP="glibc-2.6.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.7)
--	AC_MSG_RESULT(2.7 family)
--	AC_DEFINE([GLIBC_2_7], 1, [Define to 1 if you're using glibc 2.7.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.8)
--	AC_MSG_RESULT(2.8 family)
--	AC_DEFINE([GLIBC_2_8], 1, [Define to 1 if you're using glibc 2.8.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.9)
--	AC_MSG_RESULT(2.9 family)
--	AC_DEFINE([GLIBC_2_9], 1, [Define to 1 if you're using glibc 2.9.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.10)
--	AC_MSG_RESULT(2.10 family)
--	AC_DEFINE([GLIBC_2_10], 1, [Define to 1 if you're using glibc 2.10.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.11)
--	AC_MSG_RESULT(2.11 family)
--	AC_DEFINE([GLIBC_2_11], 1, [Define to 1 if you're using glibc 2.11.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--        ;;
--     2.12)
--	AC_MSG_RESULT(2.12 family)
--	AC_DEFINE([GLIBC_2_12], 1, [Define to 1 if you're using glibc 2.12.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.13)
--	AC_MSG_RESULT(2.13 family)
--	AC_DEFINE([GLIBC_2_13], 1, [Define to 1 if you're using glibc 2.13.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.14)
--	AC_MSG_RESULT(2.14 family)
--	AC_DEFINE([GLIBC_2_14], 1, [Define to 1 if you're using glibc 2.14.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+     2.[[3-6]])
-+	AC_MSG_RESULT(${GLIBC_VERSION} family)
-+	DEFAULT_SUPP="glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
--     2.15)
--	AC_MSG_RESULT(2.15 family)
--	AC_DEFINE([GLIBC_2_15], 1, [Define to 1 if you're using glibc 2.15.x])
-+     2.[[7-9]])
-+	AC_MSG_RESULT(${GLIBC_VERSION} family)
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
--     2.16)
--	AC_MSG_RESULT(2.16 family)
--	AC_DEFINE([GLIBC_2_16], 1, [Define to 1 if you're using glibc 2.16.x])
-+     2.10|2.11)
-+	AC_MSG_RESULT(${GLIBC_VERSION} family)
-+	AC_DEFINE([GLIBC_MANDATORY_STRLEN_REDIRECT], 1,
-+		  [Define to 1 if strlen() has been optimized heavily (amd64 glibc >= 2.10)])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
--     2.17)
--	AC_MSG_RESULT(2.17 family)
--	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.18)
--	AC_MSG_RESULT(2.18 family)
--	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.19)
--	AC_MSG_RESULT(2.19 family)
--	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
--	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
--	;;
--     2.20)
--	AC_MSG_RESULT(2.20 family)
--	AC_DEFINE([GLIBC_2_20], 1, [Define to 1 if you're using glibc 2.20.x])
-+     2.*)
-+	AC_MSG_RESULT(${GLIBC_VERSION} family)
-+	AC_DEFINE([GLIBC_MANDATORY_STRLEN_REDIRECT], 1,
-+		  [Define to 1 if strlen() has been optimized heavily (amd64 glibc >= 2.10)])
-+	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
-+		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-@@ -1024,10 +924,9 @@ case "${GLIBC_VERSION}" in
- 	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
- 	DEFAULT_SUPP="bionic.supp ${DEFAULT_SUPP}"
- 	;;
--
--     *)
-+     2.0|2.1|*)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.19])
-+	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later])
- 	AC_MSG_ERROR([or Darwin or Bionic libc])
- 	;;
- esac
-diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index 9d3c9b1..9aee707 100644
---- a/coregrind/m_redir.c
-+++ b/coregrind/m_redir.c
-@@ -53,7 +53,7 @@
- #include "pub_core_demangle.h"     // VG_(maybe_Z_demangle)
- #include "pub_core_libcproc.h"     // VG_(libdir)
- 
--#include "config.h" /* GLIBC_2_* */
-+#include "config.h" /* GLIBC_MANDATORY_*_REDIRECT */
- 
- 
- /* This module is a critical part of the redirection/intercept system.
-@@ -1242,10 +1242,7 @@ void VG_(redir_initialise) ( void )
-       start, otherwise ld.so (glibc-2.3.5) makes a lot of noise. */
-    if (0==VG_(strcmp)("Memcheck", VG_(details).name)) {
-       const HChar** mandatory;
--#     if defined(GLIBC_2_2) || defined(GLIBC_2_3) || defined(GLIBC_2_4) \
--         || defined(GLIBC_2_5) || defined(GLIBC_2_6) || defined(GLIBC_2_7) \
--         || defined(GLIBC_2_8) || defined(GLIBC_2_9) \
--         || defined(GLIBC_2_10) || defined(GLIBC_2_11)
-+#     ifndef GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT
-       mandatory = NULL;
- #     else
-       /* for glibc-2.12 and later, this is mandatory - can't sanely
-@@ -1282,9 +1279,7 @@ void VG_(redir_initialise) ( void )
-       add_hardwired_spec(
-          "ld-linux-x86-64.so.2", "strlen",
-          (Addr)&VG_(amd64_linux_REDIR_FOR_strlen),
--#        if defined(GLIBC_2_2) || defined(GLIBC_2_3) || defined(GLIBC_2_4) \
--            || defined(GLIBC_2_5) || defined(GLIBC_2_6) || defined(GLIBC_2_7) \
--            || defined(GLIBC_2_8) || defined(GLIBC_2_9)
-+#        ifndef GLIBC_MANDATORY_STRLEN_REDIRECT
-          NULL
- #        else
-          /* for glibc-2.10 and later, this is mandatory - can't sanely
--- 
-2.1.4
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index f311ea4..f2cd6e8 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,2 +1,2 @@
 # From http://valgrind.org/downloads/current.html
-md5	60ddae962bc79e7c95cfc4667245707f	valgrind-3.10.1.tar.bz2
+md5	4ea62074da73ae82e0162d6550d3f129	valgrind-3.11.0.tar.bz2
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 9500264..75d542a 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.10.1
+VALGRIND_VERSION = 3.11.0
 VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-VALGRIND_CONF_OPTS = --disable-tls
-VALGRIND_AUTORECONF = YES
+VALGRIND_CONF_OPTS = --disable-tls --disable-ubsan
 VALGRIND_INSTALL_STAGING = YES
 
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
