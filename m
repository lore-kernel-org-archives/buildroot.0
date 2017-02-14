From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 22:34:43 +0100
Subject: [Buildroot] [git commit] ddrescue: fix uclibc compile
Message-ID: <20170214214107.6AB7282138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c0aeeed04ecfb9a2e8650b4fa0f515a7959e7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes compile failure with uclibc [1] because of missing stdio.h include:

  In file included from io.cc:28:0:
  block.h:219:22: error: ???FILE??? has not been declared
     int write_mapfile( FILE * f = 0, const bool timestamp = false,

[1] http://autobuild.buildroot.net/results/4ac0754f1cc5ea934d6437e89d1f4906fb3fd0a8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../ddrescue/0001-io.cc-add-stdio.h-include.patch  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/ddrescue/0001-io.cc-add-stdio.h-include.patch b/package/ddrescue/0001-io.cc-add-stdio.h-include.patch
new file mode 100644
index 0000000..e719c70
--- /dev/null
+++ b/package/ddrescue/0001-io.cc-add-stdio.h-include.patch
@@ -0,0 +1,36 @@
+From 0f72787b922c53c33d497b17300a959b911e621f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 14 Feb 2017 20:12:05 +0100
+Subject: [PATCH] io.cc: add stdio.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes buildroot compile failure with uclibc [1]:
+
+  In file included from io.cc:28:0:
+  block.h:219:22: error: ???FILE??? has not been declared
+     int write_mapfile( FILE * f = 0, const bool timestamp = false,
+
+[1] http://autobuild.buildroot.net/results/4ac0754f1cc5ea934d6437e89d1f4906fb3fd0a8
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ io.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/io.cc b/io.cc
+index 36b8341..2d6a76e 100644
+--- a/io.cc
++++ b/io.cc
+@@ -23,6 +23,7 @@
+ #include <string>
+ #include <vector>
+ #include <stdint.h>
++#include <stdio.h>
+ #include <unistd.h>
+ 
+ #include "block.h"
+-- 
+2.11.0
+
