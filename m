From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 15:02:46 +0200
Subject: [Buildroot] [PATCH 2/3] coreutils: bump version
In-Reply-To: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0ef93af1e4e0b019da650bfc305053d0b79dc1d0.1249045363.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Coreutils 6.9 was broken with glibc >= 2.6, due to a coreutils
internal function being named like a glibc function. This has been
fixed in more recent coreutils version, by
http://lists.pld-linux.org/mailman/pipermail/pld-cvs-commit/Week-of-Mon-20070514/155466.html.

Therefore, we upgrade coreutils to its latest version, 7.4, which
raised two problems:

 * Recent coreutils releases are not anymore available as .bz2
   archives, only .xz archives. Since this archive format is not
   supported by Buildroot yet, and the corresponding tools are not
   widely available yet, we fallback to the bigger .gz format for the
   coreutils package.

 * The rename bug detection script m4/rename.m4 was broken, leading
   coreutils to try to include windows.h and compile some
   Windows-specific code. We introduce a patch to fix this, patch
   which has been taken from gnulib. We also make sure that this
   workaround is nevery compiled in by passing
   gl_cv_func_rename_dest_exists_bug=no to the configure script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../coreutils/coreutils-7.4-rename-m4-fix.patch    |   25 ++++++++++++++++++++
 package/coreutils/coreutils.mk                     |    7 +++--
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 package/coreutils/coreutils-7.4-rename-m4-fix.patch

diff --git a/package/coreutils/coreutils-7.4-rename-m4-fix.patch b/package/coreutils/coreutils-7.4-rename-m4-fix.patch
new file mode 100644
index 0000000..f869f43
--- /dev/null
+++ b/package/coreutils/coreutils-7.4-rename-m4-fix.patch
@@ -0,0 +1,25 @@
+Commit 7fcb389fb4cd5ba26e330fef991ffdc05392f289 from gnulib, to fix
+the rename bugs detection macros.
+---
+ m4/rename.m4 |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: coreutils-7.4/m4/rename.m4
+===================================================================
+--- coreutils-7.4.orig/m4/rename.m4
++++ coreutils-7.4/m4/rename.m4
+@@ -51,12 +51,12 @@
+     AC_LIBOBJ([rename])
+     AC_DEFINE([rename], [rpl_rename],
+       [Define to rpl_rename if the replacement function should be used.])
+-    if test $gl_cv_func_rename_trailing_slash_bug; then
++    if test $gl_cv_func_rename_trailing_slash_bug = yes; then
+       AC_DEFINE([RENAME_TRAILING_SLASH_BUG], [1],
+ 	[Define if rename does not work for source file names with a trailing
+ 	 slash, like the one from SunOS 4.1.1_U1.])
+     fi
+-    if test $gl_cv_func_rename_dest_exists_bug; then
++    if test $gl_cv_func_rename_dest_exists_bug = yes; then
+       AC_DEFINE([RENAME_DEST_EXISTS_BUG], [1],
+ 	[Define if rename does not work when the destination file exists,
+ 	 as on Windows.])
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 31de2d5..2c9c0d3 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -3,11 +3,11 @@
 # coreutils
 #
 #############################################################
-COREUTILS_VERSION:=6.9
-COREUTILS_SOURCE:=coreutils-$(COREUTILS_VERSION).tar.bz2
+COREUTILS_VERSION:=7.4
+COREUTILS_SOURCE:=coreutils-$(COREUTILS_VERSION).tar.gz
 #COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
 COREUTILS_SITE:=$(BR2_GNU_MIRROR)/coreutils
-COREUTILS_CAT:=$(BZCAT)
+COREUTILS_CAT:=$(ZCAT)
 COREUTILS_DIR:=$(BUILD_DIR)/coreutils-$(COREUTILS_VERSION)
 COREUTILS_BINARY:=src/vdir
 COREUTILS_TARGET_BINARY:=bin/vdir
@@ -59,6 +59,7 @@ $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
 		ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
+		gl_cv_func_rename_dest_exists_bug=no \
 		ac_cv_func_memcmp_working=yes \
 		ac_cv_have_decl_malloc=yes \
 		gl_cv_func_malloc_0_nonnull=yes \
-- 
1.6.0.4
