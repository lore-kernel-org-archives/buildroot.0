From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:55:57 +0100
Subject: [Buildroot] [git commit] gcc: fix libsanitizer build with
	_FILE_OFFSET_BITS=64
Message-ID: <20160324215601.8EFCE819BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c917e11f05716cceadec3087295dfe0f6f206488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the commit f67a4f50e2ace3a2 "gcc: preserve CXXFLAGS_FOR_TARGET"
target CFLAGS are passed to all libraries bundled with gcc. This breaks
libsanitizer on gcc-4.9.x when building with _FILE_OFFSET_BITS=64:

  error: size of array ???assertion_failed__837??? is negative
  ...
  libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:837:1:
  note: in expansion of macro ???CHECK_SIZE_AND_OFFSET???
  CHECK_SIZE_AND_OFFSET(dirent, d_ino);

This issue is fixed in the libsanitizer mainline and in gcc-5.x.
There's no issue with gcc-4.8.x and earlier.

Reported-by: Julien CORJON <corjon.j@ecagroup.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Backported from: https://llvm.org/svn/llvm-project/compiler-rt/trunk at 220328
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/gcc/4.9.3/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch b/package/gcc/4.9.3/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
new file mode 100644
index 0000000..55f3228
--- /dev/null
+++ b/package/gcc/4.9.3/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
@@ -0,0 +1,37 @@
+From 3c536954a67a883630f4a7513a27f02a892c3dcb Mon Sep 17 00:00:00 2001
+From: Evgeniy Stepanov <eugeni.stepanov@gmail.com>
+Date: Tue, 21 Oct 2014 21:08:13 +0000
+Subject: [PATCH] [sanitizer] Fix build with _FILE_OFFSET_BITS=64.
+
+Sanitizer source is not affected by _FILE_OFFSET_BITS in general,
+but this one file must be built with 32-bit off_t. More details in the code.
+
+git-svn-id: https://llvm.org/svn/llvm-project/compiler-rt/trunk at 220328 91177308-0d34-0410-b5e6-96231b3b80d8
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ lib/sanitizer_common/sanitizer_platform_limits_posix.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+index bbc1108..fc09522 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+@@ -13,7 +13,15 @@
+ 
+ #include "sanitizer_platform.h"
+ #if SANITIZER_LINUX || SANITIZER_MAC
++// Tests in this file assume that off_t-dependent data structures match the
++// libc ABI. For example, struct dirent here is what readdir() function (as
++// exported from libc) returns, and not the user-facing "dirent", which
++// depends on _FILE_OFFSET_BITS setting.
++// To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
++#ifdef _FILE_OFFSET_BITS
++#undef _FILE_OFFSET_BITS
++#endif
+ 
+ #include "sanitizer_internal_defs.h"
+ #include "sanitizer_platform_limits_posix.h"
+ 
+-- 
+2.1.4
+
