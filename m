From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 23 Mar 2018 14:00:30 -0300
Subject: [Buildroot] [PATCH] tpm2-tss: fix build with musl
Message-ID: <20180323170030.17416-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a missing <sys/select.h> inclusion, needed for the definition of the
fd_set type. This patch can't be sent upstream because the changed file
does not exist anymore on the master branch.

Fixes:
  http://autobuild.buildroot.net/results/09e8b3b85d7113d60e8967a2d41a6aea8f8197c0
  http://autobuild.buildroot.net/results/2e4c70f2f1239eb19235ae04a936a6492daf316d
  http://autobuild.buildroot.net/results/bbd68f52781da735e983b1260de5b804787374b1

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...ocket.cpp-add-missing-inclusion-of-sys-se.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch

diff --git a/package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch b/package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch
new file mode 100644
index 0000000000..e8e0d842f2
--- /dev/null
+++ b/package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch
@@ -0,0 +1,33 @@
+From 2fdbf9f56bd6e7b00c695881a81c0df2f5088760 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Fri, 23 Mar 2018 09:15:44 -0300
+Subject: [PATCH] tcti/tcti_socket.cpp: add missing inclusion of sys/select.h
+
+Prevents compilation errors due to undeclared "fd_set" type.
+
+Fixes:
+  http://autobuild.buildroot.net/results/09e8b3b85d7113d60e8967a2d41a6aea8f8197c0
+  http://autobuild.buildroot.net/results/2e4c70f2f1239eb19235ae04a936a6492daf316d
+  http://autobuild.buildroot.net/results/bbd68f52781da735e983b1260de5b804787374b1
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ tcti/tcti_socket.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tcti/tcti_socket.cpp b/tcti/tcti_socket.cpp
+index e8982f1..b6e5874 100644
+--- a/tcti/tcti_socket.cpp
++++ b/tcti/tcti_socket.cpp
+@@ -28,6 +28,8 @@
+ #include <stdio.h>
+ #include <stdlib.h>   // Needed for _wtoi
+ 
++#include <sys/select.h>   // for fd_set
++
+ #include "sapi/tpm20.h"
+ #include "tcti/tcti_socket.h"
+ #include "sysapi_util.h"
+-- 
+2.14.3
+
-- 
2.14.3
