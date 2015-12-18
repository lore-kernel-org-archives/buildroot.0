From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Dec 2015 08:47:01 +0100
Subject: [Buildroot] [PATCH] unionfs: add patch to revert to old pre-1.0
	meta directory
Message-ID: <1450424821-30691-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unionfs changed its meta directory from .unionfs to .unionfs-fuse with the
unionfs -> unionfs-fuse rename.  The rename later got reverted everywhere
but the meta directory, so now unionfs doesn't find the whiteout files from
older releases.

Revert back to the pre-1.0 behaviour to fix this.

Patch sent upstream: https://github.com/rpodgorny/unionfs-fuse/pull/38

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Revert-to-old-pre-1.0-meta-directory.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch

diff --git a/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch b/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
new file mode 100644
index 0000000..c9d2ef4
--- /dev/null
+++ b/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
@@ -0,0 +1,33 @@
+From 93c2f9bd8b058b28016e6db2421e5b38eac0606c Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 17 Dec 2015 15:06:38 +0100
+Subject: [PATCH] Revert to old pre-1.0 meta directory
+
+Unionfs changed its meta directory from .unionfs to .unionfs-fuse with the
+unionfs -> unionfs-fuse rename.  The rename later got reverted everywhere
+but the meta directory, so now unionfs doesn't find the whiteout files from
+older releases.
+
+Revert back to the pre-1.0 behaviour to fix this.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/unionfs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/unionfs.h b/src/unionfs.h
+index c2b5ee3..74b824f 100644
+--- a/src/unionfs.h
++++ b/src/unionfs.h
+@@ -10,7 +10,7 @@
+ #define PATHLEN_MAX 1024
+ #define HIDETAG "_HIDDEN~"
+ 
+-#define METANAME ".unionfs-fuse"
++#define METANAME ".unionfs"
+ #define METADIR (METANAME  "/") // string concetanation!
+ 
+ // fuse meta files, we might want to hide those
+-- 
+2.1.4
+
-- 
2.1.4
