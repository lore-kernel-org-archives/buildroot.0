From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Dec 2018 09:32:17 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/liblo: fix
 stringop-truncation error with gcc 8
Message-ID: <20181217082811.8E0D2815E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1c9935f1a07f0e69f5d2432b5324ec174667a18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes:
 - http://autobuild.buildroot.org/results/62896bd6a1a30facaffd07a7a763831996dc8ea0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3697a8bac5c0cbf9801961e11a70f2ae76939b67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rc-server.c-fix-stringop-truncation-error.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch b/package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch
new file mode 100644
index 0000000000..3f3bf86cc3
--- /dev/null
+++ b/package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch
@@ -0,0 +1,30 @@
+From c1b2fbd8d96d9b668a0b5e3c49c75c13cfe7d4ba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 15 Dec 2018 21:55:08 +0100
+Subject: [PATCH] src/server.c: fix stringop-truncation error
+
+Fixes:
+ - http://autobuild.buildroot.org/results/62896bd6a1a30facaffd07a7a763831996dc8ea0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/radarsat1/liblo/pull/70]
+---
+ src/server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/server.c b/src/server.c
+index 6d1a9de..72aecc9 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -377,7 +377,7 @@ void lo_server_resolve_hostname(lo_server s)
+         gethostname(hostname, sizeof(hostname));
+         he = gethostbyname(hostname);
+         if (he) {
+-            strncpy(hostname, he->h_name, sizeof(hostname));
++            strncpy(hostname, he->h_name, sizeof(hostname) - 1);
+         }
+     }
+ 
+-- 
+2.14.1
+
