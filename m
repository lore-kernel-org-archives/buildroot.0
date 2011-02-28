From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Feb 2011 10:24:51 +0100
Subject: [Buildroot] [git commit master 1/1] synergy: fix build with modern
	toolchains
Message-ID: <20110228092554.88D8881776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57ab28928bd8979fa34751bc1c248a1af00ce1f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of includes were missing for exit/getenv/memcpy/strlen/...

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/synergy/synergy-1.3.1-exit.patch     |   21 ----
 package/synergy/synergy-1.3.1-includes.patch |  167 ++++++++++++++++++++++++++
 2 files changed, 167 insertions(+), 21 deletions(-)
 delete mode 100644 package/synergy/synergy-1.3.1-exit.patch
 create mode 100644 package/synergy/synergy-1.3.1-includes.patch

diff --git a/package/synergy/synergy-1.3.1-exit.patch b/package/synergy/synergy-1.3.1-exit.patch
deleted file mode 100644
index 1eb665f..0000000
--- a/package/synergy/synergy-1.3.1-exit.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-[PATCH] fix build issue in CArchDaemonUnix
-
-exit() needs #include <stdlib.h> for the prototype.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lib/arch/CArchDaemonUnix.cpp |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/arch/CArchDaemonUnix.cpp
-+++ synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
-@@ -19,6 +19,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <errno.h>
-+#include <stdlib.h>
- 
- //
- // CArchDaemonUnix
diff --git a/package/synergy/synergy-1.3.1-includes.patch b/package/synergy/synergy-1.3.1-includes.patch
new file mode 100644
index 0000000..accaf82
--- /dev/null
+++ b/package/synergy/synergy-1.3.1-includes.patch
@@ -0,0 +1,167 @@
+[PATCH] fix build with modern toolchains
+
+Several files are missing the correct includes for exit/getenvmemcpy/strlen/..
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lib/arch/CArchDaemonUnix.cpp        |    1 +
+ lib/arch/CMultibyte.cpp             |    1 +
+ lib/base/CStringUtil.cpp            |    1 +
+ lib/client/CClient.cpp              |    3 ++-
+ lib/client/CServerProxy.cpp         |    1 +
+ lib/net/CTCPSocket.cpp              |    2 +-
+ lib/platform/CXWindowsScreen.cpp    |    1 +
+ lib/server/CClientProxy1_3.cpp      |    1 +
+ lib/server/CServer.cpp              |    1 +
+ lib/synergy/CPacketStreamFilter.cpp |    1 +
+ lib/synergy/IKeyState.cpp           |    1 +
+ lib/synergy/IPrimaryScreen.cpp      |    1 +
+ 12 files changed, 13 insertions(+), 2 deletions(-)
+
+Index: synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/arch/CArchDaemonUnix.cpp
++++ synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
+@@ -19,6 +19,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <errno.h>
++#include <stdlib.h>
+ 
+ //
+ // CArchDaemonUnix
+Index: synergy-1.3.1/lib/arch/CMultibyte.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/arch/CMultibyte.cpp
++++ synergy-1.3.1/lib/arch/CMultibyte.cpp
+@@ -19,6 +19,7 @@
+ #include "CArch.h"
+ #include <limits.h>
+ #include <string.h>
++#include <stdlib.h>
+ #if HAVE_LOCALE_H
+ #	include <locale.h>
+ #endif
+Index: synergy-1.3.1/lib/base/CStringUtil.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/base/CStringUtil.cpp
++++ synergy-1.3.1/lib/base/CStringUtil.cpp
+@@ -19,6 +19,7 @@
+ #include <cctype>
+ #include <cstdio>
+ #include <cstdlib>
++#include <cstring>
+ #include <algorithm>
+ 
+ //
+Index: synergy-1.3.1/lib/client/CClient.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/client/CClient.cpp
++++ synergy-1.3.1/lib/client/CClient.cpp
+@@ -26,7 +26,8 @@
+ #include "CLog.h"
+ #include "IEventQueue.h"
+ #include "TMethodEventJob.h"
+-
++#include <string.h>
++#include <stdlib.h>
+ //
+ // CClient
+ //
+Index: synergy-1.3.1/lib/client/CServerProxy.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/client/CServerProxy.cpp
++++ synergy-1.3.1/lib/client/CServerProxy.cpp
+@@ -24,6 +24,7 @@
+ #include "TMethodEventJob.h"
+ #include "XBase.h"
+ #include <memory>
++#include <string.h>
+ 
+ //
+ // CServerProxy
+Index: synergy-1.3.1/lib/net/CTCPSocket.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/net/CTCPSocket.cpp
++++ synergy-1.3.1/lib/net/CTCPSocket.cpp
+@@ -24,7 +24,7 @@
+ #include "CArch.h"
+ #include "XArch.h"
+ #include <string.h>
+-
++#include <stdlib.h>
+ //
+ // CTCPSocket
+ //
+Index: synergy-1.3.1/lib/platform/CXWindowsScreen.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/platform/CXWindowsScreen.cpp
++++ synergy-1.3.1/lib/platform/CXWindowsScreen.cpp
+@@ -27,6 +27,7 @@
+ #include "IEventQueue.h"
+ #include "TMethodEventJob.h"
+ #include <cstring>
++#include <stdlib.h>
+ #if X_DISPLAY_MISSING
+ #	error X11 is required to build synergy
+ #else
+Index: synergy-1.3.1/lib/server/CClientProxy1_3.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/server/CClientProxy1_3.cpp
++++ synergy-1.3.1/lib/server/CClientProxy1_3.cpp
+@@ -17,6 +17,7 @@
+ #include "CLog.h"
+ #include "IEventQueue.h"
+ #include "TMethodEventJob.h"
++#include <string.h>
+ 
+ //
+ // CClientProxy1_3
+Index: synergy-1.3.1/lib/server/CServer.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/server/CServer.cpp
++++ synergy-1.3.1/lib/server/CServer.cpp
+@@ -29,6 +29,7 @@
+ #include "TMethodEventJob.h"
+ #include "CArch.h"
+ #include <string.h>
++#include <stdlib.h>
+ 
+ //
+ // CServer
+Index: synergy-1.3.1/lib/synergy/CPacketStreamFilter.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/synergy/CPacketStreamFilter.cpp
++++ synergy-1.3.1/lib/synergy/CPacketStreamFilter.cpp
+@@ -16,6 +16,7 @@
+ #include "IEventQueue.h"
+ #include "CLock.h"
+ #include "TMethodEventJob.h"
++#include <string.h>
+ 
+ //
+ // CPacketStreamFilter
+Index: synergy-1.3.1/lib/synergy/IKeyState.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/synergy/IKeyState.cpp
++++ synergy-1.3.1/lib/synergy/IKeyState.cpp
+@@ -14,6 +14,7 @@
+ 
+ #include "IKeyState.h"
+ #include <string.h>
++#include <stdlib.h>
+ 
+ //
+ // IKeyState
+Index: synergy-1.3.1/lib/synergy/IPrimaryScreen.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/synergy/IPrimaryScreen.cpp
++++ synergy-1.3.1/lib/synergy/IPrimaryScreen.cpp
+@@ -13,6 +13,7 @@
+  */
+ 
+ #include "IPrimaryScreen.h"
++#include <stdlib.h>
+ 
+ //
+ // IPrimaryScreen
-- 
1.7.3.4
