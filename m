From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:05:26 +0200
Subject: [Buildroot] [git commit branch/next] package/trousers: bump version
 to 0.3.14
Message-ID: <20180820205808.A91898E02F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ece420b121713cfb414a8beb35b89beeaafc686b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patches 0001 & 0003, applied upstream.
Rebased patches 0002 & 0004 and renumbered them.
Added sha256 hashes for tarball and license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mpiler-understands-pie-and-relro-options.patch} | 17 ++--
 ...emove-inline-for-read_data-and-write_data.patch | 94 ----------------------
 ...-getpwent_r-is-available-before-using-it.patch} |  8 +-
 ..._param-include-limits.h-to-fix-musl-build.patch | 29 -------
 package/trousers/trousers.hash                     |  9 ++-
 package/trousers/trousers.mk                       |  2 +-
 6 files changed, 20 insertions(+), 139 deletions(-)

diff --git a/package/trousers/0002-Check-if-the-compiler-understands-pie-and-relro-options.patch b/package/trousers/0001-Check-if-the-compiler-understands-pie-and-relro-options.patch
similarity index 97%
rename from package/trousers/0002-Check-if-the-compiler-understands-pie-and-relro-options.patch
rename to package/trousers/0001-Check-if-the-compiler-understands-pie-and-relro-options.patch
index 3275b76a2c..b1179eb4aa 100644
--- a/package/trousers/0002-Check-if-the-compiler-understands-pie-and-relro-options.patch
+++ b/package/trousers/0001-Check-if-the-compiler-understands-pie-and-relro-options.patch
@@ -8,8 +8,10 @@ executables, and -Wl,-z,relro turns on read-only relocation support in gcc.
 Add checks to ensure that the compiler and linker understand these options.
 
 Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
+[Bernd: Rebased for version 0.3.14]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- configure.in                |  5 +++
+ configure.ac                |  5 +++
  m4/ax_check_compile_flag.m4 | 72 ++++++++++++++++++++++++++++++++++++
  m4/ax_check_link_flag.m4    | 71 +++++++++++++++++++++++++++++++++++
  src/tcsd/Makefile.am        |  4 +-
@@ -19,12 +21,12 @@ Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
 
 diff --git a/configure.in b/configure.in
 index add23dc..9603353 100644
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -12,6 +12,7 @@ TSS_VER_MINOR=3
  # compute $target
  AC_CANONICAL_TARGET
- AM_INIT_AUTOMAKE([foreign 1.6])
+ AM_INIT_AUTOMAKE([foreign subdir-objects 1.6])
 +AC_CONFIG_MACRO_DIR([m4])
  
  # Debugging support
@@ -205,11 +207,8 @@ index 2210734..6640ab2 100644
 -tcsd_CFLAGS=-DAPPID=\"TCSD\" -DVAR_PREFIX=\"@localstatedir@\" -DETC_PREFIX=\"@sysconfdir@\" -I${top_srcdir}/src/include -fPIE -DPIE
 +tcsd_CFLAGS=-DAPPID=\"TCSD\" -DVAR_PREFIX=\"@localstatedir@\" -DETC_PREFIX=\"@sysconfdir@\" -I${top_srcdir}/src/include $(PIE_CFLAGS)
  tcsd_LDADD=${top_builddir}/src/tcs/libtcs.a ${top_builddir}/src/tddl/libtddl.a -lpthread @CRYPTOLIB@
--tcsd_LDFLAGS=-pie -Wl,-z,relro -Wl,-z,now
+-tcsd_LDFLAGS=@TCSD_LDFLAGS@
 +tcsd_LDFLAGS=$(PIE_LDFLAGS) $(RELRO_LDFLAGS)
- 
  tcsd_SOURCES=svrside.c tcsd_conf.c tcsd_threads.c platform.c
  
--- 
-2.5.0
-
+ if TSS_BUILD_PS
diff --git a/package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch b/package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch
deleted file mode 100644
index b0db70b49b..0000000000
--- a/package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From f03c7987c234a81f7e4274b26bab07318357a2a5 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Fri, 25 Dec 2015 20:09:21 -0200
-Subject: [PATCH] Remove inline for read_data and write_data
-
-read_data and write_data functions are declared with inline, but
-their definition is not in a .h file. This is causing errors when
-linking:
-
-tcsps.c:(.text+0x4ac): undefined reference to `read_data'
-tcsps.c:(.text+0x1888): undefined reference to `write_data'
-...
-
-Partial backport of upstream commit
-3297fcdf5ac0df868778e976b8b59e35542c1ee2.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- src/include/tcsps.h    | 5 -----
- src/tcs/ps/ps_utils.c  | 8 --------
- src/tspi/ps/ps_utils.c | 4 ++--
- 3 files changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/src/include/tcsps.h b/src/include/tcsps.h
-index 87542965877d..dcd5db469822 100644
---- a/src/include/tcsps.h
-+++ b/src/include/tcsps.h
-@@ -23,13 +23,8 @@ int		   get_file();
- int		   put_file(int);
- void		   close_file(int);
- void		   ps_destroy();
--#ifdef SOLARIS
- TSS_RESULT  read_data(int, void *, UINT32);
- TSS_RESULT  write_data(int, void *, UINT32);
--#else
--inline TSS_RESULT  read_data(int, void *, UINT32);
--inline TSS_RESULT  write_data(int, void *, UINT32);
--#endif
- int		   write_key_init(int, UINT32, UINT32, UINT32);
- TSS_RESULT	   cache_key(UINT32, UINT16, TSS_UUID *, TSS_UUID *, UINT16, UINT32, UINT32);
- TSS_RESULT	   UnloadBlob_KEY_PS(UINT16 *, BYTE *, TSS_KEY *);
-diff --git a/src/tcs/ps/ps_utils.c b/src/tcs/ps/ps_utils.c
-index 2e7f502b9599..35ac89f8fc12 100644
---- a/src/tcs/ps/ps_utils.c
-+++ b/src/tcs/ps/ps_utils.c
-@@ -42,11 +42,7 @@
- struct key_disk_cache *key_disk_cache_head = NULL;
-
-
--#ifdef SOLARIS
- TSS_RESULT
--#else
--inline TSS_RESULT
--#endif
- read_data(int fd, void *data, UINT32 size)
- {
-	int rc;
-@@ -64,11 +60,7 @@ read_data(int fd, void *data, UINT32 size)
- }
-
-
--#ifdef SOLARIS
- TSS_RESULT
--#else
--inline TSS_RESULT
--#endif
- write_data(int fd, void *data, UINT32 size)
- {
-	int rc;
-diff --git a/src/tspi/ps/ps_utils.c b/src/tspi/ps/ps_utils.c
-index aac40a147314..83259141d375 100644
---- a/src/tspi/ps/ps_utils.c
-+++ b/src/tspi/ps/ps_utils.c
-@@ -22,7 +22,7 @@
- #include "tspps.h"
- #include "tsplog.h"
-
--inline TSS_RESULT
-+TSS_RESULT
- read_data(int fd, void *data, UINT32 size)
- {
-	int rc;
-@@ -39,7 +39,7 @@ read_data(int fd, void *data, UINT32 size)
-	return TSS_SUCCESS;
- }
-
--inline TSS_RESULT
-+TSS_RESULT
- write_data(int fd, void *data, UINT32 size)
- {
-	int rc;
---
-1.9.1
-
diff --git a/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch b/package/trousers/0002-Check-that-getpwent_r-is-available-before-using-it.patch
similarity index 93%
rename from package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
rename to package/trousers/0002-Check-that-getpwent_r-is-available-before-using-it.patch
index 7014ad7afb..ab2418c7c5 100644
--- a/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
+++ b/package/trousers/0002-Check-that-getpwent_r-is-available-before-using-it.patch
@@ -6,15 +6,17 @@ Subject: [PATCH] Check that getpwent_r is available before using it
 This fixes building trousers with musl
 
 Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
+[Bernd: Rebased for version 0.3.14]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- configure.in        |  4 ++++
+ configure.ac        |  4 ++++
  src/tspi/ps/tspps.c | 10 +++++-----
  2 files changed, 9 insertions(+), 5 deletions(-)
 
 diff --git a/configure.in b/configure.in
 index fd3f5f1..e3d7acf 100644
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -145,6 +145,10 @@ else
  	AC_MSG_ERROR(["gtk", "openssl" and "none" are the only supported gui options for trousers])
  fi
diff --git a/package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch b/package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch
deleted file mode 100644
index f88e47ac27..0000000000
--- a/package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 66bbe0a87818a1e3c721780dc33b2d81fdf4a774 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 21 Aug 2016 23:32:10 +0200
-Subject: [PATCH] tsp_tcsi_param: include limits.h to fix musl build
-
-The musl libc doesn't provide <bits/local_lim.h>, use <limits.h>
-instead.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/tspi/tsp_tcsi_param.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tspi/tsp_tcsi_param.c b/src/tspi/tsp_tcsi_param.c
-index 670f86f..8f2b4e4 100644
---- a/src/tspi/tsp_tcsi_param.c
-+++ b/src/tspi/tsp_tcsi_param.c
-@@ -11,7 +11,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <stdio.h>
--#include <bits/local_lim.h>
-+#include <limits.h>
- #include "trousers/tss.h"
- #include "trousers/trousers.h"
- #include "trousers_types.h"
--- 
-2.5.5
-
diff --git a/package/trousers/trousers.hash b/package/trousers/trousers.hash
index 997cfa97c1..20c65c450e 100644
--- a/package/trousers/trousers.hash
+++ b/package/trousers/trousers.hash
@@ -1,3 +1,6 @@
-# http://sourceforge.net/projects/trousers/files/trousers/0.3.13/
-sha1 d23f1a3df4febffc4174f5cca7d1c54230477bb2 trousers-0.3.13.tar.gz
-md5  ad508f97b406f6e48cd90e85d78e7ca8         trousers-0.3.13.tar.gz
+# http://sourceforge.net/projects/trousers/files/trousers/0.3.14/
+sha1 9ca2cc9e1179465f6c5d9055e2b855e25031b85a trousers-0.3.14.tar.gz
+md5  4a476b4f036dd20a764fb54fc24edbec         trousers-0.3.14.tar.gz
+# Locally computed
+sha256 ce50713a261d14b735ec9ccd97609f0ad5ce69540af560e8c3ce9eb5f2d28f47  trousers-0.3.14.tar.gz
+sha256 1ad596d12e7471549663c03e280b5b5d084a2e853fb86e4d766109818f9d7dae  LICENSE
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index e49c2ac141..1d5364959c 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TROUSERS_VERSION = 0.3.13
+TROUSERS_VERSION = 0.3.14
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
 TROUSERS_LICENSE = BSD-3-Clause
 TROUSERS_LICENSE_FILES = LICENSE
