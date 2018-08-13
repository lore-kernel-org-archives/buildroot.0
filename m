From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Aug 2018 20:39:49 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix double-conversion compile for
 aarch64_be
Message-ID: <20180813183949.16698-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
  #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/1fe2be0f26e5b92db57a5cfb5646dd253b731a5c

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - not upstreamable patch (or only for the 5.11 branch), on qtbase dev branch
    double-conversion is already updated to v3.0.0 [2] using
        defined(__AARCH64EL__) || defined(__aarch64__)
    instead of
        defined(__AARCH64EL__) || defined(__AARCH64EB__)
    used here.

  - compile failes later at linking stage with
        aarch64_be-linux-gnu/bin/ld.gold: internal error in update_erratum_insn, at /home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/aarch64_be-linux-gnu/snapshots/binutils-gdb.git~users~linaro~binutils-2_28-branch/gold/aarch64.cc:998

[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=6a39e49a6cdeb28a04a3657bb6a22f848d5dfa9d
---
 ...ble-conversion-enable-for-aarch64_be.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch

diff --git a/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch b/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch
new file mode 100644
index 0000000000..838f4dd7ad
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch
@@ -0,0 +1,26 @@
+From e81ba4e0de16ff741417ae7ed7dfe7b5a83d66e2 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 13 Aug 2018 20:15:05 +0200
+Subject: [PATCH] double-conversion: enable for aarch64_be
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../double-conversion/include/double-conversion/utils.h         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index 20bfd36c84..77baa2861a 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -65,7 +65,7 @@
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__)
++    defined(__AARCH64EL__) || defined(__AARCH64EB__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.18.0
+
-- 
2.18.0
