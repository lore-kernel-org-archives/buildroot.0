From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jun 2014 07:21:20 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: fix quota parallel build issue
Message-ID: <1401877280-5156-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missing quota.o dependencies, patch already upstream. Fixes:
http://autobuild.buildroot.net/results/aac/aac7b4e3becfc0db5e50ff45d28376f35a9131af/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...2fsck-fix-Makefile-dependency-for-quota.o.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch

diff --git a/package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch b/package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch
new file mode 100644
index 0000000..1e3f20d
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch
@@ -0,0 +1,32 @@
+From 5c15bf5f978bae01f1ca3cbe6414ab1d355a6adf Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 22 May 2014 18:52:27 -0400
+Subject: [PATCH] e2fsck: fix Makefile dependency for quota.o
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ e2fsck/Makefile.in | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/e2fsck/Makefile.in b/e2fsck/Makefile.in
+index 4b10f6f..f773fea 100644
+--- a/e2fsck/Makefile.in
++++ b/e2fsck/Makefile.in
+@@ -552,3 +552,13 @@ logfile.o: $(srcdir)/logfile.c $(top_builddir)/lib/config.h \
+  $(top_srcdir)/lib/quota/dqblk_v2.h $(top_srcdir)/lib/quota/quotaio_tree.h \
+  $(top_srcdir)/lib/../e2fsck/dict.h
+ prof_err.o: prof_err.c
++quota.o: $(srcdir)/quota.c $(top_builddir)/lib/config.h \
++ $(top_builddir)/lib/dirpaths.h $(srcdir)/e2fsck.h \
++ $(top_srcdir)/lib/ext2fs/ext2_fs.h $(top_builddir)/lib/ext2fs/ext2_types.h \
++ $(top_srcdir)/lib/ext2fs/ext2fs.h $(top_srcdir)/lib/ext2fs/ext3_extents.h \
++ $(top_srcdir)/lib/et/com_err.h $(top_srcdir)/lib/ext2fs/ext2_io.h \
++ $(top_builddir)/lib/ext2fs/ext2_err.h \
++ $(top_srcdir)/lib/ext2fs/ext2_ext_attr.h $(top_srcdir)/lib/ext2fs/bitops.h \
++ $(srcdir)/profile.h prof_err.h $(top_srcdir)/lib/quota/quotaio.h \
++ $(top_srcdir)/lib/quota/dqblk_v2.h $(top_srcdir)/lib/quota/quotaio_tree.h \
++ $(top_srcdir)/lib/../e2fsck/dict.h $(srcdir)/problem.h
+-- 
+1.8.5.5
+
-- 
1.8.5.5
