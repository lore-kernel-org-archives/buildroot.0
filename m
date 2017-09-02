From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Sep 2017 22:54:16 +0200
Subject: [Buildroot] [PATCH v2 04/11] package/jsoncpp: fix build with glibc
	>= 2.26
In-Reply-To: <20170902205423.21288-1-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
Message-ID: <20170902205423.21288-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Issue found while testing glibc 2.26 bump.

Fixes:
src/lib_json/json_writer.cpp:45:23: error: 'isfinite' is not a member of 'std'
 #define isfinite std::isfinite
                       ^

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: fix build with musl (ThomasP)
---
 ...001-json_writer-fix-build-with-glibc-2.26.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch

diff --git a/package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch b/package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch
new file mode 100644
index 0000000..fe7df85
--- /dev/null
+++ b/package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch
@@ -0,0 +1,34 @@
+From 2cb87c456f95510d55dd40f783435ecd1177c453 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 26 Aug 2017 19:39:03 +0200
+Subject: [PATCH] json_writer: fix build with glibc >= 2.26
+
+src/lib_json/json_writer.cpp:45:23: error: 'isfinite' is not a member of 'std'
+ #define isfinite std::isfinite
+                       ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/lib_json/json_writer.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/lib_json/json_writer.cpp b/src/lib_json/json_writer.cpp
+index 02f1cb1..a3189cb 100644
+--- a/src/lib_json/json_writer.cpp
++++ b/src/lib_json/json_writer.cpp
+@@ -42,9 +42,12 @@
+ #else
+ #include <cmath>
+ #if !(defined(__QNXNTO__)) // QNX already defines isfinite
++// std::isfinite is not defined on glibc >= 2.26
++#if !(defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 26)))
+ #define isfinite std::isfinite
+ #endif
+ #endif
++#endif
+ 
+ #if defined(_MSC_VER)
+ #if !defined(WINCE) && defined(__STDC_SECURE_LIB__) && _MSC_VER >= 1500 // VC++ 9.0 and above
+-- 
+2.9.5
+
-- 
2.9.5
