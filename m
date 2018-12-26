From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:34:10 +0100
Subject: [Buildroot] [git commit] package/gdb: bump to version 8.2.1
Message-ID: <20181226203511.5D91683766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e61c44888a2a327e3e5c88fe23722eaa2e463856
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GDB 8.2.1 brings the following fixes and enhancements over GDB 8.2:

 * PR build/23516 (gdb build error under msys+mingw: strip can't handle gdb-add-index.exe)
 * PR build/23623 (install-strip fails)
 * PR rust/23626 (gdb crashes in upstream rust nil-enum test)
 * PR rust/23650 (rust field name access error mentions "foo")
 * PR gdb/23663 (gdb 8.1.1: undefined rpl_stat function with musl toolchains)
 * PR python/23669 (gdb.execute("show commands") doesn't work)
 * PR python/23714 (Command repetition stops working after gdb.execute)
 * PR gdb/23838 (8.2 regression for invalid -data-directory)
 * PR gdb/23974 ("info os" crash when specifying invalid object)
 * PR gdb/23999 (SYMBOL_LANGUAGE assertion failure on AIX)
 * PR gdb/24003 (Error when binary searching CUs for a specific DIE when using DWZ)

Remove upstream patch:

0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
https://github.com/bminor/binutils-gdb/commit/5de69bdbd0bbd7941b4cd93d4571f5e22cdb28be

See:
https://sourceware.org/ml/gdb-announce/2018/msg00004.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   0
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |   0
 .../{8.2 => 8.2.1}/0003-use-asm-sgidefs.h.patch    |   0
 .../0004-gdbserver-fix-build-for-m68k.patch        |   0
 ...-nat-fork-inferior-include-linux-ptrace.h.patch |   0
 ...ular_file-from-common-utils.c-to-filestuf.patch | 179 ---------------------
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 8 files changed, 2 insertions(+), 181 deletions(-)

diff --git a/package/gdb/8.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.2.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/8.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/8.2.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/8.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.2.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/8.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/8.2.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/8.2/0003-use-asm-sgidefs.h.patch b/package/gdb/8.2.1/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/8.2/0003-use-asm-sgidefs.h.patch
rename to package/gdb/8.2.1/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/8.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.2.1/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/8.2/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/8.2.1/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/8.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.2.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/8.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/8.2.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
diff --git a/package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch b/package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
deleted file mode 100644
index a228affce7..0000000000
--- a/package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From d4b53d090e09f8929df0367e446569dc32cf269d Mon Sep 17 00:00:00 2001
-From: Sergio Durigan Junior <sergiodj@redhat.com>
-Date: Wed, 12 Sep 2018 13:16:02 -0400
-Subject: [PATCH] Move 'is_regular_file' from common-utils.c to filestuff.c
-
-There is no reason for 'is_regular_file' to be in common-utils.c; it
-belongs to 'filestuff.c'.  This commit moves the function definition
-and its prototype to the appropriate files.
-
-The motivation behind this move is a failure that happens on certain
-cross-compilation environments when compiling the IPA library, due to
-the way gnulib probes the need for a 'stat' call replacement.  Because
-configure checks when cross-compiling are more limited, gnulib decides
-that it needs to substitute the 'stat' calls its own 'rpl_stat';
-however, the IPA library doesn't link with gnulib, which leads to an
-error when compiling 'common-utils.c':
-
-  ...
-  /opt/x86-core2--musl--bleeding-edge-2018.09-1/bin/i686-buildroot-linux-musl-g++  -shared -fPIC -Wl,--soname=libinproctrace.so -Wl,--no-undefined -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os      -I. -I. -I./../common -I./../regformats -I./.. -I./../../include -I./../gnulib/import -Ibuild-gnulib-gdbserver/import -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wpointer-arith -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wempty-body -Wunused-but-set-parameter -Wunused-but-set-variable -Wno-sign-compare -Wno-narrowing -Wno-error=maybe-uninitialized  -DGDBSERVER \
-   -Wl,--dynamic-list=./proc-service.list -o libinproctrace.so ax-ipa.o common-utils-ipa.o errors-ipa.o format-ipa.o print-utils-ipa.o regcache-ipa.o remote-utils-ipa.o rsp-low-ipa.o tdesc-ipa.o tracepoint-ipa.o utils-ipa.o vec-ipa.o linux-i386-ipa.o linux-x86-tdesc-ipa.o arch/i386-ipa.o -ldl -pthread
-  /opt/x86-core2--musl--bleeding-edge-2018.09-1/lib/gcc/i686-buildroot-linux-musl/8.2.0/../../../../i686-buildroot-linux-musl/bin/ld: common-utils-ipa.o: in function `is_regular_file(char const*, int*)':
-  common-utils.c:(.text+0x695): undefined reference to `rpl_stat'
-  collect2: error: ld returned 1 exit status
-  Makefile:413: recipe for target 'libinproctrace.so' failed
-  make[1]: *** [libinproctrace.so] Error 1
-  ...
-
-More details can also be found at:
-
-  https://sourceware.org/ml/gdb-patches/2018-09/msg00304.html
-
-The most simple fix for this problem is to move 'is_regular_file' to
-'filestuff.c', which is not used by IPA.  This ends up making the
-files more logically organized as well, since 'is_regular_file' is a
-file operation.
-
-No regressions found.
-
-gdb/ChangeLog:
-2018-09-12  Sergio Durigan Junior  <sergiodj@redhat.com>
-
-	* common/common-utils.c: Don't include '<sys/stat.h>'.
-	(is_regular_file): Move to...
-	* common/filestuff.c (is_regular_file): ... here.
-	* common/common-utils.h (is_regular_file): Move to...
-	* common/filestuff.h (is_regular_file): ... here.
-
-(cherry picked from commit 3c025cfe5efc44eb4dfb03b53dca28e75096dd1e)
-[Romain: backport to gdb 8.2 and remove ChangeLog enty]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/common/common-utils.c | 32 --------------------------------
- gdb/common/common-utils.h |  5 -----
- gdb/common/filestuff.c    | 31 +++++++++++++++++++++++++++++++
- gdb/common/filestuff.h    |  5 +++++
- 4 files changed, 36 insertions(+), 37 deletions(-)
-
-diff --git a/gdb/common/common-utils.c b/gdb/common/common-utils.c
-index 8d839d10fa8..24b3936f3dc 100644
---- a/gdb/common/common-utils.c
-+++ b/gdb/common/common-utils.c
-@@ -20,7 +20,6 @@
- #include "common-defs.h"
- #include "common-utils.h"
- #include "host-defs.h"
--#include <sys/stat.h>
- #include <ctype.h>
- 
- /* The xmalloc() (libiberty.h) family of memory management routines.
-@@ -412,37 +411,6 @@ stringify_argv (const std::vector<char *> &args)
- 
- /* See common/common-utils.h.  */
- 
--bool
--is_regular_file (const char *name, int *errno_ptr)
--{
--  struct stat st;
--  const int status = stat (name, &st);
--
--  /* Stat should never fail except when the file does not exist.
--     If stat fails, analyze the source of error and return true
--     unless the file does not exist, to avoid returning false results
--     on obscure systems where stat does not work as expected.  */
--
--  if (status != 0)
--    {
--      if (errno != ENOENT)
--	return true;
--      *errno_ptr = ENOENT;
--      return false;
--    }
--
--  if (S_ISREG (st.st_mode))
--    return true;
--
--  if (S_ISDIR (st.st_mode))
--    *errno_ptr = EISDIR;
--  else
--    *errno_ptr = EINVAL;
--  return false;
--}
--
--/* See common/common-utils.h.  */
--
- ULONGEST
- align_up (ULONGEST v, int n)
- {
-diff --git a/gdb/common/common-utils.h b/gdb/common/common-utils.h
-index 7bc6e90f05c..a961514fd66 100644
---- a/gdb/common/common-utils.h
-+++ b/gdb/common/common-utils.h
-@@ -146,11 +146,6 @@ in_inclusive_range (T value, T low, T high)
-   return value >= low && value <= high;
- }
- 
--/* Return true if the file NAME exists and is a regular file.
--   If the result is false then *ERRNO_PTR is set to a useful value assuming
--   we're expecting a regular file.  */
--extern bool is_regular_file (const char *name, int *errno_ptr);
--
- /* Ensure that V is aligned to an N byte boundary (B's assumed to be a
-    power of 2).  Round up/down when necessary.  Examples of correct
-    use include:
-diff --git a/gdb/common/filestuff.c b/gdb/common/filestuff.c
-index f5a754ffa66..fa10165a7ca 100644
---- a/gdb/common/filestuff.c
-+++ b/gdb/common/filestuff.c
-@@ -417,3 +417,34 @@ make_cleanup_close (int fd)
-   *saved_fd = fd;
-   return make_cleanup_dtor (do_close_cleanup, saved_fd, xfree);
- }
-+
-+/* See common/filestuff.h.  */
-+
-+bool
-+is_regular_file (const char *name, int *errno_ptr)
-+{
-+  struct stat st;
-+  const int status = stat (name, &st);
-+
-+  /* Stat should never fail except when the file does not exist.
-+     If stat fails, analyze the source of error and return true
-+     unless the file does not exist, to avoid returning false results
-+     on obscure systems where stat does not work as expected.  */
-+
-+  if (status != 0)
-+    {
-+      if (errno != ENOENT)
-+	return true;
-+      *errno_ptr = ENOENT;
-+      return false;
-+    }
-+
-+  if (S_ISREG (st.st_mode))
-+    return true;
-+
-+  if (S_ISDIR (st.st_mode))
-+    *errno_ptr = EISDIR;
-+  else
-+    *errno_ptr = EINVAL;
-+  return false;
-+}
-diff --git a/gdb/common/filestuff.h b/gdb/common/filestuff.h
-index 0e46eb5da0b..21b4edd6bf6 100644
---- a/gdb/common/filestuff.h
-+++ b/gdb/common/filestuff.h
-@@ -98,4 +98,9 @@ struct gdb_dir_deleter
- 
- typedef std::unique_ptr<DIR, gdb_dir_deleter> gdb_dir_up;
- 
-+/* Return true if the file NAME exists and is a regular file.
-+   If the result is false then *ERRNO_PTR is set to a useful value assuming
-+   we're expecting a regular file.  */
-+extern bool is_regular_file (const char *name, int *errno_ptr);
-+
- #endif /* FILESTUFF_H */
--- 
-2.14.4
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 4072dc8074..969168ffa2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -98,5 +98,5 @@ config BR2_GDB_VERSION
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
-	default "8.2"      if BR2_GDB_VERSION_8_2
+	default "8.2.1"    if BR2_GDB_VERSION_8_2
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 50c1c2380e..1104da5dc4 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,7 +2,7 @@
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9	gdb-8.1.1.tar.xz
-sha512  11cc481bebc51eb6db73249ecb62b8c07455cf3db169f4860b3a83114849fbd2b5860a2db64488ba6c5909cf07b255c04770f1e36059eae6bee16d2a3581be90	gdb-8.2.tar.xz
+sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11	gdb-8.2.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  8303e399e396f5c15dc976e48503fc7d45a720dd1a470443f755c5f2458d092b4392e7ae582abc251bc4b43a778ad784f764286a2a05abfc1649cbeeeb6e7d15 	gdb-arc-2018.09-release-gdb.tar.gz
