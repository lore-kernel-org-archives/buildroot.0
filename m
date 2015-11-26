From: Alexey Galakhov <agalakhov@gmail.com>
Date: Thu, 26 Nov 2015 15:50:04 +0100
Subject: [Buildroot] [PATCH 1/1] core: add option to force compiling C++ as
	C++11
Message-ID: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many C++ libraries like boost and log4cplus use defines to be compatible with
both C++03 and C++11 standards. This causes ABI incompatibilities between
a library built with C++03 and an application built with C++11. To avoid this,
one has to built libraries as C++11 as well.

This patch introduces the BR2_ENABLE_CPP11 configuration option that forces
passing --std=c++11 to the compiler while building C++ target libraries.

Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>
---
 Config.in           | 16 ++++++++++++++++
 package/Makefile.in | 12 +++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d795361..79e4d31 100644
--- a/Config.in
+++ b/Config.in
@@ -533,6 +533,22 @@ config BR2_ENABLE_SSP
 comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
+config BR2_ENABLE_CPP11
+	bool "force C++11 when building libraries"
+	default n
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+	help
+	  Force building of C++ libraries in C++11 mode.
+
+	  Some C++ libraries (i.e. boost) behave differently if compiled with
+	  and without --std=c++11 flag. They define classes differently. This
+	  causes linker errors while trying to use such a library in a C++11
+	  project.
+
+	  This option forces building of all such libraries in C++11 mode.
+	  Enable it if you encounter C++11-related linker errors.
+
 choice
 	bool "libraries"
 	default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
diff --git a/package/Makefile.in b/package/Makefile.in
index 85008bb..0bb911e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -135,9 +135,19 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
 
+ifeq ($(BR2_ENABLE_CPP11),y)
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+TARGET_CXXLANGUAGE = --std=c++11
+else
+TARGET_CXXLANGUAGE = --std=c++0x
+endif
+else
+TARGET_CXXLANGUAGE =
+endif
+
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
-TARGET_CXXFLAGS = $(TARGET_CFLAGS)
+TARGET_CXXFLAGS = $(TARGET_CFLAGS) $(TARGET_CXXLANGUAGE)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-- 
2.6.2
