From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 19 Sep 2015 23:15:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.2.1
Message-ID: <1442697301-15881-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
  - unfuzz patches #1 and #2
  - remove applied patches upstream

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Fix-installation-location-of-libffi.patch | 17 +++++---
 ...0002-Fix-use-of-compact-eh-frames-on-MIPS.patch | 26 ++++++++++--
 package/libffi/0003-fix-typo.patch                 | 41 -------------------
 ...Add-missing-GNU-stack-markings-in-win32.S.patch | 36 -----------------
 .../libffi/0005-Fix-paths-in-libffi.pc.in.patch    | 46 ----------------------
 package/libffi/libffi.hash                         |  2 +-
 package/libffi/libffi.mk                           |  2 +-
 7 files changed, 35 insertions(+), 135 deletions(-)
 delete mode 100644 package/libffi/0003-fix-typo.patch
 delete mode 100644 package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch
 delete mode 100644 package/libffi/0005-Fix-paths-in-libffi.pc.in.patch

diff --git a/package/libffi/0001-Fix-installation-location-of-libffi.patch b/package/libffi/0001-Fix-installation-location-of-libffi.patch
index 56e08f7..0d8d6ae 100644
--- a/package/libffi/0001-Fix-installation-location-of-libffi.patch
+++ b/package/libffi/0001-Fix-installation-location-of-libffi.patch
@@ -1,7 +1,10 @@
-From 102c02de867bfe831b5366c89d66bcf170db962e Mon Sep 17 00:00:00 2001
+From 580f46a7bc6e9fea3a2227b5268cc3aed1d60e3b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Thu, 7 Feb 2013 22:26:56 +0100
-Subject: [PATCH] Fix installation location of libffi
+Subject: [PATCH] Fix installation location of libffi
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 The libffi is currently declared as toolexeclib_LTLIBRARIES. In many
 cases, toolexeclib libraries will be installed in /usr/lib, so it
@@ -28,15 +31,17 @@ the more standard lib_LTLIBRARIES, which ensures that the libffi
 library is always installed in /usr/lib.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[unfuzz for 3.2.1]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 ---
- Makefile.am |    2 +-
+ Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 6f669ca..b60bcc1 100644
+index 0e40451..309474c 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -93,7 +93,7 @@ FLAGS_TO_PASS = $(AM_MAKEFLAGS)
+@@ -104,7 +104,7 @@ FLAGS_TO_PASS = $(AM_MAKEFLAGS)
  
  MAKEOVERRIDES=
  
@@ -46,5 +51,5 @@ index 6f669ca..b60bcc1 100644
  
  libffi_la_SOURCES = src/prep_cif.c src/types.c \
 -- 
-1.7.9.5
+2.5.3
 
diff --git a/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch b/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
index 15d1c96..4b031fe 100644
--- a/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
+++ b/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
@@ -1,3 +1,11 @@
+From 31b6b6bc14197cd4183bdbd311fddeb36b5ae100 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 19 Sep 2015 22:53:29 +0200
+Subject: [PATCH] Fix use of compact eh frames on MIPS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Newer MIPS toolchains use a different (compact) eh_frame format.
 libffi don't like them, so we have to switch to the older format.
 
@@ -5,10 +13,17 @@ This patch add -mno-compact-eh to CFLAGS when compiling for
 Mips and compiler support it.
 
 Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+[unfuzz for 3.2.1]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
 
---- a/configure.ac	2013-08-08 14:53:11.884267155 +0200
-+++ b/configure.ac	2013-08-08 14:54:14.437493244 +0200
-@@ -430,6 +430,16 @@
+diff --git a/configure.ac b/configure.ac
+index a7bf5ee..36cd0d4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -469,6 +469,16 @@ esac
  AM_CONDITIONAL(FFI_EXEC_TRAMPOLINE_TABLE, test x$FFI_EXEC_TRAMPOLINE_TABLE = x1)
  AC_SUBST(FFI_EXEC_TRAMPOLINE_TABLE)
  
@@ -23,5 +38,8 @@ Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 +fi
 +
  if test x$TARGET = xX86_64; then
-     AC_CACHE_CHECK([assembler supports unwind section type],
+     AC_CACHE_CHECK([toolchain supports unwind section type],
  	libffi_cv_as_x86_64_unwind_section_type, [
+-- 
+2.5.3
+
diff --git a/package/libffi/0003-fix-typo.patch b/package/libffi/0003-fix-typo.patch
deleted file mode 100644
index f20804b..0000000
--- a/package/libffi/0003-fix-typo.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cbc5a3c0200aa6c2cf8d6798d69a21501557c83f Mon Sep 17 00:00:00 2001
-From: Ryan Hill <rhill@gentoo.org>
-Date: Sat, 31 May 2014 08:26:34 -0400
-Subject: [PATCH 05/10] Fix typo
-
-This patch was borrowed from upstream, commit
-cbc5a3c0200aa6c2cf8d6798d69a21501557c83f, and will be part of the next
-3.1.1 release.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/ffi.h.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/ffi.h.in b/include/ffi.h.in
-index 93c776f..70c6179 100644
---- a/include/ffi.h.in
-+++ b/include/ffi.h.in
-@@ -1,5 +1,5 @@
- /* -----------------------------------------------------------------*-C-*-
--   libffi @VERSION@ - Copyright (c) 2011 Anthony Green
-+   libffi @VERSION@ - Copyright (c) 2011, 2014 Anthony Green
-                     - Copyright (c) 1996-2003, 2007, 2008 Red Hat, Inc.
- 
-    Permission is hereby granted, free of charge, to any person
-@@ -221,10 +221,10 @@ typedef struct {
- #endif
- } ffi_cif;
- 
--#if HAVE_LONG_DOUBLE_VARIANT
-+#if @HAVE_LONG_DOUBLE_VARIANT@
- /* Used to adjust size/alignment of ffi types.  */
- void ffi_prep_types (ffi_abi abi);
--# endif
-+#endif
- 
- /* Used internally, but overridden by some architectures */
- ffi_status ffi_prep_cif_core(ffi_cif *cif,
--- 
-2.0.0
-
diff --git a/package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch b/package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch
deleted file mode 100644
index 6097287..0000000
--- a/package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 978c9540154d320525488db1b7049277122f736d Mon Sep 17 00:00:00 2001
-From: Samuli Suominen <ssuominen@gentoo.org>
-Date: Sat, 31 May 2014 08:53:10 -0400
-Subject: [PATCH 06/10] Add missing GNU stack markings in win32.S
-
-This patch was borrowed from upstream, commit
-978c9540154d320525488db1b7049277122f736d, and will be part of the next
-3.1.1 release.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/x86/win32.S | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/x86/win32.S b/src/x86/win32.S
-index daf0e79..e42baf2 100644
---- a/src/x86/win32.S
-+++ b/src/x86/win32.S
-@@ -1,5 +1,6 @@
- /* -----------------------------------------------------------------------
--   win32.S - Copyright (c) 1996, 1998, 2001, 2002, 2009  Red Hat, Inc.
-+   win32.S - Copyright (c) 2014  Anthony Green
-+	     Copyright (c) 1996, 1998, 2001, 2002, 2009  Red Hat, Inc.
- 	     Copyright (c) 2001  John Beniton
- 	     Copyright (c) 2002  Ranjit Mathew
- 	     Copyright (c) 2009  Daniel Witte
-@@ -1304,3 +1305,6 @@ L_ffi_closure_SYSV_inner$stub:
- 
- #endif /* !_MSC_VER */
- 
-+#if defined __ELF__ && defined __linux__
-+	.section	.note.GNU-stack,"", at progbits
-+#endif
--- 
-2.0.0
-
diff --git a/package/libffi/0005-Fix-paths-in-libffi.pc.in.patch b/package/libffi/0005-Fix-paths-in-libffi.pc.in.patch
deleted file mode 100644
index fd110a6..0000000
--- a/package/libffi/0005-Fix-paths-in-libffi.pc.in.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ad0d1d239afc7ad09203847793dcc020856d1035 Mon Sep 17 00:00:00 2001
-From: Samuli Suominen <ssuominen@gentoo.org>
-Date: Thu, 12 Jun 2014 06:30:21 -0400
-Subject: [PATCH 09/10] Fix paths in libffi.pc.in
-
-This patch was borrowed from upstream, commit
-ad0d1d239afc7ad09203847793dcc020856d1035, and will be part of the next
-3.1.1 release.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4f7fe3f..bbc1a9d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -590,11 +590,11 @@ AC_ARG_ENABLE(purify-safety,
- if test "x$GCC" = "xyes"; then
-   if test -n "$with_cross_host" &&
-      test x"$with_cross_host" != x"no"; then
--    toolexecdir='$(exec_prefix)/$(target_alias)'
--    toolexeclibdir='$(toolexecdir)/lib'
-+    toolexecdir="${exec_prefix}"/'$(target_alias)'
-+    toolexeclibdir="${toolexecdir}"/lib
-   else
--    toolexecdir='$(libdir)/gcc-lib/$(target_alias)'
--    toolexeclibdir='$(libdir)'
-+    toolexecdir="${libdir}"/gcc-lib/'$(target_alias)'
-+    toolexeclibdir="${libdir}"
-   fi
-   multi_os_directory=`$CC $CFLAGS -print-multi-os-directory`
-   case $multi_os_directory in
-@@ -603,7 +603,7 @@ if test "x$GCC" = "xyes"; then
-   esac
-   AC_SUBST(toolexecdir)
- else
--  toolexeclibdir='$(libdir)'
-+  toolexeclibdir="${libdir}"
- fi
- AC_SUBST(toolexeclibdir)
- 
--- 
-2.0.0
-
diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 4c25fd3..63a9203 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,2 +1,2 @@
 # From ftp://sourceware.org/pub/libffi/sha512.sum
-sha512	8994973d75facf5ad928c270e17b1a56e24d1543af75b93731a0048e747df27e4190a736b6dc2dca7d43de1d7e88891220304802c10fcccdcebee9c9ffd3d1b9	libffi-3.1.tar.gz
+sha512	980ca30a8d76f963fca722432b1fe5af77d7a4e4d2eac5144fbc5374d4c596609a293440573f4294207e1bdd9fda80ad1e1cafb2ffb543df5a275bc3bd546483  libffi-3.2.1.tar.gz
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 5644c1e..8f0f72d 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.1
+LIBFFI_VERSION = 3.2.1
 LIBFFI_SITE = ftp://sourceware.org/pub/libffi
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
-- 
2.5.3
