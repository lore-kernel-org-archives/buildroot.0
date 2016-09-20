From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 20 Sep 2016 19:30:14 +0530
Subject: [Buildroot] [PATCH] ushare: fix build with NLS support
Message-ID: <1474380014-20249-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix build errors when NLS support is enabled.

Fixes:

  http://autobuild.buildroot.net/results/19d/19d67dd43e5a313c77e4be97ecb9811ffa52f797/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 ...e-config-h-before-checking-for-CONFIG-NLS.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch

diff --git a/package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch b/package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch
new file mode 100644
index 0000000..e97c3de
--- /dev/null
+++ b/package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch
@@ -0,0 +1,42 @@
+ushare.c: include config.h before checking for CONFIG_NLS
+
+When NLS support is enabled, we get following build errors:
+
+  ushare.c: In function 'setup_i18n':
+  ushare.c:745:3: warning: implicit declaration of function 'setlocale' [-Wimplicit-function-declaration]
+     setlocale (LC_ALL, "");
+     ^
+  ushare.c:745:14: error: 'LC_ALL' undeclared (first use in this function)
+     setlocale (LC_ALL, "");
+                ^
+  ushare.c:745:14: note: each undeclared identifier is reported only once for each function it appears in
+  make[2]: *** [ushare.o] Error 1
+
+When NLS support is enabled, configure script creates macro in config.h.
+We check for CONFIG_NLS before including config.h which results in above
+build errors as locale.h doesn't get included.
+
+This patch fixes above build error by including config.h before we check for
+CONFIG_NLS.
+
+This build error is detected by Buildroot autobuilder
+http://autobuild.buildroot.net/results/19d/19d67dd43e5a313c77e4be97ecb9811ffa52f797/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+
+--- ushare-1.1a/src/ushare.c.old	2016-09-20 19:04:00.915239326 +0530
++++ ushare-1.1a/src/ushare.c	2016-09-20 19:04:24.707239276 +0530
+@@ -56,11 +56,12 @@
+ #include <upnp/upnp.h>
+ #include <upnp/upnptools.h>
+ 
++#include "config.h"
++
+ #if (defined(HAVE_SETLOCALE) && defined(CONFIG_NLS))
+ # include <locale.h>
+ #endif
+ 
+-#include "config.h"
+ #include "ushare.h"
+ #include "services.h"
+ #include "http.h"
-- 
2.6.2
