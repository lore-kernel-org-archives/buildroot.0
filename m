From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:22:12 +0200
Subject: [Buildroot] [git commit] util-linux: bump to version 2.28
Message-ID: <20160418192251.E7DBF8082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baccb506a6feabf114623866568121f49712f5df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches (0004-0008).
Convert 0001-sscanf-no-ms-as.patch to git format.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... => 0001-Fix-libmount-build-under-uClibc.patch} | 48 +++++++++++--------
 ...004-vipw-Remove-pre-ANSI-compiler-support.patch | 35 --------------
 .../0005-build-sys-use-REALTIME_LIBS.patch         | 41 ----------------
 ...sys-fix-static-configuration-and-building.patch | 54 ----------------------
 package/util-linux/0007-build-sys-fix-typo.patch   | 34 --------------
 ...don-t-free-shm-data-if-no-shm-id-is-found.patch | 42 -----------------
 package/util-linux/util-linux.hash                 |  4 +-
 package/util-linux/util-linux.mk                   |  7 ++-
 8 files changed, 35 insertions(+), 230 deletions(-)

diff --git a/package/util-linux/0001-sscanf-no-ms-as.patch b/package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
similarity index 66%
rename from package/util-linux/0001-sscanf-no-ms-as.patch
rename to package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
index 81b2be5..10cc3a5 100644
--- a/package/util-linux/0001-sscanf-no-ms-as.patch
+++ b/package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
@@ -1,29 +1,38 @@
-Fix libmount build under uClibc
+From 44d733203637666926964957af7af23429ddcecf Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 18 Apr 2016 09:58:56 -0300
+Subject: [PATCH] Fix libmount build under uClibc
 
 See https://bugs.gentoo.org/show_bug.cgi?id=406303
 http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
 
-[Gustavo: Ported to util-linux-2.26]
+[Gustavo: converted to git format for 2.28]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac             |  1 -
+ libmount/src/tab_parse.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 52 insertions(+), 1 deletion(-)
 
-diff -Nura util-linux-2.26.orig/configure.ac util-linux-2.26/configure.ac
---- util-linux-2.26.orig/configure.ac	2015-02-19 09:11:13.146192401 -0300
-+++ util-linux-2.26/configure.ac	2015-02-20 08:13:32.740006582 -0300
-@@ -840,7 +840,6 @@
+diff --git a/configure.ac b/configure.ac
+index 5a00403..3422f11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -948,7 +948,6 @@ AC_ARG_ENABLE([libmount],
  )
  UL_BUILD_INIT([libmount])
  UL_REQUIRES_BUILD([libmount], [libblkid])
 -UL_REQUIRES_HAVE([libmount], [scanf_alloc_modifier], [scanf string alloc modifier])
  AM_CONDITIONAL([BUILD_LIBMOUNT], [test "x$build_libmount" = xyes])
  AM_CONDITIONAL([BUILD_LIBMOUNT_TESTS], [test "x$build_libmount" = xyes -a "x$enable_static" = xyes])
- 
-diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmount/src/tab_parse.c
---- util-linux-2.26.orig/libmount/src/tab_parse.c	2015-02-16 09:57:34.070017496 -0300
-+++ util-linux-2.26/libmount/src/tab_parse.c	2015-02-20 08:13:32.741006617 -0300
-@@ -22,6 +22,10 @@
- #include "pathnames.h"
- #include "strutils.h"
+ AS_IF([test "x$build_libmount" = xyes], [
+diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
+index 3f5e14a..2ff1795 100644
+--- a/libmount/src/tab_parse.c
++++ b/libmount/src/tab_parse.c
+@@ -39,6 +39,10 @@ static void parser_cleanup(struct libmnt_parser *pa)
+ 	memset(pa, 0, sizeof(*pa));
+ }
  
 +#ifndef HAVE_SCANF_MS_MODIFIER
 +# define UL_SCNsA "%s"
@@ -32,7 +41,7 @@ diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmoun
  static int next_number(char **s, int *num)
  {
  	char *end = NULL;
-@@ -52,16 +56,31 @@
+@@ -69,16 +73,31 @@ static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
  	int rc, n = 0, xrc;
  	char *src = NULL, *fstype = NULL, *optstr = NULL;
  
@@ -64,7 +73,7 @@ diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmoun
  			&n);
  	xrc = rc;
  
-@@ -127,6 +146,16 @@
+@@ -144,6 +163,16 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
  	unsigned int maj, min;
  	char *fstype = NULL, *src = NULL, *p;
  
@@ -81,7 +90,7 @@ diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmoun
  	rc = sscanf(s,	"%d "		/* (1) id */
  			"%d "		/* (2) parent */
  			"%u:%u "	/* (3) maj:min */
-@@ -138,9 +167,15 @@
+@@ -155,9 +184,15 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
  			&fs->id,
  			&fs->parent,
  			&maj, &min,
@@ -97,7 +106,7 @@ diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmoun
  			&end);
  
  	if (rc >= 7 && end > 0)
-@@ -160,9 +195,15 @@
+@@ -177,9 +212,15 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
  			UL_SCNsA" "	/* (9) source */
  			UL_SCNsA,	/* (10) fs options (fs specific) */
  
@@ -113,7 +122,7 @@ diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmoun
  
  	if (rc >= 10) {
  		size_t sz;
-@@ -281,14 +322,25 @@
+@@ -298,14 +339,25 @@ static int mnt_parse_swaps_line(struct libmnt_fs *fs, char *s)
  	int rc;
  	char *src = NULL;
  
@@ -139,3 +148,6 @@ diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmoun
  			&fsz,
  			&usz,
  			&fs->priority);
+-- 
+2.7.3
+
diff --git a/package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch b/package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch
deleted file mode 100644
index 3a0c42a..0000000
--- a/package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9ce534491aea9b7975cfee5064423d0b850d8002 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 9 Aug 2015 11:20:00 +0200
-Subject: [PATCH] vipw: Remove pre-ANSI compiler support
-
-__P() is used for compatibility with old K&R C compilers. With
-ANSI C this macro has no effect.
-
-This fixes a compilation error with musl libc because of undeclared
-__P.
-
-Ref:
-https://lists.samba.org/archive/samba-technical/2015-June/108042.html
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- login-utils/vipw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/login-utils/vipw.c b/login-utils/vipw.c
-index 668f4d8..e4c803b 100644
---- a/login-utils/vipw.c
-+++ b/login-utils/vipw.c
-@@ -85,7 +85,7 @@ int program;
- char orig_file[FILENAMELEN];	/* original file /etc/passwd or /etc/group */
- char *tmp_file;			/* tmp file */
- 
--void pw_error __P((char *, int, int));
-+void pw_error (char *, int, int);
- 
- static void copyfile(int from, int to)
- {
--- 
-2.4.3
-
diff --git a/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch b/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
deleted file mode 100644
index 6402ef5..0000000
--- a/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9ed54668c15534a3b9d75e8a3e90b72ea426e596 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Fri, 9 Oct 2015 11:31:49 +0200
-Subject: [PATCH] build-sys: use REALTIME_LIBS
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- misc-utils/Makemodule.am | 2 +-
- sys-utils/Makemodule.am  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
-index e801611..b96d18b 100644
---- a/misc-utils/Makemodule.am
-+++ b/misc-utils/Makemodule.am
-@@ -90,7 +90,7 @@ endif
- if BUILD_UUIDD
- usrsbin_exec_PROGRAMS += uuidd
- dist_man_MANS += misc-utils/uuidd.8
--uuidd_LDADD = $(LDADD) libuuid.la libcommon.la
-+uuidd_LDADD = $(LDADD) libuuid.la libcommon.la $(REALTIME_LIBS)
- uuidd_CFLAGS = $(DAEMON_CFLAGS) $(AM_CFLAGS) -I$(ul_libuuid_incdir)
- uuidd_LDFLAGS = $(DAEMON_LDFLAGS) $(AM_LDFLAGS)
- uuidd_SOURCES = misc-utils/uuidd.c
-
-diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
-index f306e65..3d28ff1 100644
---- a/sys-utils/Makemodule.am
-+++ b/sys-utils/Makemodule.am
-@@ -2,7 +2,7 @@ if BUILD_FLOCK
- usrbin_exec_PROGRAMS += flock
- dist_man_MANS += sys-utils/flock.1
- flock_SOURCES = sys-utils/flock.c lib/monotonic.c lib/timer.c
--flock_LDADD = $(LDADD) libcommon.la -lrt
-+flock_LDADD = $(LDADD) libcommon.la $(REALTIME_LIBS)
- endif
-
- if BUILD_IPCMK
--- 
-2.5.0
-
diff --git a/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch b/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch
deleted file mode 100644
index cd5654e..0000000
--- a/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f69e18629d1c91d83ab91314baf5e34088b57f6e Mon Sep 17 00:00:00 2001
-From: Lada Trimasova <ltrimas@synopsys.com>
-Date: Wed, 27 Jan 2016 16:26:41 +0300
-Subject: [PATCH] buildsys: fix static configuration and building
-
-In case of uClibc librt depends on libpthread. In particular
-timer_create() function uses pthread_XXX(). That means in case
-of static builds it's required to link not librt alone but
-together with libpthread. So if checking timer_create function
-in librt fails, it is necessary to check if timer_create function
-successfully links with "-lpthread".
-
-That issues was spotted in Buldroot autobuilder failures:
-http://autobuild.buildroot.net/results/759/75960db671807091fe9155aee9e46a6245e32590/
-http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/
-
-Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
----
- configure.ac | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 56512c0..9392bf2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -382,14 +382,23 @@ AC_CHECK_FUNCS([clock_gettime], [],
- AC_SUBST([REALTIME_LIBS])
- 
- have_timer="no"
--AC_CHECK_FUNCS([timer_createx],
-+AC_CHECK_FUNCS([timer_create],
- 	[have_time="yes"],
- 	[AC_CHECK_LIB([rt], [timer_create], [
- 		have_timer="yes"
- 		REALTIME_LIBS="-lrt"
--	])]
-+	],[
-+		AC_SEARCH_LIBS([timer_create], [rt], [
-+			AC_MSG_RESULT(yes)
-+			have_timer="yes"
-+			REALTIME_LIBS="-lrt -lpthread"
-+		],[], [-lpthread]
-+		)
-+		])]
- )
- 
-+AC_SUBST([REALTIME_LIBS])
-+
- 
- AC_CHECK_MEMBER([struct sockaddr.sa_len],
- 		AC_DEFINE_UNQUOTED([HAVE_SA_LEN], [1], [Define if struct sockaddr contains sa_len]), [],
--- 
-2.5.0
-
diff --git a/package/util-linux/0007-build-sys-fix-typo.patch b/package/util-linux/0007-build-sys-fix-typo.patch
deleted file mode 100644
index 204c3d8..0000000
--- a/package/util-linux/0007-build-sys-fix-typo.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dea1bd2917ed9490ee96162288e0904e3de9da2d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 16 Feb 2016 00:24:30 +0100
-Subject: [PATCH] build-sys: fix typo
-
-When timer_create is available have_timer must be
-set to "yes". But instead have_time is used.
-
-Replace have_time by have_timer.
-
-Fixes:
-http://autobuild.buildroot.net/results/993/9935cd0522d4f978ba2e788a690f66790686b76b
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4559573..3950f0c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -390,7 +390,7 @@ AC_CHECK_FUNCS([clock_gettime], [],
- 
- have_timer="no"
- AC_CHECK_FUNCS([timer_create],
--	[have_time="yes"],
-+	[have_timer="yes"],
- 	[AC_CHECK_LIB([rt], [timer_create], [
- 		have_timer="yes"
- 		REALTIME_LIBS="-lrt"
--- 
-2.5.0
-
diff --git a/package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch b/package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch
deleted file mode 100644
index 58e422a..0000000
--- a/package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cb8e8ecc800a1a8536fe5507ae7d09a8c1c442a8 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 22 Mar 2016 11:25:09 +0100
-Subject: [PATCH] lsipc: don't free shm data if no shm id is found
-
-There is a segfault in do_shm_global() when ipc_shm_get_info() return 0 and
-ipc_shm_free_info() is called.
-
-When no shm id is found, the memory allocated in shmds by ipc_shm_get_info() is
-already free when ipc_shm_free_info() is called.
-
-Move ipc_shm_free_info(shmds) inside the if statement where at least one shm id
-is found.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- sys-utils/lsipc.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/sys-utils/lsipc.c b/sys-utils/lsipc.c
-index 523859c..fa5d99c 100644
---- a/sys-utils/lsipc.c
-+++ b/sys-utils/lsipc.c
-@@ -1072,14 +1072,13 @@ static void do_shm_global(struct libscols_table *tb)
- 			++nsegs;
- 			sum_segsz += shmdsp->shm_segsz;
- 		}
-+		ipc_shm_free_info(shmds);
- 	}
- 
- 	global_set_data(tb, "SHMMNI", _("Shared memory segments"), nsegs, lim.shmmni, 1);
- 	global_set_data(tb, "SHMALL", _("Shared memory pages"), sum_segsz / getpagesize(), lim.shmall, 1);
- 	global_set_data(tb, "SHMMAX", _("Max size of shared memory segment (bytes)"), 0, lim.shmmax, 0);
- 	global_set_data(tb, "SHMMIN", _("Min size of shared memory segment (bytes)"), 0, lim.shmmin, 0);
--
--	ipc_shm_free_info(shmds);
- }
- 
- int main(int argc, char *argv[])
--- 
-2.1.4
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index de60823..ca58102 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.27/sha256sums.asc
-sha256 0a818fcdede99aec43ffe6ca5b5388bff80d162f2f7bd4541dca94fecb87a290  util-linux-2.27.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.28/sha256sums.asc
+sha256	395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb	util-linux-2.28.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a055d17..93f45c2 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
-UTIL_LINUX_VERSION_MAJOR = 2.27
+UTIL_LINUX_VERSION = 2.28
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
-UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION)
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2.1+, libuuid BSD-3c
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
-
+# For 0001-Fix-libmount-build-under-uClibc.patch
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
