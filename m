From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 29 Sep 2020 11:26:16 +0100
Subject: [Buildroot] [RFC PATCH 2/4] Add BPF Compiler Collection (BCC)
 Package
In-Reply-To: <20200929102618.28571-1-qais.yousef@arm.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
Message-ID: <20200929102618.28571-3-qais.yousef@arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BCC is a toolkit for creating efficient kernel tracing and manipulation
programs, and includes several useful tools and examples.

Only tested to work on x86_64 and aarch64.

I had issues getting i386 and aarch32 to work. More archs support can be
added later hopefully after this initial support.

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
---
 package/Config.in                             |  1 +
 package/bcc/0001-fix-dlinfo.patch             | 17 ++++++++++
 .../0002-fix-undefined-gzgets-runtime.patch   | 15 ++++++++
 .../0003-fix-loading-libc-python-perf.patch   | 17 ++++++++++
 .../0004-fix-loading-librt-python-init.patch  | 17 ++++++++++
 .../0005-fix-python-installation-path.patch   | 15 ++++++++
 package/bcc/Config.in                         | 34 +++++++++++++++++++
 package/bcc/bcc.mk                            | 25 ++++++++++++++
 8 files changed, 141 insertions(+)
 create mode 100644 package/bcc/0001-fix-dlinfo.patch
 create mode 100644 package/bcc/0002-fix-undefined-gzgets-runtime.patch
 create mode 100644 package/bcc/0003-fix-loading-libc-python-perf.patch
 create mode 100644 package/bcc/0004-fix-loading-librt-python-init.patch
 create mode 100644 package/bcc/0005-fix-python-installation-path.patch
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.mk

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..03ed3e5874 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -84,6 +84,7 @@ endmenu
 
 menu "Debugging, profiling and benchmark"
 	source "package/blktrace/Config.in"
+	source "package/bcc/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
diff --git a/package/bcc/0001-fix-dlinfo.patch b/package/bcc/0001-fix-dlinfo.patch
new file mode 100644
index 0000000000..b3aed784fc
--- /dev/null
+++ b/package/bcc/0001-fix-dlinfo.patch
@@ -0,0 +1,17 @@
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+
+--- ./tests/cc/test_c_api.cc.old	2020-07-27 00:57:13.681656086 +0100
++++ ./tests/cc/test_c_api.cc	2020-07-27 00:57:25.258110970 +0100
+@@ -151,10 +151,12 @@
+     return -1;
+   }
+ 
++  /*
+   if (dlinfo(dlhdl, RTLD_DI_LINKMAP, &lm) < 0) {
+     fprintf(stderr, "Unable to find origin of libz.so.1: %s\n", dlerror());
+     return -1;
+   }
++  */
+ 
+   strncpy(libpath, lm->l_name, 1024);
+   dlclose(dlhdl);
diff --git a/package/bcc/0002-fix-undefined-gzgets-runtime.patch b/package/bcc/0002-fix-undefined-gzgets-runtime.patch
new file mode 100644
index 0000000000..eb85493eab
--- /dev/null
+++ b/package/bcc/0002-fix-undefined-gzgets-runtime.patch
@@ -0,0 +1,15 @@
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+
+--- ./src/cc/CMakeLists.txt.old	2020-08-02 19:32:16.502841991 +0100
++++ ./src/cc/CMakeLists.txt	2020-08-02 19:32:47.263965564 +0100
+@@ -136,8 +136,8 @@
+ add_subdirectory(frontends)
+ 
+ # Link against LLVM libraries
+-target_link_libraries(bcc-shared ${bcc_common_libs_for_s})
+-target_link_libraries(bcc-static ${bcc_common_libs_for_a} bcc-loader-static)
++target_link_libraries(bcc-shared ${bcc_common_libs_for_s} z)
++target_link_libraries(bcc-static ${bcc_common_libs_for_a} bcc-loader-static z)
+ set(bcc-lua-static ${bcc-lua-static} ${bcc_common_libs_for_lua})
+ 
+ if(LIBBPF_FOUND)
diff --git a/package/bcc/0003-fix-loading-libc-python-perf.patch b/package/bcc/0003-fix-loading-libc-python-perf.patch
new file mode 100644
index 0000000000..0460889f39
--- /dev/null
+++ b/package/bcc/0003-fix-loading-libc-python-perf.patch
@@ -0,0 +1,17 @@
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+
+--- ./src/python/bcc/perf.py.old	2020-08-02 20:29:54.769226300 +0100
++++ ./src/python/bcc/perf.py	2020-08-02 20:32:13.130379117 +0100
+@@ -64,7 +64,11 @@
+         PERF_EVENT_IOC_ENABLE = 9216
+ 
+         # fetch syscall routines
+-        libc = ct.CDLL('libc.so.6', use_errno=True)
++        try:
++            libc = ct.CDLL('libc.so.6', use_errno=True)
++        except:
++            # Try lower versions; works for uClibc
++            libc = ct.CDLL('libc.so.1', use_errno=True)
+         syscall = libc.syscall          # not declaring vararg types
+         ioctl = libc.ioctl              # not declaring vararg types
+ 
diff --git a/package/bcc/0004-fix-loading-librt-python-init.patch b/package/bcc/0004-fix-loading-librt-python-init.patch
new file mode 100644
index 0000000000..dda1810d1e
--- /dev/null
+++ b/package/bcc/0004-fix-loading-librt-python-init.patch
@@ -0,0 +1,17 @@
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+
+--- ./src/python/bcc/__init__.py.old	2020-08-02 20:29:51.817116507 +0100
++++ ./src/python/bcc/__init__.py	2020-08-02 20:30:47.971206447 +0100
+@@ -200,7 +200,11 @@
+     class timespec(ct.Structure):
+         _fields_ = [('tv_sec', ct.c_long), ('tv_nsec', ct.c_long)]
+ 
+-    _librt = ct.CDLL('librt.so.1', use_errno=True)
++    try:
++        _librt = ct.CDLL('librt.so.1', use_errno=True)
++    except:
++        # In some embedded systems (uClibc), libc contains librt
++        _librt = ct.CDLL('libc.so.1', use_errno=True)
+     _clock_gettime = _librt.clock_gettime
+     _clock_gettime.argtypes = [ct.c_int, ct.POINTER(timespec)]
+ 
diff --git a/package/bcc/0005-fix-python-installation-path.patch b/package/bcc/0005-fix-python-installation-path.patch
new file mode 100644
index 0000000000..b61df6ca48
--- /dev/null
+++ b/package/bcc/0005-fix-python-installation-path.patch
@@ -0,0 +1,15 @@
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+
+--- ./src/python/CMakeLists.txt.old	2020-08-06 22:04:15.400347699 +0100
++++ ./src/python/CMakeLists.txt	2020-08-06 22:04:28.012820888 +0100
+@@ -5,10 +5,6 @@
+   set(PYTHON_CMD "python")
+ endif()
+ 
+-if(EXISTS "/etc/debian_version")
+-  set(PYTHON_FLAGS "${PYTHON_FLAGS} --install-layout deb")
+-endif()
+-
+ file(GLOB_RECURSE PYTHON_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
+   ${CMAKE_CURRENT_SOURCE_DIR}/*.py)
+ file(GLOB_RECURSE PYTHON_INCLUDES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
diff --git a/package/bcc/Config.in b/package/bcc/Config.in
new file mode 100644
index 0000000000..6c332977f9
--- /dev/null
+++ b/package/bcc/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_BCC
+	bool "bcc"
+	depends on BR2_aarch64 || BR2_aarch64_be || BR2_x86_64
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on (BR2_TOOLCHAIN_USES_GLIBC && (BR2_aarch64 || BR2_aarch64_be)) || (!BR2_aarch64 && !BR2_aarch64_be)
+	depends on BR2_PACKAGE_ELFUTILS
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_CLANG
+	depends on BR2_PACKAGE_LLVM
+	depends on BR2_PACKAGE_LLVM_BPF
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_TAR
+	help
+	  BPF Compiler Collection
+
+	  BCC is a toolkit for creating efficient kernel tracing and
+	  manipulation programs, and includes several useful tools and
+	  examples.
+
+	  BCC makes BPF programs easier to write, with kernel
+	  instrumentation in C (and includes a C wrapper around LLVM),
+	  and front-ends in Python and lua. It is suited for many tasks,
+	  including performance analysis and network traffic control.
+
+	  https://www.github.com/iovisor/bcc
+
+comment "bcc supported on aarch64 and x86_64"
+	depends on !(BR2_aarch64 || BR2_aarch64_be || BR2_x86_64)
+
+comment "bcc requires glibc on aarch64"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && (BR2_aarch64 || BR2_aarch64_be)
+
+comment "bcc needs a toolchain w/ C++, elfutils, python, clang, llvm, llvm-bpf"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_ELFUTILS || (!BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3) || !BR2_PACKAGE_CLANG || !BR2_PACKAGE_LLVM || !BR2_PACKAGE_LLVM_BPF
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
new file mode 100644
index 0000000000..b83924aa93
--- /dev/null
+++ b/package/bcc/bcc.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# BPF Compiler Collection (BCC)
+#
+################################################################################
+
+BCC_VERSION = v0.15.0
+BCC_SITE = https://github.com/iovisor/bcc
+BCC_SITE_METHOD = git
+BCC_GIT_SUBMODULES = YES
+BCC_LICENSE = Apache-2.0
+BCC_LICENSE_FILES = LICENSE.txt
+BCC_INSTALL_STAGING = YES
+BCC_DEPENDENCIES = host-bison host-flex host-zlib zlib tar elfutils clang llvm
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+BCC_DEPENDENCIES += python
+else
+BCC_DEPENDENCIES += python3
+endif
+
+BCC_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -isystem $(HOST_DIR)/include"
+
+$(eval $(cmake-package))
-- 
2.17.1
