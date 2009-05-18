From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 May 2009 13:51:52 +0200
Subject: [Buildroot] [git commit] busybox: 1.14.0 libbb fix
Message-ID: <20090518143103.97DAB7786D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c219988fdf1240bed6086d72d4414cfecc7c7c25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.0-libbb.patch |   35 ++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.0-libbb.patch

diff --git a/package/busybox/busybox-1.14.0-libbb.patch b/package/busybox/busybox-1.14.0-libbb.patch
new file mode 100644
index 0000000..327b4ec
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-libbb.patch
@@ -0,0 +1,35 @@
+--- busybox-1.14.0/include/libbb.h	Tue Apr 14 02:50:20 2009
++++ busybox-1.14.0-libbb/include/libbb.h	Fri May 15 23:22:02 2009
+@@ -965,6 +965,12 @@
+ 	/* How long the longest ESC sequence we know? */
+ 	KEYCODE_BUFFER_SIZE = 4
+ };
++/* Note: fd may be in blocking or non-blocking mode, both make sense.
++ * For one, less uses non-blocking mode.
++ * Only the first read syscall inside read_key may block indefinitely
++ * (unless fd is in non-blocking mode),
++ * subsequent reads will time out after a few milliseconds.
++ */
+ int read_key(int fd, smalluint *nbuffered, char *buffer) FAST_FUNC;
+ 
+ 
+--- busybox-1.14.0/libbb/read.c	Tue Apr 14 01:43:00 2009
++++ busybox-1.14.0-libbb/libbb/read.c	Fri May 15 23:22:02 2009
+@@ -229,7 +229,7 @@
+ 		if (size > 64*1024)
+ 			size = 64*1024;
+ 	}
+-	xrealloc(buf, total + 1);
++	buf = xrealloc(buf, total + 1);
+ 	buf[total] = '\0';
+ 
+ 	if (maxsz_p)
+@@ -273,7 +273,7 @@
+ 		free(buf);
+ 		return NULL;
+ 	}
+-	xrealloc(buf, size + 1);
++	buf = xrealloc(buf, size + 1);
+ 	buf[size] = '\0';
+ 
+ 	if (maxsz_p)
-- 
1.6.0.6
