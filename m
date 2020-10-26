From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2020 08:18:56 +0100
Subject: [Buildroot] [git commit] package/libuhttpd: fix build without dlopen
Message-ID: <20201026070718.E4D2A8600F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef97d74b453c87b4d50e97015383af5cbbd0e796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of libuhttpd in version 3.4.0 without dlopen

Fixes:
 - http://autobuild.buildroot.org/results/b2bbd0681705b94e6b531996b39f62e47f089c92

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-src-uhttpd.c-fix-build-without-dlopen.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch b/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
new file mode 100644
index 0000000000..966041028b
--- /dev/null
+++ b/package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch
@@ -0,0 +1,35 @@
+From 0b2058e7c96a3d8d994d572116ad7b950766347b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Oct 2020 21:39:47 +0200
+Subject: [PATCH] src/uhttpd.c: fix build without dlopen
+
+Build without dlopen fails on:
+
+/data/buildroot-test/instance-0/output-1/build/libuhttpd-3.4.0/src/uhttpd.c:45:23: error: unused variable 'p' [-Werror=unused-variable]
+     struct uh_plugin *p = srv->plugins;
+                       ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b2bbd0681705b94e6b531996b39f62e47f089c92
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/zhaojh329/libuhttpd/commit/0b2058e7c96a3d8d994d572116ad7b950766347b]
+---
+ src/uhttpd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/uhttpd.c b/src/uhttpd.c
+index dad3646..a37c136 100644
+--- a/src/uhttpd.c
++++ b/src/uhttpd.c
+@@ -42,7 +42,9 @@ void conn_free(struct uh_connection *conn);
+ static void uh_server_free(struct uh_server *srv)
+ {
+     struct uh_connection *conn = srv->conns;
++#ifdef HAVE_DLOPEN
+     struct uh_plugin *p = srv->plugins;
++#endif
+ 
+     ev_io_stop(srv->loop, &srv->ior);
+ 
