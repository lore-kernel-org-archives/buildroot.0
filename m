From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 10 May 2020 22:49:42 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: bump version to 1.24
Message-ID: <20200510204942.9883-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the normal debian repo as source, has taken directory from package metadata.

Removed: 0002-communicate-check-return-status-of-msgrcv.patch (included upstream)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...nicate-check-return-status-of-msgrcv.patch | 46 -------------------
 package/fakeroot/fakeroot.hash                |  6 +--
 package/fakeroot/fakeroot.mk                  |  6 +--
 3 files changed, 5 insertions(+), 53 deletions(-)
 delete mode 100644 package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch

diff --git a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch b/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
deleted file mode 100644
index 4e81b49122..0000000000
--- a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a853f21633693f9eefc4949660253a5328d2d2f3 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 13 Aug 2017 23:21:54 +0200
-Subject: [PATCH] communicate: check return status of msgrcv()
-
-msgrcv can return with -1 to indicate an error condition.
-One such error is to have been interrupted by a signal.
-
-Being interrupted by a signal is very rare in this code, except in a
-very special condition: a highly-parallel (1000 jobs!) mksquashfs on
-a filesystem with extended attributes, where we see errors like (those
-are mksquashfs errors):
-    llistxattr for titi/603/883 failed in read_attrs, because Unknown
-    error 1716527536
-
-See: https://bugs.busybox.net/show_bug.cgi?id=10141
-
-In this case, we just have to retry the call to msgrcv().
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- communicate.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/communicate.c b/communicate.c
-index 293f404..787bb63 100644
---- a/communicate.c
-+++ b/communicate.c
-@@ -553,10 +553,13 @@ void send_get_fakem(struct fake_msg *buf)
-       l=msgrcv(msg_get,
-                (struct my_msgbuf*)buf,
-                sizeof(*buf)-sizeof(buf->mtype),0,0);
--    while((buf->serial!=serial)||buf->pid!=pid);
-+    while(((l==-1)&&(errno==EINTR))||(buf->serial!=serial)||buf->pid!=pid);
- 
-     semaphore_down();
- 
-+    if(l==-1)
-+      buf->xattr.flags_rc=errno;
-+
-     /*
-     (nah, may be wrong, due to allignment)
- 
--- 
-2.11.0
-
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index d1d959df6f..633bda0cb9 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,6 +1,4 @@
-# From http://snapshot.debian.org/package/fakeroot/1.20.2-1/
-sha1	367040df07043edb630942b21939e493f3fad888	fakeroot_1.20.2.orig.tar.bz2
-# Calculated based on the hash above
-sha256	7c0a164d19db3efa9e802e0fc7cdfeff70ec6d26cdbdc4338c9c2823c5ea230c	fakeroot_1.20.2.orig.tar.bz2
+# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.24-1.dsc
+sha256	2e045b3160370b8ab4d44d1f8d267e5d1d555f1bb522d650e7167b09477266ed	fakeroot_1.24.orig.tar.gz
 # License files, locally calculated
 sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1be99071bf..39a6906182 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.20.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 1.24
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
+FAKEROOT_SITE = http://deb.debian.org/debian/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.26.2
