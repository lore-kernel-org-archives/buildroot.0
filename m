From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Sep 2014 16:00:40 +0200
Subject: [Buildroot] [PATCH] libiscsi: bump version to 1.12.0
Message-ID: <1410012040-16794-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps libiscsi to version 1.12.0, which requires a few
changes:

 - A number of patches to get libiscsi to build properly.
 - The removal of the popt dependency, which is no longer needed.
 - The removal of unnecessary spaces for alignment of variable
   definitions in libiscsi.mk.

Fixes:

  http://autobuild.buildroot.org/results/72f/72f389edf9c5a7e35d01dc4f76fd6dd0d8110f20/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiscsi/Config.in                         |  1 -
 ...01-Fix-warnings-related-to-subdir-objects.patch | 46 ++++++++++++++++++
 ...tool-AM_PROG_AR-warning-during-autoreconf.patch | 42 ++++++++++++++++
 ...0003-Fix-CUnit-test-for-cross-compilation.patch | 56 ++++++++++++++++++++++
 ...4-examples-fix-uint64_t-formatting-issues.patch | 49 +++++++++++++++++++
 package/libiscsi/libiscsi.mk                       | 14 +++---
 6 files changed, 200 insertions(+), 8 deletions(-)
 create mode 100644 package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch
 create mode 100644 package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
 create mode 100644 package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch
 create mode 100644 package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch

diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
index 3ec184a..88933f3 100644
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBISCSI
 	bool "libiscsi"
-	select BR2_PACKAGE_POPT
 	help
 	  Libiscsi is a client-side library to implement the iSCSI protocol
 	  that can be used to access resource of an iSCSI Target.
diff --git a/package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch b/package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch
new file mode 100644
index 0000000..7ccdc53
--- /dev/null
+++ b/package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch
@@ -0,0 +1,46 @@
+From e801ccb2633e3f5842ed6d160af0e6e5cce44c77 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 2 Sep 2014 22:38:55 +0200
+Subject: [PATCH 1/4] Fix warnings related to subdir-objects
+
+Use AM_INIT_AUTOMAKE in configure.ac to define options such as
+subdir-objects, instead of AUTOMAKE_OPTIONS in Makefile.am, as it
+allows to avoid warnings during autoreconf:
+
+examples/Makefile.am:25: warning: source file '../lib/connect.c' is in a subdirectory,
+examples/Makefile.am:25: but option 'subdir-objects' is disabled
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am  | 1 -
+ configure.ac | 2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7023988..f9de08c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,6 @@
+ SUBDIRS = lib doc utils test-tool examples
+ 
+ ACLOCAL_AMFLAGS =-I m4
+-AUTOMAKE_OPTIONS = foreign subdir-objects
+ AM_CPPFLAGS=-I. -I$(srcdir)/include "-D_U_=__attribute__((unused))" \
+ 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
+ AM_CFLAGS=$(WARN_CFLAGS)
+diff --git a/configure.ac b/configure.ac
+index e1d01c6..6d29af0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_INIT(libiscsi, m4_esyscmd([grep 'Version:' ./packaging/RPM/libiscsi.spec.in 2
+ AC_CONFIG_SRCDIR([lib/init.c])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
+ AM_SILENT_RULES
+ LT_INIT
+ 
+-- 
+2.0.0
+
diff --git a/package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch b/package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
new file mode 100644
index 0000000..44572f1
--- /dev/null
+++ b/package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
@@ -0,0 +1,42 @@
+From 2f476df340f50b9c10a7f45f4ec809e9ef82aba6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 2 Sep 2014 22:40:04 +0200
+Subject: [PATCH 2/4] Avoid libtool/AM_PROG_AR warning during autoreconf
+
+This patch allows to avoid the following warning during autoreconf:
+
+/home/thomas/projets/buildroot/output/host/usr/share/automake-1.14/am/ltlibrary.am: warning: 'lib/libiscsi_convenience.la': linking libtool libraries using a non-POSIX
+/home/thomas/projets/buildroot/output/host/usr/share/automake-1.14/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Note that LT_INIT *must* be after AM_PROG_AR, otherwise:
+
+configure.ac:14: warning: LT_INIT was called before AM_PROG_AR
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6d29af0..eb9d995 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5,12 +5,14 @@ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
+ AM_SILENT_RULES
+-LT_INIT
+ 
+ AC_CANONICAL_HOST
+ AM_CONDITIONAL(LD_ISCSI,
+                [expr "$host_os" : linux > /dev/null 2>&1])
+ AM_PROG_CC_C_O
++AM_PROG_AR
++
++LT_INIT
+ 
+ enable_write_strings="yes"
+ 
+-- 
+2.0.0
+
diff --git a/package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch b/package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch
new file mode 100644
index 0000000..dd4eb4a
--- /dev/null
+++ b/package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch
@@ -0,0 +1,56 @@
+From 3271dd69b731c0320ab0b3b0a0609e64b00f1a56 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 2 Sep 2014 22:41:32 +0200
+Subject: [PATCH 3/4] Fix CUnit test for cross-compilation
+
+The current test in configure.ac for CUnit uses AC_TRY_RUN, which
+doesn't work in a cross-compilation context, because we can't run on
+the build machine the binaries that are built for the target. In
+addition, the current logic assumes CUnit is available when the
+AC_TRY_RUN test cannot be used (e.g in a cross-compilation case).
+
+Since we actually don't care about *running* but only about testing
+whether a simple program include the CUnit header file and linking
+against the cunit library works, simply use AC_TRY_LINK() instead of
+AC_TRY_RUN().
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eb9d995..0ee2d9b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -91,25 +91,14 @@ if test x"$libiscsi_cv_HAVE_SOCKADDR_IN6" = x"yes"; then
+     AC_DEFINE(HAVE_SOCKADDR_IN6,1,[Whether we have IPv6 support])
+ fi
+ 
+-
+ AC_MSG_CHECKING(whether libcunit is available)
+ ac_save_CFLAGS="$CFLAGS"
+ ac_save_LIBS="$LIBS"
+ CFLAGS="$CFLAGS $GLIB_CFLAGS"
+ LIBS="$GLIB_LIBS $LIBS -lcunit"
+-AC_TRY_RUN([
+-/*
+- * Just see if we can compile/link with libcunit
+- */
++AC_TRY_LINK([
+ #include <CUnit/CUnit.h>
+-
+-int main(int argc, const char *argv[])
+-{
+-	return 0;
+-}
+-], ac_cv_have_cunit=yes, ac_cv_have_cunit=no,
+-   [echo $ac_n "compile with CUNIT. Assuming OK... $ac_c"
+-    ac_cv_have_cunit=yes])
++], [], [ac_cv_have_cunit=yes], [ac_cv_have_cunit=no])
+ CFLAGS="$ac_save_CFLAGS"
+ LIBS="$ac_save_LIBS"
+ if test "$ac_cv_have_cunit" = yes ; then
+-- 
+2.0.0
+
diff --git a/package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch b/package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch
new file mode 100644
index 0000000..3a45049
--- /dev/null
+++ b/package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch
@@ -0,0 +1,49 @@
+From fdfeff0462e17e0f0e37e65e5b6be6e74a9b39fd Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 2 Sep 2014 22:43:44 +0200
+Subject: [PATCH 4/4] examples: fix uint64_t formatting issues
+
+Using %lu to format uint64_t doesn't work for 32 bits architecture,
+because uint64_t is an unsigned long long and therefore %llu should be
+used. The solution is to use PRIu64 from <inttypes.h>, which is equal
+to %lu on 64 bits architectures, and %llu on 32 bits architectures,
+which corresponds to the definition of uint64_t.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ examples/iscsi-dd.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/examples/iscsi-dd.c b/examples/iscsi-dd.c
+index 4cc7c2b..33007c3 100644
+--- a/examples/iscsi-dd.c
++++ b/examples/iscsi-dd.c
+@@ -19,6 +19,7 @@
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <string.h>
++#include <inttypes.h>
+ #include <poll.h>
+ #include <getopt.h>
+ #include "iscsi.h"
+@@ -79,7 +80,7 @@ void write_cb(struct iscsi_context *iscsi, int status, void *command_data, void
+ 	fill_read_queue(client);
+ 
+ 	if (client->progress) {
+-		printf("\r%lu of %lu blocks transferred.", client->pos, client->src_num_blocks);
++		printf("\r%" PRIu64 " of %" PRIu64 " blocks transferred.", client->pos, client->src_num_blocks);
+ 	}
+ 
+ 	if ((client->in_flight == 0) && (client->pos == client->src_num_blocks)) {
+@@ -378,7 +379,7 @@ int main(int argc, char *argv[])
+ 	}
+ 
+ 	if (client.src_num_blocks > client.dst_num_blocks) {
+-		fprintf(stderr, "source LUN is bigger than destination (%lu > %lu sectors)\n", client.src_num_blocks, client.dst_num_blocks);
++		fprintf(stderr, "source LUN is bigger than destination (%" PRIu64 " > %" PRIu64 " sectors)\n", client.src_num_blocks, client.dst_num_blocks);
+ 		exit(10);
+ 	}
+ 
+-- 
+2.0.0
+
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index eddde33..a52211b 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBISCSI_VERSION         = 1.6.0
-LIBISCSI_SITE            = https://github.com/downloads/sahlberg/libiscsi
-LIBISCSI_LICENSE         = GPLv2+ LGPLv2.1+
-LIBISCSI_LICENSE_FILES   = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
+LIBISCSI_VERSION = 1.12.0
+LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs/
+LIBISCSI_LICENSE = GPLv2+ LGPLv2.1+
+LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
-LIBISCSI_DEPENDENCIES    = popt
-# fixes MIPS64 link failure
-LIBISCSI_AUTORECONF      = YES
+
+# We patch configure.ac and Makefile.am
+LIBISCSI_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.0.0
