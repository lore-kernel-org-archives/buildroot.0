From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 3 Jan 2015 13:05:03 +0200
Subject: [Buildroot] [PATCH] dmalloc: fix parallel builds
Message-ID: <20150103110503.GA11955@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 This patch should fix
 http://autobuild.buildroot.net/results/2cc40ae3fc8b7a287c43528b3e4ffdbcd5033c09/

 package/dmalloc/dmalloc-deps.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/dmalloc/dmalloc-deps.patch

diff --git a/package/dmalloc/dmalloc-deps.patch b/package/dmalloc/dmalloc-deps.patch
new file mode 100644
index 0000000..c717e1a
--- /dev/null
+++ b/package/dmalloc/dmalloc-deps.patch
@@ -0,0 +1,14 @@
+Missing dmallocc.o <- dmalloc.h dependency may break parallel builds.
+dmalloc.h is generated, and may not be around by the time gcc starts
+parsing dmallocc.cc.
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -399,6 +399,7 @@
+ compat.o: compat.c dmalloc.h conf.h settings.h compat.h dmalloc_loc.h
+ dmalloc.o: dmalloc.c dmalloc_argv.h conf.h settings.h dmalloc.h \
+  compat.h debug_tok.h dmalloc_loc.h env.h error_val.h version.h
++dmallocc.o: dmallocc.cc dmalloc.h return.h conf.h settings.h
+ dmalloc_argv.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
+  dmalloc_argv_loc.h compat.h
+ dmalloc_rand.o: dmalloc_rand.c conf.h settings.h dmalloc_rand.h
-- 
2.0.3
