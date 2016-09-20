From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:07:49 +0200
Subject: [Buildroot] [git commit] ushare: fix build with NLS support
Message-ID: <20160920181525.54DFF8183B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32ff9de23e9c6deabee572eee845642671e53a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix build errors when NLS support is enabled.

Fixes:

  http://autobuild.buildroot.net/results/19d/19d67dd43e5a313c77e4be97ecb9811ffa52f797/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-config-h-before-checking-for-CONFIG-NLS.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

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
