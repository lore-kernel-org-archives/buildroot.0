From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 17:03:52 +0200
Subject: [Buildroot] [git commit] dos2unix: remove WCHAR dependency
Message-ID: <20150904150747.8DB868016D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=966968c8a99604130fc69b8948f2c4d28592005a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing wchar build failure.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dos2unix/0001-fix-build-without-wchar.patch    |   59 ++++++++++++++++++++
 package/dos2unix/Config.in                         |    4 -
 package/dos2unix/dos2unix.mk                       |    4 +
 3 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/0001-fix-build-without-wchar.patch b/package/dos2unix/0001-fix-build-without-wchar.patch
new file mode 100644
index 0000000..c318836
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
index fdcd070..782c25c 100644
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
index 0d5a674..4c5f4fc 100644
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
