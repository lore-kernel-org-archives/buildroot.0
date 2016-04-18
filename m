From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:51:00 +0200
Subject: [Buildroot] [git commit] qt5webkit: restore package
Message-ID: <20160418205144.4414681D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8dbdbd1002236962e73cad0da0a5ed1ab037cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although this package has been removed from the official release
packages since Qt5.6.0, it is still available for users to build
it from source. This is useful for platforms without GPU since its
successor (QtWebEngine) requires OpenGL support.

The package now matches the community-based meta-qt5 Yocto layer,
using the exact same revision of the qtwebkit source from github:
https://github.com/meta-qt5/meta-qt5/commit/e434995a

Here is the project source tree:
https://github.com/qtproject/qtwebkit

All the patches have been pulled from Yocto as well.

Since we are now using the source from the git repository, we need
to create an empty .git/ folder to force the headers re-generation.
https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33

Note that GPLv3 license option has been added with this release.

Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas: fix license to be LGPLv2.1+, not LGPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 --
 package/qt5/Config.in                              |  1 +
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 36 +++++++++
 .../qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch | 85 ++++++++++++++++++++++
 ...ude-backtrace-API-for-non-glibc-libraries.patch | 44 +++++++++++
 .../0004-Fix-linking-with-libpthread.patch         | 34 +++++++++
 package/qt5/qt5webkit/Config.in                    | 28 +++++++
 package/qt5/qt5webkit/qt5webkit.hash               |  2 +
 package/qt5/qt5webkit/qt5webkit.mk                 | 66 +++++++++++++++++
 9 files changed, 296 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 60702ce..6691c50 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,13 +152,6 @@ config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 	  The qt5webkit-examples package has been removed, since it
 	  was removed from upstream starting from Qt 5.6.
 
-config BR2_PACKAGE_QT5WEBKIT
-	bool "qt5webkit package removed"
-	select BR2_LEGACY
-	help
-	  The qt5webkit package has been removed, since it was removed
-	  from upstream starting from Qt 5.6.
-
 config BR2_PACKAGE_QT5QUICK1
 	bool "qt5quick1 package removed"
 	select BR2_LEGACY
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index d99d551..84cbb0f 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -54,4 +54,5 @@ comment "technology preview"
 source "package/qt5/qt5quickcontrols2/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
+source "package/qt5/qt5webkit/Config.in"
 endif
diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
new file mode 100644
index 0000000..669c7e6
--- /dev/null
+++ b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -0,0 +1,36 @@
+From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <trevor.woerner@linaro.org>
+Date: Fri, 7 Feb 2014 04:07:17 +0100
+Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
+
+Building qtwebkit causes a QA issue such that QtWebPluginProcess and
+QtWebProcess contain bad RPATHs which point into the build location. This fix
+adds a patch to not include the rpath.prf which causes this problem.
+
+Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Downloaded from:
+https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
+0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
+index fd66af6..ef754c3 100644
+--- a/Tools/qmake/mkspecs/features/unix/default_post.prf
++++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
+@@ -61,7 +61,6 @@ linux-*g++* {
+     }
+ }
+ 
+-contains(TEMPLATE, app): CONFIG += rpath
+ 
+ CONFIG(debug, debug|release)|force_debug_info {
+     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
+-- 
+2.7.0
+
diff --git a/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch b/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
new file mode 100644
index 0000000..14352a1
--- /dev/null
+++ b/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -0,0 +1,85 @@
+From ae16ce17cc7060274a0b0c165b953fc32540f977 Mon Sep 17 00:00:00 2001
+From: Magnus Granberg <zorry@gentoo.org>
+Date: Fri, 27 Feb 2015 11:55:09 +0100
+Subject: [PATCH] Remove TEXTREL tag in x86
+
+Fix textrel QA warnings when building qtwebkit for x86:
+
+  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
+
+Patch from upstream webkit:
+
+  https://bugs.webkit.org/show_bug.cgi?id=70610
+
+Minor refresh required to apply cleanly to the older webkit sources used
+by qtwebkit. Specifically, the patch needed to be modified to account
+for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
+part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
+
+Upstream status [webkit] : backport
+Upstream status [qtwebkit] : unclear
+
+Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Downloaded from:
+https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
+0002-Remove-TEXTREL-tag-in-x86.patch
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
+ Source/WTF/wtf/InlineASM.h                    |  2 ++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+index 9684df2..8af82d8 100644
+--- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
++++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+@@ -524,6 +524,30 @@ double jsRound(double d)
+     } \
+     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
+ 
++#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
++#define defineUnaryDoubleOpWrapper(function) \
++    asm( \
++        ".text\n" \
++        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
++        HIDE_SYMBOL(function##Thunk) "\n" \
++        SYMBOL_STRING(function##Thunk) ":" "\n" \
++        "pushl %ebx\n" \
++        "subl $20, %esp\n" \
++        "movsd %xmm0, (%esp) \n" \
++        "call __x86.get_pc_thunk.bx\n" \
++        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
++        "call " GLOBAL_REFERENCE(function) "\n" \
++        "fstpl (%esp) \n" \
++        "movsd (%esp), %xmm0 \n" \
++        "addl $20, %esp\n" \
++        "popl %ebx\n" \
++        "ret\n" \
++    );\
++    extern "C" { \
++        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
++    } \
++    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
++
+ #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
+ #define defineUnaryDoubleOpWrapper(function) \
+     asm( \
+diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
+index 0a2fe78..2dc40ef 100644
+--- a/Source/WTF/wtf/InlineASM.h
++++ b/Source/WTF/wtf/InlineASM.h
+@@ -46,6 +46,8 @@
+ #define GLOBAL_REFERENCE(name) #name "@plt"
+ #elif CPU(X86) && COMPILER(MINGW)
+ #define GLOBAL_REFERENCE(name) "@" #name "@4"
++#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
++#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
+ #else
+ #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
+ #endif
+-- 
+2.7.0
+
diff --git a/package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
new file mode 100644
index 0000000..a2597a5
--- /dev/null
+++ b/package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -0,0 +1,44 @@
+From 6c36f0ff8c1f5852c33d2b23714f9f187cc6ff26 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jun 2015 19:55:05 -0700
+Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
+
+It was excluding musl with current checks, so lets make it such that it
+considers only glibc when using backtrace API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Downloaded from:
+https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
+0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Source/WTF/wtf/Assertions.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
+index 1b2091f..ba03a28 100644
+--- a/Source/WTF/wtf/Assertions.cpp
++++ b/Source/WTF/wtf/Assertions.cpp
+@@ -61,7 +61,7 @@
+ #include <windows.h>
+ #endif
+ 
+-#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
++#if (OS(DARWIN) || (OS(LINUX) && defined (__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
+ #include <cxxabi.h>
+ #include <dlfcn.h>
+ #include <execinfo.h>
+@@ -245,7 +245,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
+ 
+ void WTFGetBacktrace(void** stack, int* size)
+ {
+-#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
++#if (OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
+     *size = backtrace(stack, *size);
+ #elif OS(WINDOWS) && !OS(WINCE)
+     // The CaptureStackBackTrace function is available in XP, but it is not defined
+-- 
+2.7.0
+
diff --git a/package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch b/package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
new file mode 100644
index 0000000..b7b6791
--- /dev/null
+++ b/package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
@@ -0,0 +1,34 @@
+From 5dd4bb67cfce812fd7686e43616e2069f354a7df Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+Date: Mon, 22 Feb 2016 10:57:32 +0100
+Subject: [PATCH] Fix linking with libpthread
+
+WebKit use libpthread directly but is depending on other qt modules
+causing it to be linked against, which might break unless -lpthread
+is last. Instead just add it explicitly after the static libraries.
+
+Upstream-Status: Backport from 5.7 branch
+
+Change-Id: I2b95cff2c96373f8dce6f95052c4fccbe1982b33
+Reviewed-by: Simon Hausmann <simon.hausmann@theqtcompany.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Tools/qmake/mkspecs/features/default_post.prf | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Tools/qmake/mkspecs/features/default_post.prf b/Tools/qmake/mkspecs/features/default_post.prf
+index 67276b7..39bb3f7 100644
+--- a/Tools/qmake/mkspecs/features/default_post.prf
++++ b/Tools/qmake/mkspecs/features/default_post.prf
+@@ -201,6 +201,7 @@ needToLink() {
+         linkAgainstLibrary($$library, $$eval(WEBKIT.$${library_identifier}.root_source_dir))
+         LIBS += $$eval(WEBKIT.$${library_identifier}.dependent_libs)
+     }
++    posix:!darwin: LIBS += -lpthread
+ }
+ 
+ creating_module {
+-- 
+2.7.1
+
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
new file mode 100644
index 0000000..7add5f9
--- /dev/null
+++ b/package/qt5/qt5webkit/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_QT5WEBKIT
+	bool "qt5webkit"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_ICU
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_BINFMT_FLAT # icu
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5webkit module.
+
+	  This package has been removed from the official release packages
+	  since Qt5.6.0, but it is still available for users to build it
+	  from source. This is useful for platforms without GPU since the
+	  successor (QtWebEngine) requires OpenGL support.
+
+	  http://qt.io
+
+comment "qt5webkit needs a toolchain w/ dynamic library"
+        depends on BR2_STATIC_LIBS
+        depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+        depends on !BR2_BINFMT_FLAT
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
new file mode 100644
index 0000000..d2ac7bb
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 1c79843ef32313312290d4fe0b87256a9129dc44d62b01789a692981edf4d8ab  qt5webkit-d2ff5a085572b1ee24dcb42ae107063f3142d14e.tar.gz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
new file mode 100644
index 0000000..629e40a
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# qt5webkit
+#
+################################################################################
+
+QT5WEBKIT_VERSION = d2ff5a085572b1ee24dcb42ae107063f3142d14e
+# Using GitHub since it supports downloading tarballs from random commits.
+# The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
+QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
+QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-flex
+QT5WEBKIT_INSTALL_STAGING = YES
+
+QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBKIT_LICENSE = LGPLv2.1+, BSD-3c, BSD-2c
+# Source files contain references to LGPL_EXCEPTION.txt but it is not included
+# in the archive.
+QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
+else
+QT5WEBKIT_LICENSE = LGPLv2.1+ (WebCore), Commercial license
+QT5WEBKIT_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBKIT_DEPENDENCIES += qt5declarative
+endif
+
+# Since we get the source from git, generated header files are not included.
+# qmake detects that header file generation (using the syncqt tool) must be
+# done based on the existence of a .git directory (cfr. the git_build config
+# option which is set in qt_build_paths.prf).
+# So, to make sure that qmake detects that header files must be generated,
+# create an empty .git directory.
+define QT5WEBKIT_CONFIGURE_CMDS
+	mkdir -p $(@D)/.git
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBKIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBKIT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WEBKIT_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+define QT5WEBKIT_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
+	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
+endef
+
+$(eval $(generic-package))
