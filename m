From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Sep 2020 19:20:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cxx: fix build without wchar
Message-ID: <20200924172018.904670-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build with log4cxx in version 0.11.0

Fixes:
 - http://autobuild.buildroot.org/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-without-wchar.patch        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/log4cxx/0001-fix-build-without-wchar.patch

diff --git a/package/log4cxx/0001-fix-build-without-wchar.patch b/package/log4cxx/0001-fix-build-without-wchar.patch
new file mode 100644
index 0000000000..c297c76da3
--- /dev/null
+++ b/package/log4cxx/0001-fix-build-without-wchar.patch
@@ -0,0 +1,41 @@
+From f6507390138fa599bc93bafc0552cfb3128b6cd7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Sep 2020 08:47:37 +0200
+Subject: [PATCH] fix build without wchar
+
+Disable wencode without wchar or the build will fail on:
+
+odbcappender.cpp: In static member function 'static void log4cxx::db::ODBCAppender::encode(wchar_t**, const LogString&, log4cxx::helpers::Pool&)':
+odbcappender.cpp:362:22: error: 'wencode' is not a member of 'log4cxx::helpers::Transcoder'
+  *dest = Transcoder::wencode(src, p);
+                      ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/apache/logging-log4cxx/pull/42]
+---
+ src/main/cpp/odbcappender.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/main/cpp/odbcappender.cpp b/src/main/cpp/odbcappender.cpp
+index 6bfa519e..51ec5cd0 100644
+--- a/src/main/cpp/odbcappender.cpp
++++ b/src/main/cpp/odbcappender.cpp
+@@ -357,10 +357,12 @@ void ODBCAppender::setSql(const LogString& s)
+ 	}
+ }
+ 
++#if LOG4CXX_WCHAR_T_API
+ void ODBCAppender::encode(wchar_t** dest, const LogString& src, Pool& p)
+ {
+ 	*dest = Transcoder::wencode(src, p);
+ }
++#endif
+ 
+ void ODBCAppender::encode(unsigned short** dest,
+ 	const LogString& src, Pool& p)
+-- 
+2.28.0
+
-- 
2.28.0
