From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 13:29:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build when time_t is
 defined as long long
Message-ID: <20210304122925.1609049-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some platforms time_t is defined as long long. At the moment, the
compilation of sqlite3_column_as<time_t>(...) fails on these systems
because the appropriate getter is not defined

Fixes:
 - http://autobuild.buildroot.org/results/3a76afdbd8b564579bfb08a4d75b438dbd73ac2e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...to-read-database-values-as-long-long.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch

diff --git a/package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch b/package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch
new file mode 100644
index 0000000000..564cba87bb
--- /dev/null
+++ b/package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch
@@ -0,0 +1,28 @@
+From 1d36faad18e34b43ac8ea3e7f6a44315f827a2db Mon Sep 17 00:00:00 2001
+From: George Hopkins <george-hopkins@null.net>
+Date: Mon, 4 Jan 2021 13:59:41 +0100
+Subject: [PATCH] Add getter to read database values as long long
+
+[Retrieved from:
+https://github.com/kismetwireless/kismet/commit/1d36faad18e34b43ac8ea3e7f6a44315f827a2db]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sqlite3_cpp11.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/sqlite3_cpp11.cc b/sqlite3_cpp11.cc
+index 7974bde8c..5c92dfa87 100644
+--- a/sqlite3_cpp11.cc
++++ b/sqlite3_cpp11.cc
+@@ -411,6 +411,11 @@ namespace kissqlite3 {
+         return (unsigned long) sqlite3_column_int64(stmt.get(), column);
+     }
+ 
++    template<>
++    long long sqlite3_column_as(std::shared_ptr<sqlite3_stmt> stmt, unsigned int column) {
++        return (long long) sqlite3_column_int64(stmt.get(), column);
++    }
++
+     template<>
+     unsigned long long sqlite3_column_as(std::shared_ptr<sqlite3_stmt> stmt, unsigned int column) {
+         return (unsigned long long) sqlite3_column_int64(stmt.get(), column);
-- 
2.30.0
