From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:43:40 +0100
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.4.2
Message-ID: <20201031223126.0D9288212A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8436b05494c888dfd5fcbfe3da41b2e24fb99a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix compile fail on riscv64

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-src-uhttpd.c-fix-build-without-dlopen.patch | 35 ----------------------
 package/libuhttpd/libuhttpd.hash                   |  2 +-
 package/libuhttpd/libuhttpd.mk                     |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch b/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
deleted file mode 100644
index 966041028b..0000000000
--- a/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0b2058e7c96a3d8d994d572116ad7b950766347b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Oct 2020 21:39:47 +0200
-Subject: [PATCH] src/uhttpd.c: fix build without dlopen
-
-Build without dlopen fails on:
-
-/data/buildroot-test/instance-0/output-1/build/libuhttpd-3.4.0/src/uhttpd.c:45:23: error: unused variable 'p' [-Werror=unused-variable]
-     struct uh_plugin *p = srv->plugins;
-                       ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/b2bbd0681705b94e6b531996b39f62e47f089c92
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/zhaojh329/libuhttpd/commit/0b2058e7c96a3d8d994d572116ad7b950766347b]
----
- src/uhttpd.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/uhttpd.c b/src/uhttpd.c
-index dad3646..a37c136 100644
---- a/src/uhttpd.c
-+++ b/src/uhttpd.c
-@@ -42,7 +42,9 @@ void conn_free(struct uh_connection *conn);
- static void uh_server_free(struct uh_server *srv)
- {
-     struct uh_connection *conn = srv->conns;
-+#ifdef HAVE_DLOPEN
-     struct uh_plugin *p = srv->plugins;
-+#endif
- 
-     ev_io_stop(srv->loop, &srv->ior);
- 
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index bcded4a983..0e2d125fe0 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c77a404e2a666dda6c731cee977cfa8c2aa433e167222cbd28dd0c91a5c80570  libuhttpd-3.4.0.tar.gz
+sha256  a7650915f4444c84ad7ea813fcff44ae03eaf0c4cddfd2de4dcbf5ce9083874f  libuhttpd-3.4.2.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 71e7754bab..fe8621c803 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.4.0
+LIBUHTTPD_VERSION = 3.4.2
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
