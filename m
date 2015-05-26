From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 26 May 2015 11:53:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: add patch to fix host build
	error with gcc 5.1
Message-ID: <1432634015-24079-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-mtd build fails with gcc 5.1:
  error: redefinition of ?hashtable_iterator_key?
  error: redefinition of ?hashtable_iterator_value?

Indeed, both functions are defined twice - once in the header and once in the
source file. This is permitted in C11 (and maybe in C99).

Add a patch to fix the build with toolchains using C11 as default.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../mtd/0005-Fix-redefinition-build-error.patch    | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/mtd/0005-Fix-redefinition-build-error.patch

diff --git a/package/mtd/0005-Fix-redefinition-build-error.patch b/package/mtd/0005-Fix-redefinition-build-error.patch
new file mode 100644
index 0000000..b29c3a5
--- /dev/null
+++ b/package/mtd/0005-Fix-redefinition-build-error.patch
@@ -0,0 +1,70 @@
+From d00e6c6d623485ced942a018dc9b06a52c8f90e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 25 May 2015 16:37:27 +0200
+Subject: [PATCH 1/1] Fix redefinition build error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building host-mtd with C11 (default for gcc 5.1) fails with:
+  error: redefinition of ?hashtable_iterator_key?
+  error: redefinition of ?hashtable_iterator_value?
+
+These two functions are defined both in the header and the C source file.
+Fix this by removing the definition in the C source file and convert the
+"extern inline" to "static inline" in the header file.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
+ mkfs.ubifs/hashtable/hashtable_itr.h |  4 ++--
+ 2 files changed, 2 insertions(+), 14 deletions(-)
+
+diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/mkfs.ubifs/hashtable/hashtable_itr.c
+index 24f4dde..d102453 100644
+--- a/mkfs.ubifs/hashtable/hashtable_itr.c
++++ b/mkfs.ubifs/hashtable/hashtable_itr.c
+@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
+ }
+ 
+ /*****************************************************************************/
+-/* key      - return the key of the (key,value) pair at the current position */
+-/* value    - return the value of the (key,value) pair at the current position */
+-
+-void *
+-hashtable_iterator_key(struct hashtable_itr *i)
+-{ return i->e->k; }
+-
+-void *
+-hashtable_iterator_value(struct hashtable_itr *i)
+-{ return i->e->v; }
+-
+-/*****************************************************************************/
+ /* advance - advance the iterator to the next element
+  *           returns zero if advanced to end of table */
+ 
+diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/mkfs.ubifs/hashtable/hashtable_itr.h
+index 87a97eb..5c94a04 100644
+--- a/mkfs.ubifs/hashtable/hashtable_itr.h
++++ b/mkfs.ubifs/hashtable/hashtable_itr.h
+@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
+ /* hashtable_iterator_key
+  * - return the value of the (key,value) pair at the current position */
+ 
+-extern inline void *
++static inline void *
+ hashtable_iterator_key(struct hashtable_itr *i)
+ {
+     return i->e->k;
+@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_itr *i)
+ /*****************************************************************************/
+ /* value - return the value of the (key,value) pair at the current position */
+ 
+-extern inline void *
++static inline void *
+ hashtable_iterator_value(struct hashtable_itr *i)
+ {
+     return i->e->v;
+-- 
+2.4.1
+
-- 
2.4.1
