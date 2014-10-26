From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:20 +0100
Subject: [Buildroot] [PATCH 14/51] libenca: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-14-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all the patches as they were accepted upstream.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../libenca-001-fix-installation-error.patch       | 44 ----------------------
 ...benca-002-remove-prefix-hack-in-configure.patch | 33 ----------------
 package/libenca/libenca-003-iconv.patch            | 15 --------
 package/libenca/libenca.mk                         |  2 +-
 4 files changed, 1 insertion(+), 93 deletions(-)
 delete mode 100644 package/libenca/libenca-001-fix-installation-error.patch
 delete mode 100644 package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
 delete mode 100644 package/libenca/libenca-003-iconv.patch

diff --git a/package/libenca/libenca-001-fix-installation-error.patch b/package/libenca/libenca-001-fix-installation-error.patch
deleted file mode 100644
index fc27841..0000000
--- a/package/libenca/libenca-001-fix-installation-error.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1ca09a1a8f3dd07e2805855a1f1a67a54e8d8adb Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Wed, 15 Jan 2014 00:20:08 +0100
-Subject: [PATCH 2/3] Fix installation error
-
-ln will complain that the link already exists and will error.
-Adding the -f flag, force ln to recreate the link without failing the
-build.
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- Makefile.am     | 2 +-
- src/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index b5b50be..ddf1d5f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -54,7 +54,7 @@ install-data-hook:
- 	cd $(DESTDIR)$(man1dir); \
- 	inst1=`echo enca | sed '$(transform)'`.1; \
- 	inst2=`echo enconv | sed '$(transform)'`.1; \
--	$(LN_S) $$inst1 $$inst2
-+	$(LN_S) -f $$inst1 $$inst2
- 
- uninstall-hook:
- 	inst=`echo enconv | sed '$(transform)'`.1; \
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 2f01a12..3885137 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -47,7 +47,7 @@ install-exec-hook:
- 	cd $(DESTDIR)$(bindir); \
- 	inst1=`echo enca | sed '$(transform)'`; \
- 	inst2=`echo enconv | sed '$(transform)'`; \
--	$(LN_S) $$inst1$(EXEEXT) $$inst2$(EXEEXT)
-+	$(LN_S) -f $$inst1$(EXEEXT) $$inst2$(EXEEXT)
- 
- uninstall-hook:
- 	inst=`echo enconv | sed '$(transform)'`; \
--- 
-1.8.5.2
-
diff --git a/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch b/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
deleted file mode 100644
index 45701f9..0000000
--- a/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 354a8217eb735c9678f42436d647571fcebc3ead Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Wed, 15 Jan 2014 00:46:10 +0100
-Subject: [PATCH 3/3] Remove prefix hack in configure
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- configure.ac | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9db3b21..9b99df4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,15 +100,6 @@ gtk_CHECK_GTK_DOC
- dnl Check for good random number sources
- AC_CHECK_FILES(/dev/random /dev/urandom /dev/srandom /dev/arandom)
- 
--dnl Dirty path hack.  Helps some people with badly set up search paths.
--if test "$prefix" = "NONE"; then
--  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
--else
--  LDFLAGS="$LDFLAGS -L$prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$prefix/include"
--fi
--
- dnl Checks for libraries.
- ye_CHECK_LIBM
- 
--- 
-1.8.5.2
-
diff --git a/package/libenca/libenca-003-iconv.patch b/package/libenca/libenca-003-iconv.patch
deleted file mode 100644
index 2ea43c0..0000000
--- a/package/libenca/libenca-003-iconv.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-libiconv.m4: Fix AM_ICONV macro usage
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
---- a/m4/libiconv.m4 2013-09-30 09:48:22.000000000 +0200
-+++ b/m4/libiconv.m4 2014-01-18 12:56:32.634514555 +0100
-@@ -17,7 +17,7 @@
- dnl
-
- dnl Use standard iconv test
--AM_ICONV
-+m4_pattern_allow([AM_ICONV])
- CONVERTER_LIBS="$CONVERTER_LIBS $LIBICONV"
-
- dnl Compile iconvcap.c and run it to determine what encodings iconv actually
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 66fcfaa..b46de9a 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBENCA_VERSION = 1.15
+LIBENCA_VERSION = 1.16
 LIBENCA_SITE = $(call github,nijel,enca,$(LIBENCA_VERSION))
 LIBENCA_INSTALL_STAGING = YES
 LIBENCA_AUTORECONF = YES
-- 
2.1.1
