From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:14:21 +0200
Subject: [Buildroot] [git commit] package/f2fs-tools: fix build without blkid
Message-ID: <20190922181042.A37EB8F122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a87c61737c69581435a38d82547d03ee7d0c9e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c126cb419709367479578b6f118ac9f0d6622689

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-mkfs-Makefile.am-fix-build-without-blkid.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch b/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
new file mode 100644
index 0000000000..aac60e70b6
--- /dev/null
+++ b/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
@@ -0,0 +1,30 @@
+From 7727b6fe0897849d4fc8f75a48326e902f0ab8b2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 22 Sep 2019 10:06:35 +0200
+Subject: [PATCH] mkfs/Makefile.am: fix build without blkid
+
+Commit d56232bc1640e2a3ffc412faff42cd8e77dbb8dd hardcoded -lblkid in
+libf2fs_format_la_LDFLAGS which breaks the build with --without-blkid
+option so use ${libblkid_LIBS} instead
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ mkfs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
+index cae2f93..83e2389 100644
+--- a/mkfs/Makefile.am
++++ b/mkfs/Makefile.am
+@@ -12,7 +12,7 @@ lib_LTLIBRARIES = libf2fs_format.la
+ libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
+ libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
+ libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
+-libf2fs_format_la_LDFLAGS = -lblkid -luuid -L$(top_builddir)/lib -lf2fs \
++libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} -luuid -L$(top_builddir)/lib -lf2fs \
+ 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
+ 
+ install-exec-hook:
+-- 
+2.23.0
+
