From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Feb 2019 22:01:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libssh: disable -Werror
Message-ID: <20190217210154.5843-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to disable Werror which raise build failures on gcc 4.8 or
gcc 7

Fixes:
 - http://autobuild.buildroot.org/results/a56c515746874549714270c9a635f8a2ef303e67
 - http://autobuild.buildroot.org/results/1152d0aa3ad7dc8f9abf2f074f0aa2b9ce41742e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...efineOptions.cmake-add-WITH_WERROR-option.patch | 95 ++++++++++++++++++++++
 package/libssh/libssh.mk                           |  3 +-
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 package/libssh/0005-DefineOptions.cmake-add-WITH_WERROR-option.patch

diff --git a/package/libssh/0005-DefineOptions.cmake-add-WITH_WERROR-option.patch b/package/libssh/0005-DefineOptions.cmake-add-WITH_WERROR-option.patch
new file mode 100644
index 0000000000..d3e387efdc
--- /dev/null
+++ b/package/libssh/0005-DefineOptions.cmake-add-WITH_WERROR-option.patch
@@ -0,0 +1,95 @@
+From 718cba45a31e05ad7877962abaa89295af9466c2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Feb 2019 12:20:45 +0100
+Subject: [PATCH] DefineOptions.cmake: add WITH_WERROR option
+
+Setting -Werror=strict-overflow breaks build on various situations.
+
+For example, build breaks on gcc 4.8:
+/home/buildroot/autobuild/instance-1/output/build/libssh-0.8.6/src/pki_gcrypt.c: In function 'privatekey_string_to_buffer':
+/home/buildroot/autobuild/instance-1/output/build/libssh-0.8.6/src/pki_gcrypt.c:485:10: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
+     while(len > 0 && strncmp(p, header_end, header_end_size) != 0) {
+          ^
+
+Build breaks also on gcc 7:
+In file included from /accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-2/output/build/libssh-0.8.6/src/buffer.c:27:0:
+/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-2/output/build/libssh-0.8.6/src/buffer.c: In function 'ssh_buffer_pack_va':
+/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-2/output/build/libssh-0.8.6/src/buffer.c:982:33: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
+             o.data = va_arg(ap, void *);
+
+To avoid these kind of situations, add a new WITH_WERROR option to allow
+the user to remove all -Werror=xxx
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a56c515746874549714270c9a635f8a2ef303e67
+ - http://autobuild.buildroot.org/results/1152d0aa3ad7dc8f9abf2f074f0aa2b9ce41742e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.libssh.org/T132]
+---
+ CompilerChecks.cmake | 21 ++++++++++++---------
+ DefineOptions.cmake  |  1 +
+ 2 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/CompilerChecks.cmake b/CompilerChecks.cmake
+index a3e4b5c9..6510772f 100644
+--- a/CompilerChecks.cmake
++++ b/CompilerChecks.cmake
+@@ -23,22 +23,14 @@ if (UNIX)
+     add_c_compiler_flag("-Wmissing-prototypes" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wcast-align" SUPPORTED_COMPILER_FLAGS)
+     #add_c_compiler_flag("-Wcast-qual" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=address" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wstrict-prototypes" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=strict-prototypes" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wwrite-strings" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=write-strings" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Werror-implicit-function-declaration" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wpointer-arith" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=pointer-arith" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wdeclaration-after-statement" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=declaration-after-statement" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wreturn-type" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=return-type" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wuninitialized" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=uninitialized" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wimplicit-fallthrough" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=strict-overflow" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wstrict-overflow=2" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wno-format-zero-length" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wmissing-field-initializers" SUPPORTED_COMPILER_FLAGS)
+@@ -49,7 +41,18 @@ if (UNIX)
+         set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} -Wformat")
+     endif()
+     add_c_compiler_flag("-Wformat-security" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=format-security" SUPPORTED_COMPILER_FLAGS)
++
++    if (WITH_WERROR)
++        add_c_compiler_flag("-Werror=address" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=strict-prototypes" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=write-strings" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=pointer-arith" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=declaration-after-statement" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=return-type" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=uninitialized" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=strict-overflow" SUPPORTED_COMPILER_FLAGS)
++        add_c_compiler_flag("-Werror=format-security" SUPPORTED_COMPILER_FLAGS)
++    endif() 
+ 
+     # Allow zero for a variadic macro argument
+     string(TOLOWER "${CMAKE_C_COMPILER_ID}" _C_COMPILER_ID)
+diff --git a/DefineOptions.cmake b/DefineOptions.cmake
+index 84ccd96d..15db65b3 100644
+--- a/DefineOptions.cmake
++++ b/DefineOptions.cmake
+@@ -21,6 +21,7 @@ option(WITH_SYMBOL_VERSIONING "Build with symbol versioning" ON)
+ option(WITH_ABI_BREAK "Allow ABI break" OFF)
+ option(WITH_GEX "Enable DH Group exchange mechanisms" ON)
+ option(FUZZ_TESTING "Build with fuzzer for the server" OFF)
++option(WITH_WERROR "Build with some -Werror flags" ON)
+ option(PICKY_DEVELOPER "Build with picky developer flags" OFF)
+ 
+ if (WITH_ZLIB)
+-- 
+2.14.1
+
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 016d67546f..5c3bbd2f2d 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -15,7 +15,8 @@ LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_SERVER=OFF \
-	-DWITH_EXAMPLES=OFF
+	-DWITH_EXAMPLES=OFF \
+	-DWITH_WERROR=OFF
 
 # cmake older than 3.10 require this to avoid try_run() in FindThreads
 LIBSSH_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-- 
2.14.1
