From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:26:31 +0100
Subject: [Buildroot] [git commit] package/libgpg-error: bump to version 1.37
Message-ID: <20200216141641.68BAC8E1F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c40501b9ce272c79c94fa9c7a5126b8fd4dc1df3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/0001-gawk5-support.patch | 162 --------------------------
 package/libgpg-error/libgpg-error.hash        |   8 +-
 package/libgpg-error/libgpg-error.mk          |   4 +-
 3 files changed, 5 insertions(+), 169 deletions(-)

diff --git a/package/libgpg-error/0001-gawk5-support.patch b/package/libgpg-error/0001-gawk5-support.patch
deleted file mode 100644
index 09d114c45f..0000000000
--- a/package/libgpg-error/0001-gawk5-support.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 7865041c77f4f7005282f10f9b6666b19072fbdf Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 15 Apr 2019 15:10:44 +0900
-Subject: [PATCH] awk: Prepare for Gawk 5.0.
-
-* src/Makefile.am: Use pkg_namespace (instead of namespace).
-* src/mkerrnos.awk: Likewise.
-* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
-* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
-
-Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/libgpg-error/files/libgpg-error-1.36-gawk5-support.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
-
-In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
-which only allows escaping specific characters.
-
-GnuPG-bug-id: 4459
-Reported-by: Marius Schamschula
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
----
- lang/cl/mkerrcodes.awk |  2 +-
- src/Makefile.am        |  2 +-
- src/mkerrcodes.awk     |  2 +-
- src/mkerrcodes1.awk    |  2 +-
- src/mkerrcodes2.awk    |  2 +-
- src/mkerrnos.awk       |  2 +-
- src/mkstrtable.awk     | 10 +++++-----
- 7 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/lang/cl/mkerrcodes.awk b/lang/cl/mkerrcodes.awk
-index ae29043..9a1fc18 100644
---- a/lang/cl/mkerrcodes.awk
-+++ b/lang/cl/mkerrcodes.awk
-@@ -122,7 +122,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-diff --git a/src/Makefile.am b/src/Makefile.am
-index ce1b882..f2590cb 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -293,7 +293,7 @@ code-from-errno.h: mkerrcodes$(EXEEXT_FOR_BUILD) Makefile
- 
- errnos-sym.h: Makefile mkstrtable.awk errnos.in
- 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
--		-v prefix=GPG_ERR_ -v namespace=errnos_ \
-+		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
- 		$(srcdir)/errnos.in >$@
- 
- 
-diff --git a/src/mkerrcodes.awk b/src/mkerrcodes.awk
-index 46d436c..e9c857c 100644
---- a/src/mkerrcodes.awk
-+++ b/src/mkerrcodes.awk
-@@ -85,7 +85,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-diff --git a/src/mkerrcodes1.awk b/src/mkerrcodes1.awk
-index a771a73..4578e29 100644
---- a/src/mkerrcodes1.awk
-+++ b/src/mkerrcodes1.awk
-@@ -81,7 +81,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-diff --git a/src/mkerrcodes2.awk b/src/mkerrcodes2.awk
-index ea58503..188f7a4 100644
---- a/src/mkerrcodes2.awk
-+++ b/src/mkerrcodes2.awk
-@@ -91,7 +91,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-diff --git a/src/mkerrnos.awk b/src/mkerrnos.awk
-index f79df66..15b1aad 100644
---- a/src/mkerrnos.awk
-+++ b/src/mkerrnos.awk
-@@ -83,7 +83,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-diff --git a/src/mkstrtable.awk b/src/mkstrtable.awk
-index c9de9c1..285e45f 100644
---- a/src/mkstrtable.awk
-+++ b/src/mkstrtable.awk
-@@ -77,7 +77,7 @@
- #
- # The variable prefix can be used to prepend a string to each message.
- #
--# The variable namespace can be used to prepend a string to each
-+# The variable pkg_namespace can be used to prepend a string to each
- # variable and macro name.
- 
- BEGIN {
-@@ -102,7 +102,7 @@ header {
-       print "/* The purpose of this complex string table is to produce";
-       print "   optimal code with a minimum of relocations.  */";
-       print "";
--      print "static const char " namespace "msgstr[] = ";
-+      print "static const char " pkg_namespace "msgstr[] = ";
-       header = 0;
-     }
-   else
-@@ -110,7 +110,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-@@ -150,7 +150,7 @@ END {
-   else
-     print "  gettext_noop (\"" last_msgstr "\");";
-   print "";
--  print "static const int " namespace "msgidx[] =";
-+  print "static const int " pkg_namespace "msgidx[] =";
-   print "  {";
-   for (i = 0; i < coded_msgs; i++)
-     print "    " pos[i] ",";
-@@ -158,7 +158,7 @@ END {
-   print "  };";
-   print "";
-   print "static GPG_ERR_INLINE int";
--  print namespace "msgidxof (int code)";
-+  print pkg_namespace "msgidxof (int code)";
-   print "{";
-   print "  return (0 ? 0";
- 
--- 
-2.21.0
-
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 2169182f60..05c46d6d43 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.36.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.37.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c  libgpg-error-1.36.tar.bz2
+sha256  b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763  libgpg-error-1.37.tar.bz2
 # Locally calculated
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index de4d114506..6281faa662 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.36
+LIBGPG_ERROR_VERSION = 1.37
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
-# 0001-gawk5-support.patch
-LIBGPG_ERROR_AUTORECONF = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = --disable-tests \
