From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 07:48:40 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: Add patch to fix build
	error with musl
Message-ID: <20141008075948.8E8EAB76FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0af871d0010a54283d66262d6010dd4833786df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build error with musl:

  - Instead of using the nonstandard pthread_yield call use the standardized
    sched_yield.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli-0002-musl-fixes.patch |   40 +++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

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
+Signed-off-by: J??rg Krause <jkrause@posteo.de>
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
