From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Aug 2017 19:36:03 +0200
Subject: [Buildroot] [PATCH 4/7] package/jsoncpp: fix build with glibc >=
	2.26
In-Reply-To: <20170827173606.13144-1-romain.naour@gmail.com>
References: <20170827173606.13144-1-romain.naour@gmail.com>
Message-ID: <20170827173606.13144-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Issue found while testing glibc 2.26 bump.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...001-json_writer-fix-build-with-glibc-2.26.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch

diff --git a/package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch b/package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch
new file mode 100644
index 0000000..90acb12
--- /dev/null
+++ b/package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch
@@ -0,0 +1,28 @@
+From 8b7250335f1a1a4bb46f28846500e11148d78449 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 26 Aug 2017 19:39:03 +0200
+Subject: [PATCH] json_writer: fix build with glibc >= 2.26
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/lib_json/json_writer.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib_json/json_writer.cpp b/src/lib_json/json_writer.cpp
+index 02f1cb1..db61988 100644
+--- a/src/lib_json/json_writer.cpp
++++ b/src/lib_json/json_writer.cpp
+@@ -41,7 +41,9 @@
+ #endif
+ #else
+ #include <cmath>
+-#if !(defined(__QNXNTO__)) // QNX already defines isfinite
++// QNX already defines isfinite
++#if !(defined(__QNXNTO__)) && \
++    (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 25))
+ #define isfinite std::isfinite
+ #endif
+ #endif
+-- 
+2.9.5
+
-- 
2.9.5
