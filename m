From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] icu: convert to autotargets and
	bump to version 4.4.2
Message-ID: <20101222232250.87D6C8E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=84241e949901b2e014c92ad55303de7796820bc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/icu/Config.in                        |    2 +-
 package/icu/icu-4c-3_8_1-lsupc++.patch       |   67 ------
 package/icu/icu-arm.patch                    |   25 ++
 package/icu/icu-both-elif-no-arguments.patch |   23 --
 package/icu/icu-cross-compile.patch          |  314 --------------------------
 package/icu/icu-double-escape.patch          |   17 ++
 package/icu/icu-overflow.patch               |   93 ++++++++
 package/icu/icu.mk                           |   86 ++------
 8 files changed, 153 insertions(+), 474 deletions(-)
 delete mode 100644 package/icu/icu-4c-3_8_1-lsupc++.patch
 create mode 100644 package/icu/icu-arm.patch
 delete mode 100644 package/icu/icu-both-elif-no-arguments.patch
 delete mode 100644 package/icu/icu-cross-compile.patch
 create mode 100644 package/icu/icu-double-escape.patch
 create mode 100644 package/icu/icu-overflow.patch

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 27de8d3..21f5c2f 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_ICU
 	help
 	  International Components for Unicode.
 
-	  http://icu-project.org/
+	  http://site.icu-project.org/
 
 comment "icu requires a toolchain with C++ support and WCHAR enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/icu/icu-4c-3_8_1-lsupc++.patch b/package/icu/icu-4c-3_8_1-lsupc++.patch
deleted file mode 100644
index 891ddce..0000000
--- a/package/icu/icu-4c-3_8_1-lsupc++.patch
+++ /dev/null
@@ -1,67 +0,0 @@
---- source/tools/genccode/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/genccode/Makefile.in	2008-02-07 14:37:56.000000000 -0500
-@@ -31,7 +31,7 @@ ifneq ($(top_builddir),$(top_srcdir))
- CPPFLAGS += -I$(top_builddir)/common
- endif
- CPPFLAGS += -I$(top_srcdir)/common -I$(srcdir)/../toolutil
--LIBS = $(LIBICUTOOLUTIL) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-+LIBS = $(LIBICUTOOLUTIL) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M) -lsupc++ -lstdc++
- 
- OBJECTS = genccode.o
- 
---- source/tools/gencmn/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/gencmn/Makefile.in	2008-02-07 14:37:56.000000000 -0500
-@@ -31,7 +31,7 @@ ifneq ($(top_builddir),$(top_srcdir))
- CPPFLAGS += -I$(top_builddir)/common
- endif
- CPPFLAGS += -I$(top_srcdir)/common -I$(srcdir)/../toolutil
--LIBS = $(LIBICUTOOLUTIL) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-+LIBS = $(LIBICUTOOLUTIL) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M) -lsupc++ -lstdc++
- 
- OBJECTS = gencmn.o
-
---- source/tools/genrb/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/genrb/Makefile.in	2008-02-07 14:37:56.000000000 -0500
-@@ -55,7 +55,7 @@ ifneq ($(top_builddir),$(top_srcdir))
- CPPFLAGS += -I$(top_builddir)/common
- endif
- CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(srcdir)/../toolutil
--LIBS = $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-+LIBS = $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M) -lsupc++ -lstdc++
- 
- OBJECTS = errmsg.o genrb.o parse.o read.o reslist.o ustr.o rbutil.o \
- wrtjava.o rle.o wrtxml.o prscmnts.o
-
---- source/tools/pkgdata/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/pkgdata/Makefile.in	2008-02-07 14:37:56.000000000 -0500
-@@ -35,7 +35,7 @@ CPPFLAGS += -I$(top_builddir)/common
- endif
- CPPFLAGS += -I$(top_srcdir)/common -I$(srcdir)/../toolutil
- DEFS += -DUDATA_SO_SUFFIX=\".$(SO)\" -DSTATIC_O=\"$(STATIC_O)\"
--LIBS = $(LIBICUTOOLUTIL) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-+LIBS = $(LIBICUTOOLUTIL) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M) -lsupc++ -lstdc++
- 
- OBJECTS = pkgdata.o pkgtypes.o make.o dllmode.o cmnmode.o filemode.o sttcmode.o winmode.o
- 
---- source/samples/date/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/samples/date/Makefile.in	2008-02-07 14:37:56.000000000 -0500
-@@ -21,7 +21,7 @@ CLEANFILES = *~ $(DEPS)
- TARGET = icudate$(EXEEXT)
- 
- CPPFLAGS += -I$(top_builddir)/common -I$(top_srcdir)/common -I$(top_srcdir)/i18n
--LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-+LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M) -lsupc++ -lstdc++
- 
- OBJECTS = uprint.o date.o
- 
---- source/samples/cal/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/samples/cal/Makefile.in	2008-02-07 14:37:56.000000000 -0500
-@@ -21,7 +21,7 @@ CLEANFILES = *~ $(DEPS)
- TARGET = icucal$(EXEEXT)
- 
- CPPFLAGS += -I$(top_builddir)/common -I$(top_srcdir)/common -I$(top_srcdir)/i18n
--LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-+LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M) -lsupc++ -lstdc++
- 
- OBJECTS = uprint.o cal.o
- 
diff --git a/package/icu/icu-arm.patch b/package/icu/icu-arm.patch
new file mode 100644
index 0000000..53070d9
--- /dev/null
+++ b/package/icu/icu-arm.patch
@@ -0,0 +1,25 @@
+https://bugs.icu-project.org/trac/ticket/7664
+https://bugs.icu-project.org/trac/changeset/28107
+
+--- icu.orig/source/tools/toolutil/pkg_genc.c
++++ icu/source/tools/toolutil/pkg_genc.c
+@@ -1,5 +1,5 @@
+ /******************************************************************************
+- *   Copyright (C) 2009, International Business Machines
++ *   Copyright (C) 2009-2010, International Business Machines
+  *   Corporation and others.  All Rights Reserved.
+  *******************************************************************************
+  */
+@@ -118,10 +118,10 @@
+ } assemblyHeader[] = {
+     {"gcc",
+         ".globl %s\n"
+-        "\t.section .note.GNU-stack,\"\", at progbits\n"
++        "\t.section .note.GNU-stack,\"\",%%progbits\n"
+         "\t.section .rodata\n"
+         "\t.align 8\n" /* Either align 8 bytes or 2^8 (256) bytes. 8 bytes is needed. */
+-        "\t.type %s, at object\n"
++        "\t.type %s,%%object\n"
+         "%s:\n\n",
+ 
+         ".long ","",HEX_0X
diff --git a/package/icu/icu-both-elif-no-arguments.patch b/package/icu/icu-both-elif-no-arguments.patch
deleted file mode 100644
index 8941c53..0000000
--- a/package/icu/icu-both-elif-no-arguments.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[PATCH] icu: fix #elif without arguments
-
-ParagraphLayout.cpp contains an #elif without any arguments, which
-g++ >= 4.4 flags as an error. Fix it by replacing it with an #else.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- source/layoutex/ParagraphLayout.cpp |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: source/layoutex/ParagraphLayout.cpp
-===================================================================
---- source.orig/layoutex/ParagraphLayout.cpp
-+++ source/layoutex/ParagraphLayout.cpp
-@@ -813,7 +813,7 @@ le_int32 ParagraphLayout::getLanguageCod
- 
-     return nullLanguageCode;
- }
--#elif
-+#else
- 
- // TODO - dummy implementation for right now...
- le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
diff --git a/package/icu/icu-cross-compile.patch b/package/icu/icu-cross-compile.patch
deleted file mode 100644
index a12c589..0000000
--- a/package/icu/icu-cross-compile.patch
+++ /dev/null
@@ -1,314 +0,0 @@
-diff -rup icu/source/data/icupkg.inc.in icu/source/data/icupkg.inc.in
---- source/data/icupkg.inc.in	2007-12-12 13:58:04.000000000 -0500
-+++ source/data/icupkg.inc.in	2008-02-03 12:35:09.000000000 -0500
-@@ -49,8 +49,8 @@ U_IS_BIG_ENDIAN=@U_IS_BIG_ENDIAN@
- 
- ##### Add the following to source/config/Makefile.in
- 
--GENCCODE=$(BINDIR)/genccode
--GENCMN=$(BINDIR)/gencmn
--ICUPKG=$(BINDIR)/icupkg
-+GENCCODE=$(BINDIR)-host/genccode
-+GENCMN=$(BINDIR)-host/gencmn
-+ICUPKG=$(BINDIR)-host/icupkg
- 
- 
-diff -rup icu/source/data/Makefile.in icu/source/data/Makefile.in
---- source/data/Makefile.in	2007-12-12 13:58:04.000000000 -0500
-+++ source/data/Makefile.in	2008-02-03 12:35:49.000000000 -0500
-@@ -36,7 +36,7 @@ ICUPKGDATA_OUTDIR = $(OUTDIR)
- endif
- 
- CURDIR:=$(CURR_FULL_DIR)
--PKGDATA = $(BINDIR)/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME) -d $(ICUPKGDATA_OUTDIR) -M'PKGDATA_LDFLAGS="$(LDFLAGSICUDT)"'
-+PKGDATA = $(BINDIR)-host/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME) -d $(ICUPKGDATA_OUTDIR) -M'PKGDATA_LDFLAGS="$(LDFLAGSICUDT)"'
- 
- ifeq ($(OS390_STUBDATA),1)
- OS390PKG=package390
-@@ -133,7 +133,7 @@ ICUDATA_ARCHIVE = $(firstword $(wildcard
- ifneq ($(ICUDATA_ARCHIVE),)
- ICUDATA_SOURCE_ARCHIVE = $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
- $(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
--	$(INVOKE) $(BINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
-+	$(INVOKE) $(BINDIR)-host/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
- endif
- else
- ifneq ($(ENABLE_STATIC),YES)
-@@ -349,7 +349,7 @@ $(PKGDATA_LIST): $(SRCLISTDEPS) $(ICUDAT
- ifneq ($(ICUDATA_SOURCE_IS_NATIVE_TARGET),YES)
- 	@echo "Unpacking $(ICUDATA_SOURCE_ARCHIVE) and generating $@ (list of data files)"
- 	@-$(RMV) $@
--	$(INVOKE) $(BINDIR)/icupkg -d $(BUILDDIR) --list -x \* $(ICUDATA_SOURCE_ARCHIVE) > $@
-+	$(INVOKE) $(BINDIR)-host/icupkg -d $(BUILDDIR) --list -x \* $(ICUDATA_SOURCE_ARCHIVE) > $@
- else
- 	@echo "$@" > $@
- endif
-@@ -377,46 +377,46 @@ endif
- # DAT FILES
- 
- # uprops.icu
--$(BUILDDIR)/uprops.icu: $(UNICODEDATADIR)/UnicodeData.txt $(UNICODEDATADIR)/BidiMirroring.txt $(BINDIR)/genprops$(EXEEXT) $(BUILDDIR)/$(ICUDT)pnames.icu
--	$(INVOKE) $(BINDIR)/genprops -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
--	$(INVOKE) $(BINDIR)/genprops --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
-+$(BUILDDIR)/uprops.icu: $(UNICODEDATADIR)/UnicodeData.txt $(UNICODEDATADIR)/BidiMirroring.txt $(BINDIR)-host/genprops$(EXEEXT) $(BUILDDIR)/$(ICUDT)pnames.icu
-+	$(INVOKE) $(BINDIR)-host/genprops -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
-+	$(INVOKE) $(BINDIR)-host/genprops --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
- 
- # ubidi.icu
--$(BUILDDIR)/ubidi.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)/genbidi$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genbidi -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
--	$(INVOKE) $(BINDIR)/genbidi --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
-+$(BUILDDIR)/ubidi.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)-host/genbidi$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genbidi -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
-+	$(INVOKE) $(BINDIR)-host/genbidi --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
- 
- # ucase.icu
--$(BUILDDIR)/ucase.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)/gencase$(EXEEXT)
--	$(INVOKE) $(BINDIR)/gencase -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
--	$(INVOKE) $(BINDIR)/gencase --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
-+$(BUILDDIR)/ucase.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)-host/gencase$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/gencase -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
-+	$(INVOKE) $(BINDIR)-host/gencase --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
- 
- # pnames.icu
--$(BUILDDIR)/pnames.icu: $(UNICODEDATADIR)/PropertyAliases.txt $(UNICODEDATADIR)/PropertyValueAliases.txt $(UNICODEDATADIR)/Blocks.txt $(COMINCDIR)/uscript.h $(COMINCDIR)/uchar.h $(BINDIR)/genpname$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genpname -d $(BUILDDIR)
-+$(BUILDDIR)/pnames.icu: $(UNICODEDATADIR)/PropertyAliases.txt $(UNICODEDATADIR)/PropertyValueAliases.txt $(UNICODEDATADIR)/Blocks.txt $(COMINCDIR)/uscript.h $(COMINCDIR)/uchar.h $(BINDIR)-host/genpname$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genpname -d $(BUILDDIR)
- 
- # unorm.icu
--$(BUILDDIR)/unorm.icu: $(UNICODEDATADIR)/UnicodeData.txt $(UNICODEDATADIR)/DerivedNormalizationProps.txt $(UNICODEDATADIR)/BidiMirroring.txt $(BINDIR)/gennorm$(EXEEXT) $(BUILDDIR)/$(ICUDT)pnames.icu $(BUILDDIR)/$(ICUDT)uprops.icu $(BUILDDIR)/$(ICUDT)ucase.icu
--	$(INVOKE) $(BINDIR)/gennorm -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
--	$(INVOKE) $(BINDIR)/gennorm --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
-+$(BUILDDIR)/unorm.icu: $(UNICODEDATADIR)/UnicodeData.txt $(UNICODEDATADIR)/DerivedNormalizationProps.txt $(UNICODEDATADIR)/BidiMirroring.txt $(BINDIR)-host/gennorm$(EXEEXT) $(BUILDDIR)/$(ICUDT)pnames.icu $(BUILDDIR)/$(ICUDT)uprops.icu $(BUILDDIR)/$(ICUDT)ucase.icu
-+	$(INVOKE) $(BINDIR)-host/gennorm -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
-+	$(INVOKE) $(BINDIR)-host/gennorm --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
- 
- # ucadata.icu
- # used to depend on $(BUILDDIR)/$(ICUDT)unorm.icu $(BUILDDIR)/$(ICUDT)ucase.icu
- # see Jitterbug 4497
--$(BUILDDIR)/ucadata.icu $(BUILDDIR)/$(ICUDT)invuca.icu: $(UNICODEDATADIR)/FractionalUCA.txt $(BINDIR)/genuca$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genuca -s $(UNICODEDATADIR) -d $(BUILDDIR) -i $(BUILDDIR) 
-+$(BUILDDIR)/ucadata.icu $(BUILDDIR)/$(ICUDT)invuca.icu: $(UNICODEDATADIR)/FractionalUCA.txt $(BINDIR)-host/genuca$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genuca -s $(UNICODEDATADIR) -d $(BUILDDIR) -i $(BUILDDIR) 
- 
- # unames.icu
--$(BUILDDIR)/unames.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)/gennames$(EXEEXT)
--	$(INVOKE) $(BINDIR)/gennames -1 -d $(BUILDDIR) $(UNICODEDATADIR)/UnicodeData.txt -u $(UNICODE_VERSION)
-+$(BUILDDIR)/unames.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)-host/gennames$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/gennames -1 -d $(BUILDDIR) $(UNICODEDATADIR)/UnicodeData.txt -u $(UNICODE_VERSION)
- 
- # cnvalias.icu
--$(BUILDDIR)/cnvalias.icu: $(UCMSRCDIR)/convrtrs.txt $(BINDIR)/gencnval$(EXEEXT)
--	$(INVOKE) $(BINDIR)/gencnval -d $(BUILDDIR) $(UCMSRCDIR)/convrtrs.txt
-+$(BUILDDIR)/cnvalias.icu: $(UCMSRCDIR)/convrtrs.txt $(BINDIR)-host/gencnval$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/gencnval -d $(BUILDDIR) $(UCMSRCDIR)/convrtrs.txt
- 
- # uidna.spp
--$(BUILDDIR)/uidna.spp: $(MISCSRCDIR)/NamePrepProfile.txt $(BINDIR)/gensprep$(EXEEXT) $(BUILDDIR)/unames.icu $(BUILDDIR)/pnames.icu
--	$(INVOKE) $(BINDIR)/gensprep -d $(BUILDDIR) -i $(BUILDDIR) -s $(MISCSRCDIR) -b uidna -n $(UNICODEDATADIR) -u 3.2.0 -k NamePrepProfile.txt
-+$(BUILDDIR)/uidna.spp: $(MISCSRCDIR)/NamePrepProfile.txt $(BINDIR)-host/gensprep$(EXEEXT) $(BUILDDIR)/unames.icu $(BUILDDIR)/pnames.icu
-+	$(INVOKE) $(BINDIR)-host/gensprep -d $(BUILDDIR) -i $(BUILDDIR) -s $(MISCSRCDIR) -b uidna -n $(UNICODEDATADIR) -u 3.2.0 -k NamePrepProfile.txt
- 
- ####################################################    BRK
- # BRK FILES
-@@ -424,29 +424,29 @@ $(BUILDDIR)/uidna.spp: $(MISCSRCDIR)/Nam
- #thaidict.brk: $(SRCDATADIR)/thaidict.brk
- #	$(RMV) $@ && ln -s $(BUILDDIR) $@
- 
--$(BRKBLDDIR)/%.brk: $(BRKSRCDIR)/%.txt $(BINDIR)/genbrk$(EXEEXT) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genbrk -c -i $(BUILDDIR) -r $< -o $@
-+$(BRKBLDDIR)/%.brk: $(BRKSRCDIR)/%.txt $(BINDIR)-host/genbrk$(EXEEXT) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genbrk -c -i $(BUILDDIR) -r $< -o $@
- 
- ####################################################    CTD
- # CTD FILES
- 
--$(BRKBLDDIR)/%.ctd: $(BRKSRCDIR)/%.txt $(BINDIR)/genctd$(EXEEXT) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genctd -c -i $(BUILDDIR) -o $@ $<
-+$(BRKBLDDIR)/%.ctd: $(BRKSRCDIR)/%.txt $(BINDIR)-host/genctd$(EXEEXT) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genctd -c -i $(BUILDDIR) -o $@ $<
- 
- ####################################################    CNV
- # CNV FILES
--$(BUILDDIR)/%.cnv: $(UCMSRCDIR)/%.ucm $(BINDIR)/makeconv$(EXEEXT)
--	$(INVOKE) $(BINDIR)/makeconv -c -d $(BUILDDIR) $(UCMSRCDIR)/$(<F)
-+$(BUILDDIR)/%.cnv: $(UCMSRCDIR)/%.ucm $(BINDIR)-host/makeconv$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/makeconv -c -d $(BUILDDIR) $(UCMSRCDIR)/$(<F)
- 
- ####################################################    RES
- # RES FILES
- 
- ### collation res
--$(COLBLDDIR)/%.res: $(COLSRCDIR)/%.txt  $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(COLSRCDIR) -d $(COLBLDDIR) $(<F)
-+$(COLBLDDIR)/%.res: $(COLSRCDIR)/%.txt  $(BINDIR)-host/genrb$(EXEEXT) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(COLSRCDIR) -d $(COLBLDDIR) $(<F)
- 
--$(COLBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(COLLATION_TREE)/$(INDEX_NAME).txt $(BINDIR)/genrb$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(COLLATION_TREE) -d $(COLBLDDIR) $(INDEX_NAME).txt
-+$(COLBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(COLLATION_TREE)/$(INDEX_NAME).txt $(BINDIR)-host/genrb$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(COLLATION_TREE) -d $(COLBLDDIR) $(INDEX_NAME).txt
- 
- $(COLLATION_INDEX_FILE): $(SRCLISTDEPS)
- 	@echo "generating $@ (list of installed collation locales)"; \
-@@ -461,11 +461,11 @@ $(COLLATION_INDEX_FILE): $(SRCLISTDEPS)
- 	echo "}" >> $@;
- 
- ### brk res
--$(BRKBLDDIR)/%.res: $(BRKSRCDIR)/%.txt $(BINDIR)/genrb$(EXEEXT) $(BRK_FILES) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(BRKSRCDIR) -d $(BRKBLDDIR) $(<F)
-+$(BRKBLDDIR)/%.res: $(BRKSRCDIR)/%.txt $(BINDIR)-host/genrb$(EXEEXT) $(BRK_FILES) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(BRKSRCDIR) -d $(BRKBLDDIR) $(<F)
- 
--$(BRKBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(BREAK_TREE)/$(INDEX_NAME).txt $(BINDIR)/genrb$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(BREAK_TREE) -d $(BRKBLDDIR) $(INDEX_NAME).txt
-+$(BRKBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(BREAK_TREE)/$(INDEX_NAME).txt $(BINDIR)-host/genrb$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(BREAK_TREE) -d $(BRKBLDDIR) $(INDEX_NAME).txt
- 
- $(BRK_RES_INDEX_FILE): $(SRCLISTDEPS)
- 	@echo "generating $@ (list of installed break locales)"; \
-@@ -480,11 +480,11 @@ $(BRK_RES_INDEX_FILE): $(SRCLISTDEPS)
- 	echo "}" >> $@;
- 
- ### RBNF res
--$(RBNFBLDDIR)/%.res: $(RBNFSRCDIR)/%.txt  $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(RBNFSRCDIR) -d $(RBNFBLDDIR) $(<F)
-+$(RBNFBLDDIR)/%.res: $(RBNFSRCDIR)/%.txt  $(BINDIR)-host/genrb$(EXEEXT) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(RBNFSRCDIR) -d $(RBNFBLDDIR) $(<F)
- 
--$(RBNFBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(RBNF_TREE)/$(INDEX_NAME).txt $(BINDIR)/genrb$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(RBNF_TREE) -d $(RBNFBLDDIR) $(INDEX_NAME).txt
-+$(RBNFBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(RBNF_TREE)/$(INDEX_NAME).txt $(BINDIR)-host/genrb$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(RBNF_TREE) -d $(RBNFBLDDIR) $(INDEX_NAME).txt
- 
- $(RBNF_INDEX_FILE): $(SRCLISTDEPS)
- 	@echo "generating $@ (list of installed RBNF locales)"; \
-@@ -499,14 +499,14 @@ $(RBNF_INDEX_FILE): $(SRCLISTDEPS)
- 	echo "}" >> $@;
- 
- ### TRANSLIT res
--$(TRANSLITBLDDIR)/%.res: $(TRANSLITSRCDIR)/%.txt  $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(TRANSLITSRCDIR) -d $(TRANSLITBLDDIR) $(<F)
-+$(TRANSLITBLDDIR)/%.res: $(TRANSLITSRCDIR)/%.txt  $(BINDIR)-host/genrb$(EXEEXT) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(TRANSLITSRCDIR) -d $(TRANSLITBLDDIR) $(<F)
-   
- ### normal (locale) res
- all-RES:  $(RES_FILES)
- 
--$(BUILDDIR)/%.res: $(LOCSRCDIR)/%.txt $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(LOCSRCDIR) -d $(BUILDDIR) $(<F)
-+$(BUILDDIR)/%.res: $(LOCSRCDIR)/%.txt $(BINDIR)-host/genrb$(EXEEXT) $(DAT_FILES)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(LOCSRCDIR) -d $(BUILDDIR) $(<F)
- 
- # if the tzcode directory contains a new tzdata*.tar.gz file, use it for zoneinfo.txt
- TZDATA = $(firstword $(wildcard $(top_builddir)/tools/tzcode/tzdata*.tar.gz) $(wildcard $(top_srcdir)/tools/tzcode/tzdata*.tar.gz))
-@@ -518,9 +518,9 @@ ZONEINFO=$(TZCODE_DIR)/zoneinfo.txt
- 
- # Override the normal genrb for zoneinfo.txt to always pull from
- # icu/source/tools/tzcode/zoneinfo.txt
--$(BUILDDIR)/zoneinfo.res: $(ZONEINFO) $(BINDIR)/genrb$(EXEEXT)
-+$(BUILDDIR)/zoneinfo.res: $(ZONEINFO) $(BINDIR)-host/genrb$(EXEEXT)
- 	@echo Note: $(MISCSRCDIR)/zoneinfo.txt is IGNORED because $(TZDATA) is present.
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -d $(BUILDDIR) $(ZONEINFO)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -d $(BUILDDIR) $(ZONEINFO)
- 
- # Create the tzcode tool and zoneinfo.txt as needed.
- $(ZONEINFO): $(TZDATA)
-@@ -531,8 +531,8 @@ $(ZONEINFO): $(TZDATA)
- endif
- 
- # zoneinfo has some issues. Ignore some warnings with -q
--$(BUILDDIR)/%.res: $(MISCSRCDIR)/%.txt $(BINDIR)/genrb$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -s $(MISCSRCDIR) -d $(BUILDDIR) $(<F)
-+$(BUILDDIR)/%.res: $(MISCSRCDIR)/%.txt $(BINDIR)-host/genrb$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -s $(MISCSRCDIR) -d $(BUILDDIR) $(<F)
- 
- 
- 
-@@ -552,8 +552,8 @@ $(INDEX_FILE): $(SRCLISTDEPS)
- clean-resindex:
- 	-$(RMV) $(BUILDDIR)/$(INDEX_NAME).txt $(PKGDATA_LIST)
- 
--$(INDEX_RES_FILE): $(INDEX_FILE) $(BINDIR)/genrb$(EXEEXT)
--	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -d $(BUILDDIR) $(INDEX_FILE)
-+$(INDEX_RES_FILE): $(INDEX_FILE) $(BINDIR)-host/genrb$(EXEEXT)
-+	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -d $(BUILDDIR) $(INDEX_FILE)
- 
- # Starting with ICU4C 3.4, the core Unicode properties files (uprops.icu, ucase.icu, ubidi.icu, unorm.icu)
- # are hardcoded in the common DLL and therefore not included in the data package any more.
-diff -rup icu/source/extra/uconv/Makefile.in icu/source/extra/uconv/Makefile.in
---- source/extra/uconv/Makefile.in	2007-12-12 13:57:20.000000000 -0500
-+++ source/extra/uconv/Makefile.in	2008-02-03 12:36:48.000000000 -0500
-@@ -40,7 +40,7 @@ ALL_MAN_FILES = $(TARGET_STUB_NAME).$(SE
- CLEANFILES = *~ $(DEPS) $(ALL_MAN_FILES)
- 
- ## Target information
--TARGET = $(BINDIR)/$(TARGET_STUB_NAME)$(EXEEXT)
-+TARGET = $(BINDIR)-host/$(TARGET_STUB_NAME)$(EXEEXT)
- 
- CPPFLAGS += -I$(top_builddir)/common -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(srcdir)/../toolutil
- LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
-@@ -106,7 +106,7 @@ clean-local: resclean
- 	$(RMV) $(OBJECTS) $(TARGET)
- 
- resclean:
--	@#-$(INVOKE) $(BINDIR)/pkgdata --clean -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
-+	@#-$(INVOKE) $(BINDIR)-host/pkgdata --clean -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
- 	$(RMV) pkgdata.inc $(RESDIR)
- 
- distclean-local: clean-local
-@@ -138,7 +138,7 @@ endif
- 
- 
- package-resfiles: $(RESDIR)/$(RESDIR).lst pkgdata.inc
--	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(BINDIR)/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
-+	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(BINDIR)-host/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
- 
- $(RESDIR)/$(RESDIR).lst: Makefile $(srcdir)/resfiles.mk
- 	@$(MKINSTALLDIRS) $(RESDIR)
-@@ -151,7 +151,7 @@ $(RESDIR)/$(RESDIR).lst: Makefile $(srcd
- ifneq ($(UCONVMSG_MODE),static)
- install-resfiles: $(RESFILES)
- 	$(MKINSTALLDIRS) $(DESTDIR)$(ICUDATA_DIR)
--	$(INVOKE) $(BINDIR)/pkgdata -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -I $(INSTALLTO) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
-+	$(INVOKE) $(BINDIR)-host/pkgdata -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -I $(INSTALLTO) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
- else
- install-resfiles:
- endif
-@@ -161,7 +161,7 @@ $(UCONVMSG_LIB): resfiles
- 
- $(MSGNAME)/%.res: $(srcdir)/$(RESOURCESDIR)/%.txt
- 	$(MKINSTALLDIRS) $(@D)
--	$(INVOKE) $(BINDIR)/genrb -e UTF-8 -s $(^D) -d $(@D) $(^F)
-+	$(INVOKE) $(BINDIR)-host/genrb -e UTF-8 -s $(^D) -d $(@D) $(^F)
- 
- install-man: $(ALL_MAN_FILES)
- 	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
-diff -rup icu/source/extra/uconv/pkgdata.inc.in icu/source/extra/uconv/pkgdata.inc.in
---- source/extra/uconv/pkgdata.inc.in	2007-12-12 13:57:20.000000000 -0500
-+++ source/extra/uconv/pkgdata.inc.in	2008-02-03 12:37:13.000000000 -0500
-@@ -55,8 +55,8 @@ platform=@platform@
- 
- ##### Add the following to source/config/Makefile.in
- 
--GENCCODE=$(BINDIR)/genccode
--GENCMN=$(BINDIR)/gencmn
--ICUPKG=$(BINDIR)/icupkg
-+GENCCODE=$(BINDIR)-host/genccode
-+GENCMN=$(BINDIR)-host/gencmn
-+ICUPKG=$(BINDIR)-host/icupkg
- 
- 
-diff -rup icu/source/icudefs.mk.in icu/source/icudefs.mk.in
---- source/icudefs.mk.in	2007-12-12 13:58:06.000000000 -0500
-+++ source/icudefs.mk.in	2008-02-03 12:37:47.000000000 -0500
-@@ -226,7 +226,7 @@ LIBICUTOOLUTIL= -L$(LIBDIR) -l$(STATIC_P
- LIBICUIO=       -L$(LIBDIR) -l$(STATIC_PREFIX_WHEN_USED)$(ICUPREFIX)$(IO_STUBNAME)$(ICULIBSUFFIX)$(SO_TARGET_VERSION_SUFFIX)
- 
- # Invoke, set library path for all ICU libraries.
--INVOKE = $(LDLIBRARYPATH_ENVVAR)=$(LIBRARY_PATH_PREFIX)$(LIBDIR):$(top_builddir)/stubdata:$(top_builddir)/tools/ctestfw:$$$(LDLIBRARYPATH_ENVVAR) $(LEAK_CHECKER)
-+INVOKE = $(LDLIBRARYPATH_ENVVAR)=$(LIBRARY_PATH_PREFIX)$(LIBDIR)-host:$(top_builddir)/stubdata:$(top_builddir)/tools/ctestfw:$$$(LDLIBRARYPATH_ENVVAR) $(LEAK_CHECKER)
- 
- # Platform-specific setup
- include @platform_make_fragment@
diff --git a/package/icu/icu-double-escape.patch b/package/icu/icu-double-escape.patch
new file mode 100644
index 0000000..06c70cc
--- /dev/null
+++ b/package/icu/icu-double-escape.patch
@@ -0,0 +1,17 @@
+We need to double-escape CC & CXX since we've got --sysroot and thus a space
+when cross-compiling.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura icu.orig/source/tools/icuinfo/Makefile.in icu/source/tools/icuinfo/Makefile.in
+--- icu.orig/source/tools/icuinfo/Makefile.in	2010-09-29 15:37:26.000000000 -0300
++++ icu/source/tools/icuinfo/Makefile.in	2010-12-21 13:36:45.393439756 -0300
+@@ -36,7 +36,7 @@
+ 
+ ICUINFO_OPTS=-i ../../data/out/build/$(ICUDATA_PLATFORM_NAME)
+ 
+-CPPFLAGS+=  -DU_PLATFORM=\"@platform@\"  -DU_BUILD=\"@build@\" -DU_HOST=\"@host@\" -DU_CC=\"@CC@\" -DU_CXX=\"@CXX@\"
++CPPFLAGS+=  -DU_PLATFORM=\"@platform@\"  -DU_BUILD=\"@build@\" -DU_HOST=\"@host@\" -DU_CC=\""@CC@\"" -DU_CXX=\""@CXX@\""
+ # -DENABLE_RELEASE=@ENABLE_RELEASE@ -DENABLE_DEBUG=@ENABLE_DEBUG@ "
+ 
+ 
diff --git a/package/icu/icu-overflow.patch b/package/icu/icu-overflow.patch
new file mode 100644
index 0000000..45beaa7
--- /dev/null
+++ b/package/icu/icu-overflow.patch
@@ -0,0 +1,93 @@
+
+A combination of issue & patches from...
+
+https://bugs.icu-project.org/trac/ticket/7680
+https://bugs.icu-project.org/trac/changeset/28002
+https://bugs.icu-project.org/trac/changeset/28124
+
+Enlarged buffers more since include files for pkgdata can grow
+significantly when cross-compiling.
+This ONLY affects building.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura icu.orig/source/tools/pkgdata/pkgdata.cpp icu/source/tools/pkgdata/pkgdata.cpp
+--- icu.orig/source/tools/pkgdata/pkgdata.cpp	2010-09-29 15:37:28.000000000 -0300
++++ icu/source/tools/pkgdata/pkgdata.cpp	2010-12-21 15:53:30.252554924 -0300
+@@ -97,8 +97,9 @@
+ #define PKGDATA_FILE_SEP_STRING U_FILE_SEP_STRING
+ #endif
+ 
+-#define LARGE_BUFFER_MAX_SIZE 2048
+-#define SMALL_BUFFER_MAX_SIZE 512
++#define LARGE_BUFFER_MAX_SIZE 8192
++#define MEDIUM_BUFFER_MAX_SIZE 4096
++#define SMALL_BUFFER_MAX_SIZE 2048
+ 
+ static void loadLists(UPKGOptions *o, UErrorCode *status);
+ 
+@@ -472,29 +473,48 @@
+ }
+ 
+ static int runCommand(const char* command, UBool specialHandling) {
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char *cmd = NULL;
++    char cmdBuffer[SMALL_BUFFER_MAX_SIZE];
++    int32_t len = strlen(command);
++
++    if (len == 0) {
++        return 0;
++    }
+ 
+     if (!specialHandling) {
++#if defined(USING_CYGWIN) || defined(OS400)
++#define CMD_PADDING_SIZE 20
++        if ((len + CMD_PADDING_SIZE) >= SMALL_BUFFER_MAX_SIZE) {
++            cmd = (char *)uprv_malloc(len + CMD_PADDING_SIZE);
++        } else {
++            cmd = cmdBuffer;
++        }
+ #ifdef USING_CYGWIN
+         sprintf(cmd, "bash -c \"%s\"", command);
+ 
+ #elif defined(OS400)
+         sprintf(cmd, "QSH CMD('%s')", command);
++#endif
+ #else
+         goto normal_command_mode;
+ #endif
+     } else {
+ normal_command_mode:
+-        sprintf(cmd, "%s", command);
++        cmd = (char *)command;
+     }
+-    
++
+     printf("pkgdata: %s\n", cmd);
+     int result = system(cmd);
+-    if (result != 0) { 
+-        printf("-- return status = %d\n", result); 
++    if (result != 0) {
++        printf("-- return status = %d\n", result);
++    }
++
++    if (cmd != cmdBuffer && cmd != command) {
++        uprv_free(cmd);
+     }
+-    return result; 
+-} 
++
++    return result;
++}
+ 
+ #define LN_CMD "ln -s"
+ #define RM_CMD "rm -f"
+@@ -586,7 +606,7 @@
+             pkgDataFlags = (char**)uprv_malloc(sizeof(char*) * PKGDATA_FLAGS_SIZE);
+             if (pkgDataFlags != NULL) {
+                 for (int32_t i = 0; i < PKGDATA_FLAGS_SIZE; i++) {
+-                    pkgDataFlags[i] = (char*)uprv_malloc(sizeof(char) * SMALL_BUFFER_MAX_SIZE);
++                    pkgDataFlags[i] = (char*)uprv_malloc(sizeof(char) * MEDIUM_BUFFER_MAX_SIZE);
+                     if (pkgDataFlags[i] != NULL) {
+                         pkgDataFlags[i][0] = 0;
+                     } else {
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7961b07..ffea1f1 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -1,77 +1,25 @@
 #############################################################
 #
-# ICU International Components for Unicode
+# International Components for Unicode
 #
 #############################################################
 
-ICU_VERSION:=4c-3_8_1
-ICU_SOURCE:=icu$(ICU_VERSION)-src.tgz
-ICU_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/icu
-ICU_CAT:=$(ZCAT)
-ICU_DIR:=$(BUILD_DIR)/icu/source
-ICU_HOST_DIR:=$(BUILD_DIR)/icu-host/source
-
-$(DL_DIR)/$(ICU_SOURCE):
-	 $(call DOWNLOAD,$(ICU_SITE),$(ICU_SOURCE))
-
-icu-source: $(DL_DIR)/$(ICU_SOURCE)
-
-$(ICU_DIR)/.unpacked: $(DL_DIR)/$(ICU_SOURCE)
-	$(ICU_CAT) $(DL_DIR)/$(ICU_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(ICU_DIR)
-	cp -a $(BUILD_DIR)/icu $(BUILD_DIR)/icu-host
-	toolchain/patch-kernel.sh $(ICU_DIR) package/icu/ \*.patch
-	toolchain/patch-kernel.sh $(ICU_HOST_DIR) package/icu/ \*both\*.patch
-	touch $(ICU_DIR)/.unpacked
-
-$(ICU_HOST_DIR)/.configured: $(ICU_DIR)/.unpacked
-	(cd $(ICU_HOST_DIR); ./configure $(QUIET) \
-		--prefix=/usr;);
-	touch $(ICU_HOST_DIR)/.configured
-
-$(ICU_DIR)/.configured: $(ICU_HOST_DIR)/.configured
-	(cd $(ICU_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CXX="$(TARGET_CXX)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-samples \
-	);
-	touch $(ICU_DIR)/.configured
-
-$(ICU_HOST_DIR)/.done: $(ICU_DIR)/.configured
-	$(MAKE1) -C $(ICU_HOST_DIR)
-	ln -s -f $(ICU_HOST_DIR)/bin $(ICU_DIR)/bin-host
-	ln -s -f $(ICU_HOST_DIR)/lib $(ICU_DIR)/lib-host
-	touch $(ICU_HOST_DIR)/.done
-
-$(ICU_DIR)/.done: $(ICU_HOST_DIR)/.done
-	$(MAKE1) -C $(ICU_DIR)
-	$(MAKE) -C $(ICU_DIR) install DESTDIR=$(STAGING_DIR)
-	$(MAKE) -C $(ICU_DIR) install DESTDIR=$(TARGET_DIR)
+ICU_VERSION = 4.4.2
+ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
+ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
+ICU_DEPENDENCIES = host-icu
+ICU_INSTALL_STAGING = YES
+ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
+		--disable-tests
+HOST_ICU_CONF_OPT = --disable-samples --disable-tests
+ICU_SUBDIR = source
+HOST_ICU_SUBDIR = source
+
+define ICU_PREFIX_FIXUP
 	$(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/icu-config
-	touch $(ICU_DIR)/.done
+endef
 
-icu: $(ICU_DIR)/.done
+ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
 
-icu-clean:
-	rm -f $(TARGET_DIR)/bin/icu
-	-$(MAKE) -C $(ICU_DIR) clean
-
-icu-dirclean:
-	rm -rf $(ICU_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ICU),y)
-TARGETS+=icu
-endif
+$(eval $(call AUTOTARGETS,package,icu))
+$(eval $(call AUTOTARGETS,package,icu,host))
-- 
1.7.2.2
