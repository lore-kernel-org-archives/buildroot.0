From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:37:51 +0100
Subject: [Buildroot] [git commit] tpm2-tss: fix build with musl
Message-ID: <20180324105507.355D181524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86ad2d92070c3024b2cf5de74dede294b56d5fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a missing <sys/select.h> inclusion, needed for the definition of the
fd_set type. This patch can't be sent upstream because the changed file
does not exist anymore on the master branch.

Fixes:
  http://autobuild.buildroot.net/results/09e8b3b85d7113d60e8967a2d41a6aea8f8197c0
  http://autobuild.buildroot.net/results/2e4c70f2f1239eb19235ae04a936a6492daf316d
  http://autobuild.buildroot.net/results/bbd68f52781da735e983b1260de5b804787374b1

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ocket.cpp-add-missing-inclusion-of-sys-se.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

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
