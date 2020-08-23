From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 15:03:18 +0200
Subject: [Buildroot] [git commit] package/owfs: fix build with gcc 10
Message-ID: <20200823125641.1702A82108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d57f13b7a9de24b507e16e6f3ad61920fff6501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7e9c33d7a1613826f85716403a00dce03dd8daf2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/owfs/0001-Fix-compilation-with-GCC10.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/owfs/0001-Fix-compilation-with-GCC10.patch b/package/owfs/0001-Fix-compilation-with-GCC10.patch
new file mode 100644
index 0000000000..49b703ee28
--- /dev/null
+++ b/package/owfs/0001-Fix-compilation-with-GCC10.patch
@@ -0,0 +1,41 @@
+From 43a4bc6b750c37f585d03b14941f3633ed5348d8 Mon Sep 17 00:00:00 2001
+From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
+Date: Tue, 9 Jun 2020 11:30:38 +0300
+Subject: [PATCH] Fix compilation with GCC10
+
+Fixed compilation with -fno-common, which enabled in GCC 10 by default.
+See https://bugs.gentoo.org/707438.
+[Retrieved from:
+https://github.com/owfs/owfs/commit/43a4bc6b750c37f585d03b14941f3633ed5348d8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ module/owserver/src/c/owserver.c       | 2 ++
+ module/owserver/src/include/owserver.h | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/module/owserver/src/c/owserver.c b/module/owserver/src/c/owserver.c
+index db29988e..2ed29161 100644
+--- a/module/owserver/src/c/owserver.c
++++ b/module/owserver/src/c/owserver.c
+@@ -36,6 +36,8 @@
+ 
+ #include "owserver.h"
+ 
++pthread_mutex_t persistence_mutex ;
++
+ /* --- Prototypes ------------ */
+ static void SetupAntiloop(int argc, char **argv);
+ 
+diff --git a/module/owserver/src/include/owserver.h b/module/owserver/src/include/owserver.h
+index 8be582f0..a257ed02 100644
+--- a/module/owserver/src/include/owserver.h
++++ b/module/owserver/src/include/owserver.h
+@@ -18,7 +18,7 @@
+ #include "ow.h"
+ #include "ow_connection.h"
+ 
+-pthread_mutex_t persistence_mutex ;
++extern pthread_mutex_t persistence_mutex ;
+ #define PERSISTENCELOCK    _MUTEX_LOCK(   persistence_mutex ) ;
+ #define PERSISTENCEUNLOCK  _MUTEX_UNLOCK( persistence_mutex ) ;
+ 
