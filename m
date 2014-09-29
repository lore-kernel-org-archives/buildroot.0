From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Tue, 30 Sep 2014 00:18:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: Add patch to fix build
	error with musl
Message-ID: <1412029129-12590-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build error with musl:

  - Instead of using the nonstandard pthread_yield call use the standardized
    sched_yield.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/upmpdcli/upmpdcli-0002-musl-fixes.patch | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/upmpdcli/upmpdcli-0002-musl-fixes.patch

diff --git a/package/upmpdcli/upmpdcli-0002-musl-fixes.patch b/package/upmpdcli/upmpdcli-0002-musl-fixes.patch
new file mode 100644
index 0000000..c744319
--- /dev/null
+++ b/package/upmpdcli/upmpdcli-0002-musl-fixes.patch
@@ -0,0 +1,40 @@
+From bd1a8b6b547e06456cbede686d8c2f3cfdfa47d1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Tue, 30 Sep 2014 00:07:26 +0200
+Subject: [PATCH 2/2] musl fixes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Instead of using the nonstandard pthread_yield call use the standardized 
+sched_yield.
+
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+---
+ libupnpp/control/discovery.cxx | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libupnpp/control/discovery.cxx b/libupnpp/control/discovery.cxx
+index ac14a82..0a293c7 100644
+--- a/libupnpp/control/discovery.cxx
++++ b/libupnpp/control/discovery.cxx
+@@ -18,6 +18,7 @@
+ 
+ #include <stdlib.h>
+ #include <errno.h>
++#include <sched.h>
+ #include <unistd.h>
+ 
+ #include <iostream>
+@@ -297,7 +298,7 @@ UPnPDeviceDirectory::UPnPDeviceDirectory(time_t search_window)
+         m_reason = "Discover work queue start failed";
+         return;
+     }
+-    pthread_yield();
++    sched_yield();
+     LibUPnP *lib = LibUPnP::getLibUPnP();
+     if (lib == 0) {
+         m_reason = "Can't get lib";
+-- 
+2.1.1
+
-- 
2.1.1
