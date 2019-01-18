From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Jan 2019 22:50:13 +0100
Subject: [Buildroot] [PATCH 1/1] libcpprestdk: fix build with gcc 4.7
Message-ID: <20190118215013.3743-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a080dbe2977cd35e4f8351d864bd71aaa8f9b743

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tp_compression.cpp-fix-build-with-gcc-4.7.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libcpprestsdk/0003-http_compression.cpp-fix-build-with-gcc-4.7.patch

diff --git a/package/libcpprestsdk/0003-http_compression.cpp-fix-build-with-gcc-4.7.patch b/package/libcpprestsdk/0003-http_compression.cpp-fix-build-with-gcc-4.7.patch
new file mode 100644
index 0000000000..2b8e281001
--- /dev/null
+++ b/package/libcpprestsdk/0003-http_compression.cpp-fix-build-with-gcc-4.7.patch
@@ -0,0 +1,41 @@
+From da7f3f07ecac1e8804bd190c6ea681efd70d3900 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 18 Jan 2019 19:30:01 +0100
+Subject: [PATCH] http_compression.cpp: fix build with gcc 4.7
+
+At GCC 4.7, C++11 rules for noexcept specification of implicit
+destructors (and default specification on explicit destructors without
+exception specifications) aren't perfectly implemented, see:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53613
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a080dbe2977cd35e4f8351d864bd71aaa8f9b743
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Release/src/http/common/http_compression.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Release/src/http/common/http_compression.cpp b/Release/src/http/common/http_compression.cpp
+index 202a1b92..a9cbc86e 100644
+--- a/Release/src/http/common/http_compression.cpp
++++ b/Release/src/http/common/http_compression.cpp
+@@ -600,6 +600,7 @@ private:
+ class generic_compress_factory : public compress_factory
+ {
+ public:
++    ~generic_compress_factory() CPPREST_NOEXCEPT {}
+     generic_compress_factory(const utility::string_t& algorithm,
+                              std::function<std::unique_ptr<compress_provider>()> make_compressor)
+         : m_algorithm(algorithm), _make_compressor(make_compressor)
+@@ -619,6 +620,7 @@ private:
+ class generic_decompress_factory : public decompress_factory
+ {
+ public:
++    ~generic_decompress_factory() CPPREST_NOEXCEPT {}
+     generic_decompress_factory(const utility::string_t& algorithm,
+                                uint16_t weight,
+                                std::function<std::unique_ptr<decompress_provider>()> make_decompressor)
+-- 
+2.14.1
+
-- 
2.14.1
