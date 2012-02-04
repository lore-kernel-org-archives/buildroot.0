From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:48 +0100
Subject: [Buildroot] [PATCH 7/7] lttng-babeltrace: fix build on uClibc due
	to missing posix_fallocate()
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a42ba268e6311f078f9472d80d7a40d5b576677a.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...beltrace-0.8-no-posix-fallocate-in-uclibc.patch |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch

diff --git a/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
new file mode 100644
index 0000000..5ba7f1d
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
@@ -0,0 +1,25 @@
+Do not call posix_fallocate() on uClibc
+
+uClibc does not implement posix_fallocate(), and posix_fallocate() is
+mostly only an hint to the kernel that we will need such or such
+amount of space inside a file. So we just don't call posix_fallocate()
+when building against uClibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: lttng-babeltrace-0.8/formats/ctf/ctf.c
+===================================================================
+--- lttng-babeltrace-0.8.orig/formats/ctf/ctf.c	2012-02-04 09:01:16.788552141 +0100
++++ lttng-babeltrace-0.8/formats/ctf/ctf.c	2012-02-04 09:01:33.638258644 +0100
+@@ -384,9 +384,11 @@
+ 		}
+ 		pos->content_size = -1U;	/* Unknown at this point */
+ 		pos->packet_size = WRITE_PACKET_LEN;
++#ifndef __UCLIBC__
+ 		off = posix_fallocate(pos->fd, pos->mmap_offset,
+ 				      pos->packet_size / CHAR_BIT);
+ 		assert(off >= 0);
++#endif
+ 		pos->offset = 0;
+ 	} else {
+ 	read_next_packet:
-- 
1.7.4.1
