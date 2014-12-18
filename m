From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:57:45 +0100
Subject: [Buildroot] [git commit] icu: bump to version 54.1
Message-ID: <20141218220056.7DFEC7F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f712df4f0731fa023c887179f9edef45ccd9ea0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../icu/icu-002-workaround-toolchain-bugs.patch    |   21 +++--
 .../icu-003-detect-compiler-symbol-prefix.patch    |   92 ++++++++++---------
 package/icu/icu.hash                               |    2 +
 package/icu/icu.mk                                 |    2 +-
 4 files changed, 62 insertions(+), 55 deletions(-)

diff --git a/package/icu/icu-002-workaround-toolchain-bugs.patch b/package/icu/icu-002-workaround-toolchain-bugs.patch
index 64d67a0..b5f25d0 100644
--- a/package/icu/icu-002-workaround-toolchain-bugs.patch
+++ b/package/icu/icu-002-workaround-toolchain-bugs.patch
@@ -10,22 +10,23 @@ is trivial in this case. So it will avoid our users falling into this
 internal compiler error, and allow our autobuilders to test more
 packages using this Sourcery CodeBench toolchain.qq
 
-[Gustavo: update for ICU4C 51.2]
+[Gustavo: update for ICU4C 54.1]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
 diff -Nura icu.orig/source/configure icu/source/configure
---- icu.orig/source/configure	2013-05-23 17:06:32.000000000 -0300
-+++ icu/source/configure	2013-06-29 15:43:04.202320953 -0300
-@@ -4066,7 +4066,7 @@
-         then
-             # Do not use -ansi. It limits us to C90, and it breaks some platforms.
-             # We use -std=c99 to disable the gnu99 defaults and its associated warnings
--            CFLAGS="$CFLAGS -Wall -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings"
-+            CFLAGS="$CFLAGS -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings"
+--- icu.orig/source/configure	2014-12-18 15:49:43.038628644 -0300
++++ icu/source/configure	2014-12-18 15:51:23.183083232 -0300
+@@ -4323,7 +4323,7 @@
+                 ;;
+             esac
+ 
+-            CFLAGS="$CFLAGS -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings"
++            CFLAGS="$CFLAGS -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings"
          else
              case "${host}" in
              *-*-cygwin)
-@@ -4078,7 +4078,7 @@
+@@ -4337,7 +4337,7 @@
          fi
          if test "$GXX" = yes
          then
diff --git a/package/icu/icu-003-detect-compiler-symbol-prefix.patch b/package/icu/icu-003-detect-compiler-symbol-prefix.patch
index bfc985f..1e95375 100644
--- a/package/icu/icu-003-detect-compiler-symbol-prefix.patch
+++ b/package/icu/icu-003-detect-compiler-symbol-prefix.patch
@@ -8,13 +8,16 @@ Note: since autoreconf doesn't work with this package because automake
 isn't support
 
 [Ryan: add information about why patching configure is ok]
+[Gustavo: update for ICU4C 54.1]
 
 Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
---- icu-51.2/source/configure	2014-01-06 17:13:20.907249812 +0800
-+++ icu-51.2.bak/source/configure	2014-01-06 17:12:57.335248659 +0800
-@@ -612,6 +612,7 @@
+diff -Nura icu.orig/source/configure icu/source/configure
+--- icu.orig/source/configure	2014-12-18 15:49:43.038628644 -0300
++++ icu/source/configure	2014-12-18 15:56:05.793832186 -0300
+@@ -637,6 +637,7 @@
  ICUDATA_CHAR
  SAMPLES_TRUE
  TESTS_TRUE
@@ -22,46 +25,28 @@ Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
  ICULIBSUFFIXCNAME
  U_HAVE_LIB_SUFFIX
  ICULIBSUFFIX
-@@ -7226,7 +7227,16 @@
-     U_HAVE_LIB_SUFFIX=0
- fi
-
+@@ -7414,6 +7415,17 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CHECK_UTF16_STRING_RESULT" >&5
+ $as_echo "$CHECK_UTF16_STRING_RESULT" >&6; }
+ 
 +# Check compiler generated symbol profix
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for symbol prefix" >&5
 +$as_echo "checking for symbol prefix... " >&6; }
-+    SYMBOL_PREFIX=`echo "PREFIX=__USER_LABEL_PREFIX__" \
++   SYMBOL_PREFIX=`echo "PREFIX=__USER_LABEL_PREFIX__" \
 +                  | ${CPP-${CC-gcc} -E} - 2>&1 \
 +                  | ${EGREP-grep} "^PREFIX=" \
 +                  | sed -e "s:^PREFIX=::" -e "s:__USER_LABEL_PREFIX__::"`
-
++
 +    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $SYMBOL_PREFIX" >&5
 +$as_echo "$SYMBOL_PREFIX" >&6; }
-
- # Enable/disable tests
- # Check whether --enable-tests was given.
---- icu-51.2/source/extra/uconv/Makefile.in	2014-01-06 17:47:13.991347946 +0800
-+++ icu-51.2.bak/source/extra/uconv/Makefile.in	2014-01-06 17:48:01.571355282 +0800
-@@ -57,7 +57,7 @@
- ## Static mode
- ifeq ($(UCONVMSG_MODE),static)
- DEFS += -DUCONVMSG_LINK=$(MSGNAME)
--UCONVMSG_LIB = $(RESDIR)/$(LIBPREFIX)$(STATIC_PREFIX_WHEN_USED)$(MSGNAME).$(A)
-+UCONVMSG_LIB = $(RESDIR)/$(LIBPREFIX)$(STATIC_PREFIX_WHEN_USED)@SYMBOL_PREFIX@$(MSGNAME).$(A)
- LIBS += $(UCONVMSG_LIB)
- PKGMODE=static
- INSTALLTO=$(libdir)
-@@ -151,7 +151,7 @@
- endif
-
- $(UCONVMSG_LIB): $(RESFILES) $(RESDIR)/$(RESDIR).lst pkgdata.inc
--	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(TOOLBINDIR)/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
-+	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(TOOLBINDIR)/pkgdata -p @SYMBOL_PREFIX@$(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
-
- $(RESDIR)/$(RESDIR).lst: Makefile $(srcdir)/resfiles.mk
- 	@-$(RMV) $@
---- icu-51.2/source/data/Makefile.in	2014-01-06 19:00:28.879570005 +0800
-+++ icu-51.2.bak/source/data/Makefile.in	2014-01-06 19:00:07.891570170 +0800
-@@ -175,13 +175,13 @@
++
+ # Enable/disable extras
+ # Check whether --enable-extras was given.
+ if test "${enable_extras+set}" = set; then :
+diff -Nura icu.orig/source/data/Makefile.in icu/source/data/Makefile.in
+--- icu.orig/source/data/Makefile.in	2014-12-18 15:49:42.908624160 -0300
++++ icu/source/data/Makefile.in	2014-12-18 16:01:32.751110913 -0300
+@@ -182,11 +182,11 @@
  packagedata: icupkg.inc $(PKGDATA_LIST) build-local
  ifneq ($(ENABLE_STATIC),)
  ifeq ($(PKGDATA_MODE),dll)
@@ -72,13 +57,10 @@ Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
  ifneq ($(ICUDATA_SOURCE_IS_NATIVE_TARGET),YES)
 -	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(PKGDATA_LIBNAME) $(PKGDATA_LIST)
 +	$(PKGDATA_INVOKE) $(PKGDATA) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(PKGDATA_LIBNAME) $(PKGDATA_LIST)
- ifeq ($(OS390BATCH),1)
--	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(OS390_PDS_NAME) $(PKGDATA_LIST)
-+	$(PKGDATA_INVOKE) $(PKGDATA) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(OS390_PDS_NAME) $(PKGDATA_LIST)
- endif
  else
  	$(INSTALL_DATA) $(ICUDATA_SOURCE_ARCHIVE) $(OUTDIR)
-@@ -203,11 +203,11 @@
+ endif
+@@ -209,11 +209,11 @@
  endif
  ifneq ($(ENABLE_STATIC),)
  ifeq ($(PKGDATA_MODE),dll)
@@ -92,7 +74,7 @@ Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
  else
  	$(INSTALL_DATA) $(ICUDATA_SOURCE_ARCHIVE) $(DESTDIR)$(ICUPKGDATA_DIR)
  endif
-@@ -218,7 +218,7 @@
+@@ -224,7 +224,7 @@
  #### 390 support
  install390: package390
  	$(MKINSTALLDIRS) $(TMPDATADIR) $(DESTDIR)$(libdir)
@@ -101,12 +83,34 @@ Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
  ifeq ($(PKGDATA_MODE),dll)
  	$(INSTALL-L) $(ICUPKGDATA_OUTDIR)/$(FINAL_IMPORT_LIB) $(DESTDIR)$(ICUPKGDATA_DIR)/$(FINAL_IMPORT_LIB)
  endif
-@@ -226,7 +226,7 @@
+@@ -232,7 +232,7 @@
  #### $(LIB_ICUDATA_NAME)$(STUB_SUFFIX) is the subset data for batch mode
  package390: $(OUTTMPDIR)/icudata390.lst $(PKGDATA_LIST) ./icupkg.inc packagedata
  	ln -s $(ICUDATA_NAME) $(OUTDIR)/build/$(ICUDATA_NAME)$(STUB_SUFFIX)
 -	$(INVOKE) $(PKGDATA) -s $(BUILDDIR)$(STUB_SUFFIX) -T $(OUTTMPDIR_390STUB) -p $(ICUDATA_NAME)$(STUB_SUFFIX) $(PKGDATA_LIBNAME)$(STUB_SUFFIX) -e $(ICUDATA_ENTRY_POINT) $(OS390LIST) -m dll $(PKGDATA_VERSIONING)
 +	$(INVOKE) $(PKGDATA) -s $(BUILDDIR)$(STUB_SUFFIX) -T $(OUTTMPDIR_390STUB) -p $(ICUDATA_NAME)$(STUB_SUFFIX) $(PKGDATA_LIBNAME)$(STUB_SUFFIX) -e @SYMBOL_PREFIX@$(ICUDATA_ENTRY_POINT) $(OS390LIST) -m dll $(PKGDATA_VERSIONING)
  	cp $(ICUPKGDATA_OUTDIR)/$(LIB_ICUDATA_NAME)$(STUB_SUFFIX).$(SO) $(top_builddir)/stubdata/$(LIB_ICUDATA_NAME)$(STUB_SUFFIX).$(SO)
-
-
+ 
+ 
+diff -Nura icu.orig/source/extra/uconv/Makefile.in icu/source/extra/uconv/Makefile.in
+--- icu.orig/source/extra/uconv/Makefile.in	2014-12-18 15:49:42.986626850 -0300
++++ icu/source/extra/uconv/Makefile.in	2014-12-18 15:57:40.558101179 -0300
+@@ -58,7 +58,8 @@
+ ## Static mode
+ ifeq ($(UCONVMSG_MODE),static)
+ DEFS += -DUCONVMSG_LINK=$(MSGNAME)
+-UCONVMSG_LIB = $(RESDIR)/$(LIBPREFIX)$(STATIC_PREFIX_WHEN_USED)$(MSGNAME).$(A)
++UCONVMSG_LIB = $(RESDIR)/$(LIBPREFIX)$(STATIC_PREFIX_WHEN_USED)@SYMBOL_PREFIX@$(MSGNAME).$(A)
++
+ LIBS += $(UCONVMSG_LIB)
+ PKGMODE=static
+ INSTALLTO=$(libdir)
+@@ -152,7 +153,7 @@
+ endif
+ 
+ $(UCONVMSG_LIB): $(RESFILES) $(RESDIR)/$(RESDIR).lst pkgdata.inc
+-	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(TOOLBINDIR)/pkgdata -p $(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
++	$(INVOKE) $(PKGDATA_INVOKE_OPTS) $(TOOLBINDIR)/pkgdata -p @SYMBOL_PREFIX@$(MSGNAME) $(PKGDATA_OPTS) -m $(PKGMODE) -s $(RESDIR) -d $(RESDIR) -T $(RESDIR) $(RESDIR)/$(RESDIR).lst
+ 
+ $(RESDIR)/$(RESDIR).lst: Makefile $(srcdir)/resfiles.mk
+ 	@-$(RMV) $@
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
new file mode 100644
index 0000000..4953513
--- /dev/null
+++ b/package/icu/icu.hash
@@ -0,0 +1,2 @@
+# From https://ssl.icu-project.org/files/icu4c/54.1/icu4c-src-54_1.md5
+md5	e844caed8f2ca24c088505b0d6271bc0	icu4c-54_1-src.tgz
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 2e7264f..0c554ca 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 51.2
+ICU_VERSION = 54.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
