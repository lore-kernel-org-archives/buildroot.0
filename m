From: Chris Wardman <cjwfirmware@vxmdesign.com>
Date: Sun, 13 Sep 2015 03:02:48 -0400
Subject: [Buildroot] [PATCH 3/3] Adding support for uclibcpp library
In-Reply-To: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <1442127768-26447-3-git-send-email-cjwfirmware@vxmdesign.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibcpp is built as an alternative to the standard libstdc++ library
It provides the support for c++ with a smaller memory footprint.
Right now it depends on newlib, because it has only been tested against newlib

Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
---
 .../uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch | 63 ++++++++++++++++++++++
 package/uclibcpp/Config.in                         |  9 ++++
 package/uclibcpp/uclibcpp.config                   | 54 +++++++++++++++++++
 package/uclibcpp/uclibcpp.mk                       | 28 ++++++++++
 toolchain/Config.in                                |  1 +
 5 files changed, 155 insertions(+)
 create mode 100644 package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch
 create mode 100644 package/uclibcpp/Config.in
 create mode 100644 package/uclibcpp/uclibcpp.config
 create mode 100644 package/uclibcpp/uclibcpp.mk

diff --git a/package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch b/package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch
new file mode 100644
index 0000000..851b87e
--- /dev/null
+++ b/package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch
@@ -0,0 +1,63 @@
+Minor fixes so uclibcpp compiles. 
+
+I have no clude why they wrote the Unwind_Exception_Class variable that way, but that doesn't compile
+
+uclibcpp needs isspace which is not provided otherwise
+
+Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
+
+
+diff -uNr uClibc++-0.2.4/include/unwind-cxx.h uc_new/include/unwind-cxx.h
+--- uClibc++-0.2.4/include/unwind-cxx.h	2012-05-25 17:15:31.000000000 -0400
++++ uc_new/include/unwind-cxx.h	2015-01-15 16:29:05.358633886 -0500
+@@ -172,15 +172,7 @@
+ // These are explicitly GNU C++ specific.
+ 
+ // This is the exception class we report -- "GNUCC++\0".
+-const _Unwind_Exception_Class __gxx_exception_class
+-= ((((((((_Unwind_Exception_Class) 'G' 
+-	 << 8 | (_Unwind_Exception_Class) 'N')
+-	<< 8 | (_Unwind_Exception_Class) 'U')
+-       << 8 | (_Unwind_Exception_Class) 'C')
+-      << 8 | (_Unwind_Exception_Class) 'C')
+-     << 8 | (_Unwind_Exception_Class) '+')
+-    << 8 | (_Unwind_Exception_Class) '+')
+-   << 8 | (_Unwind_Exception_Class) '\0');
++  const _Unwind_Exception_Class __gxx_exception_class = "GNUCC++";
+ 
+ // GNU C++ personality routine, Version 0.
+ extern "C" _Unwind_Reason_Code __gxx_personality_v0
+diff -uNr uClibc++-0.2.4/Rules.mak uc_new/Rules.mak
+--- uClibc++-0.2.4/Rules.mak	2012-05-25 17:15:31.000000000 -0400
++++ uc_new/Rules.mak	2015-01-15 16:29:05.358633886 -0500
+@@ -107,7 +107,7 @@
+ 
+ # Some nice CFLAGS to work with
+ GEN_CFLAGS:=-fno-builtin
+-CFLAGS:=$(XWARNINGS) $(CPU_CFLAGS) -ansi
++CFLAGS:=$(XWARNINGS) $(CPU_CFLAGS)
+ 
+ LDFLAGS:=-Wl,--warn-common -Wl,--warn-once -Wl,-z,combreloc -Wl,-z,defs
+ 
+diff -uNr uClibc++-0.2.4/src/_ct_chr.cpp uc_new/src/_ct_chr.cpp
+--- uClibc++-0.2.4/src/_ct_chr.cpp	1969-12-31 19:00:00.000000000 -0500
++++ uc_new/src/_ct_chr.cpp	2015-01-15 16:29:21.478634145 -0500
+@@ -0,0 +1,18 @@
++#include <_ansi.h>
++#include <ctype.h>
++
++int _DEFUN(isspace, (c),int c){
++  switch(c){
++  case ' ': 
++  case '\r':
++  case '\n':
++  case '\b':
++  case '\t':
++    return true;
++  }
++  return false;
++}
++
++int _DEFUN(isdigit, (c), int c){
++  return ('0' <= c && c <= '9');
++}
diff --git a/package/uclibcpp/Config.in b/package/uclibcpp/Config.in
new file mode 100644
index 0000000..d0a962a
--- /dev/null
+++ b/package/uclibcpp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UCLIBCPP
+       bool "uClibc++ C++ library"
+       depends on BR2_TOOLCHAIN_BUILDROOT_NEWLIB
+       depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+       help
+	Uclibc++ library support. Smaller than libvstdc++
+
+
+
diff --git a/package/uclibcpp/uclibcpp.config b/package/uclibcpp/uclibcpp.config
new file mode 100644
index 0000000..4e2d0ec
--- /dev/null
+++ b/package/uclibcpp/uclibcpp.config
@@ -0,0 +1,54 @@
+#
+# Automatically generated make config: don't edit
+#
+
+#
+# Target Features and Options
+#
+UCLIBCXX_HAS_FLOATS=y
+UCLIBCXX_HAS_LONG_DOUBLE=y
+UCLIBCXX_HAS_TLS=y
+WARNINGS="-Wall"
+BUILD_EXTRA_LIBRARIES=""
+HAVE_DOT_CONFIG=y
+
+#
+# String and I/O Stream Support
+#
+# UCLIBCXX_HAS_WCHAR is not set
+UCLIBCXX_IOSTREAM_BUFSIZE=32
+UCLIBCXX_HAS_LFS=y
+UCLIBCXX_SUPPORT_CDIR=y
+UCLIBCXX_SUPPORT_CIN=y
+UCLIBCXX_SUPPORT_COUT=y
+UCLIBCXX_SUPPORT_CERR=y
+# UCLIBCXX_SUPPORT_CLOG is not set
+
+#
+# STL and Code Expansion
+#
+UCLIBCXX_STL_BUFFER_SIZE=32
+UCLIBCXX_CODE_EXPANSION=y
+UCLIBCXX_EXPAND_CONSTRUCTORS_DESTRUCTORS=y
+UCLIBCXX_EXPAND_STRING_CHAR=y
+UCLIBCXX_EXPAND_VECTOR_BASIC=y
+UCLIBCXX_EXPAND_IOS_CHAR=y
+UCLIBCXX_EXPAND_STREAMBUF_CHAR=y
+UCLIBCXX_EXPAND_ISTREAM_CHAR=y
+UCLIBCXX_EXPAND_OSTREAM_CHAR=y
+UCLIBCXX_EXPAND_FSTREAM_CHAR=y
+UCLIBCXX_EXPAND_SSTREAM_CHAR=y
+
+#
+# Library Installation Options
+#
+UCLIBCXX_RUNTIME_PREFIX="/usr"
+UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include"
+UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib"
+UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin"
+UCLIBCXX_EXCEPTION_SUPPORT=y
+IMPORT_LIBSUP=y
+# IMPORT_LIBGCC_EH is not set
+BUILD_STATIC_LIB=y
+BUILD_ONLY_STATIC_LIB=y
+# DODEBUG is not set
diff --git a/package/uclibcpp/uclibcpp.mk b/package/uclibcpp/uclibcpp.mk
new file mode 100644
index 0000000..dfe8ede
--- /dev/null
+++ b/package/uclibcpp/uclibcpp.mk
@@ -0,0 +1,28 @@
+UCLIBCPP_VERSION = 0.2.4
+UCLIBCPP_SOURCE = uClibc++-$(UCLIBCPP_VERSION).tar.bz2
+UCLIBCPP_LICENSE = LGPLv3
+UCLIBCPP_SITE = http://cxx.uclibc.org/src/
+
+UCLIBCPP_INSTALL_STAGING = YES
+
+UCLIBCPP_DEPENDENCIES = host-gcc-final
+
+UCLIBCPP_KCONFIG_FILE = $(TOPDIR)/package/uclibcpp/uclibcpp.config
+
+UCLIBCPP_MAKE_FLAGS = CROSS=$(TARGET_CROSS)
+
+define UCLIBCPP_BUILD_CMDS
+	$(MAKE) -C $(@D) $(UCLIBCPP_MAKE_FLAGS)
+endef
+
+define UCLIBCPP_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(STAGING_DIR) install
+endef
+
+define UCLIBCPP_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
+endef
+
+$(eval $(kconfig-package))
+
+
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 88ebe8c..3904f44 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -60,5 +60,6 @@ endchoice
 source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
 source "toolchain/toolchain-common.in"
+source "package/uclibcpp/Config.in"
 
 endmenu
-- 
1.9.1
