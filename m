From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Mar 2015 18:22:51 +0200
Subject: [Buildroot] [PATCH] jsoncpp: fix build
Message-ID: <d6210b774fe3742376af62da3878a787570309be.1427214171.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch removing reference to non-existent std::snprintf.

Fixes:
http://autobuild.buildroot.net/results/b39/b390beeb9a6fea12f1a4d9f2ff9a8a483628cad2/
http://autobuild.buildroot.net/results/d18/d18b3e116b680a3897fbea296938e900a1e5e80a/
http://autobuild.buildroot.net/results/1b2/1b20a2f81dd2b409785930705222bc03576c4907/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...001-Revert-Use-std-namespace-for-snprintf.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch

diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
new file mode 100644
index 000000000000..1ffba9e3acfc
--- /dev/null
+++ b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
@@ -0,0 +1,34 @@
+From ce9b8553fe6741a935079ce94f8b29a26af1887f Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Subject: [PATCH] Revert "Use std namespace for snprintf."
+
+This reverts commit 1c58876185d2a4ed87dac4a54b82f607e74f55fd.
+
+snprintf() is not in the std namespace. This fixes the build error below:
+
+src/lib_json/json_writer.cpp:33:18: error: 'snprintf' is not a member of 'std'
+
+Upstream status: sent upstream
+https://github.com/open-source-parsers/jsoncpp/pull/227
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
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
