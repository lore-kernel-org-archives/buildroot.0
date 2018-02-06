From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue,  6 Feb 2018 15:39:49 +0100
Subject: [Buildroot] [PATCH 1/4] openjdk: new package
In-Reply-To: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180206143952.12332-2-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build openjdk for a headless system without crazy dependencies.

Tested on Buildroot 2017.02.
Created in context of PowerPC.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/Config.in                                  |   1 +
 package/openjdk/Config.in                          |  30 +++++
 package/openjdk/openjdk.mk                         | 117 +++++++++++++++++
 .../openjdk8-find-compiler-fix-env-respect.patch   | 140 +++++++++++++++++++++
 ...8-fix-assembler-flag-handling-in-makefile.patch |  20 +++
 package/openjdk/openjdk8-fix-zero-mode-crash.patch |  49 ++++++++
 .../openjdk/openjdk8-no-genx11-in-headless.patch   |  17 +++
 package/openjdk/openjdk8-no-unused-deps.patch      |  94 ++++++++++++++
 .../openjdk/openjdk8-restrict-to-staging-dir.patch |  11 ++
 9 files changed, 479 insertions(+)
 create mode 100644 package/openjdk/Config.in
 create mode 100644 package/openjdk/openjdk.mk
 create mode 100644 package/openjdk/openjdk8-find-compiler-fix-env-respect.patch
 create mode 100644 package/openjdk/openjdk8-fix-assembler-flag-handling-in-makefile.patch
 create mode 100644 package/openjdk/openjdk8-fix-zero-mode-crash.patch
 create mode 100644 package/openjdk/openjdk8-no-genx11-in-headless.patch
 create mode 100644 package/openjdk/openjdk8-no-unused-deps.patch
 create mode 100644 package/openjdk/openjdk8-restrict-to-staging-dir.patch

diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..5746ca75a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -648,6 +648,7 @@ menu "Mono libraries/modules"
 endmenu
 endif
 	source "package/nodejs/Config.in"
+	source "package/openjdk/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
new file mode 100644
index 0000000000..f4e2c09776
--- /dev/null
+++ b/package/openjdk/Config.in
@@ -0,0 +1,30 @@
+comment "openjdk needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENJDK
+	bool "openjdk"
+	select BR2_NEEDS_HOST_JAR
+	select BR2_NEEDS_HOST_JAVAC
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBFFI
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
+	help
+	  OpenJDK JRE runtime.
+
+	  http://openjdk.java.net/
+
+if BR2_PACKAGE_OPENJDK
+
+config BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK
+	bool "Specify a custom boot JDK"
+	help
+	  A custom boot JDK passed via --with-boot-jdk
+	  (used to bootstrap build)
+
+config BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK_PATH
+	string "Path to boot JDK"
+	depends on BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK
+	help
+	  Path to custom boot JDK
+
+endif
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
new file mode 100644
index 0000000000..790a36ba8d
--- /dev/null
+++ b/package/openjdk/openjdk.mk
@@ -0,0 +1,117 @@
+################################################################################
+#
+# openjdk
+#
+################################################################################
+
+# Please be aware that, when cross-compiling, the OpenJDK configure script will
+# generally use 'target' where autoconf traditionally uses 'host'
+
+#Version is the same as OpenJDK HG tag
+OPENJDK_VERSION = jdk8u102-b14
+#Release is the same as OpenJDK repo
+OPENJDK_RELEASE = jdk8u
+OPENJDK_PROJECT = jdk8u
+
+OPENJDK_DOWNLOAD_SITE = http://hg.openjdk.java.net/$(OPENJDK_PROJECT)/$(OPENJDK_RELEASE)
+OPENJDK_SOURCE = $(OPENJDK_VERSION).tar.gz
+OPENJDK_SITE = $(OPENJDK_DOWNLOAD_SITE)/archive
+
+OPENJDK_DEPENDENCIES = host-pkgconf libffi freetype
+OPENJDK_LICENSE = GPLv2+ with classpath exception
+OPENJDK_LICENSE_FILES = LICENSE
+
+# Certain patches are taken from Yocto, see below listing from
+# directory: meta-java/recipes-core/openjdk/patches-openjdk-8
+# Note: patches needed to be postprocessed to add one directory component:
+#    find -name "*.patch" | xargs sed -i -e 's,--- ,--- a/,' -e 's,+++ ,+++ b/,'
+#
+# NOTNEEDED? dont-expect-fqpn-for-make.patch
+# NOTNEEDED? filter-aclocal-copy-too.patch
+# NOTNEEDED  openjdk8-add-missing-linker-flags.patch
+# TAKEN      openjdk8-find-compiler-fix-env-respect.patch
+# NOTNEEDED? openjdk8-fix-adlc-flags.patch
+# TAKEN      openjdk8-fix-assembler-flag-handling-in-makefile.patch
+# NOSHARKYET openjdk8-fix-shark-build.patch
+# NOSHARKYET openjdk8-fix-shark-stdc++11.patch
+# TAKEN      openjdk8-fix-zero-mode-crash.patch
+# TAKEN      openjdk8-no-genx11-in-headless.patch
+# TAKEN      openjdk8-no-unused-deps.patch
+# NOTNEEDED  openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch
+# TAKEN      openjdk8-restrict-to-staging-dir.patch
+# NOTNEEDED  openjdk8-silence-d_fortify_source-warning.patch
+# NOTNEEDED? remove-shell-variables-from-autoheader.patch
+
+OPENJDK_CONF_OPTS += \
+	--with-jvm-interpreter=cpp \
+	--with-jvm-variants=zero \
+	--enable-openjdk-only \
+	--with-debug-level=release \
+	--openjdk-target=$(GNU_TARGET_NAME) \
+	--with-sys-root=$(STAGING_DIR) \
+	--with-tools-dir=$(HOST_DIR) \
+	--enable-unlimited-crypto \
+	--disable-headful \
+	--with-extra-cflags="-DHEADLESS=true -Wno-error" \
+	--with-extra-cxxflags="-DHEADLESS=true -Wno-error" \
+	--with-x=no \
+
+ifeq ($(BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK),y)
+OPENJDK_CONF_OPTS += --with-boot-jdk=$(call qstrip,$(BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK_PATH))
+endif
+
+OPENJDK_MAKE_OPTS += BUILD_HEADLESS_ONLY=1 BUILD_HEADLESS=true \
+		     BUILD_SOUNDLESS_ONLY=1 X11_NOT_NEEDED=1 \
+		     CUPS_NOT_NEEDED=1 ALSA_NOT_NEEDED=1 PULSE_NOT_NEEDED=1 \
+
+OPENJDK_MAKE_ENV += X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes \
+		    PULSE_NOT_NEEDED=yes \
+		    BUILD_LD="$(HOSTCC)"
+
+# OpenJDK uses a mercurial forest structure
+# thankfully the various forests can be downloaded as individual .tar.gz files using
+# the following URL structure
+# http://hg.openjdk.java.net/$(OPENJDK_PROJECT)/archive/$(OPENJDK_VERSION).tar.bz2
+# http://hg.openjdk.java.net/$(OPENJDK_PROJECT)/corba/archive/$(OPENJDK_VERSION).tar.bz2
+# ...
+define OPENJDK_DOWNLOAD_CMDS
+$(foreach sub,hotspot corba jaxp jaxws jdk langtools nashorn,
+	$(call DOWNLOAD_INNER,$(OPENJDK_DOWNLOAD_SITE)/$(sub)/archive/$(OPENJDK_VERSION).tar.gz,openjdk-$(OPENJDK_RELEASE)-$(sub)-$(OPENJDK_VERSION).tar.gz,DOWNLOAD)
+)
+endef
+
+OPENJDK_POST_DOWNLOAD_HOOKS += OPENJDK_DOWNLOAD_CMDS
+
+define OPENJDK_POST_EXTRACT_CMDS
+$(foreach sub,hotspot corba jaxp jaxws jdk langtools nashorn,
+	mkdir $(@D)/$(sub) ;
+	$(TAR) --strip-components=1 -C $(@D)/$(sub) \
+		-z $(TAR_OPTIONS) $(DL_DIR)/openjdk-$(OPENJDK_RELEASE)-$(sub)-$(OPENJDK_VERSION).tar.gz ;
+)
+endef
+
+OPENJDK_POST_EXTRACT_HOOKS += OPENJDK_POST_EXTRACT_CMDS
+
+define OPENJDK_CONFIGURE_CMDS
+	cd $(@D) && bash common/autoconf/autogen.sh
+	cd $(@D) && $(OPENJDK_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) bash ./configure $(OPENJDK_CONF_OPTS)
+endef
+
+# TODO in post-patch step?
+define OPENJDK_CLEAN_X11_DEPENDENCY
+	rm -f $(@D)/jdk/src/solaris/classes/sun/awt/X11/*.java
+endef
+
+OPENJDK_PRE_BUILD_HOOKS += OPENJDK_CLEAN_X11_DEPENDENCY
+
+define OPENJDK_BUILD_CMDS
+	$(OPENJDK_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) JOBS=$(PARALLEL_JOBS) -C $(@D) $(OPENJDK_MAKE_OPTS) images
+endef
+
+define OPENJDK_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/jvm/
+	cp -arf $(@D)/build/*/images/j2re-image $(TARGET_DIR)/usr/lib/jvm/
+endef
+
+#openjdk configure is not based on automake
+$(eval $(generic-package))
diff --git a/package/openjdk/openjdk8-find-compiler-fix-env-respect.patch b/package/openjdk/openjdk8-find-compiler-fix-env-respect.patch
new file mode 100644
index 0000000000..d15e9705ba
--- /dev/null
+++ b/package/openjdk/openjdk8-find-compiler-fix-env-respect.patch
@@ -0,0 +1,140 @@
+--- a/common/autoconf/toolchain.m4.orig	2015-08-07 20:52:38.000000000 +0200
++++ b/common/autoconf/toolchain.m4	2015-10-27 13:57:19.708566525 +0100
+@@ -27,7 +27,7 @@
+ # $2 = human readable name of compiler (C or C++)
+ AC_DEFUN([TOOLCHAIN_CHECK_COMPILER_VERSION],
+ [
+-  COMPILER=[$]$1
++  COMPILER="[$]$1"
+   COMPILER_NAME=$2
+
+   if test "x$OPENJDK_TARGET_OS" = xsolaris; then
+@@ -123,64 +123,37 @@
+ [
+   COMPILER_NAME=$2
+
+-  $1=
++  FOUND_$1=
++
++  if test "x[$]$1" != "x"; then
++    FOUND_$1="[$]$1"
++  fi
++
+   # If TOOLS_DIR is set, check for all compiler names in there first
+   # before checking the rest of the PATH.
+-  if test -n "$TOOLS_DIR"; then
++  if test "x[$]FOUND_$1" = x -a -n "$TOOLS_DIR"; then
+     PATH_save="$PATH"
+     PATH="$TOOLS_DIR"
+     AC_PATH_PROGS(TOOLS_DIR_$1, $3)
+-    $1=$TOOLS_DIR_$1
++    FOUND_$1=$TOOLS_DIR_$1
+     PATH="$PATH_save"
+   fi
+
+   # AC_PATH_PROGS can't be run multiple times with the same variable,
+   # so create a new name for this run.
+-  if test "x[$]$1" = x; then
++  if test "x[$]FOUND_$1" = x; then
+     AC_PATH_PROGS(POTENTIAL_$1, $3)
+-    $1=$POTENTIAL_$1
++    FOUND_$1=$POTENTIAL_$1
+   fi
+
+-  if test "x[$]$1" = x; then
++  if test "x[$]FOUND_$1" = x; then
+     HELP_MSG_MISSING_DEPENDENCY([devkit])
+     AC_MSG_ERROR([Could not find a $COMPILER_NAME compiler. $HELP_MSG])
+   fi
+-  BASIC_FIXUP_EXECUTABLE($1)
+-  TEST_COMPILER="[$]$1"
+-  # Don't remove symbolic links on AIX because 'xlc_r' and 'xlC_r' may all be links
+-  # to 'xlc' but it is crucial that we invoke the compiler with the right name!
+-  if test "x$OPENJDK_BUILD_OS" != xaix; then
+-    AC_MSG_CHECKING([resolved symbolic links for $1])
+-    BASIC_REMOVE_SYMBOLIC_LINKS(TEST_COMPILER)
+-    AC_MSG_RESULT([$TEST_COMPILER])
+-  fi
+-  AC_MSG_CHECKING([if $1 is disguised ccache])
+-
+-  COMPILER_BASENAME=`$BASENAME "$TEST_COMPILER"`
+-  if test "x$COMPILER_BASENAME" = "xccache"; then
+-    AC_MSG_RESULT([yes, trying to find proper $COMPILER_NAME compiler])
+-    # We /usr/lib/ccache in the path, so cc is a symlink to /usr/bin/ccache.
+-    # We want to control ccache invocation ourselves, so ignore this cc and try
+-    # searching again.
+-
+-    # Remove the path to the fake ccache cc from the PATH
+-    RETRY_COMPILER_SAVED_PATH="$PATH"
+-    COMPILER_DIRNAME=`$DIRNAME [$]$1`
+-    PATH="`$ECHO $PATH | $SED -e "s,$COMPILER_DIRNAME,,g" -e "s,::,:,g" -e "s,^:,,g"`"
+-
+-    # Try again looking for our compiler
+-    AC_CHECK_TOOLS(PROPER_COMPILER_$1, $3)
+-    BASIC_FIXUP_EXECUTABLE(PROPER_COMPILER_$1)
+-    PATH="$RETRY_COMPILER_SAVED_PATH"
+-
+-    AC_MSG_CHECKING([for resolved symbolic links for $1])
+-    BASIC_REMOVE_SYMBOLIC_LINKS(PROPER_COMPILER_$1)
+-    AC_MSG_RESULT([$PROPER_COMPILER_$1])
+-    $1="$PROPER_COMPILER_$1"
+-  else
+-    AC_MSG_RESULT([no, keeping $1])
+-    $1="$TEST_COMPILER"
+-  fi
++  BASIC_FIXUP_EXECUTABLE(FOUND_$1)
++  TEST_COMPILER="[$]FOUND_$1"
++
++  $1="$TEST_COMPILER"
+   TOOLCHAIN_CHECK_COMPILER_VERSION([$1], [$COMPILER_NAME])
+ ])
+
+@@ -214,12 +187,12 @@
+     # otherwise we might pick up cross-compilers which don't use standard naming.
+     # Otherwise, we'll set the BUILD_tools to the native tools, but that'll have
+     # to wait until they are properly discovered.
+-    AC_PATH_PROGS(BUILD_CC, [cl cc gcc])
+-    BASIC_FIXUP_EXECUTABLE(BUILD_CC)
+-    AC_PATH_PROGS(BUILD_CXX, [cl CC g++])
+-    BASIC_FIXUP_EXECUTABLE(BUILD_CXX)
+-    AC_PATH_PROG(BUILD_LD, ld)
+-    BASIC_FIXUP_EXECUTABLE(BUILD_LD)
++    AS_IF([test "x${BUILD_CC}" = "x"], [AC_PATH_PROGS(BUILD_CC, [cl cc gcc])
++    BASIC_FIXUP_EXECUTABLE(BUILD_CC)])
++    AS_IF([test "x${BUILD_CXX}" = "x"], [AC_PATH_PROGS(BUILD_CXX, [cl CC g++])
++    BASIC_FIXUP_EXECUTABLE(BUILD_CXX)])
++    AS_IF([test "x${BUILD_LD}" = "x"], [AC_PATH_PROG(BUILD_LD, ld)
++    BASIC_FIXUP_EXECUTABLE(BUILD_LD)])
+   fi
+   AC_SUBST(BUILD_CC)
+   AC_SUBST(BUILD_CXX)
+--- a/common/autoconf/basics.m4.orig	2015-08-31 15:03:54.942975387 +0200
++++ b/common/autoconf/basics.m4	2015-08-31 15:02:25.090975049 +0200
+@@ -171,8 +171,15 @@
+       fi
+     fi
+
++    # First separate the path from the arguments. This will split at the first
++    # space.
++    complete="[$]$1"
++    path="${complete%% *}"
++    tmp="$complete EOL"
++    arguments="${tmp#* }"
++
+     if test "x$READLINK" != x; then
+-      $1=`$READLINK -f [$]$1`
++      new_path=`$READLINK -f $path`
+     else
+       # Save the current directory for restoring afterwards
+       STARTDIR=$PWD
+@@ -198,8 +205,9 @@
+         let COUNTER=COUNTER+1
+       done
+       cd $STARTDIR
+-      $1=$sym_link_dir/$sym_link_file
++      new_path=$sym_link_dir/$sym_link_file
+     fi
++    $1="$new_path ${arguments% *}"
+   fi
+ ])
+
diff --git a/package/openjdk/openjdk8-fix-assembler-flag-handling-in-makefile.patch b/package/openjdk/openjdk8-fix-assembler-flag-handling-in-makefile.patch
new file mode 100644
index 0000000000..e6948d463c
--- /dev/null
+++ b/package/openjdk/openjdk8-fix-assembler-flag-handling-in-makefile.patch
@@ -0,0 +1,20 @@
+Delay $CXX insertion until after make has evaluated the comma-separated list,
+as any comma separated parameters in CXX (such as assembler arguments) would
+break the build
+
+Signed-off-by: Erkka K??ri? <erkka.kaaria@intel.com>
+
+Upstream-Status: Pending
+
+---
+--- a/make/common/NativeCompilation.gmk
++++ b/make/common/NativeCompilation.gmk
+@@ -372,7 +372,7 @@ define SetupNativeCompilation
+   $$(foreach p,$$($1_SRCS), \
+       $$(eval $$(call add_native_source,$1,$$p,$$($1_OBJECT_DIR), \
+           $$($1_CFLAGS) $$($1_EXTRA_CFLAGS),$$($1_CC), \
+-          $$($1_CXXFLAGS) $$($1_EXTRA_CXXFLAGS),$(CXX),$$($1_ASFLAGS))))
++          $$($1_CXXFLAGS) $$($1_EXTRA_CXXFLAGS),$$(CXX),$$($1_ASFLAGS))))
+
+   # On windows we need to create a resource file
+   ifeq ($(OPENJDK_TARGET_OS), windows)
diff --git a/package/openjdk/openjdk8-fix-zero-mode-crash.patch b/package/openjdk/openjdk8-fix-zero-mode-crash.patch
new file mode 100644
index 0000000000..ef40bc6372
--- /dev/null
+++ b/package/openjdk/openjdk8-fix-zero-mode-crash.patch
@@ -0,0 +1,49 @@
+# HG changeset patch
+# User aph
+# Date 1461121375 -3600
+#      Wed Apr 20 04:02:55 2016 +0100
+# Node ID 6811f311f905409fe71d2b1c2fb34c3268758724
+# Parent  c66e4cc0fce57664ab44c55c47fa1a2f1bf02638
+8154210: Zero: Better byte behaviour
+Summary: Complete support for 8132051 on Zero and fix failure on 64-bit big-endian systems
+Reviewed-by: andrew, chrisphi, coleenp
+
+Upstream-Status: Backport [Fixed in u112]
+
+diff --git hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
+--- a/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
++++ b/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
+@@ -220,9 +220,16 @@
+   // Push our result
+   for (int i = 0; i < result_slots; i++) {
+     // Adjust result to smaller
+-    intptr_t res = result[-i];
++    union {
++      intptr_t res;
++      jint res_jint;
++    };
++    res = result[-i];
+     if (result_slots == 1) {
+-      res = narrow(method->result_type(), res);
++      BasicType t = method->result_type();
++      if (is_subword_type(t)) {
++        res_jint = (jint)narrow(t, res_jint);
++      }
+     }
+     stack->push(res);
+   }
+diff --git hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp
+--- a/hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp
++++ b/hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp
+@@ -593,8 +593,9 @@
+ /* 0xDC */ &&opc_default,     &&opc_default,        &&opc_default,      &&opc_default,
+
+ /* 0xE0 */ &&opc_default,     &&opc_default,        &&opc_default,      &&opc_default,
+-/* 0xE4 */ &&opc_default,     &&opc_fast_aldc,      &&opc_fast_aldc_w,  &&opc_return_register_finalizer,
+-/* 0xE8 */ &&opc_invokehandle,&&opc_default,        &&opc_default,      &&opc_default,
++/* 0xE4 */ &&opc_default,     &&opc_default,        &&opc_fast_aldc,    &&opc_fast_aldc_w,
++/* 0xE8 */ &&opc_return_register_finalizer,
++                              &&opc_invokehandle,   &&opc_default,      &&opc_default,
+ /* 0xEC */ &&opc_default,     &&opc_default,        &&opc_default,      &&opc_default,
+
+ /* 0xF0 */ &&opc_default,     &&opc_default,        &&opc_default,      &&opc_default,
diff --git a/package/openjdk/openjdk8-no-genx11-in-headless.patch b/package/openjdk/openjdk8-no-genx11-in-headless.patch
new file mode 100644
index 0000000000..5a9f9056ad
--- /dev/null
+++ b/package/openjdk/openjdk8-no-genx11-in-headless.patch
@@ -0,0 +1,17 @@
+--- a/jdk/make/GenerateSources.gmk.orig	2015-08-24 11:23:34.720648954 +0200
++++ b/jdk/make/GenerateSources.gmk	2015-08-24 11:24:41.376649205 +0200
+@@ -73,9 +73,11 @@
+     GENSRC += $(GENSRC_OSX_ICONS)
+   endif
+
+-  ifneq ($(OPENJDK_TARGET_OS), macosx)
+-    include gensrc/GensrcX11Wrappers.gmk
+-    GENSRC += $(GENSRC_X11WRAPPERS)
++  ifndef BUILD_HEADLESS_ONLY
++    ifneq ($(OPENJDK_TARGET_OS), macosx)
++      include gensrc/GensrcX11Wrappers.gmk
++      GENSRC += $(GENSRC_X11WRAPPERS)
++    endif
+   endif
+ endif
+
diff --git a/package/openjdk/openjdk8-no-unused-deps.patch b/package/openjdk/openjdk8-no-unused-deps.patch
new file mode 100644
index 0000000000..c76eae9f20
--- /dev/null
+++ b/package/openjdk/openjdk8-no-unused-deps.patch
@@ -0,0 +1,94 @@
+--- a/jdk/make/lib/Awt2dLibraries.gmk.orig	2015-09-03 15:05:21.429981848 +0200
++++ b/jdk/make/lib/Awt2dLibraries.gmk	2015-09-03 15:05:44.705981936 +0200
+@@ -235,6 +235,10 @@
+   LIBAWT_DIRS += $(JDK_TOPDIR)/src/aix/porting
+ endif
+
++ifdef BUILD_HEADLESS_ONLY
++LIBAWT_CFLAGS += -DHEADLESS=true
++endif
++
+ LIBAWT_CFLAGS += -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES \
+     $(X_CFLAGS) \
+     $(foreach dir, $(LIBAWT_DIRS), -I$(dir))
+@@ -1126,17 +1130,28 @@
+           -F/System/Library/Frameworks/ApplicationServices.framework/Frameworks
+     endif
+
+-    LIBAWT_HEADLESS_FILES := \
+-        awt_Font.c \
+-        HeadlessToolkit.c \
+-        fontpath.c \
+-        VDrawingArea.c \
++    ifndef X11_NOT_NEEDED
++    LIBAWT_HEADLESS_X11_FILES := \
+         X11Color.c \
+         X11Renderer.c \
+         X11PMBlitLoops.c \
+         X11SurfaceData.c \
+         X11FontScaler_md.c \
+         X11TextRenderer_md.c \
++        GLXGraphicsConfig.c \
++        GLXSurfaceData.c
++    endif
++
++    ifndef CUPS_NOT_NEEDED
++    LIBAWT_HEADLESS_CUPS_FILES := \
++        CUPSfuncs.c
++    endif
++
++    LIBAWT_HEADLESS_FILES := \
++        awt_Font.c \
++        HeadlessToolkit.c \
++        fontpath.c \
++        VDrawingArea.c \
+         OGLBlitLoops.c \
+         OGLBufImgOps.c \
+         OGLContext.c \
+@@ -1149,10 +1164,9 @@
+         OGLSurfaceData.c \
+         OGLTextRenderer.c \
+         OGLVertexCache.c \
+-        GLXGraphicsConfig.c \
+-        GLXSurfaceData.c \
+         AccelGlyphCache.c \
+-        CUPSfuncs.c
++	$(LIBAWT_HEADLESS_X11_FILES) \
++	$(LIBAWT_HEADLESS_CUPS_FILES)
+
+     LIBAWT_HEADLESS_REORDER :=
+     ifeq ($(OPENJDK_TARGET_OS), solaris)
+--- a/jdk/make/CompileNativeLibraries.gmk.orig	2015-08-24 13:35:55.320678845 +0200
++++ b/jdk/make/CompileNativeLibraries.gmk	2015-08-24 13:36:22.776678949 +0200
+@@ -85,7 +85,9 @@
+
+ include lib/Awt2dLibraries.gmk
+
++ifndef BUILD_SOUNDLESS_ONLY
+ include lib/SoundLibraries.gmk
++endif
+
+ # Include the corresponding custom file, if present.
+ -include $(CUSTOM_MAKE_DIR)/CompileNativeLibraries.gmk
+--- a/jdk/src/solaris/native/sun/awt/jawt.c.orig	2015-08-24 14:12:29.376687104 +0200
++++ b/jdk/src/solaris/native/sun/awt/jawt.c	2015-08-24 14:16:20.420687974 +0200
+@@ -33,7 +33,7 @@
+  */
+ JNIEXPORT jboolean JNICALL JAWT_GetAWT(JNIEnv* env, JAWT* awt)
+ {
+-#if defined(JAVASE_EMBEDDED) && defined(HEADLESS)
++#if defined(JAVASE_EMBEDDED) || defined(HEADLESS)
+     /* there are no AWT libs available at all */
+     return JNI_FALSE;
+ #else
+--- a/jdk/src/solaris/native/sun/awt/utility/rect.h.orig	2015-09-03 14:45:40.717977403 +0200
++++ b/jdk/src/solaris/native/sun/awt/utility/rect.h	2015-09-03 14:46:46.337977650 +0200
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+
+-#ifndef MACOSX
++#if !(defined(MACOSX) || defined(HEADLESS))
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
diff --git a/package/openjdk/openjdk8-restrict-to-staging-dir.patch b/package/openjdk/openjdk8-restrict-to-staging-dir.patch
new file mode 100644
index 0000000000..aa78a54fc8
--- /dev/null
+++ b/package/openjdk/openjdk8-restrict-to-staging-dir.patch
@@ -0,0 +1,11 @@
+--- a/hotspot/make/linux/makefiles/dtrace.make.orig	2015-09-01 08:00:59.737868760 +0200
++++ b/hotspot/make/linux/makefiles/dtrace.make	2015-09-01 08:01:24.049859677 +0200
+@@ -40,7 +40,7 @@
+ ifneq ($(ALT_SDT_H),)
+   SDT_H_FILE = $(ALT_SDT_H)
+ else
+-  SDT_H_FILE = /usr/include/sys/sdt.h
++  SDT_H_FILE = $(SYS_ROOT)/usr/include/sys/sdt.h
+ endif
+ DTRACE_ENABLED = $(shell test -f $(SDT_H_FILE) && echo $(SDT_H_FILE))
+ REASON = "$(SDT_H_FILE) not found"
-- 
2.13.6
