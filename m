From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 21:39:17 +0100
Subject: [Buildroot] [git commit] dmalloc: fix parallel build
Message-ID: <20150104204046.4ACD38042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cac64f2b0cb9e6f6a39c7eede1b80152293a741a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should hopefully fix:

  http://autobuild.buildroot.net/results/2cc40ae3fc8b7a287c43528b3e4ffdbcd5033c09/

[Thomas:
 - Rename patch to the new naming convention.
 - Add SoB line from Alex inside the patch itself.
 - Adjust the commit log to contain the reference to the autobuilder
   failure.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/0003-fix-parallel-build.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/dmalloc/0003-fix-parallel-build.patch b/package/dmalloc/0003-fix-parallel-build.patch
new file mode 100644
index 0000000..d6bb6e5
--- /dev/null
+++ b/package/dmalloc/0003-fix-parallel-build.patch
@@ -0,0 +1,18 @@
+Fix parallel build issue
+
+Missing dmallocc.o <- dmalloc.h dependency may break parallel builds.
+dmalloc.h is generated,and may not be around by the time gcc starts
+parsing dmallocc.cc.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
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
