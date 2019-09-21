From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 18:54:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/gengetopt: bump to version 2.23
Message-ID: <20190921165452.4864-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (not needed since
  https://git.savannah.gnu.org/cgit/gengetopt.git/commit/?id=9769f643d2e21379b8f7a3fd52ef77184fa753f6)
- Enable parallel build (fixed since
  https://git.savannah.gnu.org/cgit/gengetopt.git/commit/?id=8e6fa4d9d63c680b84ba872e8e581eb01ae3bc09)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...mpilation-warnings-in-generated-code.patch | 65 -------------------
 package/gengetopt/gengetopt.hash              |  4 +-
 package/gengetopt/gengetopt.mk                |  6 +-
 3 files changed, 5 insertions(+), 70 deletions(-)
 delete mode 100644 package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch

diff --git a/package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch b/package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch
deleted file mode 100644
index 88961e6690..0000000000
--- a/package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Fix compilation warnings in generated code
-
-Patch taken from open bug report http://savannah.gnu.org/bugs/?40243
-(project gengetopt seems to be dead; no hope for a new release soon)
-
-Imported by Philippe Mariman.
-This description by Thomas De Schampheleire.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
-Index: gengetopt-2.22.6/src/skels/c_source.cc
-===================================================================
---- gengetopt-2.22.6.orig/src/skels/c_source.cc	2012-11-07 20:58:29.000000000 +0100
-+++ gengetopt-2.22.6/src/skels/c_source.cc	2014-11-20 12:05:02.597527761 +0100
-@@ -2424,9 +2424,12 @@
-       stream << "  FIX_UNUSED (field);";
-       stream << "\n";
-       stream << indent_str;
-+      stream << "  FIX_UNUSED (stop_char);";
-+      stream << "\n";
-+      stream << indent_str;
-+      stream << "  FIX_UNUSED (val);";
-       stream << "\n";
-       stream << indent_str;
--      stream << "  stop_char = 0;";
-       stream << "\n";
-       stream << indent_str;
-       stream << "  found = 0;";
-@@ -3981,6 +3984,12 @@
-       stream << "\n";
-       stream << indent_str;
-     }
-+  else
-+    {
-+      stream << "  FIX_UNUSED (check_required);";
-+      stream << "\n";
-+      stream << indent_str;
-+    }
-   stream << "\n";
-   stream << indent_str;
-   indent = 2;
-Index: gengetopt-2.22.6/src/skels/c_source.h_skel
-===================================================================
---- gengetopt-2.22.6.orig/src/skels/c_source.h_skel	2012-11-02 18:43:24.000000000 +0100
-+++ gengetopt-2.22.6/src/skels/c_source.h_skel	2014-11-20 12:05:22.501528424 +0100
-@@ -767,8 +767,9 @@
-   char **string_field;
- @ENDIF@
-   FIX_UNUSED (field);
-+  FIX_UNUSED (stop_char);
-+  FIX_UNUSED (val);
- 
--  stop_char = 0;
-   found = 0;
- 
-   if (!multiple_option && prev_given && (*prev_given || (check_ambiguity && *field_given)))
-@@ -1327,6 +1328,8 @@
-     {
-       error_occurred += @parser_name at _required2 (args_info, argv[0], additional_error);
-     }
-+ at ELSE@
-+  FIX_UNUSED (check_required);
- @ENDIF@
- 
-   @parser_name@_release (&local_args_info);
diff --git a/package/gengetopt/gengetopt.hash b/package/gengetopt/gengetopt.hash
index 4f411ac8b3..35c214fce2 100644
--- a/package/gengetopt/gengetopt.hash
+++ b/package/gengetopt/gengetopt.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 30b05a88604d71ef2a42a2ef26cd26df242b41f5b011ad03083143a31d9b01f7 gengetopt-2.22.6.tar.gz
+sha256 b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac gengetopt-2.23.tar.xz
+sha256 afab96ff35204960631dc05506034f9efc01e6d696f0ac93718d6bd43512cda7 COPYING
+sha256 72a43351233d6a581f891cdfff78b7b7d5f2a12522523929c5f7e8f674c2f6fc LICENSE
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
index e7c49ba527..37f7de1ee8 100644
--- a/package/gengetopt/gengetopt.mk
+++ b/package/gengetopt/gengetopt.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-GENGETOPT_VERSION = 2.22.6
+GENGETOPT_VERSION = 2.23
+GENGETOPT_SOURCE = gengetopt-$(GENGETOPT_VERSION).tar.xz
 GENGETOPT_SITE = $(BR2_GNU_MIRROR)/gengetopt
 GENGETOPT_LICENSE = GPL-3.0+
 GENGETOPT_LICENSE_FILES = COPYING LICENSE
 
-# Parallel build broken
-GENGETOPT_MAKE = $(MAKE1)
-
 $(eval $(host-autotools-package))
-- 
2.23.0
