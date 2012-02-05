From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 Feb 2012 14:42:16 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: fix build on uClibc due
	to missing posix_fallocate()
Message-ID: <20120205134245.89FF4909CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8bf70e01e8c2712ce4be8069d90025231a7ac49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add explicit #include <features.h>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...beltrace-0.8-no-posix-fallocate-in-uclibc.patch |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
new file mode 100644
index 0000000..d77825f
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
@@ -0,0 +1,37 @@
+Do not call posix_fallocate() on uClibc
+
+uClibc does not implement posix_fallocate(), and posix_fallocate() is
+mostly only an hint to the kernel that we will need such or such
+amount of space inside a file. So we just don't call posix_fallocate()
+when building against uClibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: add #include <features.h>
+---
+ formats/ctf/ctf.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: lttng-babeltrace-0.8/formats/ctf/ctf.c
+===================================================================
+--- lttng-babeltrace-0.8.orig/formats/ctf/ctf.c
++++ lttng-babeltrace-0.8/formats/ctf/ctf.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <dirent.h>
++#include <features.h>
+ #include <glib.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+@@ -384,9 +385,11 @@
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
