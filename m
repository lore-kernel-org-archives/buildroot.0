From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 13 Jun 2018 16:14:54 +0200
Subject: [Buildroot] [PATCH 1/1] libcxx: new package
Message-ID: <20180613141454.25028-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

provides llvm's libc++ as package,
probably needs some more work to
better fit into buildroots toolchain construction.

It should be build after the host-g++ and C-Library,
but before any other packages and it does install a
small script host/bin/<xa-y-z>-g++-libc++
to allow easy use.

For lowlevel language support ABI, it can be built with
libstdc++ support library or its own libc++-abi.

the parent LLVM software needs to be available,
apparently for a few tools. Its downloaded currently,
as depending on host-llvm means this package has to be
built - which takes forever.

In the future, a option could potentially compile
all C++ Packages with this library.

-   depend on threading library if available?
    (supposedly builds without)
-   proper integration in toolchain step
-   use libc++ for remaining packages

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/Config.in                             |   1 +
 package/libcxx/Config.in                      |  29 +++++
 package/libcxx/g++-libc++.in                  |  16 +++
 package/libcxx/libcxx.hash                    |   7 ++
 package/libcxx/libcxx.mk                      | 108 ++++++++++++++++++
 ...i_fix_find_fpath_when_crosscompiling.patch |  27 +++++
 6 files changed, 188 insertions(+)
 create mode 100644 package/libcxx/Config.in
 create mode 100644 package/libcxx/g++-libc++.in
 create mode 100644 package/libcxx/libcxx.hash
 create mode 100644 package/libcxx/libcxx.mk
 create mode 100644 package/libcxx/libcxxabi_fix_find_fpath_when_crosscompiling.patch

diff --git a/package/Config.in b/package/Config.in
index fcabed4fde..cda825612a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1565,6 +1565,7 @@ menu "Other"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
 	source "package/llvm/Config.in"
+	source "package/libcxx/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
diff --git a/package/libcxx/Config.in b/package/libcxx/Config.in
new file mode 100644
index 0000000000..f5ff911b6d
--- /dev/null
+++ b/package/libcxx/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_LIBCXX
+	bool "libc++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libc++ is a new implementation of the C++ standard library,
+	  targeting C++11 (and newer). Part of the LLVM Project.
+
+	  The LLVM Project is a collection of modular and reusable
+	  compiler and toolchain technologies.
+
+if BR2_PACKAGE_LIBCXX
+choice
+	prompt "libc++ abi support"
+	default BR2_PACKAGE_LIBCXX_ABI_SUPCXX
+	help
+	  Select the c++ abi support: libsupc++ (from gcc toolchain)
+	  or libc++-abi (from llvm).
+
+config BR2_PACKAGE_LIBCXX_ABI_SUPCXX
+	bool "libsupc++"
+
+config BR2_PACKAGE_LIBCXX_ABI_CXXABI
+	bool "libc++-abi"
+
+endchoice
+endif
+
+comment "libc++ needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libcxx/g++-libc++.in b/package/libcxx/g++-libc++.in
new file mode 100644
index 0000000000..db6d050a7c
--- /dev/null
+++ b/package/libcxx/g++-libc++.in
@@ -0,0 +1,16 @@
+#!/bin/sh
+SCRIPTPATH=$(readlink -f "$(dirname "$0")")
+cxx_libs="-lc++ @link_abi@"
+c_libs="-lc @link_comrt@"
+pthread_libs="-lpthread $c_libs"
+
+libs="$cxx_libs $c_libs"
+
+for i; do
+    if test x"$i" = x"-pthread"; then
+        libs="$libs $pthread_libs"
+        break
+    fi
+done
+
+exec "$SCRIPTPATH"/@TARGET_CROSS at g++ -nodefaultlibs -nostdinc++ $libs -isystem"$SCRIPTPATH"/../../staging/usr/include/c++/v1 "$@"
diff --git a/package/libcxx/libcxx.hash b/package/libcxx/libcxx.hash
new file mode 100644
index 0000000000..7d384365b6
--- /dev/null
+++ b/package/libcxx/libcxx.hash
@@ -0,0 +1,7 @@
+# locally calculated
+sha256  1ff53c915b4e761ef400b803f07261ade637b0c269d99569f18040f3dcee4408  llvm-6.0.0.src.tar.xz
+sha256  70931a87bde9d358af6cb7869e7535ec6b015f7e6df64def6d2ecdd954040dd9  libcxx-6.0.0.src.tar.xz
+sha256  91c6d9c5426306ce28d0627d6a4448e7d164d6a3f64b01cb1d196003b16d641b  libcxxabi-6.0.0.src.tar.xz
+
+
+sha256  c1938c0e9e90639d1e8f5a7f6bebaab83a3642e0ee44295a4c69934686d0bda8  LICENSE.TXT
diff --git a/package/libcxx/libcxx.mk b/package/libcxx/libcxx.mk
new file mode 100644
index 0000000000..9d9efc90b0
--- /dev/null
+++ b/package/libcxx/libcxx.mk
@@ -0,0 +1,108 @@
+################################################################################
+#
+# libc++
+#
+################################################################################
+
+LIBCXX_VERSION = 6.0.0
+LIBCXX_SITE = http://llvm.org/releases/$(LIBCXX_VERSION)
+LIBCXX_SOURCE = llvm-$(LIBCXX_VERSION).src.tar.xz
+LIBCXX_LICENSE = MIT
+#LIBCXX_LICENSE_FILES = COPYRIGHT
+LIBCXX_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBCXX_INSTALL_STAGING = YES
+
+LIBCXX_EXTRA_DOWNLOADS = $(patsubst %,$(LIBCXX_SITE)/%-$(LIBCXX_VERSION).src.tar.xz,libcxx libcxxabi)
+
+define LIBCXX_EXTRA_EXTRACT
+	$(foreach arch,$(LIBCXX_EXTRA_DOWNLOADS), \
+		TDIR=projects/$(patsubst $(LIBCXX_SITE)/%-$(LIBCXX_VERSION).src.tar.xz,%,$(arch)); \
+		mkdir -p $(@D)/$$TDIR && \
+		$(call suitable-extractor,$(notdir $(arch))) $(LIBCXX_DL_DIR)/$(notdir $(arch)) | \
+		$(TAR) --strip-components=1 -C $(@D)/$$TDIR $(TAR_OPTIONS) -
+	)
+endef
+
+LIBCXX_POST_EXTRACT_HOOKS += LIBCXX_EXTRA_EXTRACT
+
+# Before libcxx is configured, we must have the first stage
+# cross-compiler and the clibrary
+LIBCXX_DEPENDENCIES = host-gcc-initial
+
+ifeq ($(BR2_PACKAGE_LIBCXX_ABI_CXXABI),y)
+_LIBCXX_ABI_TARGET = cxxabi
+endif
+
+_LIBCXX_ABI-$(BR2_PACKAGE_LIBCXX_ABI_CXXABI) = libcxxabi
+_LIBCXX_ABI-$(BR2_PACKAGE_LIBCXX_ABI_SUPCXX) = libsupc++
+
+_LIBCXX_ABI_LINK-$(BR2_PACKAGE_LIBCXX_ABI_CXXABI) = c++abi
+_LIBCXX_ABI_LINK-$(BR2_PACKAGE_LIBCXX_ABI_SUPCXX) = supc++
+
+LIBCXX_MAKE_OPTS = $(_LIBCXX_ABI_TARGET) cxx
+
+LIBCXX_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) $(addprefix install-,$(_LIBCXX_ABI_TARGET) cxx)
+
+LIBCXX_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) $(addprefix install-,$(_LIBCXX_ABI_TARGET) cxx)
+
+
+#LIBCXXABI_SYSROOT LIBCXX_SYSROOT
+# TODO: potentially depend on threading library?
+# allow using gccs libsupc++
+# consider whether its better to statically link libc++-abi
+# USe this library to build the remaining C++ packages?
+
+# llvm does not recommend using this
+LIBCXX_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF
+
+LIBCXX_CONF_OPTS += -DLIBCXXABI_INCLUDE_TESTS=OFF -DLIBCXXABI_ENABLE_ASSERTIONS=OFF -DLIBCXXABI_ENABLE_NEW_DELETE_DEFINITIONS=OFF -DLIBCXX_ENABLE_NEW_DELETE_DEFINITIONS=ON
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBCXX_CONF_OPTS += -DLIBCXX_HAS_MUSL_LIBC:BOOL=ON
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBCXX_CONF_OPTS += -DLIBCXXABI_ENABLE_SHARED:BOOL=ON -DLIBCXX_ENABLE_SHARED:BOOL=ON
+else
+LIBCXX_CONF_OPTS += -DLIBCXXABI_ENABLE_SHARED:BOOL=OFF -DLIBCXX_ENABLE_SHARED:BOOL=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBCXX_CONF_OPTS += -DLIBCXXABI_ENABLE_STATIC:BOOL=ON -DLIBCXX_ENABLE_STATIC:BOOL=ON
+else
+LIBCXX_CONF_OPTS += -DLIBCXXABI_ENABLE_STATIC:BOOL=OFF -DLIBCXX_ENABLE_STATIC:BOOL=OFF
+endif
+
+LIBCXX_CONF_OPTS += -DLIBCXX_ENABLE_ABI_LINKER_SCRIPT=ON
+
+#LIBCXX_CONF_OPTS += -DLLVM_PATH:PATH=$(@D)/llvm
+
+#LIBCXX_CONF_OPTS += -DLIBCXX_CXX_ABI:STRING=default
+
+# libc++ needs to be massaged to pick header and libs
+LIBCXX_CONF_OPTS += -DLIBCXX_CXX_ABI:STRING=$(_LIBCXX_ABI-y)
+
+ifneq ($(_LIBCXX_ABI_TARGET),)
+LIBCXX_CONF_OPTS += -DLIBCXX_CXX_ABI_INCLUDE_PATHS:PATH=$(@D)/projects/libcxxabi/include \
+					-DLIBCXX_CXX_ABI_LIBRARY_PATH:PATH=../../../lib
+endif
+
+
+#LIBCXX_CONF_OPTS += -DLIBCXX_INCLUDE_BENCHMARKS:BOOL=OFF
+#LIBCXX_CONF_OPTS += -DLIBCXX_INCLUDE_DOCS:BOOL=OFF
+#LIBCXX_CONF_OPTS += -DLIBCXX_INCLUDE_TESTS:BOOL=OFF
+
+cxx_libs="-lc++ @link_abi@"
+c_libs="-lc @link_comrt@"
+
+# Create a g++ wrapper to add the necessary aguments for building with libc++
+define LIBCXX_CREATE_GXXWRAPPER_TARGET
+	sed -e 's, at TARGET_CROSS@,$(notdir $(TARGET_CROSS)),g' \
+	  -e 's, at link_abi@,$(addprefix -l,$(_LIBCXX_ABI_LINK-y)),g' \
+	  -e 's, at link_comrt@,-lgcc_s,g' \
+	  $(LIBCXX_PKGDIR)g++-libc++.in > $(LIBCXX_BUILDDIR)gxxwrap.tmp
+	install -D -m755 $(LIBCXX_BUILDDIR)gxxwrap.tmp $(TARGET_CROSS)g++-libc++
+endef
+LIBCXX_POST_INSTALL_TARGET_HOOKS = LIBCXX_CREATE_GXXWRAPPER_TARGET
+
+$(eval $(cmake-package))
diff --git a/package/libcxx/libcxxabi_fix_find_fpath_when_crosscompiling.patch b/package/libcxx/libcxxabi_fix_find_fpath_when_crosscompiling.patch
new file mode 100644
index 0000000000..2fd95178f7
--- /dev/null
+++ b/package/libcxx/libcxxabi_fix_find_fpath_when_crosscompiling.patch
@@ -0,0 +1,27 @@
+diff -burN libcxx-6.0.0.org/projects/libcxxabi/CMakeLists.txt libcxx-6.0.0/projects/libcxxabi/CMakeLists.txt
+--- libcxx-6.0.0.org/projects/libcxxabi/CMakeLists.txt	2018-06-12 14:26:05.184675501 +0200
++++ libcxx-6.0.0/projects/libcxxabi/CMakeLists.txt	2018-06-12 14:27:05.553370290 +0200
+@@ -115,6 +115,7 @@
+         ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBCXX_INCLUDES}
+         ${LIBCXXABI_LIBCXX_INCLUDE_DIRS}
+         ${LLVM_INCLUDE_DIR}/c++/v1
++  NO_CMAKE_FIND_ROOT_PATH
+   )
+
+ set(LIBCXXABI_LIBCXX_INCLUDES "${LIBCXXABI_LIBCXX_INCLUDES}" CACHE PATH
+@@ -127,6 +128,7 @@
+         ${LIBCXXABI_LIBCXX_INCLUDES}/../
+         ${LIBCXXABI_LIBCXX_SRC_DIRS}
+   NO_DEFAULT_PATH
++  NO_CMAKE_FIND_ROOT_PATH
+   )
+
+ if (LIBCXXABI_LIBCXX_PATH STREQUAL "LIBCXXABI_LIBCXX_PATH-NOTFOUND")
+@@ -425,6 +427,7 @@
+           ${LLVM_MAIN_SRC_DIR}/projects/libunwind/include
+           ${LLVM_MAIN_SRC_DIR}/runtimes/libunwind/include
+     NO_DEFAULT_PATH
++    NO_CMAKE_FIND_ROOT_PATH
+   )
+
+   if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL "LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND")
--
2.17.1
