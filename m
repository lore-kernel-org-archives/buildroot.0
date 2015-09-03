From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Sep 2015 07:10:52 +0300
Subject: [Buildroot] [PATCH v3 3/5] dos2unix: remove WCHAR dependency
In-Reply-To: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
Message-ID: <934c9f1ca101afba70b5fe1efeaea01767ec95fd.1441253454.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch fixing wchar build failure.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
I added this as a separate patch after version bump to avoid package patch
rebase churn.

v3:
   * New patch in this series (Peter)
---
 .../dos2unix/0001-fix-build-without-wchar.patch    | 59 ++++++++++++++++++++++
 package/dos2unix/Config.in                         |  4 --
 package/dos2unix/dos2unix.mk                       |  4 ++
 3 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 package/dos2unix/0001-fix-build-without-wchar.patch

diff --git a/package/dos2unix/0001-fix-build-without-wchar.patch b/package/dos2unix/0001-fix-build-without-wchar.patch
new file mode 100644
index 000000000000..c3188363ec7e
--- /dev/null
+++ b/package/dos2unix/0001-fix-build-without-wchar.patch
@@ -0,0 +1,59 @@
+Don't reference wchar_t when D2U_UNICODE is not defined.
+
+Patch status: upstream (http://sourceforge.net/p/dos2unix/code/736)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+diff -Nuar dos2unix-7.3.orig/common.c dos2unix-7.3/common.c
+--- dos2unix-7.3.orig/common.c	2015-08-21 02:02:31.000000000 +0300
++++ dos2unix-7.3/common.c	2015-09-02 22:13:33.648486366 +0300
+@@ -1615,9 +1615,11 @@
+     } else if (pFlag->status & WRONG_CODEPAGE) {
+       d2u_fprintf(stderr,"%s: ",progname);
+       d2u_fprintf(stderr, _("code page %d is not supported.\n"), pFlag->ConvMode);
++#ifdef D2U_UNICODE
+     } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
+       d2u_fprintf(stderr,"%s: ",progname);
+       d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), "stdin", (int)sizeof(wchar_t));
++#endif
+     } else if (pFlag->status & UNICODE_CONVERSION_ERROR) {
+       d2u_fprintf(stderr,"%s: ",progname);
+       d2u_fprintf(stderr, _("Skipping UTF-16 file %s, an UTF-16 conversion error occurred on line %u.\n"), "stdin", pFlag->line_nr);
+@@ -1701,9 +1703,11 @@
+   } else if (pFlag->status & WRONG_CODEPAGE) {
+     d2u_fprintf(stderr,"%s: ",progname);
+     d2u_fprintf(stderr, _("code page %d is not supported.\n"), pFlag->ConvMode);
++#ifdef D2U_UNICODE
+   } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
+     d2u_fprintf(stderr,"%s: ",progname);
+     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), infile, (int)sizeof(wchar_t));
++#endif
+   } else if (pFlag->status & UNICODE_CONVERSION_ERROR) {
+     d2u_fprintf(stderr,"%s: ",progname);
+     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, an UTF-16 conversion error occurred on line %u.\n"), infile, pFlag->line_nr);
+@@ -1781,9 +1785,11 @@
+   } else if (pFlag->status & WRONG_CODEPAGE) {
+     d2u_fprintf(stderr,"%s: ",progname);
+     d2u_fprintf(stderr, _("code page %d is not supported.\n"), pFlag->ConvMode);
++#ifdef D2U_UNICODE
+   } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
+     d2u_fprintf(stderr,"%s: ",progname);
+     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), infile, (int)sizeof(wchar_t));
++#endif
+   } else if (pFlag->status & UNICODE_CONVERSION_ERROR) {
+     d2u_fprintf(stderr,"%s: ",progname);
+     d2u_fprintf(stderr, _("Skipping UTF-16 file %s, an UTF-16 conversion error occurred on line %u.\n"), infile, pFlag->line_nr);
+@@ -1834,11 +1840,13 @@
+       d2u_fprintf(stderr,"%s: ",progname);
+       d2u_fprintf(stderr, _("Skipping symbolic link %s, target is not a regular file.\n"), infile);
+     }
++#ifdef D2U_UNICODE
+   } else if (pFlag->status & WCHAR_T_TOO_SMALL) {
+     if (pFlag->verbose) {
+       d2u_fprintf(stderr,"%s: ",progname);
+       d2u_fprintf(stderr, _("Skipping UTF-16 file %s, the size of wchar_t is %d bytes.\n"), infile, (int)sizeof(wchar_t));
+     }
++#endif
+   }
+ }
+ 
diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index fdcd0700509b..782c25cf0e13 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_DOS2UNIX
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_USE_WCHAR # gettext
 	bool "dos2unix"
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
 	  http://freshmeat.net/projects/dos2unix
-
-comment "dos2unix needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 0d5a67456e6b..4c5f4fcff384 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -20,6 +20,10 @@ DOS2UNIX_DEPENDENCIES += gettext
 DOS2UNIX_MAKE_OPTS += LIBS_EXTRA=-lintl
 endif
 
+ifeq ($(BR2_USE_WCHAR),)
+DOS2UNIX_MAKE_OPTS += UCS=
+endif
+
 define DOS2UNIX_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(DOS2UNIX_MAKE_OPTS)
 endef
-- 
2.5.0
