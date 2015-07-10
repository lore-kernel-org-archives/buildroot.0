From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 10 Jul 2015 18:10:00 +0200
Subject: [Buildroot] [PATCH] qpid-proton: new package
Message-ID: <1436544600-18532-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Patch from upstream.

Note: the tarball is buggy, as is contains two leading components instead of
one, the first being a dummy ".":

  $ tar taf ~/src/qpid-proton-0.9.1.tar.gz
  ./
  ./qpid-proton-0.9.1-rc1/
  ./qpid-proton-0.9.1-rc1/version.txt
  [...]

So the tarball gets correctly extracted by hand, but the --strip-components=1
option we pass to tar is useless. This issue is handled fine by
QPID_PROTON_SUBDIR, but the original patch does not apply. Thus I manually
added the "qpid-proton-0.9.1-rc1/" prefix on the patch, which looked to me
better than overriding QPID_PROTON_EXTRACT_CMDS or otherwise playing dirty
with hooks.
---
 package/Config.in                                  |  1 +
 ...fix-C-compiler-detection-with-_ARG1-_ARG2.patch | 52 ++++++++++++++++++++++
 package/qpid-proton/Config.in                      | 17 +++++++
 package/qpid-proton/qpid-proton.hash               |  2 +
 package/qpid-proton/qpid-proton.mk                 | 28 ++++++++++++
 5 files changed, 100 insertions(+)
 create mode 100644 package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
 create mode 100644 package/qpid-proton/Config.in
 create mode 100644 package/qpid-proton/qpid-proton.hash
 create mode 100644 package/qpid-proton/qpid-proton.mk

diff --git a/package/Config.in b/package/Config.in
index d9b0794..21ead51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -995,6 +995,7 @@ menu "Networking"
 	source "package/openpgm/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
+	source "package/qpid-proton/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
diff --git a/package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch b/package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
new file mode 100644
index 0000000..d3822a9
--- /dev/null
+++ b/package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
@@ -0,0 +1,52 @@
+From f24be9ae9ab01c7507a366e9d5529c444f0b7edd Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Fri, 10 Jul 2015 10:13:47 +0200
+Subject: [PATCH] proton-c: fix C compiler detection with _ARG1/_ARG2
+
+The C compiler commandline in CMake is composed by the concatenation of
+CMAKE_C_COMPILER + CMAKE_C_COMPILER_ARG1 + CMAKE_C_COMPILER_ARG2.
+
+In most use cases the two additional argument variables are empty, thus
+CMAKE_C_COMPILER can be used without any noticeable difference.
+
+The Buildroot embedded Linux build system [0], however, optionally exploits the
+CMAKE_C_COMPILER_ARG1 variable to speed up the cross-compilation of CMake-based
+packages using ccache. It does so by setting [1]:
+
+  CMAKE_C_COMPILER      = /path/to/ccache
+  CMAKE_C_COMPILER_ARG1 = /path/to/cross-gcc
+
+This works fine with other CMake-based packages, but proton-c's CMakeLists.txt
+calls gcc to extract the compiler version. It does so by calling
+"${CMAKE_C_COMPILER} -dumpversion", without honoring the two extra arguments.
+Within Buildroot with ccache enabled, this means calling
+"/path/to/ccache -dumpversion", which fails with the error:
+
+  ccache: invalid option -- 'd'
+
+Fix the compiler check by adding the two arguments.
+
+[0] http://buildroot.net/
+[1] http://git.buildroot.net/buildroot/tree/support/misc/toolchainfile.cmake.in?id=2015.05
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ proton-c/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/proton-c/CMakeLists.txt b/proton-c/CMakeLists.txt
+index 93449a9..8c31a89 100644
+--- a/qpid-proton-0.9.1-rc1/proton-c/CMakeLists.txt
++++ b/qpid-proton-0.9.1-rc1/proton-c/CMakeLists.txt
+@@ -218,7 +218,7 @@ if (CMAKE_COMPILER_IS_GNUCC)
+     set (COMPILE_LANGUAGE_FLAGS "-std=c99")
+     set (COMPILE_PLATFORM_FLAGS "-std=gnu99")
+ 
+-    execute_process(COMMAND ${CMAKE_C_COMPILER} -dumpversion OUTPUT_VARIABLE GCC_VERSION
++    execute_process(COMMAND ${CMAKE_C_COMPILER} ${CMAKE_C_COMPILER_ARG1} ${CMAKE_C_COMPILER_ARG2} -dumpversion OUTPUT_VARIABLE GCC_VERSION
+       OUTPUT_STRIP_TRAILING_WHITESPACE)
+     if (${GCC_VERSION} VERSION_LESS "4.3.0")
+       # Only a concern if contibuting code back.
+-- 
+1.9.1
+
diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
new file mode 100644
index 0000000..b6a1aa9
--- /dev/null
+++ b/package/qpid-proton/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QPID_PROTON
+	bool "qpid-proton"
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  The AMQP messaging toolkit
+
+	  Qpid Proton is a high-performance, lightweight messaging library.
+	  It can be used in the widest range of messaging applications,
+	  including brokers, client libraries, routers, bridges, proxies, and
+	  more.
+
+	  https://qpid.apache.org/proton/
+
+comment "qpid-proton needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
new file mode 100644
index 0000000..8c2cc4f
--- /dev/null
+++ b/package/qpid-proton/qpid-proton.hash
@@ -0,0 +1,2 @@
+# Hash from: http://www.apache.org/dist/qpid/proton/0.9.1/qpid-proton-0.9.1.tar.gz.sha
+sha1  98008d90acd0d47cbd7ac1572a2bb50b452338ed  qpid-proton-0.9.1.tar.gz
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
new file mode 100644
index 0000000..37ec052
--- /dev/null
+++ b/package/qpid-proton/qpid-proton.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# qpid-proton
+#
+################################################################################
+
+QPID_PROTON_VERSION_MAJOR = 0.9
+QPID_PROTON_VERSION = $(QPID_PROTON_VERSION_MAJOR).1
+QPID_PROTON_SITE = http://apache.panu.it/qpid/proton/0.9.1
+QPID_PROTON_SUBDIR = qpid-proton-0.9.1-rc1
+QPID_PROTON_LICENSE = Apache-2.0
+QPID_PROTON_LICENSE_FILES = LICENSE
+QPID_PROTON_INSTALL_STAGING = YES
+QPID_PROTON_DEPENDENCIES = \
+	util-linux \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl,)
+QPID_PROTON_CONF_OPTS = \
+	-DBUILD_JAVA=OFF \
+	-DENABLE_VALGRIND=OFF \
+	-DENABLE_WARNING_ERROR=OFF
+
+define QPID_PROTON_REMOVE_EXAMPLES
+	rm -fr $(TARGET_DIR)/usr/share/proton-$(QPID_PROTON_VERSION_MAJOR)/examples
+endef
+
+QPID_PROTON_POST_INSTALL_TARGET_HOOKS += QPID_PROTON_REMOVE_EXAMPLES
+
+$(eval $(cmake-package))
-- 
1.9.1
