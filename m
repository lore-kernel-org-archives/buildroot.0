From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Jun 2020 11:54:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/wampcc fix build with musl 1.2.0
Message-ID: <20200601095432.1108102-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/da996e189220499b85efbdb541a891ac18db38c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...platform.h-fix-build-with-musl-1.2.0.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch

diff --git a/package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch b/package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch
new file mode 100644
index 0000000000..c7b8c78602
--- /dev/null
+++ b/package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch
@@ -0,0 +1,38 @@
+From 9c2559434b752df3dc8460ee242d321670a40847 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 1 Jun 2020 11:41:54 +0200
+Subject: [PATCH] include/wampcc/platform.h: fix build with musl 1.2.0
+
+Fix the following build failure on musl 1.2.0 due to time_t being on 64
+bits:
+
+/home/naourr/work/instance-0/output-1/build/wampcc-1.6/libs/wampcc/utils.cc: In function 'std::__cxx11::string wampcc::local_timestamp()':
+/home/naourr/work/instance-0/output-1/build/wampcc-1.6/libs/wampcc/utils.cc:205:15: error: cannot convert 'wampcc::time_val::type_type*' {aka 'long int*'} to 'const time_t*' {aka 'const long long int*'}
+   localtime_r(&now.sec, &parts);
+               ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/da996e189220499b85efbdb541a891ac18db38c6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/darrenjs/wampcc/pull/62]
+---
+ include/wampcc/platform.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/wampcc/platform.h b/include/wampcc/platform.h
+index 24d0868..aebf950 100644
+--- a/include/wampcc/platform.h
++++ b/include/wampcc/platform.h
+@@ -27,7 +27,7 @@ namespace wampcc
+   struct time_val
+   {
+ #ifndef _WIN32
+-    typedef long type_type;
++    typedef time_t type_type;
+ #else
+     typedef __time64_t type_type;
+ #endif
+-- 
+2.26.2
+
-- 
2.26.2
