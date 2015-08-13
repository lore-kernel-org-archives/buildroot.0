From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2015 21:55:31 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/nbd: fix static builds
Message-ID: <1439495731-8645-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/aa8/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/ (arm)
    http://autobuild.buildroot.org/results/e5b/e5bd05623dd6c57bb0338592ecd21a5ba0cbe95a/ (arc)
    http://autobuild.buildroot.org/results/e0f/e0fd23eec2dd31bece122d84515b2b7cb14594b8/ (ppc)
    http://autobuild.buildroot.org/results/3a2/3a2d4124f78d4e504e8e961fabe038e570923408/ (mips)
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nbd/0001-avoid-name-clashing.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/nbd/0001-avoid-name-clashing.patch

diff --git a/package/nbd/0001-avoid-name-clashing.patch b/package/nbd/0001-avoid-name-clashing.patch
new file mode 100644
index 0000000..b3ea9c9
--- /dev/null
+++ b/package/nbd/0001-avoid-name-clashing.patch
@@ -0,0 +1,28 @@
+rename err() function to avoid clashing with err() form C library
+
+err() is a function available in the C library, so when static linking,
+there is a clash at link timebecause the function is provided both by
+nbd and the C library:
+    http://autobuild.buildroot.org/results/aa8/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/build-end.log
+
+Fix that by renaming err() to nbd_err() and providing a small maco
+wrapper to avoid touching the many call sites.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status: hack, not submitted.
+
+diff -durN nbd-3.11.orig/cliserv.h nbd-3.11/cliserv.h
+--- nbd-3.11.orig/cliserv.h	2015-05-25 12:27:56.000000000 +0200
++++ nbd-3.11/cliserv.h	2015-08-13 19:28:21.609467505 +0200
+@@ -75,7 +75,8 @@
+ void setmysockopt(int sock);
+ void err_nonfatal(const char *s);
+ 
+-void err(const char *s) G_GNUC_NORETURN;
++void nbd_err(const char *s) G_GNUC_NORETURN;
++#define err(S) nbd_err(S)
+ 
+ void logging(const char* name);
+ 
-- 
1.9.1
