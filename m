From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:55:52 +0200
Subject: [Buildroot] [git commit] jsoncpp: fix build for non C++11 toolchains
Message-ID: <20150331115925.4E8B67FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42bb259af5ce66a8b74f6d00b9e4cfd81922e0e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch removing reference to std::snprintf that is only in C++11.

Fixes:
http://autobuild.buildroot.net/results/b39/b390beeb9a6fea12f1a4d9f2ff9a8a483628cad2/
http://autobuild.buildroot.net/results/d18/d18b3e116b680a3897fbea296938e900a1e5e80a/
http://autobuild.buildroot.net/results/1b2/1b20a2f81dd2b409785930705222bc03576c4907/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-Revert-Use-std-namespace-for-snprintf.patch |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
new file mode 100644
index 0000000..6c6ae2d
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
