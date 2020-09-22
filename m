From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:24:22 +0200
Subject: [Buildroot] [git commit] package/log4cxx: bump to version 0.11.0
Message-ID: <20200922191810.340868D4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=652a01b6b03aa7da11cf8335b104454bf16c3c71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Retrieve sha512 from upstream
- Drop first patch (not needed since
  https://github.com/apache/logging-log4cxx/commit/33ca357ea075fabf74d50b2a2c8420ae39a8b453)
- Drop second patch (already in version:
  https://github.com/apache/logging-log4cxx/commit/1f6bf7e11963849f44e65ed32eb8e2fea35e2065)
- Drop third patch (already in version:
  https://github.com/apache/logging-log4cxx/commit/0319bfa7f64048efeff954e4c5da055711b28ce4)
- Drop fourth patch (already in version:
  https://github.com/apache/logging-log4cxx/commit/3d96b34921913aed39b61b7c617bda285889887c)
- Drop fifth patch (not needed since
  https://github.com/apache/logging-log4cxx/commit/d6776be8f280914982c4f0d6ad979607e91fb89a)
- Add LOG4CXX_AUTORECONF = YES as running the bundled configure fails
  during the build step on:
  configure.ac:47: error: required file './compile' not found
  configure.ac:47:   'automake --add-missing' can install 'compile'

https://logging.apache.org/log4cxx/latest_stable/changes-report.html#a0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cxx/0001-charset-fixes.patch           |  43 -----
 package/log4cxx/0002-missing-includes.patch        |  44 -----
 package/log4cxx/0003-missing-includes.patch        |  21 ---
 ...ch-for-LOGCXX-400-LOGCXX-404-LOGCXX-402-L.patch | 180 ---------------------
 ....cpp-fix-narrowing-conversion-compile-err.patch |  36 -----
 package/log4cxx/log4cxx.hash                       |   4 +-
 package/log4cxx/log4cxx.mk                         |   4 +-
 7 files changed, 5 insertions(+), 327 deletions(-)

diff --git a/package/log4cxx/0001-charset-fixes.patch b/package/log4cxx/0001-charset-fixes.patch
deleted file mode 100644
index 75567fdad1..0000000000
--- a/package/log4cxx/0001-charset-fixes.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Fix build when iconv support is not available
-
-When iconv support is not available, the apr-util library does not
-provide character set conversion features, and therefore APR_HAS_XLATE
-is false.
-
-However, on Linux !defined(_WIN32) is always true, but the part of the
-code that defines the APRCharsetDecoder and APRCharsetEncoder are only
-enclosed in a #if APR_HAS_XLATE, without the "|| defined(_WIN32)"
-which leads to build failures: the APRCharsetEncoder and
-APRCharsetDecoder classes are used without being defined.
-
-This patch removes the || !defined(_WIN32) so that when iconv support
-is not here, we fall back to raising an exception at runtime.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/main/cpp/charsetdecoder.cpp
-===================================================================
---- a/src/main/cpp/charsetdecoder.cpp
-+++ b/src/main/cpp/charsetdecoder.cpp
-@@ -476,7 +476,7 @@
-         StringHelper::equalsIgnoreCase(charset, LOG4CXX_STR("ISO-LATIN-1"), LOG4CXX_STR("iso-latin-1"))) {
-         return new ISOLatinCharsetDecoder();
-     }
--#if APR_HAS_XLATE || !defined(_WIN32)
-+#if APR_HAS_XLATE
-     return new APRCharsetDecoder(charset);
- #else    
-     throw IllegalArgumentException(charset);
-Index: b/src/main/cpp/charsetencoder.cpp
-===================================================================
---- a/src/main/cpp/charsetencoder.cpp
-+++ b/src/main/cpp/charsetencoder.cpp
-@@ -484,7 +484,7 @@
-     } else if (StringHelper::equalsIgnoreCase(charset, LOG4CXX_STR("UTF-16LE"), LOG4CXX_STR("utf-16le"))) {
-         return new UTF16LECharsetEncoder();
-     }
--#if APR_HAS_XLATE || !defined(_WIN32)
-+#if APR_HAS_XLATE
-     return new APRCharsetEncoder(charset);
- #else    
-     throw IllegalArgumentException(charset);
diff --git a/package/log4cxx/0002-missing-includes.patch b/package/log4cxx/0002-missing-includes.patch
deleted file mode 100644
index dd4da11619..0000000000
--- a/package/log4cxx/0002-missing-includes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-commit bcaf1f8a682d641cee325142099c371464fd5946
-Author: Curtis William Arnold <carnold@apache.org>
-Date:   Tue May 20 16:05:37 2008 +0000
-
-    LOGCXX-286: gcc 4.3 requires #include <cstring>
-    
-    git-svn-id: https://svn.apache.org/repos/asf/logging/log4cxx/trunk at 658304 13f79535-47bb-0310-9956-ffa450edef68
-
-diff --git a/src/examples/cpp/console.cpp b/src/examples/cpp/console.cpp
-index 6a01d8a..a673a10 100755
---- a/src/examples/cpp/console.cpp
-+++ b/src/examples/cpp/console.cpp
-@@ -22,6 +22,7 @@
- #include <log4cxx/logmanager.h>
- #include <iostream>
- #include <locale.h>
-+#include <cstring>
- 
- using namespace log4cxx;
- using namespace log4cxx::helpers;
-diff --git a/src/main/cpp/inputstreamreader.cpp b/src/main/cpp/inputstreamreader.cpp
-index 52b1c0a..cb45181 100644
---- a/src/main/cpp/inputstreamreader.cpp
-+++ b/src/main/cpp/inputstreamreader.cpp
-@@ -20,6 +20,7 @@
- #include <log4cxx/helpers/exception.h>
- #include <log4cxx/helpers/pool.h>
- #include <log4cxx/helpers/bytebuffer.h>
-+#include <cstring>
- 
- using namespace log4cxx;
- using namespace log4cxx::helpers;
-diff --git a/src/main/cpp/socketoutputstream.cpp b/src/main/cpp/socketoutputstream.cpp
-index 185f835..c61eb11 100644
---- a/src/main/cpp/socketoutputstream.cpp
-+++ b/src/main/cpp/socketoutputstream.cpp
-@@ -19,6 +19,7 @@
- #include <log4cxx/helpers/socketoutputstream.h>
- #include <log4cxx/helpers/socket.h>
- #include <log4cxx/helpers/bytebuffer.h>
-+#include <cstring>
- 
- using namespace log4cxx;
- using namespace log4cxx::helpers;
diff --git a/package/log4cxx/0003-missing-includes.patch b/package/log4cxx/0003-missing-includes.patch
deleted file mode 100644
index cd21bbab3e..0000000000
--- a/package/log4cxx/0003-missing-includes.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-commit ce62c00ea5f9bf2f0740ecde5b245c9b7edc80ff
-Author: Curtis William Arnold <carnold@apache.org>
-Date:   Mon Apr 27 03:53:50 2009 +0000
-
-    LOGCXX-332: fails to build with gcc 4.4
-    
-    git-svn-id: https://svn.apache.org/repos/asf/logging/log4cxx/trunk at 768863 13f79535-47bb-0310-9956-ffa450edef68
-
-diff --git a/src/examples/cpp/console.cpp b/src/examples/cpp/console.cpp
-index a673a10..f44c944 100755
---- a/src/examples/cpp/console.cpp
-+++ b/src/examples/cpp/console.cpp
-@@ -23,6 +23,8 @@
- #include <iostream>
- #include <locale.h>
- #include <cstring>
-+#include <cstdio>
-+#include <stdint.h>
- 
- using namespace log4cxx;
- using namespace log4cxx::helpers;
diff --git a/package/log4cxx/0004-Applied-patch-for-LOGCXX-400-LOGCXX-404-LOGCXX-402-L.patch b/package/log4cxx/0004-Applied-patch-for-LOGCXX-400-LOGCXX-404-LOGCXX-402-L.patch
deleted file mode 100644
index a0c9b3f5bd..0000000000
--- a/package/log4cxx/0004-Applied-patch-for-LOGCXX-400-LOGCXX-404-LOGCXX-402-L.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 5b75dfa78b2c5e95296cee0201bc045ef7264ed0 Mon Sep 17 00:00:00 2001
-From: Christian Grobmeier <grobmeier@apache.org>
-Date: Tue, 27 Nov 2012 09:39:18 +0000
-Subject: [PATCH] Applied patch for LOGCXX-400 LOGCXX-404 LOGCXX-402 LOGCXX-403
- LOGCXX-401 thanks to Andrew Lazarus
-
-git-svn-id: https://svn.apache.org/repos/asf/logging/log4cxx/trunk at 1414037 13f79535-47bb-0310-9956-ffa450edef68
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- pom.xml                                             | 2 ++
- src/main/cpp/locationinfo.cpp                       | 4 ++--
- src/main/cpp/loggingevent.cpp                       | 2 +-
- src/main/cpp/ndc.cpp                                | 4 ++--
- src/main/cpp/objectoutputstream.cpp                 | 4 ++--
- src/main/cpp/transcoder.cpp                         | 2 +-
- src/main/include/log4cxx/helpers/object.h           | 6 +++---
- src/main/include/log4cxx/helpers/simpledateformat.h | 4 +++-
- src/main/include/log4cxx/logstring.h                | 2 +-
- 9 files changed, 17 insertions(+), 13 deletions(-)
-
-diff --git a/pom.xml b/pom.xml
-index 3504c8a3..255907bd 100644
---- a/pom.xml
-+++ b/pom.xml
-@@ -55,6 +55,7 @@
- </organization>
- <build>
-     <plugins>
-+    <!--
-       <plugin>
-         <artifactId>maven-antrun-plugin</artifactId>
-         <executions>
-@@ -166,6 +167,7 @@
-           </dependency>
-         </dependencies>
-       </plugin>  
-+      -->
-           <plugin>
-          <artifactId>maven-assembly-plugin</artifactId>
-          <configuration>
-diff --git a/src/main/cpp/locationinfo.cpp b/src/main/cpp/locationinfo.cpp
-index e76ea29c..1daa3a5f 100644
---- a/src/main/cpp/locationinfo.cpp
-+++ b/src/main/cpp/locationinfo.cpp
-@@ -153,8 +153,8 @@ void LocationInfo::write(ObjectOutputStream& os, Pool& p) const {
-          0x61, 0x70, 0x61, 0x63, 0x68, 0x65, 0x2E, 0x6C, 
-          0x6F, 0x67, 0x34, 0x6A, 0x2E, 0x73, 0x70, 0x69, 
-          0x2E, 0x4C, 0x6F, 0x63, 0x61, 0x74, 0x69, 0x6F, 
--         0x6E, 0x49, 0x6E, 0x66, 0x6F, 0xED, 0x99, 0xBB, 
--         0xE1, 0x4A, 0x91, 0xA5, 0x7C, 0x02, 0x00, 0x01, 
-+         0x6E, 0x49, 0x6E, 0x66, 0x6F, static_cast<char>(0xED), static_cast<char>(0x99), static_cast<char>(0xBB), 
-+         static_cast<char>(0xE1), 0x4A, static_cast<char>(0x91), static_cast<char>(0xA5), 0x7C, 0x02, 0x00, 0x01, 
-          0x4C, 0x00, 0x08, 0x66, 0x75, 0x6C, 0x6C, 0x49, 
-          0x6E, 0x66, 0x6F, 
-             0x74, 0x00, 0x12, 0x4C, 0x6A, 
-diff --git a/src/main/cpp/loggingevent.cpp b/src/main/cpp/loggingevent.cpp
-index 1c0d4be7..edbf40b6 100644
---- a/src/main/cpp/loggingevent.cpp
-+++ b/src/main/cpp/loggingevent.cpp
-@@ -242,7 +242,7 @@ void LoggingEvent::writeProlog(ObjectOutputStream& os, Pool& p)  {
-         0x68, 0x65, 0x2E, 0x6C, 0x6F, 0x67, 0x34, 0x6A, 
-         0x2E, 0x73, 0x70, 0x69, 0x2E, 0x4C, 0x6F, 0x67, 
-         0x67, 0x69, 0x6E, 0x67, 0x45, 0x76, 0x65, 0x6E, 
--        0x74, 0xF3, 0xF2, 0xB9, 0x23, 0x74, 0x0B, 0xB5, 
-+        0x74, static_cast<char>(0xF3), static_cast<char>(0xF2), static_cast<char>(0xB9), 0x23, 0x74, 0x0B, static_cast<char>(0xB5), 
-         0x3F, 0x03, 0x00, 0x0A, 0x5A, 0x00, 0x15, 0x6D, 
-         0x64, 0x63, 0x43, 0x6F, 0x70, 0x79, 0x4C, 0x6F, 
-         0x6F, 0x6B, 0x75, 0x70, 0x52, 0x65, 0x71, 0x75, 
-diff --git a/src/main/cpp/ndc.cpp b/src/main/cpp/ndc.cpp
-index 4ab612dd..89788c16 100644
---- a/src/main/cpp/ndc.cpp
-+++ b/src/main/cpp/ndc.cpp
-@@ -309,7 +309,7 @@ bool NDC::pop(CFStringRef& dst)
-         Stack& stack = data->getStack();
-         if(!stack.empty())
-         {
--                dst = Transcoder::encode(stack.top().message);
-+                dst = Transcoder::encode(getMessage(stack.top()));
-                 stack.pop();
-                 data->recycle();
-                 return true;
-@@ -326,7 +326,7 @@ bool NDC::peek(CFStringRef& dst)
-         Stack& stack = data->getStack();
-         if(!stack.empty())
-         {
--                dst = Transcoder::encode(stack.top().message);
-+                dst = Transcoder::encode(getMessage(stack.top()));
-                 return true;
-         }
-         data->recycle();
-diff --git a/src/main/cpp/objectoutputstream.cpp b/src/main/cpp/objectoutputstream.cpp
-index 7cd696b8..9567a856 100644
---- a/src/main/cpp/objectoutputstream.cpp
-+++ b/src/main/cpp/objectoutputstream.cpp
-@@ -36,7 +36,7 @@ ObjectOutputStream::ObjectOutputStream(OutputStreamPtr outputStream, Pool& p)
-        objectHandle(0x7E0000),
-        classDescriptions(new ClassDescriptionMap())
- {
--   char start[] = { 0xAC, 0xED, 0x00, 0x05 };
-+   char start[] = { static_cast<char>(0xAC), static_cast<char>(0xED), 0x00, 0x05 };
-    ByteBuffer buf(start, sizeof(start));
-    os->write(buf, p);
- }
-@@ -85,7 +85,7 @@ void ObjectOutputStream::writeObject(const MDC::Map& val, Pool& p) {
-         0x72, 0x00, 0x13, 0x6A, 0x61, 0x76, 0x61, 
-         0x2E, 0x75, 0x74, 0x69, 0x6C, 0x2E, 0x48, 0x61, 
-         0x73, 0x68, 0x74, 0x61, 0x62, 0x6C, 0x65, 0x13, 
--        0xBB, 0x0F, 0x25, 0x21, 0x4A, 0xE4, 0xB8, 0x03, 
-+        static_cast<char>(0xBB), 0x0F, 0x25, 0x21, 0x4A, static_cast<char>(0xE4), static_cast<char>(0xB8), 0x03,
-         0x00, 0x02, 0x46, 0x00, 0x0A, 0x6C, 0x6F, 0x61, 
-         0x64, 0x46, 0x61, 0x63, 0x74, 0x6F, 0x72, 0x49, 
-         0x00, 0x09, 0x74, 0x68, 0x72, 0x65, 0x73, 0x68, 
-diff --git a/src/main/cpp/transcoder.cpp b/src/main/cpp/transcoder.cpp
-index d572ffce..32bed844 100644
---- a/src/main/cpp/transcoder.cpp
-+++ b/src/main/cpp/transcoder.cpp
-@@ -356,7 +356,7 @@ static void encodeUTF16(unsigned int sv, String& dst) {
-         unsigned char u = (unsigned char) (sv >> 16);
-         unsigned char w = (unsigned char) (u - 1);
-         unsigned short hs = (0xD800 + ((w & 0xF) << 6) + ((sv & 0xFFFF) >> 10));
--        unsigned short ls = (0xDC00 + (sv && 0x3FF));
-+        unsigned short ls = (0xDC00 + (sv & 0x3FF));
-         dst.append(1, hs);
-         dst.append(1, ls);
-     }
-diff --git a/src/main/include/log4cxx/helpers/object.h b/src/main/include/log4cxx/helpers/object.h
-index 92d44c55..b9386c47 100644
---- a/src/main/include/log4cxx/helpers/object.h
-+++ b/src/main/include/log4cxx/helpers/object.h
-@@ -61,8 +61,8 @@ static const helpers::Class& getStaticClass();\
- static const log4cxx::helpers::ClassRegistration&  registerClass();
- 
- #define IMPLEMENT_LOG4CXX_OBJECT(object)\
--const log4cxx::helpers::Class& object::getClass() const { return getStaticClass(); }\
--const log4cxx::helpers::Class& object::getStaticClass() { \
-+const ::log4cxx::helpers::Class& object::getClass() const { return getStaticClass(); }\
-+const ::log4cxx::helpers::Class& object::getStaticClass() { \
-    static Clazz##object theClass;                         \
-    return theClass;                                       \
- }                                                                      \
-@@ -71,7 +71,7 @@ const log4cxx::helpers::ClassRegistration& object::registerClass() {   \
-     return classReg; \
- }\
- namespace log4cxx { namespace classes { \
--const log4cxx::helpers::ClassRegistration& object##Registration = object::registerClass(); \
-+const ::log4cxx::helpers::ClassRegistration& object##Registration = object::registerClass(); \
- } }
- 
- 
-diff --git a/src/main/include/log4cxx/helpers/simpledateformat.h b/src/main/include/log4cxx/helpers/simpledateformat.h
-index 9c27f685..76fb784c 100644
---- a/src/main/include/log4cxx/helpers/simpledateformat.h
-+++ b/src/main/include/log4cxx/helpers/simpledateformat.h
-@@ -29,7 +29,9 @@
- #include <vector>
- #include <time.h>
- 
--namespace std { class locale; }
-+#include <locale>
-+
-+using std::locale;
- 
- namespace log4cxx
- {
-diff --git a/src/main/include/log4cxx/logstring.h b/src/main/include/log4cxx/logstring.h
-index 3bbcdf2d..19e8aec7 100644
---- a/src/main/include/log4cxx/logstring.h
-+++ b/src/main/include/log4cxx/logstring.h
-@@ -27,7 +27,7 @@
- #include <string>
- #include <log4cxx/log4cxx.h>
- 
--#if LOG4CXX_LOGCHAR_IS_WCHAR && LOG4CXX_LOGCHAR_IS_UTF8 && LOG4CXX_LOGCHAR_IS_UNICHAR
-+#if (LOG4CXX_LOGCHAR_IS_WCHAR + LOG4CXX_LOGCHAR_IS_UTF8 + LOG4CXX_LOGCHAR_IS_UNICHAR)>1
- #error only one of LOG4CXX_LOGCHAR_IS_WCHAR, LOG4CXX_LOGCHAR_IS_UTF8 or LOG4CXX_LOGCHAR_IS_UNICHAR may be true
- #endif
- 
--- 
-2.11.0
-
diff --git a/package/log4cxx/0005-domtestcase.cpp-fix-narrowing-conversion-compile-err.patch b/package/log4cxx/0005-domtestcase.cpp-fix-narrowing-conversion-compile-err.patch
deleted file mode 100644
index b3f43bfd7c..0000000000
--- a/package/log4cxx/0005-domtestcase.cpp-fix-narrowing-conversion-compile-err.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From afc191aec355619d6ebabb2cad660a5a8ad4569b Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 30 Jan 2017 23:13:43 +0100
-Subject: [PATCH] domtestcase.cpp: fix narrowing conversion compile error with
- gcc 6+ / signed char
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/test/cpp/xml/domtestcase.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/test/cpp/xml/domtestcase.cpp b/src/test/cpp/xml/domtestcase.cpp
-index ad276d1a..2a1e6e2e 100644
---- a/src/test/cpp/xml/domtestcase.cpp
-+++ b/src/test/cpp/xml/domtestcase.cpp
-@@ -190,7 +190,7 @@ public:
-                 DOMConfigurator::configure(LOG4CXX_TEST_STR("input/xml/DOMTestCase3.xml"));
-                 LOG4CXX_INFO(logger, "File name is expected to end with a superscript 3")
- #if LOG4CXX_LOGCHAR_IS_UTF8
--                const logchar fname[] = { 0x6F, 0x75, 0x74, 0x70, 0x75, 0x74, 0x2F, 0x64, 0x6F, 0x6D, 0xC2, 0xB3, 0 };
-+                const logchar fname[] = { 0x6F, 0x75, 0x74, 0x70, 0x75, 0x74, 0x2F, 0x64, 0x6F, 0x6D, static_cast<logchar>(0xC2), static_cast<logchar>(0xB3), 0 };
- #else
-                 const logchar fname[] = { 0x6F, 0x75, 0x74, 0x70, 0x75, 0x74, 0x2F, 0x64, 0x6F, 0x6D, 0xB3, 0 };
- #endif
-@@ -209,7 +209,7 @@ public:
-                 DOMConfigurator::configure(LOG4CXX_TEST_STR("input/xml/DOMTestCase4.xml"));
-                 LOG4CXX_INFO(logger, "File name is expected to end with an ideographic 4")
- #if LOG4CXX_LOGCHAR_IS_UTF8
--                const logchar fname[] = { 0x6F, 0x75, 0x74, 0x70, 0x75, 0x74, 0x2F, 0x64, 0x6F, 0x6D, 0xE3, 0x86, 0x95, 0 };
-+                const logchar fname[] = { 0x6F, 0x75, 0x74, 0x70, 0x75, 0x74, 0x2F, 0x64, 0x6F, 0x6D, static_cast<logchar>(0xE3), static_cast<logchar>(0x86), static_cast<logchar>(0x95), 0 };
- #else
-                 const logchar fname[] = { 0x6F, 0x75, 0x74, 0x70, 0x75, 0x74, 0x2F, 0x64, 0x6F, 0x6D, 0x3195, 0 };
- #endif
--- 
-2.11.0
-
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 90fa2e73d3..535a0c4aac 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c  apache-log4cxx-0.10.0.tar.gz
+# From https://www.apache.org/dist/logging/log4cxx/0.11.0/apache-log4cxx-0.11.0.tar.gz.sha512
+sha512  f8aa37c9c094e7a4d6ca92dff13c032f69f1e078c51ea55e284fcb931c13256b08950af3ea6eaf7a12282240f6073e9acab19bfe217f88dbd62a5d2360f3fbdd  apache-log4cxx-0.11.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 7d7e2e9bb2..0ddea9466a 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 0.10.0
+LOG4CXX_VERSION = 0.11.0
 LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
+# error: required file './compile' not found
+LOG4CXX_AUTORECONF = YES
 
 LOG4CXX_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
