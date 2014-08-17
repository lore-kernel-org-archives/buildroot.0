From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 Aug 2014 19:22:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/oprofile: fix configure test with
	gcc 4.9.x
Message-ID: <1408296131-15354-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport the upstream patch that fix a configure test breaked with gcc 4.9.x.

This patch must be removed with the next version bump.

Fixes:
http://autobuild.buildroot.net/results/f80/f8083f038d0efb7b5becf7810b6fcaf440fb8294/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...e-fix-test-for-synth-check-with-GCC-4.9.0.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch

diff --git a/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch b/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
new file mode 100644
index 0000000..24bed98
--- /dev/null
+++ b/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
@@ -0,0 +1,45 @@
+From cc08b52f8376867121f22e166636779e2a1a6e48 Mon Sep 17 00:00:00 2001
+From: Aaro Koskinen <aaro.koskinen@iki.fi>
+Date: Mon, 12 May 2014 08:28:46 -0500
+Subject: [PATCH 1/1] configure: fix test-for-synth check with GCC 4.9.0
+
+With GCC 4.9.0 oprofile 0.9.9 build fails on non-PPC platfroms because
+the "test-for-synth" configure check result is incorrect: There is a NULL
+pointer dereference in the test program, so the compiler seems to optimize
+the rest of the code away, and the test will always succeed regardless
+whether powerpc_elf64_vec/bfd_elf64_powerpc_vec are present or not.
+Fix by allocating the referred struct statically.
+
+While at it, also include stdio.h to avoid a compiler warning.
+
+[Romain: backport the patch to 0.9.9]
+
+Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+
+Conflicts:
+	m4/binutils.m4
+---
+ m4/binutils.m4 | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/m4/binutils.m4 b/m4/binutils.m4
+index 25fb15a..3486488 100644
+--- a/m4/binutils.m4
++++ b/m4/binutils.m4
+@@ -27,8 +27,10 @@ if test "$OS" = "Linux"; then
+ 	AC_MSG_CHECKING([whether bfd_get_synthetic_symtab() exists in BFD library])
+ 	rm -f test-for-synth
+ 	AC_LANG_CONFTEST(
+-		[AC_LANG_PROGRAM([[#include <bfd.h>]],
+-			[[asymbol * synthsyms;	bfd * ibfd = 0; 
++		[AC_LANG_PROGRAM([[#include <bfd.h>]
++			[#include <stdio.h>]
++			[static bfd _ibfd;]],
++			[[asymbol * synthsyms;	bfd * ibfd = &_ibfd;
+ 			long synth_count = bfd_get_synthetic_symtab(ibfd, 0, 0, 0, 0, &synthsyms);
+ 			extern const bfd_target bfd_elf64_powerpc_vec;
+ 			extern const bfd_target bfd_elf64_powerpcle_vec;
+-- 
+1.9.3
+
-- 
1.9.3
