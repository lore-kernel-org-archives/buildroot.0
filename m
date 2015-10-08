From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  8 Oct 2015 20:35:02 +0200
Subject: [Buildroot] [PATCH v1] fbterm: fix musl compile
Message-ID: <1444329302-13716-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add missing include, fixes:

  fbio.cpp:33:8: error: ?fd_set? does not name a type
   static fd_set fds;

  improxy.cpp:439:3: error: ?fd_set? was not declared in this scope

- add missing WAIT_ANY define, fixes:

  fbterm.cpp: In member function ?void FbTerm::processSignal(u32)?:
  fbterm.cpp:212:22: error: ?WAIT_ANY? was not declared in this scope
      s32 pid = waitpid(WAIT_ANY, 0, WNOHANG);

Fixes:
http://autobuild.buildroot.net/results/ab2/ab2334700b44bac233994b76f2acf1795f0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...p-improxy.cpp-fbterm.cpp-fix-musl-compile.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch

diff --git a/package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch b/package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch
new file mode 100644
index 0000000..27e1e91
--- /dev/null
+++ b/package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch
@@ -0,0 +1,70 @@
+From 1072d60c6c8f1f51feb740527a8a056bfead9318 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 8 Oct 2015 19:53:47 +0200
+Subject: [PATCH] fbio.cpp, improxy.cpp, fbterm.cpp: fix musl compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- add missing include, fixes:
+
+  fbio.cpp:33:8: error: ?fd_set? does not name a type
+   static fd_set fds;
+
+  improxy.cpp:439:3: error: ?fd_set? was not declared in this scope
+
+- add missing WAIT_ANY define, fixes:
+
+  fbterm.cpp: In member function ?void FbTerm::processSignal(u32)?:
+  fbterm.cpp:212:22: error: ?WAIT_ANY? was not declared in this scope
+      s32 pid = waitpid(WAIT_ANY, 0, WNOHANG);
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/fbio.cpp    | 1 +
+ src/fbterm.cpp  | 4 ++++
+ src/improxy.cpp | 1 +
+ 3 files changed, 6 insertions(+)
+
+diff --git a/src/fbio.cpp b/src/fbio.cpp
+index e5afc44..88c632c 100644
+--- a/src/fbio.cpp
++++ b/src/fbio.cpp
+@@ -30,6 +30,7 @@
+ #define NR_EPOLL_FDS 10
+ s32 epollFd;
+ #else
++#include <sys/select.h>
+ static fd_set fds;
+ static u32 maxfd = 0;
+ #endif
+diff --git a/src/fbterm.cpp b/src/fbterm.cpp
+index 38d4014..60288e4 100644
+--- a/src/fbterm.cpp
++++ b/src/fbterm.cpp
+@@ -37,6 +37,10 @@
+ #include "input_key.h"
+ #include "mouse.h"
+ 
++#ifndef WAIT_ANY
++#define WAIT_ANY (-1)
++#endif
++
+ #ifdef HAVE_SIGNALFD
+ // <sys/signalfd.h> offered by some systems has bug with g++
+ #include "signalfd.h"
+diff --git a/src/improxy.cpp b/src/improxy.cpp
+index 3d03e66..4e046d2 100644
+--- a/src/improxy.cpp
++++ b/src/improxy.cpp
+@@ -23,6 +23,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <errno.h>
++#include <sys/select.h>
+ #include <sys/socket.h>
+ #include "improxy.h"
+ #include "immessage.h"
+-- 
+2.1.4
+
-- 
2.1.4
