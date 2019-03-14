From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:53:44 +0100
Subject: [Buildroot] [git commit] package/liblo: bump to version 0.30
Message-ID: <20190314205055.B95638EC68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e61048ee149f423d768581cf3c90171d1fb9f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove both patches (already in version)
- Add sha256 hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-server-use-correct-poll.h-header.patch    | 32 ----------------------
 ...rc-server.c-fix-stringop-truncation-error.patch | 30 --------------------
 package/liblo/liblo.hash                           |  7 +++--
 package/liblo/liblo.mk                             |  2 +-
 4 files changed, 5 insertions(+), 66 deletions(-)

diff --git a/package/liblo/0001-server-use-correct-poll.h-header.patch b/package/liblo/0001-server-use-correct-poll.h-header.patch
deleted file mode 100644
index 04c0445534..0000000000
--- a/package/liblo/0001-server-use-correct-poll.h-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d59f2e6f42a9e4f8a9184d7ed75546f47dc50123 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 8 Apr 2018 11:09:02 +0200
-Subject: [PATCH] server: use correct poll.h header
-
-Fixes build with the musl C library:
-    http://autobuild.buildroot.net/results/000a46954d0c6d3dbc4b4634a0d3a3c955fac679
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Upstream status:
-  PR sent: https://github.com/radarsat1/liblo/pull/66
----
- src/server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/server.c b/src/server.c
-index 01fa08f..11c62d2 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -51,7 +51,7 @@
- #include <netdb.h>
- #include <sys/socket.h>
- #ifdef HAVE_POLL
--#include <sys/poll.h>
-+#include <poll.h>
- #endif
- #include <sys/un.h>
- #include <arpa/inet.h>
--- 
-2.14.1
-
diff --git a/package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch b/package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch
deleted file mode 100644
index 3f3bf86cc3..0000000000
--- a/package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c1b2fbd8d96d9b668a0b5e3c49c75c13cfe7d4ba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 15 Dec 2018 21:55:08 +0100
-Subject: [PATCH] src/server.c: fix stringop-truncation error
-
-Fixes:
- - http://autobuild.buildroot.org/results/62896bd6a1a30facaffd07a7a763831996dc8ea0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/radarsat1/liblo/pull/70]
----
- src/server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/server.c b/src/server.c
-index 6d1a9de..72aecc9 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -377,7 +377,7 @@ void lo_server_resolve_hostname(lo_server s)
-         gethostname(hostname, sizeof(hostname));
-         he = gethostbyname(hostname);
-         if (he) {
--            strncpy(hostname, he->h_name, sizeof(hostname));
-+            strncpy(hostname, he->h_name, sizeof(hostname) - 1);
-         }
-     }
- 
--- 
-2.14.1
-
diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index fe61f82e67..049ab80747 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,6 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
-sha1	6aa69456787d3d6ef915281b4a0f8f2c79548ce3	liblo-0.29.tar.gz
-md5	b0e70bc0fb2254addf94adddf85cffd3		liblo-0.29.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.30/
+sha1	152a3260d186f111a71508dc0ed709984960f130	liblo-0.30.tar.gz
+md5	fa1a9d45f86fc18fb54019f670ff2262		liblo-0.30.tar.gz
 
 # Locally computed
+sha256	  30a7c9de49a25ed7f2425a7a7415f5b14739def62431423d3419ea26fb978d1b	liblo-0.30.tar.gz
 sha256	  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index e28e52803a..69918186db 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.29
+LIBLO_VERSION = 0.30
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
