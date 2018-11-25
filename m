From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:14:14 +0100
Subject: [Buildroot] [git commit] package/uclibc: bump to version 1.0.31
Message-ID: <20181202071558.DC71082855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cf118e406ae2809f61872dae31d7584d414ae09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove all patches, since they were already applied upstream.
Add license file hash.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...vert-ldconfig-add-glibc-compatibility-fix.patch | 54 ----------------------
 ...re-clock_nanosleep-independent-of-thread-.patch | 34 --------------
 ...ix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch | 45 ------------------
 ...4-mkostemp64-clear-flags-as-mkostemp-does.patch | 38 ---------------
 package/uclibc/uclibc.hash                         |  6 ++-
 package/uclibc/uclibc.mk                           |  4 +-
 6 files changed, 6 insertions(+), 175 deletions(-)

diff --git a/package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch b/package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch
deleted file mode 100644
index 7ba3b2866d..0000000000
--- a/package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 92d250d387e247029900c9074150f45866b29781 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sun, 29 Apr 2018 19:34:11 +0200
-Subject: [PATCH] Revert "ldconfig: add glibc compatibility fix"
-
-This reverts commit 2a3bb4daf5778c5875674cd26a3c75b3d460a042.
-
-This is breaking ld.so.cache usage. Seen on Gentoo/amd64.
-
-Reported-by: "Anthony G. Basile" <basile@freeharbor.net>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- utils/ldconfig.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/utils/ldconfig.c b/utils/ldconfig.c
-index 58939d6..e6b7881 100644
---- a/utils/ldconfig.c
-+++ b/utils/ldconfig.c
-@@ -184,9 +184,10 @@ static char *readsoname(char *name, FILE *infile, int expected_type,
- 		res = readsoname32(name, infile, expected_type, type);
- 	else {
- 		res = readsoname64(name, infile, expected_type, type);
--
--		// For 64-bit glibc compatibility
--		*type |= FLAG_X8664_LIB64;
-+#if 0
-+		/* relies on multilib support which we dont have ... */
-+		*type |= LIB_ELF64;
-+#endif
- 	}
- 
- 	return res;
-@@ -757,7 +758,7 @@ void cache_print(void)
- 
- 	for (fd = 0; fd < header->nlibs; fd++) {
- 		printf("\t%s ", strs + libent[fd].sooffset);
--		switch (libent[fd].flags & ~LIB_ELF64 & FLAG_TYPE_MASK) {
-+		switch (libent[fd].flags & ~LIB_ELF64) {
- 		case LIB_DLL:
- 			printf("(libc4)");
- 			break;
-@@ -770,7 +771,7 @@ void cache_print(void)
- 		case LIB_ELF_LIBC5:
- 		case LIB_ELF_LIBC6:
- 			printf("(libc%d%s)",
--			       (libent[fd].flags & ~LIB_ELF64 & FLAG_TYPE_MASK) + 3,
-+			       (libent[fd].flags & ~LIB_ELF64) + 3,
- 			       libent[fd].flags & LIB_ELF64 ? "/64" : "");
- 			break;
- 		default:
--- 
-2.1.4
-
diff --git a/package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch b/package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
deleted file mode 100644
index bb9ef18b4f..0000000000
--- a/package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 368a1df04a32c3b95859b0ca588da8548a5f39ca Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Tue, 1 May 2018 19:35:20 +0200
-Subject: [PATCH] librt: declare clock_nanosleep independent of thread support
-
-Reported-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- include/time.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/include/time.h b/include/time.h
-index 785c8f6..1a14089 100644
---- a/include/time.h
-+++ b/include/time.h
-@@ -356,7 +356,6 @@ extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
- #  endif /* __UCLIBC_HAS_REALTIME__ */
- 
- #  if defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
--#   ifdef __UCLIBC_HAS_THREADS_NATIVE__
- /* High-resolution sleep with the specified clock.
- 
-    This function is a cancellation point and therefore not marked with
-@@ -367,7 +366,6 @@ extern int clock_nanosleep (clockid_t __clock_id, int __flags,
- 
- /* Return clock ID for CPU-time clock.  */
- extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __THROW;
--#   endif /* __UCLIBC_HAS_THREADS_NATIVE__ */
- #  endif
- 
- #  if defined __UCLIBC_HAS_REALTIME__
--- 
-2.1.4
-
diff --git a/package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch b/package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch
deleted file mode 100644
index ad87698f53..0000000000
--- a/package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 269a2a2a0f863e1b43dc02f2f4f0f3c50299456e Mon Sep 17 00:00:00 2001
-From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
-Date: Tue, 26 Jun 2018 18:26:24 -0700
-Subject: [PATCH] ldso/arc: fix LD_DEBUG segv when printing R_ARC_NONE
-
-Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- ldso/ldso/arc/elfinterp.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ldso/ldso/arc/elfinterp.c b/ldso/ldso/arc/elfinterp.c
-index 5a02bc234..a30c19bcb 100644
---- a/ldso/ldso/arc/elfinterp.c
-+++ b/ldso/ldso/arc/elfinterp.c
-@@ -64,7 +64,7 @@ _dl_linux_resolver(struct elf_resolve *tpnt, unsigned int plt_pc)
- 	if (_dl_debug_bindings) {
- 		_dl_dprintf(_dl_debug_file, "\nresolve function: %s", symname);
- 		if (_dl_debug_detail)
--			_dl_dprintf(_dl_debug_file, "\n\tpatched %x ==> %pc @ %pl\n",
-+			_dl_dprintf(_dl_debug_file, "\n\tpatched %x ==> %pc @ %p\n",
- 					*got_addr, new_addr, got_addr);
- 	}
- 
-@@ -178,7 +178,7 @@ _dl_do_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
- 
- log_entry:
- #if defined __SUPPORT_LD_DEBUG__
--	if (_dl_debug_detail)
-+	if (_dl_debug_detail && (reloc_type != R_ARC_NONE))
- 		_dl_dprintf(_dl_debug_file,"\tpatched: %x ==> %x @ %x",
- 				old_val, *reloc_addr, reloc_addr);
- #endif
-@@ -214,7 +214,7 @@ _dl_do_lazy_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
- 	}
- 
- #if defined __SUPPORT_LD_DEBUG__
--	if (_dl_debug_reloc && _dl_debug_detail)
-+	if (_dl_debug_reloc && _dl_debug_detail && (reloc_type != R_ARC_NONE))
- 		_dl_dprintf(_dl_debug_file, "\tpatched: %x ==> %x @ %x\n",
- 				old_val, *reloc_addr, reloc_addr);
- #endif
--- 
-2.16.2
-
diff --git a/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
deleted file mode 100644
index f87abd8849..0000000000
--- a/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 09a776103e4aa75f95c9ad44554a9c2b56de3535 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.com.br>
-Date: Mon, 29 Oct 2018 01:17:38 -0300
-Subject: [PATCH] mkostemp64: clear flags, as mkostemp does
-
-This should have been made in commit 9649721950 but was forgotten.
-
-Signed-off-by: Carlos Santos <casantos@datacom.com.br>
----
- libc/stdlib/mkostemp64.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libc/stdlib/mkostemp64.c b/libc/stdlib/mkostemp64.c
-index aa9736cd6..f4674bb0c 100644
---- a/libc/stdlib/mkostemp64.c
-+++ b/libc/stdlib/mkostemp64.c
-@@ -15,9 +15,9 @@
-    License along with the GNU C Library; if not, see
-    <http://www.gnu.org/licenses/>.  */
- 
--#include <fcntl.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <fcntl.h>
- #include "../misc/internals/tempname.h"
- 
- /* Generate a unique temporary file name from TEMPLATE.
-@@ -27,6 +27,7 @@
- int
- mkostemp64 (char *template, int flags)
- {
-+  flags -= flags & O_ACCMODE; /* Remove O_RDONLY, O_WRONLY, and O_RDWR. */
-   return __gen_tempname (template, __GT_BIGFILE, flags | O_LARGEFILE, 0,
-                          S_IRUSR | S_IWUSR);
- }
--- 
-2.14.5
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 81936f3639..d1cbdb6c78 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,4 @@
-# From https://uclibc-ng.org/
-sha256  992bd9a2889ea385902b87e3d3d30603741eb16728288fbf537ff2027f770496        uClibc-ng-1.0.30.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.31/uClibc-ng-1.0.31.tar.xz.sha256
+sha256  2215d7377118434d1697fd575f10d7a6be3f29e460d6b0e1ee9f6f5306288060  uClibc-ng-1.0.31.tar.xz
+# Locally calculated
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 63d36943ed..b4c90bdf5d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.30
+UCLIBC_VERSION = 1.0.31
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
-UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
+UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
 UCLIBC_INSTALL_STAGING = YES
