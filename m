From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Sep 2017 18:56:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/binutils: bump to 2.29.1
Message-ID: <20170930165603.31828-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a problem between the git tag and the archive release content,
they are not in sync [1].

The version used to generate the archive allow us to remove the xtensa
patches.

Otherwise, see the announce [2].

[1] https://sourceware.org/ml/binutils/2017-09/msg00337.html
[2] https://sourceware.org/ml/binutils/2017-09/msg00311.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../binutils/{2.29 => 2.29.1}/0001-sh-conf.patch   |  0
 .../{2.29 => 2.29.1}/0002-ld-makefile.patch        |  0
 .../0003-check-ldrunpath-length.patch              |  0
 .../0004-add-sysroot-fix-from-bug-3049.patch       |  0
 .../0005-poison-system-directories.patch           |  0
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch |  0
 ...a-ld-restore-old-section-sorting-behavior.patch | 48 ----------------------
 ...a-fix-memory-corruption-by-broken-sysregs.patch | 42 -------------------
 package/binutils/Config.in.host                    |  4 +-
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  2 +-
 11 files changed, 4 insertions(+), 94 deletions(-)
 rename package/binutils/{2.29 => 2.29.1}/0001-sh-conf.patch (100%)
 rename package/binutils/{2.29 => 2.29.1}/0002-ld-makefile.patch (100%)
 rename package/binutils/{2.29 => 2.29.1}/0003-check-ldrunpath-length.patch (100%)
 rename package/binutils/{2.29 => 2.29.1}/0004-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{2.29 => 2.29.1}/0005-poison-system-directories.patch (100%)
 rename package/binutils/{2.29 => 2.29.1}/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch (100%)
 delete mode 100644 package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch
 delete mode 100644 package/binutils/2.29/0008-xtensa-fix-memory-corruption-by-broken-sysregs.patch

diff --git a/package/binutils/2.29/0001-sh-conf.patch b/package/binutils/2.29.1/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.29/0001-sh-conf.patch
rename to package/binutils/2.29.1/0001-sh-conf.patch
diff --git a/package/binutils/2.29/0002-ld-makefile.patch b/package/binutils/2.29.1/0002-ld-makefile.patch
similarity index 100%
rename from package/binutils/2.29/0002-ld-makefile.patch
rename to package/binutils/2.29.1/0002-ld-makefile.patch
diff --git a/package/binutils/2.29/0003-check-ldrunpath-length.patch b/package/binutils/2.29.1/0003-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/2.29/0003-check-ldrunpath-length.patch
rename to package/binutils/2.29.1/0003-check-ldrunpath-length.patch
diff --git a/package/binutils/2.29/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.29.1/0004-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/2.29/0004-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/2.29.1/0004-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/2.29/0005-poison-system-directories.patch b/package/binutils/2.29.1/0005-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.29/0005-poison-system-directories.patch
rename to package/binutils/2.29.1/0005-poison-system-directories.patch
diff --git a/package/binutils/2.29/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch b/package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
similarity index 100%
rename from package/binutils/2.29/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
rename to package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
diff --git a/package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch b/package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch
deleted file mode 100644
index b411837..0000000
--- a/package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3a399127ead1ba3c8b8d0b9e7206fce39311ee72 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 2 Aug 2017 02:49:56 -0700
-Subject: [PATCH] xtensa: ld: restore old section sorting behavior
-
-With the recent change 535b785fb0c9 ("Don't compare boolean values
-against TRUE or FALSE") the following assertion is observed when
-linking with --sort-section,alignment option:
-
-  BFD (GNU Binutils) 2.29 assertion fail elf32-xtensa.c:3965
-
-It appears that xtensa linker only supported sorting sections by name,
-and the code that checks for the section sorting type in
-ld/emultempl/xtensaelf.em was not updated in the change bcaa7b3eb957
-("ld/"), that replaced boolean wildcard_spec::sorted with enumeration.
-
-Restore the original behavior of the section sorting code.
-
-ld/
-2017-08-02  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* emultempl/xtensaelf.em
-	(xtensa_wild_group_interleave_callback): Only check for by_name
-	sorting.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: 73d5923e480944e2d66bde8c59f4dff298ec57e3
-
- ld/emultempl/xtensaelf.em | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
-index 1447d526a25b..3827d91b6291 100644
---- a/ld/emultempl/xtensaelf.em
-+++ b/ld/emultempl/xtensaelf.em
-@@ -1432,7 +1432,7 @@ xtensa_wild_group_interleave_callback (lang_statement_union_type *statement)
- 	  struct wildcard_list *l;
- 	  for (l = w->section_list; l != NULL; l = l->next)
- 	    {
--	      if (l->spec.sorted != none)
-+	      if (l->spec.sorted == by_name)
- 		{
- 		  no_reorder = TRUE;
- 		  break;
--- 
-2.1.4
-
diff --git a/package/binutils/2.29/0008-xtensa-fix-memory-corruption-by-broken-sysregs.patch b/package/binutils/2.29/0008-xtensa-fix-memory-corruption-by-broken-sysregs.patch
deleted file mode 100644
index 30103ee..0000000
--- a/package/binutils/2.29/0008-xtensa-fix-memory-corruption-by-broken-sysregs.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3c8788dbb70b40e737d4b8e30cab81406e5c5091 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 2 Aug 2017 00:36:05 -0700
-Subject: [PATCH] xtensa: fix memory corruption by broken sysregs
-
-In some xtensa configurations there may be system/user registers in
-xtensa-modules with negative index. ISA initialization for such config
-may clobber heap and result in program termination.
-Don't update lookup table entries for register with negative indices.
-They are not directly accessible via RSR/WSR/XSR or RUR/WUR, so this
-change should not affect processing of valid assembly/binary code.
-
-bfd/
-2017-08-02  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* xtensa-isa.c (xtensa_isa_init): Don't update lookup table
-	entries for sysregs with negative indices.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: d84ed528d4817b0ff854006b65a9f6ec75f0407a
-
- bfd/xtensa-isa.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/xtensa-isa.c b/bfd/xtensa-isa.c
-index 8da75bea8109..8c6ee88fdeae 100644
---- a/bfd/xtensa-isa.c
-+++ b/bfd/xtensa-isa.c
-@@ -292,7 +292,8 @@ xtensa_isa_init (xtensa_isa_status *errno_p, char **error_msg_p)
-       xtensa_sysreg_internal *sreg = &isa->sysregs[n];
-       is_user = sreg->is_user;
- 
--      isa->sysreg_table[is_user][sreg->number] = n;
-+      if (sreg->number >= 0)
-+	isa->sysreg_table[is_user][sreg->number] = n;
-     }
- 
-   /* Set up the interface lookup table.  */
--- 
-2.1.4
-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 48d3ea1..bce1e91 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -16,7 +16,7 @@ config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28.1"
 
 config BR2_BINUTILS_VERSION_2_29_X
-	bool "binutils 2.29"
+	bool "binutils 2.29.1"
 
 endchoice
 
@@ -25,7 +25,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2017.03"	if BR2_arc
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
-	default "2.29"		if BR2_BINUTILS_VERSION_2_29_X
+	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 4630a26..6e35c5c 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
-sha512  bb227c7af65133a61bbde8be4104a543f4185fce8c8e7be22c36d92d121d28b5413d42f18c7e987d035d6312c542d0e2aaca8930386a4ce26d7c9d7248145398  binutils-2.29.tar.xz
+sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  07d5639e74eafe8fced259870c1a7dedee67c534573dda53fb78ee1ffeec9e17479fdde41dccd03b1cf0248023acbef7f66013398b2f722e4a8891ac680d1d16  binutils-arc-2017.03.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 768f084..34739d7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -23,7 +23,7 @@ endif
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 ifeq ($(BINUTILS_VERSION),2.28.1)
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
-else ifeq ($(BINUTILS_VERSION),2.29)
+else ifeq ($(BINUTILS_VERSION),2.29.1)
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 else
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
-- 
2.9.5
