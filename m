From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 23:50:01 +0100
Subject: [Buildroot] [PATCH v2 1/1] icu: detect and add compiler symbol
	prefix to the assembly code
In-Reply-To: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Tue, 4 Feb 2014 14:06:46 +0100")
References: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87wqgqyaxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>
 > Some compiler, such as Blackfin GNU compiler, prefix a charater to any
 > C symbol in generated assembly code. If any assembly symbol is invoked
 > from C code, it needs to be prefixed as well.

 > Note: since autoreconf doesn't work with this package because automake
 > isn't support

 > Fixes:
 >   http://autobuild.buildroot.net/results/c40a22814b405de2c5c75139cfc393c863ed4b81/

 > [Ryan: add information about why patching configure is ok]
 > [Ryan: add renaming of patches to be consistent with standard]

 > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

We recently added this patch to icu for bfin symbol prefix, but from
todays autobuilder I see that icu's configure script completely doesn't
support uclinux (E.G. bfin):

http://autobuild.buildroot.net/results/d11/d118b4f753ade63201758e1b14ca54d96ec77698/build-end.log

What's going on here? Should I revert this patch and instead mark icu as
unavailable on bfin?





 > ---
 >  ... icu-001-dont-build-static-dynamic-twice.patch} |   0
 >  ...tch => icu-002-workaround-toolchain-bugs.patch} |   0
 >  .../icu-003-detect-compiler-symbol-prefix.patch    | 112 +++++++++++++++++++++
 >  3 files changed, 112 insertions(+)
 >  rename package/icu/{icu-dont-build-static-dynamic-twice.patch => icu-001-dont-build-static-dynamic-twice.patch} (100%)
 >  rename package/icu/{icu-workaround-toolchain-bugs.patch => icu-002-workaround-toolchain-bugs.patch} (100%)
 >  create mode 100644 package/icu/icu-003-detect-compiler-symbol-prefix.patch

 > diff --git a/package/icu/icu-dont-build-static-dynamic-twice.patch b/package/icu/icu-001-dont-build-static-dynamic-twice.patch
 > similarity index 100%
 > rename from package/icu/icu-dont-build-static-dynamic-twice.patch
 > rename to package/icu/icu-001-dont-build-static-dynamic-twice.patch
 > diff --git a/package/icu/icu-workaround-toolchain-bugs.patch b/package/icu/icu-002-workaround-toolchain-bugs.patch
 > similarity index 100%
 > rename from package/icu/icu-workaround-toolchain-bugs.patch
 > rename to package/icu/icu-002-workaround-toolchain-bugs.patch
 > diff --git a/package/icu/icu-003-detect-compiler-symbol-prefix.patch b/package/icu/icu-003-detect-compiler-symbol-prefix.patch
 > new file mode 100644
 > index 0000000..bfc985f
 > --- /dev/null
 > +++ b/package/icu/icu-003-detect-compiler-symbol-prefix.patch
 > @@ -0,0 +1,112 @@
 > +detect and add compiler symbol prefix to the assembly code
 > +
 > +Some compiler, such as Blackfin GNU compiler, prefix a charater to any
 > +C symbol in generated assembly code. If any assembly symbol is invoked
 > +from C code, it needs to be prefixed as well.
 > +
 > +Note: since autoreconf doesn't work with this package because automake
 > +isn't support
 > +
 > +[Ryan: add information about why patching configure is ok]
 > +
 > +Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 > +Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > +
 > +--- icu-51.2/source/configure	2014-01-06 17:13:20.907249812 +0800
 > ++++ icu-51.2.bak/source/configure	2014-01-06 17:12:57.335248659 +0800
 > +@@ -612,6 +612,7 @@
 > + ICUDATA_CHAR
 > + SAMPLES_TRUE
 > + TESTS_TRUE
 > ++SYMBOL_PREFIX
 > + ICULIBSUFFIXCNAME
 > + U_HAVE_LIB_SUFFIX
 > + ICULIBSUFFIX
 > +@@ -7226,7 +7227,16 @@
 > +     U_HAVE_LIB_SUFFIX=0
 > + fi
 > +
 > ++# Check compiler generated symbol profix
 > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for symbol prefix" >&5
 > ++$as_echo "checking for symbol prefix... " >&6; }
 > ++    SYMBOL_PREFIX=`echo "PREFIX=__USER_LABEL_PREFIX__" \
 > ++                  | ${CPP-${CC-gcc} -E} - 2>&1 \
 > ++                  | ${EGREP-grep} "^PREFIX=" \
 > ++                  | sed -e "s:^PREFIX=::" -e "s:__USER_LABEL_PREFIX__::"`
 > +
 > ++    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $SYMBOL_PREFIX" >&5
 > ++$as_echo "$SYMBOL_PREFIX" >&6; }
 > +
 > + # Enable/disable tests
 > + # Check whether --enable-tests was given.
 > +--- icu-51.2/source/extra/uconv/Makefile.in	2014-01-06 17:47:13.991347946 +0800
 > ++++ icu-51.2.bak/source/extra/uconv/Makefile.in	2014-01-06 17:48:01.571355282 +0800
 > +@@ -57,7 +57,7 @@
 > + ## Static mode
 > + ifeq ($(UCONVMSG_MODE),static)
 > + DEFS += -DUCONVMSG_LINK=$(MSGNAME)
 > +-UCONVMSG_LIB = $(RESDIR)/$(LIBPREFIX)$(STATIC_PREFIX_WHEN_USED)$(MSGNAME).$(A)
 > ++UCONVMSG_LIB = $(RESDIR)/$(LIBPREFIX)$(STATIC_PREFIX_WHEN_USED)@SYMBOL_PREFIX@$(MSGNAME).$(A)
 > + LIBS += $(UCONVMSG_LIB)
 > + PKGMODE=static
 > + INSTALLTO=$(libdir)
 > +@@ -151,7 +151,7 @@
 > + endif
 > +
 > + $(UCONVMSG_LIB): $(RESFILES) $(RESDIR)/$(RESDIR).lst pkgdata.inc
 > +-	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(TOOLBINDIR)/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
 > ++	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(TOOLBINDIR)/pkgdata -p @SYMBOL_PREFIX@$(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
 > +
 > + $(RESDIR)/$(RESDIR).lst: Makefile $(srcdir)/resfiles.mk
 > + 	@-$(RMV) $@
 > +--- icu-51.2/source/data/Makefile.in	2014-01-06 19:00:28.879570005 +0800
 > ++++ icu-51.2.bak/source/data/Makefile.in	2014-01-06 19:00:07.891570170 +0800
 > +@@ -175,13 +175,13 @@
 > + packagedata: icupkg.inc $(PKGDATA_LIST) build-local
 > + ifneq ($(ENABLE_STATIC),)
 > + ifeq ($(PKGDATA_MODE),dll)
 > +-	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) $(PKGDATA_LIBSTATICNAME) -m static $(PKGDATA_VERSIONING) $(PKGDATA_LIST)
 > ++	$(PKGDATA_INVOKE) $(PKGDATA) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) $(PKGDATA_LIBSTATICNAME) -m static $(PKGDATA_VERSIONING) $(PKGDATA_LIST)
 > + endif
 > + endif
 > + ifneq ($(ICUDATA_SOURCE_IS_NATIVE_TARGET),YES)
 > +-	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(PKGDATA_LIBNAME) $(PKGDATA_LIST)
 > ++	$(PKGDATA_INVOKE) $(PKGDATA) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(PKGDATA_LIBNAME) $(PKGDATA_LIST)
 > + ifeq ($(OS390BATCH),1)
 > +-	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(OS390_PDS_NAME) $(PKGDATA_LIST)
 > ++	$(PKGDATA_INVOKE) $(PKGDATA) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(OS390_PDS_NAME) $(PKGDATA_LIST)
 > + endif
 > + else
 > + 	$(INSTALL_DATA) $(ICUDATA_SOURCE_ARCHIVE) $(OUTDIR)
 > +@@ -203,11 +203,11 @@
 > + endif
 > + ifneq ($(ENABLE_STATIC),)
 > + ifeq ($(PKGDATA_MODE),dll)
 > +-	$(PKGDATA_INVOKE) $(PKGDATA) -m static -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -s $(BUILDDIR) -p $(ICUDATA_NAME) $(PKGDATA_LIBSTATICNAME) $(PKGDATA_LIST) -I $(ICUPKGDATA_INSTALL_LIBDIR)
 > ++	$(PKGDATA_INVOKE) $(PKGDATA) -m static -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -s $(BUILDDIR) -p $(ICUDATA_NAME) $(PKGDATA_LIBSTATICNAME) $(PKGDATA_LIST) -I $(ICUPKGDATA_INSTALL_LIBDIR)
 > + endif
 > + endif
 > + ifneq ($(ICUDATA_SOURCE_IS_NATIVE_TARGET),YES)
 > +-	$(PKGDATA_INVOKE) $(PKGDATA) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -s $(BUILDDIR) -p $(ICUDATA_NAME) $(PKGDATA_LIBNAME) $(PKGDATA_LIST) -I $(ICUPKGDATA_INSTALL_DIR)
 > ++	$(PKGDATA_INVOKE) $(PKGDATA) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -s $(BUILDDIR) -p $(ICUDATA_NAME) $(PKGDATA_LIBNAME) $(PKGDATA_LIST) -I $(ICUPKGDATA_INSTALL_DIR)
 > + else
 > + 	$(INSTALL_DATA) $(ICUDATA_SOURCE_ARCHIVE) $(DESTDIR)$(ICUPKGDATA_DIR)
 > + endif
 > +@@ -218,7 +218,7 @@
 > + #### 390 support
 > + install390: package390
 > + 	$(MKINSTALLDIRS) $(TMPDATADIR) $(DESTDIR)$(libdir)
 > +-	$(INVOKE) $(PKGDATA) -s $(BUILDDIR)$(STUB_SUFFIX) -T $(OUTTMPDIR_390STUB) -p $(ICUDATA_NAME)$(STUB_SUFFIX) $(PKGDATA_LIBNAME)$(STUB_SUFFIX) -e $(ICUDATA_ENTRY_POINT) $(OS390LIST) -m dll $(PKGDATA_VERSIONING) -I $(DESTDIR)$(ICUPKGDATA_DIR)
 > ++	$(INVOKE) $(PKGDATA) -s $(BUILDDIR)$(STUB_SUFFIX) -T $(OUTTMPDIR_390STUB) -p $(ICUDATA_NAME)$(STUB_SUFFIX) $(PKGDATA_LIBNAME)$(STUB_SUFFIX) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) $(OS390LIST) -m dll $(PKGDATA_VERSIONING) -I $(DESTDIR)$(ICUPKGDATA_DIR)
 > + ifeq ($(PKGDATA_MODE),dll)
 > + 	$(INSTALL-L) $(ICUPKGDATA_OUTDIR)/$(FINAL_IMPORT_LIB) $(DESTDIR)$(ICUPKGDATA_DIR)/$(FINAL_IMPORT_LIB)
 > + endif
 > +@@ -226,7 +226,7 @@
 > + #### $(LIB_ICUDATA_NAME)$(STUB_SUFFIX) is the subset data for batch mode
 > + package390: $(OUTTMPDIR)/icudata390.lst $(PKGDATA_LIST) ./icupkg.inc packagedata
 > + 	ln -s $(ICUDATA_NAME) $(OUTDIR)/build/$(ICUDATA_NAME)$(STUB_SUFFIX)
 > +-	$(INVOKE) $(PKGDATA) -s $(BUILDDIR)$(STUB_SUFFIX) -T $(OUTTMPDIR_390STUB) -p $(ICUDATA_NAME)$(STUB_SUFFIX) $(PKGDATA_LIBNAME)$(STUB_SUFFIX) -e $(ICUDATA_ENTRY_POINT) $(OS390LIST) -m dll $(PKGDATA_VERSIONING)
 > ++	$(INVOKE) $(PKGDATA) -s $(BUILDDIR)$(STUB_SUFFIX) -T $(OUTTMPDIR_390STUB) -p $(ICUDATA_NAME)$(STUB_SUFFIX) $(PKGDATA_LIBNAME)$(STUB_SUFFIX) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) $(OS390LIST) -m dll $(PKGDATA_VERSIONING)
 > + 	cp $(ICUPKGDATA_OUTDIR)/$(LIB_ICUDATA_NAME)$(STUB_SUFFIX).$(SO) $(top_builddir)/stubdata/$(LIB_ICUDATA_NAME)$(STUB_SUFFIX).$(SO)
 > +
 > +
 > --
 > 1.8.3.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
