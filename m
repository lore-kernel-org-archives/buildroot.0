From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Jun 2020 18:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/fmt: bump version to 6.2.1
Message-ID: <20200613160337.2531242-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst

Removed patch included in this version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...g-of-unsigned-char-strings-in-printf.patch | 54 -------------------
 package/fmt/fmt.hash                          |  4 +-
 package/fmt/fmt.mk                            |  2 +-
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch

diff --git a/package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch b/package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch
deleted file mode 100644
index 41c72aa4a3..0000000000
--- a/package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 7d01859ef16e6b65bc023ad8bebfedecb088bf81 Mon Sep 17 00:00:00 2001
-From: Victor Zverovich <viz@fb.com>
-Date: Wed, 8 Apr 2020 12:32:34 -0700
-Subject: [PATCH] Fix handling of unsigned char strings in printf
-
-Downloaded from upstream commit
-https://github.com/fmtlib/fmt/commit/7d01859ef16e6b65bc023ad8bebfedecb088bf81
-
-to fix Kodi build error:
-https://github.com/xbmc/xbmc/issues/17629
-https://github.com/fmtlib/fmt/issues/1620
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/fmt/core.h  | 8 ++++++++
- test/printf-test.cc | 6 ++++++
- 2 files changed, 14 insertions(+)
-
-diff --git a/include/fmt/core.h b/include/fmt/core.h
-index 6df2875ac..dc10722bf 100644
---- a/include/fmt/core.h
-+++ b/include/fmt/core.h
-@@ -972,6 +972,14 @@ template <typename Context> struct arg_mapper {
-     static_assert(std::is_same<char_type, char>::value, "invalid string type");
-     return reinterpret_cast<const char*>(val);
-   }
-+  FMT_CONSTEXPR const char* map(signed char* val) {
-+    const auto* const_val = val;
-+    return map(const_val);
-+  }
-+  FMT_CONSTEXPR const char* map(unsigned char* val) {
-+    const auto* const_val = val;
-+    return map(const_val);
-+  }
- 
-   FMT_CONSTEXPR const void* map(void* val) { return val; }
-   FMT_CONSTEXPR const void* map(const void* val) { return val; }
-diff --git a/test/printf-test.cc b/test/printf-test.cc
-index 5aaa27b13..545e02aab 100644
---- a/test/printf-test.cc
-+++ b/test/printf-test.cc
-@@ -447,6 +447,12 @@ TEST(PrintfTest, String) {
-   EXPECT_PRINTF(L"    (null)", L"%10s", null_wstr);
- }
- 
-+TEST(PrintfTest, UCharString) {
-+  unsigned char str[] = "test";
-+  unsigned char* pstr = str;
-+  EXPECT_EQ("test", fmt::sprintf("%s", pstr));
-+}
-+
- TEST(PrintfTest, Pointer) {
-   int n;
-   void* p = &n;
diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 29b8237082..da58d45c33 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fe6e4ff397e01c379fc4532519339c93da47404b9f6674184a458a9967a76575  fmt-6.2.0.tar.gz
-sha256 825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
+sha256  5edf8b0f32135ad5fafb3064de26d063571e95e8ae46829c2f4f4b52696bbff0  fmt-6.2.1.tar.gz
+sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 9601141e06..62c165fbea 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 6.2.0
+FMT_VERSION = 6.2.1
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
-- 
2.26.2
