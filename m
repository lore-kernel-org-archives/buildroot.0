From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Aug 2017 23:48:34 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: fix highly parallel uses
Message-ID: <20170813214834.24093-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although the issue can very well occur with low-paralle builds, or even
with non-parallel builds, the conditions are so strict that the ocasion
it breaks is extremely rare, to the point where a failure would go
unnoticed.

Fixes #10141.

Reported-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 ...communicate-check-return-status-of-msgrcv.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch

diff --git a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch b/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
new file mode 100644
index 0000000000..3bb4f9701f
--- /dev/null
+++ b/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
@@ -0,0 +1,46 @@
+From a853f21633693f9eefc4949660253a5328d2d2f3 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 13 Aug 2017 23:21:54 +0200
+Subject: [PATCH 1/1] communicate: check return status of msgrcv()
+
+msgrcv can return with -1 to indicate an error condition.
+One such error is to have been interrupted by a signal.
+
+Being interrupted by a signal is very rare in this code, except in a
+very special condition: a highly-parallel (1000 jobs!) mksquashfs on
+a filesystem with extended attributes, where we see errors like (those
+are mksquashfs errors):
+    llistxattr for titi/603/883 failed in read_attrs, because Unknown
+    error 1716527536
+
+See: https://bugs.busybox.net/show_bug.cgi?id=10141
+
+In this case, we just have to retry the call to msgrcv().
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ communicate.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/communicate.c b/communicate.c
+index 293f404..787bb63 100644
+--- a/communicate.c
++++ b/communicate.c
+@@ -553,10 +553,13 @@ void send_get_fakem(struct fake_msg *buf)
+       l=msgrcv(msg_get,
+                (struct my_msgbuf*)buf,
+                sizeof(*buf)-sizeof(buf->mtype),0,0);
+-    while((buf->serial!=serial)||buf->pid!=pid);
++    while(((l==-1)&&(errno==EINTR))||(buf->serial!=serial)||buf->pid!=pid);
+ 
+     semaphore_down();
+ 
++    if(l==-1)
++      buf->xattr.flags_rc=errno;
++
+     /*
+     (nah, may be wrong, due to allignment)
+ 
+-- 
+2.11.0
+
-- 
2.11.0
