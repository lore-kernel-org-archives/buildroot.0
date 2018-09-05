From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed,  5 Sep 2018 16:28:54 +0200
Subject: [Buildroot] [PATCH] busybox: add patch to fix 'head -n -1'
Message-ID: <20180905142854.24825-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Busybox 1.29.0 introduces a regression causing head to fail with negative
'-n' parameters, e.g. 'head -n -1'. Instead of showing all but the last one
line, no lines are printed whatsoever.

The issue was reported with
http://lists.busybox.net/pipermail/busybox/2018-August/086617.html . This
commit backports the revert applied upstream.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...b-remove-unnecessary-variable-in-xmalloc_.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch

diff --git a/package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch b/package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
new file mode 100644
index 0000000000..ba2d214c29
--- /dev/null
+++ b/package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
@@ -0,0 +1,39 @@
+From 0d598ab9f03dbf320f7b81c05e4a94cb303dfbc7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 2 Sep 2018 18:35:29 +0200
+Subject: [PATCH] Revert "libbb: remove unnecessary variable in xmalloc_fgets"
+
+The variable is in fact necessary.
+
+    commit 2da9724b56169f00bd7fb6b9a11c9409a7620981
+    Author: Quentin Rameau <quinq@fifth.space>
+    Date:   Sun Apr 1 17:05:35 2018 +0200
+        libbb: remove unnecessary variable in xmalloc_fgets
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+[Thomas De Schampheleire: added to unbreak 'head -n -1',
+see http://lists.busybox.net/pipermail/busybox/2018-August/086617.html ]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+---
+ libbb/get_line_from_file.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libbb/get_line_from_file.c b/libbb/get_line_from_file.c
+index f3d6c6203..49ef093c2 100644
+--- a/libbb/get_line_from_file.c
++++ b/libbb/get_line_from_file.c
+@@ -47,7 +47,9 @@ char* FAST_FUNC bb_get_chunk_from_file(FILE *file, size_t *end)
+ /* Get line, including trailing \n if any */
+ char* FAST_FUNC xmalloc_fgets(FILE *file)
+ {
+-	return bb_get_chunk_from_file(file, NULL);
++	int i;
++
++	return bb_get_chunk_from_file(file, &i);
+ }
+ /* Get line.  Remove trailing \n */
+ char* FAST_FUNC xmalloc_fgetline(FILE *file)
+-- 
+2.16.4
+
-- 
2.16.4
