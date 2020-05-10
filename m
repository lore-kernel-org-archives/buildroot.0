From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 May 2020 09:51:57 +0200
Subject: [Buildroot] [git commit] package/squashfs: fix host compile
 multiple definitions
Message-ID: <20200510074508.EDFEF91313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d7b714027b451df6b202cee5d85ff6bbf3fe624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch to fix squashfs-tools build failures because
of missing external declaration for fwriter_buffer and
bwriter_buffer.

Fixes:

  - http://autobuild.buildroot.net/results/6789b668898245926e0a3a3e7caf823dff515d71

  /usr/bin/ld: read_fs.o:(.bss+0x0): multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
  /usr/bin/ld: read_fs.o:(.bss+0x8): multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...fs-tools-fix-build-failure-against-gcc-10.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/squashfs/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch b/package/squashfs/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..a5fc487aac
--- /dev/null
+++ b/package/squashfs/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
@@ -0,0 +1,49 @@
+From e1cdcfd94172a0b1ba4c9df70f4d69a41c687404 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Sun, 26 Jan 2020 18:35:13 +0000
+Subject: [PATCH] squashfs-tools: fix build failure against gcc-10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On gcc-10 (and gcc-9 -fno-common) build fails as:
+
+```
+cc ... -o mksquashfs
+ld: read_fs.o:(.bss+0x0):
+  multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
+ld: read_fs.o:(.bss+0x8):
+  multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=-fno-common passed explicitly.
+
+Reported-by: Toralf F??rster
+Bug: https://bugs.gentoo.org/706456
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+
+[Upstream: https://github.com/plougher/squashfs-tools/commit/fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ squashfs-tools/mksquashfs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/squashfs-tools/mksquashfs.h b/squashfs-tools/mksquashfs.h
+index 1beefef..b650306 100644
+--- a/squashfs-tools/mksquashfs.h
++++ b/squashfs-tools/mksquashfs.h
+@@ -143,7 +143,7 @@ struct append_file {
+ #endif
+ 
+ extern struct cache *reader_buffer, *fragment_buffer, *reserve_cache;
+-struct cache *bwriter_buffer, *fwriter_buffer;
++extern struct cache *bwriter_buffer, *fwriter_buffer;
+ extern struct queue *to_reader, *to_deflate, *to_writer, *from_writer,
+ 	*to_frag, *locked_fragment, *to_process_frag;
+ extern struct append_file **file_mapping;
+-- 
+2.26.2
+
