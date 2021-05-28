From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 28 May 2021 09:35:07 +0200
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.13.0
Message-ID: <20210528073511.16854-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE OS package version to OP-TEE release 3.13.0.

Add a patch already merged OP-TEE to fix build issue seen with 3.13.0
on some BR toolchain.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...ild-warning-when-_LFS64_LARGEFILE-is.patch | 56 +++++++++++++++++++
 boot/optee-os/Config.in                       |  4 +-
 boot/optee-os/optee-os.hash                   |  4 +-
 3 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch

diff --git a/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch b/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch
new file mode 100644
index 0000000000..0ff61dc524
--- /dev/null
+++ b/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch
@@ -0,0 +1,56 @@
+From 82becbadd5918ed7ad3c2b651ce479084b5feb2a Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Mon, 10 May 2021 15:58:41 +0200
+Subject: core: zlib: fix build warning when _LFS64_LARGEFILE is not defined
+
+In zlib, _LFS64_LARGEFILE is expected to be a boolean directive, either
+1 (true) or 0 (false). Depending on toolchain version and directives
+build may produces warnings (as shown below with gcc 9.3) when the macro
+is not defined hence this change to default it to value 0 (false).
+
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+In file included from core/lib/zlib/adler32.c:9:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+  CC      out/core/lib/zlib/zutil.o
+In file included from core/lib/zlib/inftrees.c:7:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+In file included from core/lib/zlib/inflate.c:84:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+In file included from core/lib/zlib/zutil.c:9:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/lib/zlib/zconf.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/core/lib/zlib/zconf.h b/core/lib/zlib/zconf.h
+index 0bca18be..a7d13741 100644
+--- a/core/lib/zlib/zconf.h
++++ b/core/lib/zlib/zconf.h
+@@ -487,6 +487,11 @@ typedef uLong FAR uLongf;
+ #  endif
+ #endif
+ 
++/* Other places expect _LFS64_LARGEFILE to be defined with a valid value */
++#ifndef _LFS64_LARGEFILE
++#define _LFS64_LARGEFILE	0
++#endif
++
+ #if defined(_LFS64_LARGEFILE) && _LFS64_LARGEFILE-0
+ #  define Z_LFS64
+ #endif
+-- 
+2.17.1
+
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 8e833ecd75..4679fd2fde 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.12.0"
+	bool "3.13.0"
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.12.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.13.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 36bc1d9593..3803a69797 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.12.0/optee-os-3.12.0.tar.gz
-sha256 b13991099f25d00dac479db93b55034cb93d206e296f2c7aa9c42b92bca2c783  optee-os-3.12.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.13.0/optee-os-3.13.0.tar.gz
+sha256 c6629ba54f62a2624299f7d17cf6df2dadc902e6a862c62f85d1b6da6c909c3f  optee-os-3.13.0.tar.gz
 # Locally computed
 sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.17.1
