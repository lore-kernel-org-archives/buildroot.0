From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Oct 2019 22:33:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsvgtiny: fix build with latest
 gperf
Message-ID: <20191014203306.30263-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove second patch and retrieve two upstream patches to fix build with
latest gperf

Fixes:
 - http://autobuild.buildroot.org/results/51be63089209d38c2cf29b0e0b08f73a0e15c467

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Werror.patch => 0002-Remove-Werror.patch} |  0
 package/libsvgtiny/0002-create-builddir.patch | 15 ---
 ...-inlines-and-non-inlines-calling-one.patch | 36 +++++++
 ...nclude-gperf-generated-code-directly.patch | 97 +++++++++++++++++++
 4 files changed, 133 insertions(+), 15 deletions(-)
 rename package/libsvgtiny/{0003-Remove-Werror.patch => 0002-Remove-Werror.patch} (100%)
 delete mode 100644 package/libsvgtiny/0002-create-builddir.patch
 create mode 100644 package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
 create mode 100644 package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch

diff --git a/package/libsvgtiny/0003-Remove-Werror.patch b/package/libsvgtiny/0002-Remove-Werror.patch
similarity index 100%
rename from package/libsvgtiny/0003-Remove-Werror.patch
rename to package/libsvgtiny/0002-Remove-Werror.patch
diff --git a/package/libsvgtiny/0002-create-builddir.patch b/package/libsvgtiny/0002-create-builddir.patch
deleted file mode 100644
index a404d86bca..0000000000
--- a/package/libsvgtiny/0002-create-builddir.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-svgtiny: create BUILDDIR before $(BUILDDIR)/src_colors.c
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
---- libsvgtiny-12121/src/Makefile.orig	2014-06-17 15:30:21.765311434 +0400
-+++ libsvgtiny-12121/src/Makefile	2014-06-17 15:29:56.569909931 +0400
-@@ -3,7 +3,7 @@
- 
- SOURCES := $(SOURCES) $(BUILDDIR)/src_colors.c
- 
--$(BUILDDIR)/src_colors.c: src/colors.gperf
-+$(BUILDDIR)/src_colors.c: src/colors.gperf $(BUILDDIR)/stamp
- 	$(VQ)$(ECHO) "   GPERF: $<"
- 	$(Q)gperf --output-file=$@.tmp $<
- # Hack for GCC 4.2 compatibility (gperf 3.0.4 solves this properly)
diff --git a/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch b/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
new file mode 100644
index 0000000000..9285477d25
--- /dev/null
+++ b/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
@@ -0,0 +1,36 @@
+From 21b4836ac9d6c6725590a925daa5d17eda9843e9 Mon Sep 17 00:00:00 2001
+From: Daniel Silverstone <dsilvers@digital-scurf.org>
+Date: Sat, 26 Apr 2014 16:24:54 +0100
+Subject: Hopefully silence warnings about inlines and non inlines calling one
+ another.
+
+[Retrieved from:
+https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=21b4836ac9d6c6725590a925daa5d17eda9843e9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/colors.gperf | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/colors.gperf b/src/colors.gperf
+index 89152d2..96d5b9e 100644
+--- a/src/colors.gperf
++++ b/src/colors.gperf
+@@ -16,6 +16,15 @@
+ #include <string.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
++
++/* This unusual define shennanigan is to try and prevent the gperf
++ * generated function from being inlined.  This is pointless given
++ * it (a) is in a separate .c file and (b) has external linkage.
++ */
++#ifdef __inline
++#undef __inline
++#define __inline
++#endif
+ %}
+ 
+ struct svgtiny_named_color;
+-- 
+cgit v1.2.1
+
diff --git a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
new file mode 100644
index 0000000000..c17426ff05
--- /dev/null
+++ b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
@@ -0,0 +1,97 @@
+From 4390f1c84e8fee51fc22468821e6fc158e783053 Mon Sep 17 00:00:00 2001
+From: Michael Drake <michael.drake@codethink.co.uk>
+Date: Thu, 20 Apr 2017 10:51:07 +0100
+Subject: Build: Include gperf-generated code directly.
+
+Previously we built the generated code separatly and then linked to
+it.  However, this caused problems with certain compilers and gperf
+versions.  This change includes the generated code directly in
+svgtiny.c instead, which is the only place its used.
+
+[Retrieved from:
+https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=4390f1c84e8fee51fc22468821e6fc158e783053]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/Makefile           | 13 +++++++------
+ src/colors.gperf       |  8 --------
+ src/svgtiny.c          |  3 +++
+ src/svgtiny_internal.h |  5 -----
+ 4 files changed, 10 insertions(+), 19 deletions(-)
+
+(limited to 'src')
+
+diff --git a/src/Makefile b/src/Makefile
+index a979720..fb8a72f 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -1,13 +1,14 @@
+ # Sources
+ DIR_SOURCES := svgtiny.c svgtiny_gradient.c svgtiny_list.c
+ 
+-SOURCES := $(SOURCES) $(BUILDDIR)/src_colors.c
++SOURCES := $(SOURCES)
+ 
+-$(BUILDDIR)/src_colors.c: src/colors.gperf
++$(DIR)autogenerated_colors.c: src/colors.gperf
+ 	$(VQ)$(ECHO) "   GPERF: $<"
+-	$(Q)gperf --output-file=$@.tmp $<
+-# Hack for GCC 4.2 compatibility (gperf 3.0.4 solves this properly)
+-	$(Q)$(SED) -e 's/#ifdef __GNUC_STDC_INLINE__/#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__/' $@.tmp >$@
+-	$(Q)$(RM) $@.tmp
++	$(Q)gperf --output-file=$@ $<
++
++PRE_TARGETS := $(DIR)autogenerated_colors.c
++
++CLEAN_ITEMS := $(DIR)autogenerated_colors.c
+ 
+ include $(NSBUILD)/Makefile.subdir
+diff --git a/src/colors.gperf b/src/colors.gperf
+index 96d5b9e..a836787 100644
+--- a/src/colors.gperf
++++ b/src/colors.gperf
+@@ -17,14 +17,6 @@
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+-/* This unusual define shennanigan is to try and prevent the gperf
+- * generated function from being inlined.  This is pointless given
+- * it (a) is in a separate .c file and (b) has external linkage.
+- */
+-#ifdef __inline
+-#undef __inline
+-#define __inline
+-#endif
+ %}
+ 
+ struct svgtiny_named_color;
+diff --git a/src/svgtiny.c b/src/svgtiny.c
+index 4661a58..bbefb88 100644
+--- a/src/svgtiny.c
++++ b/src/svgtiny.c
+@@ -20,6 +20,9 @@
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
++/* Source file generated by `gperf`. */
++#include "autogenerated_colors.c"
++
+ #ifndef M_PI
+ #define M_PI		3.14159265358979323846
+ #endif
+diff --git a/src/svgtiny_internal.h b/src/svgtiny_internal.h
+index 158d230..6bf5d64 100644
+--- a/src/svgtiny_internal.h
++++ b/src/svgtiny_internal.h
+@@ -102,9 +102,4 @@ void *svgtiny_list_get(struct svgtiny_list *list,
+ void *svgtiny_list_push(struct svgtiny_list *list);
+ void svgtiny_list_free(struct svgtiny_list *list);
+ 
+-/* colors.gperf */
+-const struct svgtiny_named_color *
+-		svgtiny_color_lookup(register const char *str,
+-				register unsigned int len);
+-
+ #endif
+-- 
+cgit v1.2.1
+
-- 
2.23.0
