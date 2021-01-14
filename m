From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jan 2021 22:59:25 +0100
Subject: [Buildroot] [git commit] package/erofs-utils: bump version to 1.2.1
Message-ID: <20210114214104.A08778129A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c00d8f18a381df4749dd346f8464321699ed5ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- minor maintainence release mainly to address exist build issues;
- remove the following patches since all have been upstreamed:
    0001-erofs-utils-fix-multiple-definition-of-sbi.patch;
    0002-erofs-utils-fuse-fix-linking-when-using-with-selinux.patch;
    0003-erofs-utils-fuse-disable-backtrace-if-unsupported.patch.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...rofs-utils-fix-multiple-definition-of-sbi.patch | 62 ----------------
 ...-fuse-fix-linking-when-using-with-selinux.patch | 33 ---------
 ...ils-fuse-disable-backtrace-if-unsupported.patch | 82 ----------------------
 package/erofs-utils/erofs-utils.hash               |  4 +-
 package/erofs-utils/erofs-utils.mk                 |  2 +-
 5 files changed, 3 insertions(+), 180 deletions(-)

diff --git a/package/erofs-utils/0001-erofs-utils-fix-multiple-definition-of-sbi.patch b/package/erofs-utils/0001-erofs-utils-fix-multiple-definition-of-sbi.patch
deleted file mode 100644
index 374c9ab72d..0000000000
--- a/package/erofs-utils/0001-erofs-utils-fix-multiple-definition-of-sbi.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 6c938b755682629a26f85e5540f40c0d316130ed Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@aol.com>
-Date: Tue, 8 Dec 2020 18:57:41 +0800
-Subject: erofs-utils: fix multiple definition of `sbi'
-
-As nl6720 reported [1], lib/inode.o (mkfs) and lib/super.o (erofsfuse)
-could be compiled together by some options. Fix it now.
-
-[1] https://lore.kernel.org/r/10789285.Na0ui7I3VY at walnut
-
-Link: https://lore.kernel.org/r/20201208105741.9614-1-hsiangkao at aol.com
-Fixes: 5e35b75ad499 ("erofs-utils: introduce fuse implementation")
-Reported-by: nl6720 <nl6720@gmail.com>
-Reviewed-by: Li Guifu <bluce.lee@aliyun.com>
-Signed-off-by: Gao Xiang <hsiangkao@aol.com>
----
- lib/config.c | 1 +
- lib/inode.c  | 2 --
- lib/super.c  | 2 --
- 3 files changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/lib/config.c b/lib/config.c
-index 3155112..3ecd481 100644
---- a/lib/config.c
-+++ b/lib/config.c
-@@ -11,6 +11,7 @@
- #include "erofs/internal.h"
- 
- struct erofs_configure cfg;
-+struct erofs_sb_info sbi;
- 
- void erofs_init_configure(void)
- {
-diff --git a/lib/inode.c b/lib/inode.c
-index 3d634fc..0c4839d 100644
---- a/lib/inode.c
-+++ b/lib/inode.c
-@@ -22,8 +22,6 @@
- #include "erofs/xattr.h"
- #include "erofs/exclude.h"
- 
--struct erofs_sb_info sbi;
--
- #define S_SHIFT                 12
- static unsigned char erofs_ftype_by_mode[S_IFMT >> S_SHIFT] = {
- 	[S_IFREG >> S_SHIFT]  = EROFS_FT_REG_FILE,
-diff --git a/lib/super.c b/lib/super.c
-index 2d36692..025cefe 100644
---- a/lib/super.c
-+++ b/lib/super.c
-@@ -11,8 +11,6 @@
- #include "erofs/io.h"
- #include "erofs/print.h"
- 
--struct erofs_sb_info sbi;
--
- static bool check_layout_compatibility(struct erofs_sb_info *sbi,
- 				       struct erofs_super_block *dsb)
- {
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/erofs-utils/0002-erofs-utils-fuse-fix-linking-when-using-with-selinux.patch b/package/erofs-utils/0002-erofs-utils-fuse-fix-linking-when-using-with-selinux.patch
deleted file mode 100644
index bea3168b53..0000000000
--- a/package/erofs-utils/0002-erofs-utils-fuse-fix-linking-when-using-with-selinux.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f1f9659e98ea925a100e50332309955f5b2b4234 Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Thu, 10 Dec 2020 21:29:43 -0500
-Subject: erofs-utils: fuse: fix linking when using --with-selinux
-
-The libselinux functions selabel_open and selabel_close are called
-by lib/config.c, so include libselinux in CFLAGS and LIBS to fix
-building erofsfuse.
-
-Link: https://lore.kernel.org/r/87360dnkh4.fsf at gmail.com
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Reviewed-and-tested-by: Li Guifu <bluce.lee@aliyun.com>
-Signed-off-by: Gao Xiang <hsiangkao@aol.com>
----
- fuse/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/fuse/Makefile.am b/fuse/Makefile.am
-index f14f6fd..e7757bc 100644
---- a/fuse/Makefile.am
-+++ b/fuse/Makefile.am
-@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
- bin_PROGRAMS     = erofsfuse
- erofsfuse_SOURCES = dir.c main.c
- erofsfuse_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
--erofsfuse_CFLAGS += -DFUSE_USE_VERSION=26 ${libfuse_CFLAGS}
--erofsfuse_LDADD = $(top_builddir)/lib/liberofs.la ${libfuse_LIBS} ${liblz4_LIBS}
-+erofsfuse_CFLAGS += -DFUSE_USE_VERSION=26 ${libfuse_CFLAGS} ${libselinux_CFLAGS}
-+erofsfuse_LDADD = $(top_builddir)/lib/liberofs.la ${libfuse_LIBS} ${liblz4_LIBS} ${libselinux_LIBS}
- 
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/erofs-utils/0003-erofs-utils-fuse-disable-backtrace-if-unsupported.patch b/package/erofs-utils/0003-erofs-utils-fuse-disable-backtrace-if-unsupported.patch
deleted file mode 100644
index 4881df30c4..0000000000
--- a/package/erofs-utils/0003-erofs-utils-fuse-disable-backtrace-if-unsupported.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 833563ffd3126b6e85fc54402c6d68c29a30264c Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@aol.com>
-Date: Thu, 17 Dec 2020 16:59:04 +0800
-Subject: [PATCH] erofs-utils: fuse: disable backtrace if unsupported
-
-backtrace is a GNU extension, enable it conditionally.
-
-Signed-off-by: Gao Xiang <hsiangkao@aol.com>
----
- configure.ac | 3 ++-
- fuse/main.c  | 8 ++++++--
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d5fdfb8a3d17..28926c303c5c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -96,6 +96,7 @@ AC_ARG_VAR([LZ4_LIBS], [linker flags for lz4])
- # Checks for header files.
- AC_CHECK_HEADERS(m4_flatten([
- 	dirent.h
-+	execinfo.h
- 	fcntl.h
- 	getopt.h
- 	inttypes.h
-@@ -147,7 +148,7 @@ AC_CHECK_DECL(lseek64,[AC_DEFINE(HAVE_LSEEK64_PROTOTYPE, 1,
-    #include <unistd.h>])
- 
- # Checks for library functions.
--AC_CHECK_FUNCS([fallocate gettimeofday memset realpath strdup strerror strrchr strtoull])
-+AC_CHECK_FUNCS([backtrace fallocate gettimeofday memset realpath strdup strerror strrchr strtoull])
- 
- # Configure libuuid
- AS_IF([test "x$with_uuid" != "xno"], [
-diff --git a/fuse/main.c b/fuse/main.c
-index 1e24efe110c2..c16291272e75 100644
---- a/fuse/main.c
-+++ b/fuse/main.c
-@@ -6,7 +6,6 @@
-  */
- #include <stdlib.h>
- #include <string.h>
--#include <execinfo.h>
- #include <signal.h>
- #include <libgen.h>
- #include <fuse.h>
-@@ -168,6 +167,9 @@ static int optional_opt_func(void *data, const char *arg, int key,
- 	return 1;
- }
- 
-+#if defined(HAVE_EXECINFO_H) && defined(HAVE_BACKTRACE)
-+#include <execinfo.h>
-+
- static void signal_handle_sigsegv(int signal)
- {
- 	void *array[10];
-@@ -187,7 +189,7 @@ static void signal_handle_sigsegv(int signal)
- 	erofs_dump("========================================\n");
- 	abort();
- }
--
-+#endif
- 
- int main(int argc, char *argv[])
- {
-@@ -197,11 +199,13 @@ int main(int argc, char *argv[])
- 	erofs_init_configure();
- 	fprintf(stderr, "%s %s\n", basename(argv[0]), cfg.c_version);
- 
-+#if defined(HAVE_EXECINFO_H) && defined(HAVE_BACKTRACE)
- 	if (signal(SIGSEGV, signal_handle_sigsegv) == SIG_ERR) {
- 		fprintf(stderr, "failed to initialize signals\n");
- 		ret = -errno;
- 		goto err;
- 	}
-+#endif
- 
- 	/* parse options */
- 	ret = fuse_opt_parse(&args, &fusecfg, option_spec, optional_opt_func);
--- 
-2.24.0
-
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index cd29ea96ff..0de52d28a9 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b3f65a6b6d8b1dc37694e083e01492041619100211757564adc851e327f1553c  erofs-utils-1.2.tar.gz
-sha256 feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
+sha256  6b2ea15c3b092bd9a3abd966f78bc01c6caacb94022643ff34cf69893ee04e84  erofs-utils-1.2.1.tar.gz
+sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index d4e719470e..5d547148b2 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.2
+EROFS_UTILS_VERSION = 1.2.1
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+
 EROFS_UTILS_LICENSE_FILES = COPYING
