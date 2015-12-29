From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:54:34 +0100
Subject: [Buildroot] [git commit] unionfs: add patch to revert to old
	pre-1.0 meta directory
Message-ID: <20151229165503.CD292822B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49c4a83a081f0309780124766ccfae87dc12de3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unionfs changed its meta directory from .unionfs to .unionfs-fuse with the
unionfs -> unionfs-fuse rename.  The rename later got reverted everywhere
but the meta directory, so now unionfs doesn't find the whiteout files from
older releases.

Revert back to the pre-1.0 behaviour to fix this.

Patch merged upstream:
https://github.com/rpodgorny/unionfs-fuse/commit/93c2f9bd8b058b28016e6db2421e5b38eac0606c

[Thomas: add reference to the upstream commit, now that the patch has
been merged.]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-Revert-to-old-pre-1.0-meta-directory.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch b/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
new file mode 100644
index 0000000..228441b
--- /dev/null
+++ b/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
@@ -0,0 +1,36 @@
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
+Committed upstream:
+https://github.com/rpodgorny/unionfs-fuse/commit/93c2f9bd8b058b28016e6db2421e5b38eac0606c
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
