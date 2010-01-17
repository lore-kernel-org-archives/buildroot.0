From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 17 Jan 2010 23:40:59 +0100
Subject: [Buildroot] [PATCH 11/15] Rework icu package on top of the generic
	infrastructure
In-Reply-To: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
References: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1263768063-24133-12-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This patch is based on a previous attempt by Thomas Petazzoni.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 ...icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch |   77 +++
 .../icu/icu-4c-3_8_1-fix-cross-compilation.patch   |  400 ++++++++++++
 package/icu/icu-4c-3_8_1-lsupc++.patch             |   24 +-
 package/icu/icu-config                             |  684 ++++++++++++++++++++
 package/icu/icu-cross-compile.patch                |  314 ---------
 package/icu/icu.mk                                 |  111 ++--
 6 files changed, 1231 insertions(+), 379 deletions(-)
 create mode 100644 package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch
 create mode 100644 package/icu/icu-4c-3_8_1-fix-cross-compilation.patch
 create mode 100755 package/icu/icu-config
 delete mode 100644 package/icu/icu-cross-compile.patch

diff --git a/package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch b/package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch
new file mode 100644
index 0000000..8c88f1c
--- /dev/null
+++ b/package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch
@@ -0,0 +1,77 @@
+From b515227d0ca1ca61e033645cd2a99e829574c31a Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Tue, 5 Jan 2010 16:24:57 +0100
+Subject: [PATCH] icu: fix compilation with gcc 4.4
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ source/layoutex/ParagraphLayout.cpp |   14 +++++++-------
+ 1 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/source/layoutex/ParagraphLayout.cpp b/source/layoutex/ParagraphLayout.cpp
+index 5b07e54..62c794b 100644
+--- a/source/layoutex/ParagraphLayout.cpp
++++ b/source/layoutex/ParagraphLayout.cpp
+@@ -326,12 +326,12 @@ ParagraphLayout::ParagraphLayout(const LEUnicode chars[], le_int32 count,
+     le_int32  styleCount = sizeof styleRunArrays / sizeof styleRunArrays[0];
+     StyleRuns styleRuns(styleRunArrays, styleCount);
+     LEErrorCode layoutStatus = LE_NO_ERROR;
+-    
++
+     fStyleRunCount = styleRuns.getRuns(NULL, NULL);
+ 
+     fStyleRunLimits = LE_NEW_ARRAY(le_int32, fStyleRunCount);
+     fStyleIndices   = LE_NEW_ARRAY(le_int32, fStyleRunCount * styleCount);
+-    
++
+     styleRuns.getRuns(fStyleRunLimits, fStyleIndices);
+ 
+     // now build a LayoutEngine for each style run...
+@@ -362,7 +362,7 @@ ParagraphLayout::ParagraphLayout(const LEUnicode chars[], le_int32 count,
+     }
+ 
+     // Make big arrays for the glyph widths, glyph-to-char and char-to-glyph maps,
+-    // in logical order. (Both maps need an extra entry for the end of the text.) 
++    // in logical order. (Both maps need an extra entry for the end of the text.)
+     //
+     // For each layout get the positions and convert them into glyph widths, in
+     // logical order. Get the glyph-to-char mapping, offset by starting index in the
+@@ -509,7 +509,7 @@ ParagraphLayout::~ParagraphLayout()
+     }
+ }
+ 
+-    
++
+ le_bool ParagraphLayout::isComplex(const LEUnicode chars[], le_int32 count)
+ {
+     UErrorCode scriptStatus = U_ZERO_ERROR;
+@@ -813,7 +813,7 @@ le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
+ 
+     return nullLanguageCode;
+ }
+-#elif
++#else
+ 
+ // TODO - dummy implementation for right now...
+ le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
+@@ -943,7 +943,7 @@ void ParagraphLayout::appendRun(ParagraphLayout::Line *line, le_int32 run, le_in
+     // previous run, even though this glyph may be in the middle of the
+     // run.
+     fVisualRunLastX -= fStyleRunInfo[run].positions[leftGlyph * 2];
+- 
++
+     // Make rightGlyph be the glyph just to the right of
+     // the run's glyphs
+     rightGlyph += 1;
+@@ -1057,7 +1057,7 @@ le_int32 ParagraphLayout::Line::getWidth() const
+ 
+     le_int32 glyphCount = lastRun->getGlyphCount();
+     const float *positions = lastRun->getPositions();
+-    
++
+     return (le_int32) positions[glyphCount * 2];
+ }
+ 
+-- 
+1.6.5.7
+
diff --git a/package/icu/icu-4c-3_8_1-fix-cross-compilation.patch b/package/icu/icu-4c-3_8_1-fix-cross-compilation.patch
new file mode 100644
index 0000000..8b1cd49
--- /dev/null
+++ b/package/icu/icu-4c-3_8_1-fix-cross-compilation.patch
@@ -0,0 +1,400 @@
+From 4cdb6a3cad77236f8d74d2ba18f9d559c82a5353 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Fri, 8 Jan 2010 16:58:37 +0100
+Subject: [PATCH] Fix cross compilation
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ source/config/Makefile.inc.in       |   10 +++---
+ source/data/Makefile.in             |   60 +++++++++++++++++-----------------
+ source/data/icupkg.inc              |    6 ++--
+ source/data/icupkg.inc.in           |    6 ++--
+ source/extra/uconv/Makefile.in      |    8 ++--
+ source/extra/uconv/pkgdata.inc.in   |    6 ++--
+ source/test/testdata/Makefile.in    |   20 ++++++------
+ source/test/testdata/pkgdata.inc.in |    4 +-
+ 8 files changed, 60 insertions(+), 60 deletions(-)
+
+diff --git a/source/config/Makefile.inc.in b/source/config/Makefile.inc.in
+index 02d2205..71618fe 100644
+--- a/source/config/Makefile.inc.in
++++ b/source/config/Makefile.inc.in
+@@ -135,11 +135,11 @@ MIDDLE_SO_TARGET = $(SO_TARGET).$(SO_TARGET_VERSION_MAJOR)
+ # Access to important ICU tools.
+ # Use as follows:  $(INVOKE) $(GENRB) arguments .. 
+ INVOKE = $(LDLIBRARYPATH_ENVVAR)=$(libdir):$$$(LDLIBRARYPATH_ENVVAR) $(LEAK_CHECKER)
+-GENCCODE = $(sbindir)/genccode
+-ICUPKG   = $(sbindir)/icupkg
+-GENCMN   = $(sbindir)/gencmn
+-GENRB    = $(bindir)/genrb
+-PKGDATA  = $(bindir)/pkgdata
++GENCCODE = $(BINDIR)-host/genccode
++ICUPKG   = $(BINDIR)-host/icupkg
++GENCMN   = $(BINDIR)-host/gencmn
++GENRB    = $(BINDIR)-host/genrb
++PKGDATA  = $(BINDIR)-host/pkgdata
+ 
+ ##################################################################
+ ##################################################################
+diff --git a/source/data/Makefile.in b/source/data/Makefile.in
+index 9abc94b..3395f52 100644
+--- a/source/data/Makefile.in
++++ b/source/data/Makefile.in
+@@ -36,7 +36,7 @@ ICUPKGDATA_OUTDIR = $(OUTDIR)
+ endif
+ 
+ CURDIR:=$(CURR_FULL_DIR)
+-PKGDATA = $(BINDIR)/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME) -d $(ICUPKGDATA_OUTDIR) -M'PKGDATA_LDFLAGS="$(LDFLAGSICUDT)"'
++PKGDATA = $(BINDIR)-host/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME) -d $(ICUPKGDATA_OUTDIR) -M'PKGDATA_LDFLAGS="$(LDFLAGSICUDT)"'
+ 
+ ifeq ($(OS390_STUBDATA),1)
+ OS390PKG=package390
+@@ -133,7 +133,7 @@ ICUDATA_ARCHIVE = $(firstword $(wildcard $(srcdir)/in/$(ICUDATA_BASENAME_VERSION
+ ifneq ($(ICUDATA_ARCHIVE),)
+ ICUDATA_SOURCE_ARCHIVE = $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
+ $(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
+-	$(INVOKE) $(BINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
++	$(INVOKE) $(BINDIR)-host/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
+ endif
+ else
+ ifneq ($(ENABLE_STATIC),YES)
+@@ -349,7 +349,7 @@ $(PKGDATA_LIST): $(SRCLISTDEPS) $(ICUDATA_SOURCE_ARCHIVE)
+ ifneq ($(ICUDATA_SOURCE_IS_NATIVE_TARGET),YES)
+ 	@echo "Unpacking $(ICUDATA_SOURCE_ARCHIVE) and generating $@ (list of data files)"
+ 	@-$(RMV) $@
+-	$(INVOKE) $(BINDIR)/icupkg -d $(BUILDDIR) --list -x \* $(ICUDATA_SOURCE_ARCHIVE) > $@
++	$(INVOKE) $(BINDIR)-host/icupkg -d $(BUILDDIR) --list -x \* $(ICUDATA_SOURCE_ARCHIVE) > $@
+ else
+ 	@echo "$@" > $@
+ endif
+@@ -378,45 +378,45 @@ endif
+ 
+ # uprops.icu
+ $(BUILDDIR)/uprops.icu: $(UNICODEDATADIR)/UnicodeData.txt $(UNICODEDATADIR)/BidiMirroring.txt $(BINDIR)/genprops$(EXEEXT) $(BUILDDIR)/$(ICUDT)pnames.icu
+-	$(INVOKE) $(BINDIR)/genprops -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
+-	$(INVOKE) $(BINDIR)/genprops --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/genprops -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/genprops --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
+ 
+ # ubidi.icu
+ $(BUILDDIR)/ubidi.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)/genbidi$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genbidi -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
+-	$(INVOKE) $(BINDIR)/genbidi --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/genbidi -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/genbidi --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
+ 
+ # ucase.icu
+ $(BUILDDIR)/ucase.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)/gencase$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/gencase -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
+-	$(INVOKE) $(BINDIR)/gencase --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/gencase -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/gencase --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
+ 
+ # pnames.icu
+ $(BUILDDIR)/pnames.icu: $(UNICODEDATADIR)/PropertyAliases.txt $(UNICODEDATADIR)/PropertyValueAliases.txt $(UNICODEDATADIR)/Blocks.txt $(COMINCDIR)/uscript.h $(COMINCDIR)/uchar.h $(BINDIR)/genpname$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genpname -d $(BUILDDIR)
++	$(INVOKE) $(BINDIR)-host/genpname -d $(BUILDDIR)
+ 
+ # unorm.icu
+ $(BUILDDIR)/unorm.icu: $(UNICODEDATADIR)/UnicodeData.txt $(UNICODEDATADIR)/DerivedNormalizationProps.txt $(UNICODEDATADIR)/BidiMirroring.txt $(BINDIR)/gennorm$(EXEEXT) $(BUILDDIR)/$(ICUDT)pnames.icu $(BUILDDIR)/$(ICUDT)uprops.icu $(BUILDDIR)/$(ICUDT)ucase.icu
+-	$(INVOKE) $(BINDIR)/gennorm -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
+-	$(INVOKE) $(BINDIR)/gennorm --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/gennorm -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(BUILDDIR) -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/gennorm --csource -s $(UNICODEDATADIR) -i $(BUILDDIR) -d $(OUTTMPDIR) -u $(UNICODE_VERSION)
+ 
+ # ucadata.icu
+ # used to depend on $(BUILDDIR)/$(ICUDT)unorm.icu $(BUILDDIR)/$(ICUDT)ucase.icu
+ # see Jitterbug 4497
+ $(BUILDDIR)/ucadata.icu $(BUILDDIR)/$(ICUDT)invuca.icu: $(UNICODEDATADIR)/FractionalUCA.txt $(BINDIR)/genuca$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genuca -s $(UNICODEDATADIR) -d $(BUILDDIR) -i $(BUILDDIR) 
++	$(INVOKE) $(BINDIR)-host/genuca -s $(UNICODEDATADIR) -d $(BUILDDIR) -i $(BUILDDIR) 
+ 
+ # unames.icu
+ $(BUILDDIR)/unames.icu: $(UNICODEDATADIR)/UnicodeData.txt $(BINDIR)/gennames$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/gennames -1 -d $(BUILDDIR) $(UNICODEDATADIR)/UnicodeData.txt -u $(UNICODE_VERSION)
++	$(INVOKE) $(BINDIR)-host/gennames -1 -d $(BUILDDIR) $(UNICODEDATADIR)/UnicodeData.txt -u $(UNICODE_VERSION)
+ 
+ # cnvalias.icu
+ $(BUILDDIR)/cnvalias.icu: $(UCMSRCDIR)/convrtrs.txt $(BINDIR)/gencnval$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/gencnval -d $(BUILDDIR) $(UCMSRCDIR)/convrtrs.txt
++	$(INVOKE) $(BINDIR)-host/gencnval -d $(BUILDDIR) $(UCMSRCDIR)/convrtrs.txt
+ 
+ # uidna.spp
+ $(BUILDDIR)/uidna.spp: $(MISCSRCDIR)/NamePrepProfile.txt $(BINDIR)/gensprep$(EXEEXT) $(BUILDDIR)/unames.icu $(BUILDDIR)/pnames.icu
+-	$(INVOKE) $(BINDIR)/gensprep -d $(BUILDDIR) -i $(BUILDDIR) -s $(MISCSRCDIR) -b uidna -n $(UNICODEDATADIR) -u 3.2.0 -k NamePrepProfile.txt
++	$(INVOKE) $(BINDIR)-host/gensprep -d $(BUILDDIR) -i $(BUILDDIR) -s $(MISCSRCDIR) -b uidna -n $(UNICODEDATADIR) -u 3.2.0 -k NamePrepProfile.txt
+ 
+ ####################################################    BRK
+ # BRK FILES
+@@ -425,28 +425,28 @@ $(BUILDDIR)/uidna.spp: $(MISCSRCDIR)/NamePrepProfile.txt $(BINDIR)/gensprep$(EXE
+ #	$(RMV) $@ && ln -s $(BUILDDIR) $@
+ 
+ $(BRKBLDDIR)/%.brk: $(BRKSRCDIR)/%.txt $(BINDIR)/genbrk$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genbrk -c -i $(BUILDDIR) -r $< -o $@
++	$(INVOKE) $(BINDIR)-host/genbrk -c -i $(BUILDDIR) -r $< -o $@
+ 
+ ####################################################    CTD
+ # CTD FILES
+ 
+ $(BRKBLDDIR)/%.ctd: $(BRKSRCDIR)/%.txt $(BINDIR)/genctd$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genctd -c -i $(BUILDDIR) -o $@ $<
++	$(INVOKE) $(BINDIR)-host/genctd -c -i $(BUILDDIR) -o $@ $<
+ 
+ ####################################################    CNV
+ # CNV FILES
+ $(BUILDDIR)/%.cnv: $(UCMSRCDIR)/%.ucm $(BINDIR)/makeconv$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/makeconv -c -d $(BUILDDIR) $(UCMSRCDIR)/$(<F)
++	$(INVOKE) $(BINDIR)-host/makeconv -c -d $(BUILDDIR) $(UCMSRCDIR)/$(<F)
+ 
+ ####################################################    RES
+ # RES FILES
+ 
+ ### collation res
+ $(COLBLDDIR)/%.res: $(COLSRCDIR)/%.txt  $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(COLSRCDIR) -d $(COLBLDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(COLSRCDIR) -d $(COLBLDDIR) $(<F)
+ 
+ $(COLBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(COLLATION_TREE)/$(INDEX_NAME).txt $(BINDIR)/genrb$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(COLLATION_TREE) -d $(COLBLDDIR) $(INDEX_NAME).txt
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(COLLATION_TREE) -d $(COLBLDDIR) $(INDEX_NAME).txt
+ 
+ $(COLLATION_INDEX_FILE): $(SRCLISTDEPS)
+ 	@echo "generating $@ (list of installed collation locales)"; \
+@@ -462,10 +462,10 @@ $(COLLATION_INDEX_FILE): $(SRCLISTDEPS)
+ 
+ ### brk res
+ $(BRKBLDDIR)/%.res: $(BRKSRCDIR)/%.txt $(BINDIR)/genrb$(EXEEXT) $(BRK_FILES) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(BRKSRCDIR) -d $(BRKBLDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(BRKSRCDIR) -d $(BRKBLDDIR) $(<F)
+ 
+ $(BRKBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(BREAK_TREE)/$(INDEX_NAME).txt $(BINDIR)/genrb$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(BREAK_TREE) -d $(BRKBLDDIR) $(INDEX_NAME).txt
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(BREAK_TREE) -d $(BRKBLDDIR) $(INDEX_NAME).txt
+ 
+ $(BRK_RES_INDEX_FILE): $(SRCLISTDEPS)
+ 	@echo "generating $@ (list of installed break locales)"; \
+@@ -481,10 +481,10 @@ $(BRK_RES_INDEX_FILE): $(SRCLISTDEPS)
+ 
+ ### RBNF res
+ $(RBNFBLDDIR)/%.res: $(RBNFSRCDIR)/%.txt  $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(RBNFSRCDIR) -d $(RBNFBLDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(RBNFSRCDIR) -d $(RBNFBLDDIR) $(<F)
+ 
+ $(RBNFBLDDIR)/$(INDEX_NAME).res: $(OUTTMPDIR)/$(RBNF_TREE)/$(INDEX_NAME).txt $(BINDIR)/genrb$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(RBNF_TREE) -d $(RBNFBLDDIR) $(INDEX_NAME).txt
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(OUTTMPDIR)/$(RBNF_TREE) -d $(RBNFBLDDIR) $(INDEX_NAME).txt
+ 
+ $(RBNF_INDEX_FILE): $(SRCLISTDEPS)
+ 	@echo "generating $@ (list of installed RBNF locales)"; \
+@@ -500,13 +500,13 @@ $(RBNF_INDEX_FILE): $(SRCLISTDEPS)
+ 
+ ### TRANSLIT res
+ $(TRANSLITBLDDIR)/%.res: $(TRANSLITSRCDIR)/%.txt  $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(TRANSLITSRCDIR) -d $(TRANSLITBLDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(TRANSLITSRCDIR) -d $(TRANSLITBLDDIR) $(<F)
+   
+ ### normal (locale) res
+ all-RES:  $(RES_FILES)
+ 
+ $(BUILDDIR)/%.res: $(LOCSRCDIR)/%.txt $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(LOCSRCDIR) -d $(BUILDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -s $(LOCSRCDIR) -d $(BUILDDIR) $(<F)
+ 
+ # if the tzcode directory contains a new tzdata*.tar.gz file, use it for zoneinfo.txt
+ TZDATA = $(firstword $(wildcard $(top_builddir)/tools/tzcode/tzdata*.tar.gz) $(wildcard $(top_srcdir)/tools/tzcode/tzdata*.tar.gz))
+@@ -520,7 +520,7 @@ ZONEINFO=$(TZCODE_DIR)/zoneinfo.txt
+ # icu/source/tools/tzcode/zoneinfo.txt
+ $(BUILDDIR)/zoneinfo.res: $(ZONEINFO) $(BINDIR)/genrb$(EXEEXT)
+ 	@echo Note: $(MISCSRCDIR)/zoneinfo.txt is IGNORED because $(TZDATA) is present.
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -d $(BUILDDIR) $(ZONEINFO)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -d $(BUILDDIR) $(ZONEINFO)
+ 
+ # Create the tzcode tool and zoneinfo.txt as needed.
+ $(ZONEINFO): $(TZDATA)
+@@ -532,7 +532,7 @@ endif
+ 
+ # zoneinfo has some issues. Ignore some warnings with -q
+ $(BUILDDIR)/%.res: $(MISCSRCDIR)/%.txt $(BINDIR)/genrb$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -s $(MISCSRCDIR) -d $(BUILDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -q -i $(BUILDDIR) -s $(MISCSRCDIR) -d $(BUILDDIR) $(<F)
+ 
+ 
+ 
+@@ -553,7 +553,7 @@ clean-resindex:
+ 	-$(RMV) $(BUILDDIR)/$(INDEX_NAME).txt $(PKGDATA_LIST)
+ 
+ $(INDEX_RES_FILE): $(INDEX_FILE) $(BINDIR)/genrb$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -i $(BUILDDIR) -d $(BUILDDIR) $(INDEX_FILE)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -i $(BUILDDIR) -d $(BUILDDIR) $(INDEX_FILE)
+ 
+ # Starting with ICU4C 3.4, the core Unicode properties files (uprops.icu, ucase.icu, ubidi.icu, unorm.icu)
+ # are hardcoded in the common DLL and therefore not included in the data package any more.
+diff --git a/source/data/icupkg.inc b/source/data/icupkg.inc
+index ccae469..40ccf9b 100644
+--- a/source/data/icupkg.inc
++++ b/source/data/icupkg.inc
+@@ -49,8 +49,8 @@ U_IS_BIG_ENDIAN=0
+ 
+ ##### Add the following to source/config/Makefile.in
+ 
+-GENCCODE=$(BINDIR)/genccode
+-GENCMN=$(BINDIR)/gencmn
+-ICUPKG=$(BINDIR)/icupkg
++GENCCODE=$(BINDIR)-host/genccode
++GENCMN=$(BINDIR)-host/gencmn
++ICUPKG=$(BINDIR)-host/icupkg
+ 
+ 
+diff --git a/source/data/icupkg.inc.in b/source/data/icupkg.inc.in
+index c76790a..6a2aa70 100644
+--- a/source/data/icupkg.inc.in
++++ b/source/data/icupkg.inc.in
+@@ -49,8 +49,8 @@ U_IS_BIG_ENDIAN=@U_IS_BIG_ENDIAN@
+ 
+ ##### Add the following to source/config/Makefile.in
+ 
+-GENCCODE=$(BINDIR)/genccode
+-GENCMN=$(BINDIR)/gencmn
+-ICUPKG=$(BINDIR)/icupkg
++GENCCODE=$(BINDIR)-host/genccode
++GENCMN=$(BINDIR)-host/gencmn
++ICUPKG=$(BINDIR)-host/icupkg
+ 
+ 
+diff --git a/source/extra/uconv/Makefile.in b/source/extra/uconv/Makefile.in
+index de6ed18..65e0e42 100644
+--- a/source/extra/uconv/Makefile.in
++++ b/source/extra/uconv/Makefile.in
+@@ -106,7 +106,7 @@ clean-local: resclean
+ 	$(RMV) $(OBJECTS) $(TARGET)
+ 
+ resclean:
+-	@#-$(INVOKE) $(BINDIR)/pkgdata --clean -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
++	@#-$(INVOKE) $(BINDIR)-host/pkgdata --clean -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
+ 	$(RMV) pkgdata.inc $(RESDIR)
+ 
+ distclean-local: clean-local
+@@ -138,7 +138,7 @@ endif
+ 
+ 
+ package-resfiles: $(RESDIR)/$(RESDIR).lst pkgdata.inc
+-	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(BINDIR)/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
++	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(BINDIR)-host/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
+ 
+ $(RESDIR)/$(RESDIR).lst: Makefile $(srcdir)/resfiles.mk
+ 	@$(MKINSTALLDIRS) $(RESDIR)
+@@ -151,7 +151,7 @@ $(RESDIR)/$(RESDIR).lst: Makefile $(srcdir)/resfiles.mk
+ ifneq ($(UCONVMSG_MODE),static)
+ install-resfiles: $(RESFILES)
+ 	$(MKINSTALLDIRS) $(DESTDIR)$(ICUDATA_DIR)
+-	$(INVOKE) $(BINDIR)/pkgdata -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -I $(INSTALLTO) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
++	$(INVOKE) $(BINDIR)-host/pkgdata -p $(RESDIR) -O pkgdata.inc -m $(PKGMODE) -d $(RESDIR) -I $(INSTALLTO) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
+ else
+ install-resfiles:
+ endif
+@@ -161,7 +161,7 @@ $(UCONVMSG_LIB): resfiles
+ 
+ $(MSGNAME)/%.res: $(srcdir)/$(RESOURCESDIR)/%.txt
+ 	$(MKINSTALLDIRS) $(@D)
+-	$(INVOKE) $(BINDIR)/genrb -e UTF-8 -s $(^D) -d $(@D) $(^F)
++	$(INVOKE) $(BINDIR)-host/genrb -e UTF-8 -s $(^D) -d $(@D) $(^F)
+ 
+ install-man: $(ALL_MAN_FILES)
+ 	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
+diff --git a/source/extra/uconv/pkgdata.inc.in b/source/extra/uconv/pkgdata.inc.in
+index 8ce5c21..45765b7 100644
+--- a/source/extra/uconv/pkgdata.inc.in
++++ b/source/extra/uconv/pkgdata.inc.in
+@@ -55,8 +55,8 @@ platform=@platform@
+ 
+ ##### Add the following to source/config/Makefile.in
+ 
+-GENCCODE=$(BINDIR)/genccode
+-GENCMN=$(BINDIR)/gencmn
+-ICUPKG=$(BINDIR)/icupkg
++GENCCODE=$(BINDIR)-host/genccode
++GENCMN=$(BINDIR)-host/gencmn
++ICUPKG=$(BINDIR)-host/icupkg
+ 
+ 
+diff --git a/source/test/testdata/Makefile.in b/source/test/testdata/Makefile.in
+index 657c770..dcf1769 100644
+--- a/source/test/testdata/Makefile.in
++++ b/source/test/testdata/Makefile.in
+@@ -99,7 +99,7 @@ ICU_DATA_OPT = -i $(BUILDDIR)
+ endif
+ endif
+ 
+-PKGDATA = $(BINDIR)/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME)
++PKGDATA = $(BINDIR)-host/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME)
+ PKGDATA_INVOKE:=$(INVOKE) $(PKGDATA_INVOKE_OPTS)
+ 
+ # Contains all 'intermediate' files (and temp files) except for 'unpackaged data' below
+@@ -158,42 +158,42 @@ $(JAVA_OUT_DIR)/DebugUtilitiesData.java:  $(TOOLDIR)/gentest/gentest$(EXEEXT)
+ 
+ 
+ $(TESTBUILDDIR)/testtable32.res: $(TESTBUILDDIR)/testtable32.txt $(BINDIR)/genrb$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -s $(TESTBUILDDIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -s $(TESTBUILDDIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) $(<F)
+ 
+ # Targets for nfscsi.spp
+ $(TESTBUILDDIR)/nfscsi.spp: $(BINDIR)/gensprep$(EXEEXT) $(TESTSRCDATADIR)/nfs4_cs_prep_ci.txt
+ 	@echo Building nfscsi.icu
+-	$(INVOKE) $(BINDIR)/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfscsi -u 3.2.0 nfs4_cs_prep_ci.txt
++	$(INVOKE) $(BINDIR)-host/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfscsi -u 3.2.0 nfs4_cs_prep_ci.txt
+ 
+ # Targets for nfscss.spp
+ $(TESTBUILDDIR)/nfscss.spp: $(BINDIR)/gensprep$(EXEEXT) $(TESTSRCDATADIR)/nfs4_cs_prep_cs.txt
+ 	@echo Building nfscss.icu
+-	$(INVOKE) $(BINDIR)/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfscss -u 3.2.0 nfs4_cs_prep_cs.txt
++	$(INVOKE) $(BINDIR)-host/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfscss -u 3.2.0 nfs4_cs_prep_cs.txt
+ 
+ # Targets for nfscis.spp
+ $(TESTBUILDDIR)/nfscis.spp: $(BINDIR)/gensprep$(EXEEXT) $(TESTSRCDATADIR)/nfs4_cis_prep.txt
+ 	@echo Building nfscis.spp
+-	$(INVOKE) $(BINDIR)/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfscis -k -n $(UNICODEDATADIR) -u 3.2.0 nfs4_cis_prep.txt
++	$(INVOKE) $(BINDIR)-host/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfscis -k -n $(UNICODEDATADIR) -u 3.2.0 nfs4_cis_prep.txt
+ 
+ # Targets for nfsmxs.spp
+ $(TESTBUILDDIR)/nfsmxs.spp: $(BINDIR)/gensprep$(EXEEXT) $(TESTSRCDATADIR)/nfs4_mixed_prep_s.txt
+ 	@echo Building nfsmxs.spp
+-	$(INVOKE) $(BINDIR)/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfsmxs -k -n $(UNICODEDATADIR) -u 3.2.0 nfs4_mixed_prep_s.txt
++	$(INVOKE) $(BINDIR)-host/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfsmxs -k -n $(UNICODEDATADIR) -u 3.2.0 nfs4_mixed_prep_s.txt
+ 
+ # Targets for nfsmxp.spp
+ $(TESTBUILDDIR)/nfsmxp.spp: $(BINDIR)/gensprep$(EXEEXT) $(TESTSRCDATADIR)/nfs4_mixed_prep_p.txt
+ 	@echo Building nfsmxp.spp
+-	$(INVOKE) $(BINDIR)/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfsmxp -k -n $(UNICODEDATADIR) -u 3.2.0 nfs4_mixed_prep_p.txt
++	$(INVOKE) $(BINDIR)-host/gensprep -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) -b nfsmxp -k -n $(UNICODEDATADIR) -u 3.2.0 nfs4_mixed_prep_p.txt
+ 
+ $(TESTBUILDDIR)/%.cnv: $(TESTSRCDATADIR)/%.ucm $(BINDIR)/makeconv$(EXEEXT)
+-	$(INVOKE) $(BINDIR)/makeconv -c -d $(TESTBUILDDIR) $(TESTSRCDATADIR)/$(<F)
++	$(INVOKE) $(BINDIR)-host/makeconv -c -d $(TESTBUILDDIR) $(TESTSRCDATADIR)/$(<F)
+ 
+ $(TESTBUILDDIR)/%.res: $(TESTSRCDATADIR)/%.txt $(BINDIR)/genrb$(EXEEXT) $(DAT_FILES)
+-	$(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -q -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) $(<F)
++	$(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -q -s $(TESTSRCDATADIR) $(ICU_DATA_OPT) -d $(TESTBUILDDIR) $(<F)
+ 
+ $(TESTBUILDDIR)/iscii.res:  $(TESTSRCDATADIR)/iscii.bin $(BINDIR)/genrb$(EXEEXT)
+ 	@echo Testing genrb -e option
+-	@ICU_DATA=$(BUILDDIR) $(INVOKE) $(BINDIR)/genrb $(GENRBOPTS) -s $(TESTSRCDATADIR) -eISCII,version=0 -d $(TESTBUILDDIR) $(<F) >/dev/null  || ( echo "WARNING: could not open ISCII - it may have been disabled." | tee $@ )
++	@ICU_DATA=$(BUILDDIR) $(INVOKE) $(BINDIR)-host/genrb $(GENRBOPTS) -s $(TESTSRCDATADIR) -eISCII,version=0 -d $(TESTBUILDDIR) $(<F) >/dev/null  || ( echo "WARNING: could not open ISCII - it may have been disabled." | tee $@ )
+ 	@echo Finished testing genrb -e option
+ 
+ ################################################################### TYP
+diff --git a/source/test/testdata/pkgdata.inc.in b/source/test/testdata/pkgdata.inc.in
+index 40cc60f..bac0834 100644
+--- a/source/test/testdata/pkgdata.inc.in
++++ b/source/test/testdata/pkgdata.inc.in
+@@ -15,6 +15,6 @@ include $(top_builddir)/icudefs.mk
+ 
+ ##### Add the following to source/config/Makefile.in
+ 
+-GENCCODE=$(BINDIR)/genccode
+-ICUPKG=$(BINDIR)/icupkg
++GENCCODE=$(BINDIR)-host/genccode
++ICUPKG=$(BINDIR)-host/icupkg
+ 
+-- 
+1.6.5.7
+
diff --git a/package/icu/icu-4c-3_8_1-lsupc++.patch b/package/icu/icu-4c-3_8_1-lsupc++.patch
index 891ddce..8f5d72b 100644
--- a/package/icu/icu-4c-3_8_1-lsupc++.patch
+++ b/package/icu/icu-4c-3_8_1-lsupc++.patch
@@ -1,5 +1,5 @@
---- source/tools/genccode/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/genccode/Makefile.in	2008-02-07 14:37:56.000000000 -0500
+--- a/source/tools/genccode/Makefile.in	2007-12-12 13:57:28.000000000 -0500
++++ b/source/tools/genccode/Makefile.in	2008-02-07 14:37:56.000000000 -0500
 @@ -31,7 +31,7 @@ ifneq ($(top_builddir),$(top_srcdir))
  CPPFLAGS += -I$(top_builddir)/common
  endif
@@ -9,8 +9,8 @@
  
  OBJECTS = genccode.o
  
---- source/tools/gencmn/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/gencmn/Makefile.in	2008-02-07 14:37:56.000000000 -0500
+--- a/source/tools/gencmn/Makefile.in	2007-12-12 13:57:28.000000000 -0500
++++ b/source/tools/gencmn/Makefile.in	2008-02-07 14:37:56.000000000 -0500
 @@ -31,7 +31,7 @@ ifneq ($(top_builddir),$(top_srcdir))
  CPPFLAGS += -I$(top_builddir)/common
  endif
@@ -20,8 +20,8 @@
  
  OBJECTS = gencmn.o
 
---- source/tools/genrb/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/genrb/Makefile.in	2008-02-07 14:37:56.000000000 -0500
+--- a/source/tools/genrb/Makefile.in	2007-12-12 13:57:28.000000000 -0500
++++ b/source/tools/genrb/Makefile.in	2008-02-07 14:37:56.000000000 -0500
 @@ -55,7 +55,7 @@ ifneq ($(top_builddir),$(top_srcdir))
  CPPFLAGS += -I$(top_builddir)/common
  endif
@@ -32,8 +32,8 @@
  OBJECTS = errmsg.o genrb.o parse.o read.o reslist.o ustr.o rbutil.o \
  wrtjava.o rle.o wrtxml.o prscmnts.o
 
---- source/tools/pkgdata/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/tools/pkgdata/Makefile.in	2008-02-07 14:37:56.000000000 -0500
+--- a/source/tools/pkgdata/Makefile.in	2007-12-12 13:57:28.000000000 -0500
++++ b/source/tools/pkgdata/Makefile.in	2008-02-07 14:37:56.000000000 -0500
 @@ -35,7 +35,7 @@ CPPFLAGS += -I$(top_builddir)/common
  endif
  CPPFLAGS += -I$(top_srcdir)/common -I$(srcdir)/../toolutil
@@ -43,8 +43,8 @@
  
  OBJECTS = pkgdata.o pkgtypes.o make.o dllmode.o cmnmode.o filemode.o sttcmode.o winmode.o
  
---- source/samples/date/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/samples/date/Makefile.in	2008-02-07 14:37:56.000000000 -0500
+--- a/source/samples/date/Makefile.in	2007-12-12 13:57:28.000000000 -0500
++++ b/source/samples/date/Makefile.in	2008-02-07 14:37:56.000000000 -0500
 @@ -21,7 +21,7 @@ CLEANFILES = *~ $(DEPS)
  TARGET = icudate$(EXEEXT)
  
@@ -54,8 +54,8 @@
  
  OBJECTS = uprint.o date.o
  
---- source/samples/cal/Makefile.in	2007-12-12 13:57:28.000000000 -0500
-+++ source/samples/cal/Makefile.in	2008-02-07 14:37:56.000000000 -0500
+--- a/source/samples/cal/Makefile.in	2007-12-12 13:57:28.000000000 -0500
++++ b/source/samples/cal/Makefile.in	2008-02-07 14:37:56.000000000 -0500
 @@ -21,7 +21,7 @@ CLEANFILES = *~ $(DEPS)
  TARGET = icucal$(EXEEXT)
  
diff --git a/package/icu/icu-config b/package/icu/icu-config
new file mode 100755
index 0000000..d6da4fc
--- /dev/null
+++ b/package/icu/icu-config
@@ -0,0 +1,684 @@
+#!/bin/sh
+## -*-sh-*-
+#set -x
+# BEGIN of icu-config-top
+#******************************************************************************
+#   Copyright (C) 1999-2004, International Business Machines
+#   Corporation and others.  All Rights Reserved.
+#******************************************************************************
+# This script is designed to aid configuration of ICU.
+# rpath links a library search path right into the binaries.
+
+
+### END of icu-config-top
+
+## Zero out prefix.
+execprefix=
+prefix=
+
+
+loaddefs()
+{
+
+# Following from ./config/mh-linux
+## -*-makefile-*-
+#******************************************************************************
+#   Copyright (C) 1999-2007, International Business Machines
+#   Corporation and others.  All Rights Reserved.
+#******************************************************************************
+# This Makefile.inc is designed to be included into projects which make use
+# of the ICU.
+
+# CONTENTS OF THIS FILE
+# 1). Base configuration information and linkage
+# 2). Variables giving access to ICU tools
+# 3). Host information
+# 4). Compiler flags and settings
+# 5). Data Packaging directives
+# 6). Include of platform make fragment (mh-* file)
+
+##################################################################
+#
+#       *1*  base configuration information and linkage
+#
+##################################################################
+# The PREFIX is the base of where ICU is installed.
+# Inside this directory you should find  bin, lib, include/unicode,
+# etc.  If ICU is not installed in this directory, you must change the
+# following line.  There should exist ${prefix}/include/unicode/utypes.h
+# for example.
+default_prefix="/usr"
+if [ "x${prefix}" = "x" ]; then prefix="$default_prefix"; fi
+exec_prefix="${prefix}"
+libdir="${exec_prefix}/lib"
+libexecdir="${exec_prefix}/libexec"
+bindir="${exec_prefix}/bin"
+datadir="${prefix}/share"
+sbindir="${exec_prefix}/sbin"
+
+# about the ICU version
+VERSION="3.8.1"
+UNICODE_VERSION="5.0"
+
+# The prefix for ICU libraries, normally 'icu'
+ICUPREFIX="icu"
+PACKAGE="icu"
+LIBICU="lib${ICUPREFIX}"
+
+# Static library prefix and file extension
+STATIC_PREFIX="s"
+LIBSICU="lib${STATIC_PREFIX}${ICUPREFIX}"
+A="a"
+
+# Suffix at the end of libraries. Usually empty.
+ICULIBSUFFIX=""
+# ICULIBSUFFIX_VERSION  is non-empty if it is to contain a library
+# version. For example, if it is 21, it means libraries are named
+# libicuuc21.so for example.
+
+# rpath links a library search path right into the binaries.
+## mh-files MUST NOT override RPATHLDFLAGS unless they provide
+## equivalent '#SH#' lines for icu-config fixup
+default_ENABLE_RPATH="NO"
+if [ "x${ENABLE_RPATH}" = "x" ]; then ENABLE_RPATH="$default_ENABLE_RPATH"; fi
+RPATHLDFLAGS="${LD_RPATH}${LD_RPATH_PRE}${libdir}"
+
+# icu-config version of above 'if':
+case "$ENABLE_RPATH" in
+[yY]*)
+	ENABLE_RPATH=YES
+	RPATHLDFLAGS="${LD_RPATH}${LD_RPATH_PRE}${libdir}"
+	;;
+
+[nN]*)
+	ENABLE_RPATH=NO
+	RPATHLDFLAGS=""
+	;;
+
+*)
+	echo $0: Unknown --enable-rpath value ${ENABLE_RPATH} 1>&2
+	exit 3
+	;;
+esac
+
+# Name flexibility for the library naming scheme.  Any modifications should
+# be made in the mh- file for the specific platform.
+DATA_STUBNAME="data"
+COMMON_STUBNAME="uc"
+I18N_STUBNAME="i18n"
+LAYOUT_STUBNAME="le"
+LAYOUTEX_STUBNAME="lx"
+IO_STUBNAME="io"
+TOOLUTIL_STUBNAME="tu"
+CTESTFW_STUBNAME="test"
+
+
+### To link your application with ICU:
+# 1. use LDFLAGS, CFLAGS, etc from above
+# 2. link with ${ICULIBS}
+# 3. optionally, add one or more of:
+#    - ${ICULIBS_I18N}    - i18n library, formatting, etc.
+#    - ${ICULIBS_LAYOUT}  - ICU layout library.
+#    - ${ICULIBS_ICUIO}   - ICU stdio equivalent library
+
+ICULIBS_COMMON="-l${ICUPREFIX}uc${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_DATA="-l${ICUPREFIX}${DATA_STUBNAME}${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_I18N="-l${ICUPREFIX}${I18N_STUBNAME}${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_TOOLUTIL="-l${ICUPREFIX}tu${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_CTESTFW="-l${ICUPREFIX}ctestfw${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_ICUIO="-l${ICUPREFIX}io${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_OBSOLETE="-l${ICUPREFIX}obsolete${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_LAYOUT="-l${ICUPREFIX}le${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_LAYOUTEX="-l${ICUPREFIX}lx${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}"
+ICULIBS_BASE="${LIBS}"
+
+# for icu-config to test with
+ICULIBS_COMMON_LIB_NAME="${LIBICU}uc${ICULIBSUFFIX}${ICULIBSUFFIX_VERSION}.${SO}"
+
+# ICULIBS is the set of libraries your application should link
+# with usually. Many applications will want to add ${ICULIBS_I18N} as well.
+ICULIBS="${ICULIBS_BASE} ${ICULIBS_I18N} ${ICULIBS_COMMON} ${ICULIBS_DATA} "
+
+##################################################################
+#
+#       *2*  access to ICU tools
+#
+##################################################################
+# Environment variable to set a runtime search path
+#   (Overridden when necessary in -mh files)
+LDLIBRARYPATH_ENVVAR="LD_LIBRARY_PATH"
+
+# Versioned target for a shared library
+## FINAL_SO_TARGET = ${SO_TARGET}.${SO_TARGET_VERSION}
+## MIDDLE_SO_TARGET = ${SO_TARGET}.${SO_TARGET_VERSION_MAJOR}
+
+# Access to important ICU tools.
+# Use as follows:  ${INVOKE} ${GENRB} arguments ..
+INVOKE="${LDLIBRARYPATH_ENVVAR}=${libdir}:$$${LDLIBRARYPATH_ENVVAR} ${LEAK_CHECKER}"
+GENCCODE="${sbindir}/genccode"
+ICUPKG="${sbindir}/icupkg"
+GENCMN="${sbindir}/gencmn"
+GENRB="${bindir}/genrb"
+PKGDATA="${bindir}/pkgdata"
+
+##################################################################
+#
+#       *3*  Information about the host
+#
+##################################################################
+
+# Information about the host that 'configure' was run on.
+host="i686-cm-linux-gnu"
+host_alias="i686-cm-linux"
+host_cpu="i686"
+host_vendor="cm"
+host_os="linux-gnu"
+# Our platform canonical name (as determined by configure)
+# this is a #define value (i.e. U_XXXX or XXXX)
+platform="U_LINUX"
+
+##################################################################
+#
+#       *4*  compiler flags and misc. options
+#
+##################################################################
+AR="/opt/IntelCE//bin/i686-cm-linux-ar"
+# initial tab keeps it out of the shell version.
+ARFLAGS=" ${ARFLAGS}"
+CC="/opt/IntelCE//bin/i686-cm-linux-gcc -Os -pipe -Os  --sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/"
+CFLAGS="-Os -pipe -Os  --sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/ ${THREADSCFLAGS} "
+CPP="/opt/IntelCE//bin/i686-cm-linux-cpp -Os -pipe -Os  --sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/"
+CPPFLAGS="--sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/ ${THREADSCPPFLAGS} ${LIBCPPFLAGS}"
+CXX="/opt/IntelCE//bin/i686-cm-linux-g++ -Os -pipe -Os  --sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/"
+CXXFLAGS="-Os -pipe -Os  --sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/ ${THREADSCXXFLAGS} "
+DEFAULT_MODE="dll"
+DEFS="-DHAVE_CONFIG_H "
+FFLAGS="@FFLAGS@"
+# use a consistent INSTALL
+INSTALL="${SHELL} ${pkgdatadir}/install-sh -c"
+INSTALL_DATA="${INSTALL} -m 644"
+INSTALL_PROGRAM="${INSTALL}"
+INSTALL_SCRIPT="${INSTALL}"
+LDFLAGS="--sysroot /home/djdeath/src/buildroot/buildroot_rebase/output2/staging/ ${RPATHLDFLAGS}"
+LIBS="-lpthread -lm  "
+LIB_M=""
+LIB_VERSION="38.1"
+LIB_VERSION_MAJOR="38"
+MKINSTALLDIRS="${SHELL} ${pkgdatadir}/mkinstalldirs"
+RANLIB="/opt/IntelCE//bin/i686-cm-linux-ranlib"
+RMV="rm -rf"
+SHELL="/bin/sh"
+SHLIB_c="${CC} ${DEFS} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -shared"
+SHLIB_cc="${CXX} ${DEFS} ${CPPFLAGS} ${CXXFLAGS} ${LDFLAGS} -shared"
+U_IS_BIG_ENDIAN="0"
+includedir="${prefix}/include"
+infodir="/usr/info"
+localstatedir="${prefix}/var"
+mandir="/usr/man"
+oldincludedir="/usr/include"
+program_transform_name="s,x,x,"
+sharedstatedir="${prefix}/com"
+sysconfdir="${prefix}/etc"
+INSTALL_L="${INSTALL_DATA}"
+
+##################################################################
+#
+#       *5* packaging options and directories
+#
+##################################################################
+
+pkgdatadir="${datadir}/${PACKAGE}${ICULIBSUFFIX}/${VERSION}"
+pkglibdir="${libdir}/${PACKAGE}${ICULIBSUFFIX}/${VERSION}"
+
+# The basename of the ICU data file (i.e. icudt21b )
+ICUDATA_CHAR="l"
+ICUDATA_NAME="icudt38l"
+
+# Defaults for pkgdata's mode and directories
+# The default data dir changes depending on what packaging mode
+# is being used
+if [ "x$PKGDATA_MODE" = "x" ];
+then
+PKGDATA_MODE="dll"
+fi
+
+case "$PKGDATA_MODE" in
+common)
+ICUDATA_DIR="${pkgdatadir}"
+ICUPKGDATA_DIR="${ICUDATA_DIR}"
+;;
+dll)
+ICUDATA_DIR="${pkgdatadir}"
+ICUPKGDATA_DIR="${libdir}"
+;;
+*)
+ICUDATA_DIR="${pkgdatadir}"
+ICUPKGDATA_DIR="${ICUDATA_DIR}"
+;;
+
+esac
+
+GENCCODE_ASSEMBLY="-a gcc"
+
+##################################################################
+#
+#       *6* Inclusion of platform make fragment (mh-* file)
+#
+##################################################################
+# The mh- file ("make fragment") for the platform is included here.
+# It may override the above settings.
+# It is put last so that the mh-file can override anything.
+
+## -*-makefile-*-
+## Linux-specific setup
+## Copyright (c) 1999-2006, International Business Machines Corporation and
+## others. All Rights Reserved.
+
+## Commands to generate dependency files
+GEN_DEPS_c="${CC} -E -MM ${DEFS} ${CPPFLAGS}"
+GEN_DEPS_cc="${CXX} -E -MM ${DEFS} ${CPPFLAGS}"
+
+## Flags for position independent code
+SHAREDLIBCFLAGS="-fPIC"
+SHAREDLIBCXXFLAGS="-fPIC"
+SHAREDLIBCPPFLAGS="-DPIC"
+
+## Additional flags when building libraries and with threads
+THREADSCPPFLAGS="-D_REENTRANT"
+LIBCPPFLAGS=""
+
+## Compiler switch to embed a runtime search path
+LD_RPATH=""
+LD_RPATH_PRE="-Wl,-rpath,"
+
+## These are the library specific LDFLAGS
+LDFLAGSICUDT="-nodefaultlibs -nostdlib"
+
+## Compiler switch to embed a library name
+# The initial tab in the next line is to prevent icu-config from reading it.
+# We can't depend on MIDDLE_SO_TARGET being set.
+LD_SONAME=
+
+## Shared object suffix
+SO="so"
+## Non-shared intermediate object suffix
+STATIC_O="ao"
+
+## Compilation rules
+
+## Dependency rules
+
+## Versioned libraries rules
+
+##  Bind internal references
+
+# LDflags that pkgdata will use
+BIR_LDFLAGS="-Wl,-Bsymbolic"
+
+# Dependencies [i.e. map files] for the final library
+BIR_DEPS=""
+
+## End Linux-specific setup
+
+## -*-sh-*-
+## BEGIN of icu-config-bottom.
+## Copyright (c) 2002-2007, International Business Machines Corporation and
+## others. All Rights Reserved.
+
+ICUUC_FILE=${libdir}/${ICULIBS_COMMON_LIB_NAME}
+
+#  echo ENABLE RPATH $ENABLE_RPATH and RPATHLDFLAGS=${RPATH_LDFLAGS}
+if [ "x$PKGDATA_MODE" = "x" ]; then
+    PKGDATA_MODE=dll
+fi
+
+}
+
+## The actual code of icu-config goes here.
+
+ME=`basename "$0"`
+
+allflags()
+{
+    echo "  --bindir               Print binary directory path (bin)"
+    echo "  --cc                   Print C compiler used [CC]"
+    echo "  --cflags               Print C compiler flags [CFLAGS]"
+    echo "  --cflags-dynamic       Print additional C flags for"
+    echo "                             building shared libraries."
+    echo "  --cppflags             Print C Preprocessor flags [CPPFLAGS]"
+    echo "  --cppflags-dynamic     Print additional C Preprocessor flags for"
+    echo "                             building shared libraries."
+    echo "  --cppflags-searchpath  Print only -I include directives  (-Iinclude)"
+    echo "  --cxx                  Print C++ compiler used [CXX]"
+    echo "  --cxxflags             Print C++ compiler flags [CXXFLAGS]"
+    echo "  --cxxflags-dynamic     Print additional C++ flags for"
+    echo "                             building shared libraries."
+    echo "  --detect-prefix        Attempt to detect prefix based on PATH"
+    echo "  --exec-prefix          Print prefix for executables (/bin)"
+    echo "  --exists               Return with 0 status if ICU exists else fail"
+    echo "  --help, -?, --usage    Print this message"
+    echo "  --icudata              Print shortname of ICU data file (icudt21l)"
+    echo "  --icudata-install-dir  Print path to install data to - use as --install option to pkgdata(1)"
+    echo "  --icudata-mode         Print default ICU pkgdata mode (dll) - use as --mode option to pkgdata(1)."
+    echo "  --icudatadir           Print path to packaged archive data. Can set as [ICU_DATA]"
+    echo "  --invoke               Print commands to invoke an ICU program"
+    echo "  --invoke=<prog>        Print commands to invoke an ICU program named <prog> (ex: genrb)"
+    echo "  --ldflags              Print -L search path and -l libraries to link with ICU [LDFLAGS].  This is for the data, uc (common), and i18n libraries only.  "
+    echo "  --ldflags-layout       Print ICU layout engine link directive. Use in addition to --ldflags"
+    echo "  --ldflags-libsonly     Same as --ldflags, but only the -l directives"
+    echo "  --ldflags-searchpath   Print only -L (search path) directive"
+    echo "  --ldflags-system       Print only system libs ICU links with (-lpthread, -lm)"
+    echo "  --ldflags-icuio        Print ICU icuio link directive. Use in addition to --ldflags "
+    echo "  --ldflags-obsolete     Print ICU obsolete link directive. Use in addition to --ldflags. (requires icuapps/obsolete to be built and installed.) "
+    echo "  --mandir               Print manpage (man) path"
+    echo "  --prefix               Print PREFIX to icu install (/usr/local)"
+    echo "  --prefix=XXX           Set prefix to XXX for remainder of command"
+    echo "  --sbindir              Print system binary path (sbin) "
+    echo "  --shared-datadir       Print shared data (share) path. This is NOT the ICU data dir."
+    echo "  --shlib-c              Print the command to compile and build C shared libraries with ICU"
+    echo "  --shlib-cc             Print the command to compile and build C++ shared libraries with ICU"
+    echo "  --sysconfdir           Print system config (etc) path"
+    echo "  --unicode-version      Print version of Unicode data used in ICU ($UNICODE_VERSION)"
+    echo "  --version              Print ICU version ($VERSION)"
+    echo "  --incfile              Print path to Makefile.inc (for -O option of pkgdata)"
+    echo "  --install              Print path to install-sh"
+    echo "  --mkinstalldirs              Print path to mkinstalldirs"
+}
+
+## Print the normal usage message
+shortusage()
+{
+    echo "usage: ${ME} " `allflags | cut -c-25 | sed -e 's%.*%[ & ]%'`
+}
+
+
+usage()
+{
+    echo "${ME}: icu-config: ICU configuration helper script"
+    echo
+    echo "The most commonly used options will be --cflags, --cxxflags, --cppflags, and --ldflags."
+    echo 'Example (in make):   CPFLAGS=$(shell icu-config --cppflags)'
+    echo '                     LDFLAGS=$(shell icu-config --ldflags)'
+    echo "                     (etc).."
+    echo
+    echo "Usage:"
+    allflags
+
+    echo
+    echo " [Brackets] show MAKE variable equivalents,  (parenthesis) show example output"
+    echo
+    echo "Copyright (c) 2002, International Business Machines Corporation and others. All Rights Reserved."
+}
+
+## Check the sanity of current variables
+sanity()
+{
+    if [ ! -f ${ICUUC_FILE} ];
+    then
+	echo "### $ME: Can't find ${ICUUC_FILE} - ICU prefix is wrong."  1>&2
+	echo "###      Try the --prefix= or --exec-prefix= options " 1>&2
+	echo "###      or --detect-prefix"
+	echo "### $ME: Exitting." 1>&2
+	exit 2
+    fi
+}
+
+## Main starts here.
+
+if [ $# -lt 1 ]; then
+    shortusage
+    exit 1
+fi
+
+
+# Load our variables from autoconf
+# ALWAYS load twice because of dependencies
+loaddefs
+loaddefs
+sanity
+
+while [ $# -gt 0 ];
+do
+    arg="$1"
+    var=`echo $arg | sed -e 's/^[^=]*=//'`
+#    echo "### processing $arg" 1>&2
+    case "$arg" in
+
+        # undocumented.
+	--debug)
+	    set -x
+	    ;;
+
+        --so)
+            echo $SO
+            ;;
+
+	--bindir)
+	    echo $bindir
+	    ;;
+
+	--libdir)
+	    echo $libdir
+	    ;;
+
+	--exists)
+	    sanity
+	    ;;
+
+	--sbindir)
+	    echo $sbindir
+	    ;;
+
+	--mkinstalldirs)
+	    echo ${MKINSTALLDIRS}
+	    ;;
+
+	--install)
+	    echo ${INSTALL}
+	    ;;
+
+	--invoke=*)
+	    QUOT="\""
+            CMD="${var}"
+
+            # If it's not a locally executable command (1st choice) then
+            # search for it in the ICU directories.
+            if [ ! -x ${CMD} ]; then
+                if [ -x ${bindir}/${var} ]; then
+                    CMD="${bindir}/${var}"
+                fi
+                if [ -x ${sbindir}/${var} ]; then
+                    CMD="${sbindir}/${var}"
+                fi
+            fi
+
+	    echo "env ${QUOT}${LDLIBRARYPATH_ENVVAR}=${libdir}:"'${'"${LDLIBRARYPATH_ENVVAR}"'}'${QUOT} ${CMD}
+	    ;;
+
+	--invoke)
+	    QUOT="\""
+	    echo "env ${QUOT}${LDLIBRARYPATH_ENVVAR}=${libdir}:"'${'"${LDLIBRARYPATH_ENVVAR}"'}'${QUOT}
+	    ;;
+
+	--cflags)
+	    echo $CFLAGS
+	    ;;
+
+	--cc)
+	    echo $CC
+	    ;;
+
+	--cxx)
+	    echo $CXX
+	    ;;
+
+	--cxxflags)
+	    echo $CXXFLAGS
+	    ;;
+
+	--cppflags)
+	    # Don't echo the -I. - it's unneeded.
+	    echo $CPPFLAGS | sed -e 's/-I. //'
+	    ;;
+
+	--cppflags-searchpath)
+	    echo -I${prefix}/include
+	    ;;
+
+	--cppflags-dynamic)
+	    echo $SHAREDLIBCPPFLAGS
+	    ;;
+
+	--cxxflags-dynamic)
+	    echo $SHAREDLIBCXXFLAGS
+	    ;;
+
+	--cflags-dynamic)
+	    echo $SHAREDLIBCFLAGS
+	    ;;
+
+	--ldflags-system)
+	    echo $LIBS
+	    ;;
+
+	--ldflags)
+	    echo $LDFLAGS $ICULIBS $LIBS
+# $RPATH_LDFLAGS
+	    ;;
+
+	--ldflags-libsonly)
+	    echo $ICULIBS_I18N $ICULIBS_COMMON $ICULIBS_DATA
+	    ;;
+
+	--ldflags-icuio)
+	    echo $ICULIBS_ICUIO
+	    ;;
+
+	--ldflags-obsolete)
+	    echo $ICULIBS_OBSOLETE
+	    ;;
+
+	--ldflags-toolutil)
+	    echo $ICULIBS_TOOLUTIL
+	    ;;
+
+	--ldflags-layout)
+	    echo $ICULIBS_LAYOUT $ICULIBS_LAYOUTEX
+	    ;;
+
+	--ldflags-searchpath)
+	    echo -L${libdir}
+	    ;;
+
+	--detect-prefix)
+	    HERE=`echo $0 | sed -e "s/$ME//g"`
+	    if [ -f $HERE/../lib/${ICULIBS_COMMON_LIB_NAME} ]; then
+		prefix=$HERE/..
+		echo "## Using --prefix=${prefix}" 1>&2
+	    fi
+	    loaddefs
+	    loaddefs
+	    sanity
+	    ;;
+
+	--exec-prefix)
+	    echo $exec_prefix
+	    ;;
+
+	--prefix)
+	    echo $prefix
+	    ;;
+
+	--prefix=*)
+	    prefix=$var
+	    loaddefs
+	    loaddefs
+	    sanity
+	    ;;
+
+	--sysconfdir)
+	    echo $sysconfdir
+	    ;;
+
+	--mandir)
+	    echo $mandir
+	    ;;
+
+	--shared-datadir)
+	    echo $datadir
+	    ;;
+
+        --incfile)
+	    echo $pkglibdir/Makefile.inc
+	    ;;
+
+	--icudata)
+	    echo $ICUDATA_NAME
+	    ;;
+
+	--icudata-mode)
+	    echo $PKGDATA_MODE
+	    ;;
+
+	--icudata-install-dir)
+            echo $ICUPKGDATA_DIR
+	    ;;
+
+	--icudatadir)
+	    echo $ICUDATA_DIR
+	    ;;
+
+	--shlib-c)
+	    echo $SHLIB_c
+	    ;;
+
+	--shlib-cc)
+	    echo $SHLIB_cc
+	    ;;
+
+	--version)
+            echo $VERSION
+            ;;
+
+        --unicode-version)
+            echo $UNICODE_VERSION
+            ;;
+
+	--help)
+	    usage
+	    exit 0
+	    ;;
+
+	--usage)
+	    usage
+	    exit 0
+	    ;;
+
+#	--enable-rpath=*)
+#	    ENABLE_RPATH=$var
+#	    loaddefs
+#	    ;;
+
+	-?)
+	    usage
+	    exit 0
+	    ;;
+
+        *)
+	    echo ${ME}: ERROR Unknown Option $arg 1>&2
+            echo 1>&2
+            shortusage 1>&2
+	    echo "### $ME: Exitting." 1>&2
+            exit 1;
+            ;;
+    esac
+    shift
+done
+
+# Check once before we quit (will check last used prefix)
+sanity
+## END of icu-config-bottom
+
+exit 0
+
+# Rebuilt on mercredi 25 novembre 2009, 12:31:58 (UTC+0100)
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
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 589c31f..def5ef3 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -1,3 +1,4 @@
+
 #############################################################
 #
 # ICU International Components for Unicode
@@ -7,70 +8,74 @@
 ICU_VERSION:=4c-3_8_1
 ICU_SOURCE:=icu$(ICU_VERSION)-src.tgz
 ICU_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/icu
-ICU_CAT:=$(ZCAT)
-ICU_DIR:=$(BUILD_DIR)/icu/source
-ICU_HOST_DIR:=$(BUILD_DIR)/icu-host/source
-
-$(DL_DIR)/$(ICU_SOURCE):
-	 $(call DOWNLOAD,$(ICU_SITE),$(ICU_SOURCE))
+ICU_DEPENDENCIES:=host-icu
+ICU_SUBDIR:=source
+ICU_INSTALL_STAGING = YES
 
-icu-source: $(DL_DIR)/$(ICU_SOURCE)
+ICU_BINARIES = \
+	derb \
+	genbidi \
+	genbrk \
+	gencase \
+	genccode \
+	gencmn \
+	gencnval \
+	genctd \
+	gennames \
+	gennorm \
+	genpname \
+	genprops \
+	genrb \
+	gensprep \
+	genuca \
+	icupkg \
+	icuswap \
+	makeconv \
+	pkgdata \
+	uconv
 
-$(ICU_DIR)/.unpacked: $(DL_DIR)/$(ICU_SOURCE)
-	$(ICU_CAT) $(DL_DIR)/$(ICU_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(ICU_DIR)
-	cp -a $(BUILD_DIR)/icu $(BUILD_DIR)/icu-host
-	toolchain/patch-kernel.sh $(ICU_DIR) package/icu/ \*.patch
-	touch $(ICU_DIR)/.unpacked
+define HOST_ICU_CONFIGURE_CMDS
+ (cd $(@D)/$(ICU_SUBDIR); \
+ $(HOST_CONFIGURE_OPTS) \
+ $(HOST_CONFIGURE_ARGS) \
+ $(HOST_CONFIGURE_ENV)  \
+ ./configure $(QUIET) --prefix=/usr)
+endef
 
-$(ICU_HOST_DIR)/.configured: $(ICU_DIR)/.unpacked
-	(cd $(ICU_HOST_DIR); ./configure $(QUIET) \
-		--prefix=/usr;);
-	touch $(ICU_HOST_DIR)/.configured
+define HOST_ICU_INSTALL_CMDS
+ make -C $(@D)/$(ICU_SUBDIR) DESTDIR=$(HOST_DIR) install
+ mkdir -p $(HOST_DIR)/usr/sbin
+ cp -f $(addprefix $(@D)/$(ICU_SUBDIR)/bin/,$(ICU_BINARIES)) $(HOST_DIR)/usr/sbin/
+endef
 
-$(ICU_DIR)/.configured: $(ICU_HOST_DIR)/.configured
-	(cd $(ICU_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CXX=$(TARGET_CXX) \
-		./configure $(QUIET) \
+define ICU_CONFIGURE_CMDS
+ (cd $(@D)/$(ICU_SUBDIR); \
+ $(TARGET_CONFIGURE_OPTS) \
+ $(TARGET_CONFIGURE_ARGS) \
+ $(TARGET_CONFIGURE_ENV) \
+ ./configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--enable-samples \
-	);
-	touch $(ICU_DIR)/.configured
-
-$(ICU_HOST_DIR)/.done: $(ICU_DIR)/.configured
-	$(MAKE) -C $(ICU_HOST_DIR)
-	ln -s -f $(ICU_HOST_DIR)/bin $(ICU_DIR)/bin-host
-	ln -s -f $(ICU_HOST_DIR)/lib $(ICU_DIR)/lib-host
-	touch $(ICU_HOST_DIR)/.done
-
-$(ICU_DIR)/.done: $(ICU_HOST_DIR)/.done
-	$(MAKE) -C $(ICU_DIR)
-	$(MAKE) -C $(ICU_DIR) install DESTDIR=$(STAGING_DIR)
-	$(MAKE) -C $(ICU_DIR) install DESTDIR=$(TARGET_DIR)
-	$(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/icu-config
-	touch $(ICU_DIR)/.done
+		--enable-samples)
+ ln -sf $(HOST_DIR)/usr/sbin $(@D)/$(ICU_SUBDIR)/bin-host
+endef
 
-icu: $(ICU_DIR)/.done
+define ICU_BUILD_CMDS
+ make -C $(@D)/$(ICU_SUBDIR)
+endef
 
-icu-clean:
-	rm -f $(TARGET_DIR)/bin/icu
-	-$(MAKE) -C $(ICU_DIR) clean
+define ICU_INSTALL_TARGET_CMDS
+ make -C $(@D)/$(ICU_SUBDIR) DESTDIR=$(TARGET_DIR) install
+endef
 
-icu-dirclean:
-	rm -rf $(ICU_DIR)
+define ICU_INSTALL_STAGING_CMDS
+ make -C $(@D)/$(ICU_SUBDIR) DESTDIR=$(STAGING_DIR) install
+ $(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/icu-config
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ICU),y)
-TARGETS+=icu
-endif
+$(eval $(call GENTARGETS,package,icu,host))
+$(eval $(call GENTARGETS,package,icu))
-- 
1.6.5.7
