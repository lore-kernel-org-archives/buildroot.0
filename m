From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  7 Oct 2015 09:58:12 +0300
Subject: [Buildroot] [PATCH] dos2unix: bump to version 7.3.1
Message-ID: <5237318417009cae71629a9316d41d6adeed5a0d.1444201092.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../dos2unix/0001-fix-build-without-wchar.patch    | 59 ----------------------
 package/dos2unix/dos2unix.hash                     |  2 +-
 package/dos2unix/dos2unix.mk                       |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/dos2unix/0001-fix-build-without-wchar.patch

diff --git a/package/dos2unix/0001-fix-build-without-wchar.patch b/package/dos2unix/0001-fix-build-without-wchar.patch
deleted file mode 100644
index c3188363ec7e..000000000000
--- a/package/dos2unix/0001-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Don't reference wchar_t when D2U_UNICODE is not defined.
-
-Patch status: upstream (http://sourceforge.net/p/dos2unix/code/736)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-diff -Nuar dos2unix-7.3.orig/common.c dos2unix-7.3/common.c
---- dos2unix-7.3.orig/common.c	2015-08-21 02:02:31.000000000 +0300
-+++ dos2unix-7.3/common.c	2015-09-02 22:13:33.648486366 +0300
-@@ -1615,9 +1615,11 @@
-     } else if (pFlag->status & WRONG_CODEPAGE) {
-       d2u_fprintf(stderr,"%s: ",progname);
-       d2u_fprintf(stderr, _("code page %d is not supported.\n"), pFlag->ConvMode);
-+#ifdef D2U_UNICODE
-     } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
-       d2u_fprintf(stderr,"%s: ",progname);
-       d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), "stdin", (int)sizeof(wchar_t));
-+#endif
-     } else if (pFlag->status & UNICODE_CONVERSION_ERROR) {
-       d2u_fprintf(stderr,"%s: ",progname);
-       d2u_fprintf(stderr, _("Skipping UTF-16 file %s, an UTF-16 conversion error occurred on line %u.\n"), "stdin", pFlag->line_nr);
-@@ -1701,9 +1703,11 @@
-   } else if (pFlag->status & WRONG_CODEPAGE) {
-     d2u_fprintf(stderr,"%s: ",progname);
-     d2u_fprintf(stderr, _("code page %d is not supported.\n"), pFlag->ConvMode);
-+#ifdef D2U_UNICODE
-   } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
-     d2u_fprintf(stderr,"%s: ",progname);
-     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), infile, (int)sizeof(wchar_t));
-+#endif
-   } else if (pFlag->status & UNICODE_CONVERSION_ERROR) {
-     d2u_fprintf(stderr,"%s: ",progname);
-     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, an UTF-16 conversion error occurred on line %u.\n"), infile, pFlag->line_nr);
-@@ -1781,9 +1785,11 @@
-   } else if (pFlag->status & WRONG_CODEPAGE) {
-     d2u_fprintf(stderr,"%s: ",progname);
-     d2u_fprintf(stderr, _("code page %d is not supported.\n"), pFlag->ConvMode);
-+#ifdef D2U_UNICODE
-   } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
-     d2u_fprintf(stderr,"%s: ",progname);
-     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), infile, (int)sizeof(wchar_t));
-+#endif
-   } else if (pFlag->status & UNICODE_CONVERSION_ERROR) {
-     d2u_fprintf(stderr,"%s: ",progname);
-     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, an UTF-16 conversion error occurred on line %u.\n"), infile, pFlag->line_nr);
-@@ -1834,11 +1840,13 @@
-       d2u_fprintf(stderr,"%s: ",progname);
-       d2u_fprintf(stderr, _("Skipping symbolic link %s, target is not a regular file.\n"), infile);
-     }
-+#ifdef D2U_UNICODE
-   } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
-     if (pFlag->verbose) {
-       d2u_fprintf(stderr,"%s: ",progname);
-       d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), infile, (int)sizeof(wchar_t));
-     }
-+#endif
-   }
- }
- 
diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index b22b6fc1682e..7e1a12002849 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8175f7552a72edaaa8918fdee68ce2cbc982dc25452f33d4dc611d769f4944d1	dos2unix-7.3.tar.gz
+sha256	f4d5df24d181c2efecf7631aab6e894489012396092cf206829f1f9a98556b94	dos2unix-7.3.1.tar.gz
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index f448e1406d5f..21e03aecb07c 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.3
+DOS2UNIX_VERSION = 7.3.1
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.5.3
