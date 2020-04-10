From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:43:08 +0200
Subject: [Buildroot] [git commit] package/fmt: bump version to 6.2.0
Message-ID: <20200410203127.4EBFA8E391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afeae17c365f15d810cc974db06da9a1c8eb4bc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream commit to fix Kodi build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ndling-of-unsigned-char-strings-in-printf.patch | 54 ++++++++++++++++++++++
 package/fmt/fmt.hash                               |  2 +-
 package/fmt/fmt.mk                                 |  2 +-
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch b/package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch
new file mode 100644
index 0000000000..41c72aa4a3
--- /dev/null
+++ b/package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch
@@ -0,0 +1,54 @@
+From 7d01859ef16e6b65bc023ad8bebfedecb088bf81 Mon Sep 17 00:00:00 2001
+From: Victor Zverovich <viz@fb.com>
+Date: Wed, 8 Apr 2020 12:32:34 -0700
+Subject: [PATCH] Fix handling of unsigned char strings in printf
+
+Downloaded from upstream commit
+https://github.com/fmtlib/fmt/commit/7d01859ef16e6b65bc023ad8bebfedecb088bf81
+
+to fix Kodi build error:
+https://github.com/xbmc/xbmc/issues/17629
+https://github.com/fmtlib/fmt/issues/1620
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/fmt/core.h  | 8 ++++++++
+ test/printf-test.cc | 6 ++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/include/fmt/core.h b/include/fmt/core.h
+index 6df2875ac..dc10722bf 100644
+--- a/include/fmt/core.h
++++ b/include/fmt/core.h
+@@ -972,6 +972,14 @@ template <typename Context> struct arg_mapper {
+     static_assert(std::is_same<char_type, char>::value, "invalid string type");
+     return reinterpret_cast<const char*>(val);
+   }
++  FMT_CONSTEXPR const char* map(signed char* val) {
++    const auto* const_val = val;
++    return map(const_val);
++  }
++  FMT_CONSTEXPR const char* map(unsigned char* val) {
++    const auto* const_val = val;
++    return map(const_val);
++  }
+ 
+   FMT_CONSTEXPR const void* map(void* val) { return val; }
+   FMT_CONSTEXPR const void* map(const void* val) { return val; }
+diff --git a/test/printf-test.cc b/test/printf-test.cc
+index 5aaa27b13..545e02aab 100644
+--- a/test/printf-test.cc
++++ b/test/printf-test.cc
+@@ -447,6 +447,12 @@ TEST(PrintfTest, String) {
+   EXPECT_PRINTF(L"    (null)", L"%10s", null_wstr);
+ }
+ 
++TEST(PrintfTest, UCharString) {
++  unsigned char str[] = "test";
++  unsigned char* pstr = str;
++  EXPECT_EQ("test", fmt::sprintf("%s", pstr));
++}
++
+ TEST(PrintfTest, Pointer) {
+   int n;
+   void* p = &n;
diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 24d05e7789..29b8237082 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1cafc80701b746085dddf41bd9193e6d35089e1c6ec1940e037fcb9c98f62365  fmt-6.1.2.tar.gz
+sha256 fe6e4ff397e01c379fc4532519339c93da47404b9f6674184a458a9967a76575  fmt-6.2.0.tar.gz
 sha256 825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 5dc3088e89..9601141e06 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 6.1.2
+FMT_VERSION = 6.2.0
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
