From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:14:56 +0200
Subject: [Buildroot] [git commit] libiscsi: Bump version
Message-ID: <20150726212545.899727F95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64295d38712ef2aa7cda7a94837d085f63a550f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches were applied upstream so they are removed. Also remove the
autoreconf which has no purposes anymore

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-Fix-warnings-related-to-subdir-objects.patch |   46 -----------
 ...tool-AM_PROG_AR-warning-during-autoreconf.patch |   42 ----------
 ...0003-Fix-CUnit-test-for-cross-compilation.patch |   56 -------------
 ...4-examples-fix-uint64_t-formatting-issues.patch |   49 ------------
 ...005-ld_iscsi-fix-largefile-related-issues.patch |   83 --------------------
 ...nly-build-the-test-tool-and-ld-iscsi-iff-.patch |   55 -------------
 package/libiscsi/libiscsi.hash                     |    2 +
 package/libiscsi/libiscsi.mk                       |    5 +-
 8 files changed, 3 insertions(+), 335 deletions(-)

diff --git a/package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch b/package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
deleted file mode 100644
index 7ccdc53..0000000
--- a/package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e801ccb2633e3f5842ed6d160af0e6e5cce44c77 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 2 Sep 2014 22:38:55 +0200
-Subject: [PATCH 1/4] Fix warnings related to subdir-objects
-
-Use AM_INIT_AUTOMAKE in configure.ac to define options such as
-subdir-objects, instead of AUTOMAKE_OPTIONS in Makefile.am, as it
-allows to avoid warnings during autoreconf:
-
-examples/Makefile.am:25: warning: source file '../lib/connect.c' is in a subdirectory,
-examples/Makefile.am:25: but option 'subdir-objects' is disabled
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am  | 1 -
- configure.ac | 2 +-
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7023988..f9de08c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,7 +2,6 @@
- SUBDIRS = lib doc utils test-tool examples
- 
- ACLOCAL_AMFLAGS =-I m4
--AUTOMAKE_OPTIONS = foreign subdir-objects
- AM_CPPFLAGS=-I. -I$(srcdir)/include "-D_U_=__attribute__((unused))" \
- 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
- AM_CFLAGS=$(WARN_CFLAGS)
-diff --git a/configure.ac b/configure.ac
-index e1d01c6..6d29af0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(libiscsi, m4_esyscmd([grep 'Version:' ./packaging/RPM/libiscsi.spec.in 2
- AC_CONFIG_SRCDIR([lib/init.c])
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
- AM_SILENT_RULES
- LT_INIT
- 
--- 
-2.0.0
-
diff --git a/package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch b/package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
deleted file mode 100644
index 44572f1..0000000
--- a/package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 2f476df340f50b9c10a7f45f4ec809e9ef82aba6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 2 Sep 2014 22:40:04 +0200
-Subject: [PATCH 2/4] Avoid libtool/AM_PROG_AR warning during autoreconf
-
-This patch allows to avoid the following warning during autoreconf:
-
-/home/thomas/projets/buildroot/output/host/usr/share/automake-1.14/am/ltlibrary.am: warning: 'lib/libiscsi_convenience.la': linking libtool libraries using a non-POSIX
-/home/thomas/projets/buildroot/output/host/usr/share/automake-1.14/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Note that LT_INIT *must* be after AM_PROG_AR, otherwise:
-
-configure.ac:14: warning: LT_INIT was called before AM_PROG_AR
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6d29af0..eb9d995 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -5,12 +5,14 @@ AC_CONFIG_MACRO_DIR([m4])
- 
- AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
- AM_SILENT_RULES
--LT_INIT
- 
- AC_CANONICAL_HOST
- AM_CONDITIONAL(LD_ISCSI,
-                [expr "$host_os" : linux > /dev/null 2>&1])
- AM_PROG_CC_C_O
-+AM_PROG_AR
-+
-+LT_INIT
- 
- enable_write_strings="yes"
- 
--- 
-2.0.0
-
diff --git a/package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch b/package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
deleted file mode 100644
index dd4eb4a..0000000
--- a/package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3271dd69b731c0320ab0b3b0a0609e64b00f1a56 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 2 Sep 2014 22:41:32 +0200
-Subject: [PATCH 3/4] Fix CUnit test for cross-compilation
-
-The current test in configure.ac for CUnit uses AC_TRY_RUN, which
-doesn't work in a cross-compilation context, because we can't run on
-the build machine the binaries that are built for the target. In
-addition, the current logic assumes CUnit is available when the
-AC_TRY_RUN test cannot be used (e.g in a cross-compilation case).
-
-Since we actually don't care about *running* but only about testing
-whether a simple program include the CUnit header file and linking
-against the cunit library works, simply use AC_TRY_LINK() instead of
-AC_TRY_RUN().
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 15 ++-------------
- 1 file changed, 2 insertions(+), 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eb9d995..0ee2d9b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -91,25 +91,14 @@ if test x"$libiscsi_cv_HAVE_SOCKADDR_IN6" = x"yes"; then
-     AC_DEFINE(HAVE_SOCKADDR_IN6,1,[Whether we have IPv6 support])
- fi
- 
--
- AC_MSG_CHECKING(whether libcunit is available)
- ac_save_CFLAGS="$CFLAGS"
- ac_save_LIBS="$LIBS"
- CFLAGS="$CFLAGS $GLIB_CFLAGS"
- LIBS="$GLIB_LIBS $LIBS -lcunit"
--AC_TRY_RUN([
--/*
-- * Just see if we can compile/link with libcunit
-- */
-+AC_TRY_LINK([
- #include <CUnit/CUnit.h>
--
--int main(int argc, const char *argv[])
--{
--	return 0;
--}
--], ac_cv_have_cunit=yes, ac_cv_have_cunit=no,
--   [echo $ac_n "compile with CUNIT. Assuming OK... $ac_c"
--    ac_cv_have_cunit=yes])
-+], [], [ac_cv_have_cunit=yes], [ac_cv_have_cunit=no])
- CFLAGS="$ac_save_CFLAGS"
- LIBS="$ac_save_LIBS"
- if test "$ac_cv_have_cunit" = yes ; then
--- 
-2.0.0
-
diff --git a/package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch b/package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
deleted file mode 100644
index 3a45049..0000000
--- a/package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From fdfeff0462e17e0f0e37e65e5b6be6e74a9b39fd Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 2 Sep 2014 22:43:44 +0200
-Subject: [PATCH 4/4] examples: fix uint64_t formatting issues
-
-Using %lu to format uint64_t doesn't work for 32 bits architecture,
-because uint64_t is an unsigned long long and therefore %llu should be
-used. The solution is to use PRIu64 from <inttypes.h>, which is equal
-to %lu on 64 bits architectures, and %llu on 32 bits architectures,
-which corresponds to the definition of uint64_t.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- examples/iscsi-dd.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/examples/iscsi-dd.c b/examples/iscsi-dd.c
-index 4cc7c2b..33007c3 100644
---- a/examples/iscsi-dd.c
-+++ b/examples/iscsi-dd.c
-@@ -19,6 +19,7 @@
- #include <stdlib.h>
- #include <stdint.h>
- #include <string.h>
-+#include <inttypes.h>
- #include <poll.h>
- #include <getopt.h>
- #include "iscsi.h"
-@@ -79,7 +80,7 @@ void write_cb(struct iscsi_context *iscsi, int status, void *command_data, void
- 	fill_read_queue(client);
- 
- 	if (client->progress) {
--		printf("\r%lu of %lu blocks transferred.", client->pos, client->src_num_blocks);
-+		printf("\r%" PRIu64 " of %" PRIu64 " blocks transferred.", client->pos, client->src_num_blocks);
- 	}
- 
- 	if ((client->in_flight == 0) && (client->pos == client->src_num_blocks)) {
-@@ -378,7 +379,7 @@ int main(int argc, char *argv[])
- 	}
- 
- 	if (client.src_num_blocks > client.dst_num_blocks) {
--		fprintf(stderr, "source LUN is bigger than destination (%lu > %lu sectors)\n", client.src_num_blocks, client.dst_num_blocks);
-+		fprintf(stderr, "source LUN is bigger than destination (%" PRIu64 " > %" PRIu64 " sectors)\n", client.src_num_blocks, client.dst_num_blocks);
- 		exit(10);
- 	}
- 
--- 
-2.0.0
-
diff --git a/package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch b/package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
deleted file mode 100644
index 05ad8eb..0000000
--- a/package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From b77db7fa6cd00e1412fdd186180996f8d622b275 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Sep 2014 12:21:04 +0200
-Subject: [PATCH 5/5] ld_iscsi: fix largefile related issues
-
-This commit fixes two related issues in the ld_iscsi example with
-largefile support.
-
-The first issue appears when building libiscsi against the glibc C
-library, with the flags -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
--D_FILE_OFFSET_BITS=64:
-
-{standard input}: Assembler messages:
-{standard input}:2774: Error: symbol `__fxstat64' is already defined
-{standard input}:2850: Error: symbol `__lxstat64' is already defined
-{standard input}:2938: Error: symbol `__xstat64' is already defined
-
-This is due to the fact that when _FILE_OFFSET_BITS=64 is passed, the
-*64() functions are defined by the C library as aliases to the
-non-64*() functions, because those ones directly support large files
-(i.e 64 bits).
-
-The second issue appears when building libiscsi against the uClibc C
-library, in a configuration that doesn't have largefile support. In
-this case, the ld_iscsi that tries to use stat64 or some other *64()
-functions cannot build, because such functions are not provided by the
-C library. Of course, ld_iscsi does not need to wrap the *64()
-functions in such a situation, because they do not exist.
-
-This commit fixes those problems by enclosing the *64() related code
-of ld_iscsi in the following compile time conditional:
-
-This ensures that the *64() function handling is here only if
-largefile support is available and enabled (_LARGEFILE_SOURCE64) and
-if non-*64() functions are not already 64 bits capable (in which case
-the 64*() functions are just aliases for the non-64*() ones).
-
-See also
-http://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html
-for more details about the meaning of those macros.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- examples/ld_iscsi.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/examples/ld_iscsi.c b/examples/ld_iscsi.c
-index 0cf2724..02f9d25 100644
---- a/examples/ld_iscsi.c
-+++ b/examples/ld_iscsi.c
-@@ -543,6 +543,7 @@ int dup2(int oldfd, int newfd)
- 	return real_dup2(oldfd, newfd);
- }
- 
-+#if defined(_LARGEFILE64_SOURCE) && _FILE_OFFSET_BITS != 64
- 
- int (*real_fxstat64)(int ver, int fd, struct stat64 *buf);
- 
-@@ -591,6 +592,7 @@ int __xstat64(int ver, const char *path, struct stat64 *buf)
- 	return __lxstat64(ver, path, buf);
- }
- 
-+#endif
- 
- static void __attribute__((constructor)) _init(void)
- {
-@@ -669,6 +671,7 @@ static void __attribute__((constructor)) _init(void)
- 		exit(10);
- 	}
- 
-+#if defined(_LARGEFILE64_SOURCE) && _FILE_OFFSET_BITS != 64
- 	real_fxstat64 = dlsym(RTLD_NEXT, "__fxstat64");
- 	if (real_fxstat64 == NULL) {
- 		LD_ISCSI_DPRINTF(0,"Failed to dlsym(__fxstat64)");
-@@ -683,4 +686,5 @@ static void __attribute__((constructor)) _init(void)
- 	if (real_xstat64 == NULL) {
- 		LD_ISCSI_DPRINTF(0,"Failed to dlsym(__xstat64)");
- 	}
-+#endif
- }
--- 
-2.0.0
-
diff --git a/package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch b/package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch
deleted file mode 100644
index d57a208..0000000
--- a/package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Only build the test tool and ld-iscsi if we have shared libraries
-
-Backporting an upstream patch to fix a failure when doing a static
-build:
-
-/br/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc -shared -o 
-ld_iscsi.so ld_iscsi.o -ldl
-/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld: 
-ld_iscsi.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be 
-used when making a shared object; recompile with -fPIC
-ld_iscsi.o: could not read symbols: Bad value
-collect2: error: ld returned 1 exit status
-
-Upstream commit:
-  https://github.com/sahlberg/libiscsi/commit/3d6c2be3428d88682cecfa2a4ad172aaacffb318
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 3d6c2be3428d88682cecfa2a4ad172aaacffb318 Mon Sep 17 00:00:00 2001
-From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
-Date: Wed, 22 Oct 2014 17:44:03 -0700
-Subject: [PATCH] configure: only build the test tool and ld-iscsi iff we have shared libraries
-
-Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
----
- configure.ac |    5 ++---
- 1 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e18ff4..e9c5c93 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -10,8 +10,6 @@ AM_PROG_AR
- LT_INIT
- 
- AC_CANONICAL_HOST
--AM_CONDITIONAL(LD_ISCSI,
--               [expr "$host_os" : linux > /dev/null 2>&1])
- AM_PROG_CC_C_O
- 
- enable_write_strings="yes"
-@@ -108,8 +106,9 @@ else
-   AC_MSG_NOTICE(You need libcunit to build the test suite.)
-   AC_MSG_NOTICE(The scsi/iscsi test suite will not be built.)
- fi
--AM_CONDITIONAL(ISCSITEST, [test "$ac_cv_have_cunit" = yes])
-+AM_CONDITIONAL(ISCSITEST, [test "$ac_cv_have_cunit" = yes -a "$enable_shared" = "yes"])
- 
-+AM_CONDITIONAL(LD_ISCSI, [expr "(" "$host_os" : "linux" ")" "&" "$enable_shared" "=" "yes"])
- 
- AC_CHECK_MEMBER([struct CU_SuiteInfo.pSetUpFunc],
- 		[AC_DEFINE([HAVE_CU_SUITEINFO_PSETUPFUNC], 1,
--- 
-1.7.1
-
diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
new file mode 100644
index 0000000..8ccc264
--- /dev/null
+++ b/package/libiscsi/libiscsi.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 26aa5583053d4fe0d4686f76a76c216c7dce00130f008e652ece305b88758ff1  libiscsi-1.15.0.tar.gz
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index c244830..7877cd9 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-LIBISCSI_VERSION = 1.12.0
+LIBISCSI_VERSION = 1.15.0
 LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs
 LIBISCSI_LICENSE = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 
-# We patch configure.ac and Makefile.am
-LIBISCSI_AUTORECONF = YES
-
 $(eval $(autotools-package))
