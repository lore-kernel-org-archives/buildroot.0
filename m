From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jun 2018 22:09:22 +0300
Subject: [Buildroot] [PATCH] znc: fix build without openssl
Message-ID: <c809ed2649c492c5cd3bd30fd9d50c38858fe7c7.1528657762.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to include <memory> unconditionally.

Fixes:
http://autobuild.buildroot.net/results/4c3/4c3d9f6f5214052b7eda4c7bbfabe5b463080b12/
http://autobuild.buildroot.net/results/d06/d06176f00109ad0707032b0d76fe94f1d414106c/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Fix-build-without-SSL-support.patch  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/znc/0001-Fix-build-without-SSL-support.patch

diff --git a/package/znc/0001-Fix-build-without-SSL-support.patch b/package/znc/0001-Fix-build-without-SSL-support.patch
new file mode 100644
index 000000000000..23b78ed4beea
--- /dev/null
+++ b/package/znc/0001-Fix-build-without-SSL-support.patch
@@ -0,0 +1,37 @@
+From a263157165c411552d73a211ac9c7647285abdc5 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 10 Jun 2018 22:01:47 +0300
+Subject: [PATCH] Fix build without SSL support
+
+The <memory> headers is needed for unique_ptr even when SSL is not
+enabled. This fixes the following build failure:
+
+src/Utils.cpp: In static member function 'static bool CUtils::CheckCIDR(const CString&, const CString&)':
+src/Utils.cpp:674:5: error: 'unique_ptr' is not a member of 'std'
+     std::unique_ptr<addrinfo, decltype(deleter)> aiHost(aiHostC, deleter);
+     ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/znc/znc/pull/1554
+
+ src/Utils.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Utils.cpp b/src/Utils.cpp
+index 9c3b2549b791..cced5683d78a 100644
+--- a/src/Utils.cpp
++++ b/src/Utils.cpp
+@@ -27,8 +27,8 @@
+ #include <znc/Message.h>
+ #ifdef HAVE_LIBSSL
+ #include <openssl/ssl.h>
+-#include <memory>
+ #endif /* HAVE_LIBSSL */
++#include <memory>
+ #include <unistd.h>
+ #include <time.h>
+ 
+-- 
+2.17.1
+
-- 
2.17.1
