From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 19:38:22 +0200
Subject: [Buildroot] [git commit] package/qdecoder: Fix build error
Message-ID: <20141025173840.809E1AF5AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1359943effe4051f048597f503c499f8f34dd362
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Error occured with an allyespackageconfig setup, with
BR2_ENABLE_DEBUG=y:

qcgireq.c: In function '_parse_multipart_value_into_disk':
qcgireq.c:738:60: error: 'errno' undeclared (first use in this function)
         DEBUG("I/O error. (errno=%d)", (ioerror == true) ? errno : 0);

Also fixes the same issue, seen by the autobuilders:

  http://autobuild.buildroot.org/results/ec0/ec06b196e0fe1e2cccb660c683cd1ba012c7f8c7/

[Thomas: add reference to autobuilder failure.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qdecoder/qdecoder-0003-errno.patch |   34 ++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/qdecoder/qdecoder-0003-errno.patch b/package/qdecoder/qdecoder-0003-errno.patch
new file mode 100644
index 0000000..71d5cfd
--- /dev/null
+++ b/package/qdecoder/qdecoder-0003-errno.patch
@@ -0,0 +1,34 @@
+Fixes build error
+
+qcgireq.c: In function '_parse_multipart_value_into_disk':
+qcgireq.c:738:60: error: 'errno' undeclared (first use in this function)
+         DEBUG("I/O error. (errno=%d)", (ioerror == true) ? errno : 0);
+
+Patch downloaded from upstream repo:
+https://github.com/wolkykim/qdecoder/commit/574f0216a51e3e852cd94e2a0a3b52dc64e74548
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 574f0216a51e3e852cd94e2a0a3b52dc64e74548 Mon Sep 17 00:00:00 2001
+From: nyov <nyov@nexnode.net>
+Date: Fri, 5 Sep 2014 18:41:10 +0000
+Subject: [PATCH] add missing header include
+
+fixes #7
+---
+ src/qcgireq.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/qcgireq.c b/src/qcgireq.c
+index dcb8c57..d34ff83 100644
+--- a/src/qcgireq.c
++++ b/src/qcgireq.c
+@@ -139,6 +139,7 @@
+ #ifndef _WIN32
+ #include <dirent.h>
+ #endif
++#include <errno.h>
+ #include "qdecoder.h"
+ #include "internal.h"
+ 
