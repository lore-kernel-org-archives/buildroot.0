From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Mar 2015 08:05:55 +0300
Subject: [Buildroot] [PATCH] jsoncpp: fix build for non C++11 toolchains
Message-ID: <37b3e007267cbef5bd458fc06e21e9893f3eb0a4.1427778355.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch removing reference to std::snprintf that is only in C++11.

Fixes:
http://autobuild.buildroot.net/results/b39/b390beeb9a6fea12f1a4d9f2ff9a8a483628cad2/
http://autobuild.buildroot.net/results/d18/d18b3e116b680a3897fbea296938e900a1e5e80a/
http://autobuild.buildroot.net/results/1b2/1b20a2f81dd2b409785930705222bc03576c4907/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   Update the commit log and patch description to note that C++11 does provide
   std::snprintf (Thomas P)
---
 ...001-Revert-Use-std-namespace-for-snprintf.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch

diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
new file mode 100644
index 000000000000..6c6ae2d0c4c9
--- /dev/null
+++ b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
@@ -0,0 +1,39 @@
+From 29bfb6ac06b7304d326e3b70fc0209a702b89d83 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Subject: [PATCH] Revert "Use std namespace for snprintf."
+
+This reverts commit 1c58876185d2a4ed87dac4a54b82f607e74f55fd.
+
+std::snprintf() is only available in C++11, which is not provided by
+all compilers. Since the C library snprintf() can easily be used as a
+replacement on Linux systems, this patch changes jsoncpp to use the C
+library snprintf() instead of C++11 std::snprintf(), fixing the build error
+below:
+
+src/lib_json/json_writer.cpp:33:18: error: 'snprintf' is not a member of 'std'
+
+Upstream status: sent upstream
+package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+ src/lib_json/json_writer.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/lib_json/json_writer.cpp b/src/lib_json/json_writer.cpp
+index 83102fd2bb86..f7ad1e21bbc0 100644
+--- a/src/lib_json/json_writer.cpp
++++ b/src/lib_json/json_writer.cpp
+@@ -29,8 +29,6 @@
+ 
+ #if defined(_MSC_VER) && _MSC_VER < 1500 // VC++ 8.0 and below
+ #define snprintf _snprintf
+-#else
+-#define snprintf std::snprintf
+ #endif
+ 
+ #if defined(_MSC_VER) && _MSC_VER >= 1400 // VC++ 8.0
+-- 
+2.1.4
+
-- 
2.1.4
