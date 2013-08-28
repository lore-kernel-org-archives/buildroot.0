From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 08:35:31 +0200
Subject: [Buildroot] [PATCH 12/12] toolchain: improve mudflap support
In-Reply-To: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377671731-28656-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mudflap library is only useful if one uses the -fmudflap gcc
option, to do more checks on pointers/arrays, which is typically not
the case.

This commit:

 * Adds an option to enable/disable mudflap support at the gcc
   level. By default, it is disabled, which saves a little bit of
   build time.

 * Adds a way for the external toolchain backend to tell whether
   mudflap is supported or not by the external toolchain.

 * Adds a global BR2_TOOLCHAIN_HAS_MUDFLAP hidden option, that
   indicates whether the toolchain (internal or external) supports
   mudflap.

 * Adds a global BR2_ENABLE_MUDFLAP in "Build options" that allows the
   user to build all packages with mudflap support. It depends on
   BR2_TOOLCHAIN_HAS_MUDFLAP.

WARNING WARNING: this currently doesn't result into a working system,
even with just Busybox. Busybox init crashes with "/sbin/init: symbol
lookup error: /lib/libmudflapth.so.0: undefined symbol:
main". According to
http://gcc.gnu.org/ml/gcc-help/2008-03/msg00165.html it is caused by
-Wl,--gc-sections (which is used by Busybox), but even after removing
it, it still doesn't work. I don't personaly have much interest in
mudflap support, so as I couldn't get it to work easily, my suggestion
would be to drop support for it entirely, unless someone steps up to
fix this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                | 20 ++++++++++++++++++++
 package/Makefile.in                      | 12 ++++++++++++
 package/gcc/Config.in.host               | 13 +++++++++++++
 package/gcc/gcc-final/gcc-final.mk       |  8 ++++++++
 package/gcc/gcc.mk                       |  6 ++++++
 toolchain/helpers.mk                     | 12 ++++++++++++
 toolchain/toolchain-common.in            |  3 +++
 toolchain/toolchain-external/Config.in   |  9 +++++++++
 toolchain/toolchain-external/ext-tool.mk | 11 +++++++++++
 9 files changed, 94 insertions(+)

diff --git a/Config.in b/Config.in
index 590c013..2ffdfc5 100644
--- a/Config.in
+++ b/Config.in
@@ -415,6 +415,26 @@ config BR2_ENABLE_SSP
 comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
+config BR2_ENABLE_MUDFLAP
+	bool "build code with Mudflap pointer debugging"
+	depends on BR2_TOOLCHAIN_HAS_MUDFLAP
+	help
+	   Instrument all risky pointer/array dereferencing
+	   operations, some standard library string/heap functions,
+	   and some other associated constructs with range/validity
+	   tests.  Modules so instrumented should be immune to buffer
+	   overflows, invalid heap use, and some other classes of
+	   C/C++ programming errors.
+
+	   See http://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging for
+	   more details.
+
+	   Note that this requires the toolchain to have Mudflap
+	   support.
+
+comment "enabling Mudflap pointer debugging requires support in the toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_MUDFLAP
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index 3eaa2b2..194da11 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -134,6 +134,18 @@ TARGET_CFLAGS += -fstack-protector-all
 TARGET_CXXFLAGS += -fstack-protector-all
 endif
 
+ifeq ($(BR2_ENABLE_MUDFLAP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+TARGET_CFLAGS += -fmudflapth
+TARGET_CXXFLAGS += fmudflapth
+TARGET_LDFLAGS += -fmudflapth -ldl -lpthread -lmudflapth
+else
+TARGET_CFLAGS += -fmudflap
+TARGET_CXXFLAGS += -fmudflap
+TARGET_LDFLAGS += -fmudflap -ldl -lmudflap
+endif
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 111da3b..ac9c5dd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -155,3 +155,16 @@ config BR2_GCC_ENABLE_OPENMP
 	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
 	help
 	  Enable OpenMP support for the compiler
+
+config BR2_GCC_ENABLE_LIBMUDFLAP
+	bool "Enable libmudflap support"
+	select BR2_TOOLCHAIN_HAS_MUDFLAP
+	help
+	  libmudflap is a gcc library used for the mudflap pointer
+	  debugging functionality. It is only needed if you intend to
+	  use the -fmudflap gcc flag.
+
+	  See http://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging and
+	  the help of the gcc -fmudflap option for more details.
+
+	  If you're unsure, leave this option disabled.
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 3ead53b..c153299 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -130,6 +130,14 @@ ifeq ($(BR2_INSTALL_OBJC),y)
 HOST_GCC_FINAL_USR_LIBS += libobjc
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HOST_GCC_FINAL_USR_LIBS += libmudflapth
+else
+HOST_GCC_FINAL_USR_LIBS += libmudflap
+endif
+endif
+
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_USR_LIBS
 	mkdir -p $(TARGET_DIR)/usr/lib
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 20d6d14..7630299 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -119,6 +119,12 @@ else
 HOST_GCC_COMMON_CONF_OPT += --disable-tls
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
+HOST_GCC_COMMON_CONF_OPT += --enable-libmudflap
+else
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_COMMON_CONF_OPT += \
 	--disable-threads \
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 262c052..e8da6dc 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -315,6 +315,18 @@ check_cplusplus = \
 	fi
 
 #
+# Check that the external toolchain has mudflap support
+#
+# $1: cross-gcc path
+#
+check_mudflap = \
+	__CROSS_CC=$(strip $1) ; \
+	if ! test -f `$${__CROSS_CC} -print-file-name=libmudflap.a` ; then \
+		echo "Mudflap support is selected but is not available in external toolchain" ; \
+		exit 1 ; \
+	fi
+
+#
 # Check that the cross-compiler given in the configuration exists
 #
 # $1: cross-gcc path
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1085fb3..03eab7f 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -35,6 +35,9 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
+config BR2_TOOLCHAIN_HAS_MUDFLAP
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 11edc98..ddba707 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -13,6 +13,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_MUDFLAP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2013.06 (based on gcc 4.8), Linaro GDB 2013.06 (based on
@@ -949,6 +950,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_MUDFLAP
+	bool "Toolchain has mudflap support?"
+	select BR2_TOOLCHAIN_HAS_MUDFLAP
+	help
+	  Select this option if your external toolchain has mudflap
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
 config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	string "Extra toolchain libraries to be copied to target"
 	help
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 01be85c..fa2419f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -55,6 +55,14 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
 
+ifeq ($(BR2_ENABLE_MUDFLAP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIB_EXTERNAL_LIBS+=libmudflapth.so
+else
+LIB_EXTERNAL_LIBS+=libmudflap.so
+endif
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 USR_LIB_EXTERNAL_LIBS+=libstdc++.so
 endif
@@ -376,6 +384,9 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
+	if test "$(BR2_TOOLCHAIN_EXTERNAL_MUDFLAP)" = "y" ; then \
+		$(call check_mudflap,$(TOOLCHAIN_EXTERNAL_CC)) ; \
+	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
 	else \
-- 
1.8.1.2
