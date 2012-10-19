From: Will Newton <will.newton@gmail.com>
Date: Fri, 19 Oct 2012 17:27:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/lttng-babeltrace: Bump version to
	1.0.0-rc6.
Message-ID: <CAFbHwiQrwqxRBiGOW+gvDv5pt-XXu0SJyHe5DU-LFdBWvUSD6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 ...beltrace-0.8-no-posix-fallocate-in-uclibc.patch |   37 --------------------
 ...g-babeltrace-no-posix-fallocate-in-uclibc.patch |   37 ++++++++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk       |   11 +-----
 3 files changed, 39 insertions(+), 46 deletions(-)
 delete mode 100644
package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
 create mode 100644
package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch

diff --git a/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
deleted file mode 100644
index d77825f..0000000
--- a/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Do not call posix_fallocate() on uClibc
-
-uClibc does not implement posix_fallocate(), and posix_fallocate() is
-mostly only an hint to the kernel that we will need such or such
-amount of space inside a file. So we just don't call posix_fallocate()
-when building against uClibc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: add #include <features.h>
----
- formats/ctf/ctf.c |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: lttng-babeltrace-0.8/formats/ctf/ctf.c
-===================================================================
---- lttng-babeltrace-0.8.orig/formats/ctf/ctf.c
-+++ lttng-babeltrace-0.8/formats/ctf/ctf.c
-@@ -32,6 +32,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <dirent.h>
-+#include <features.h>
- #include <glib.h>
- #include <unistd.h>
- #include <stdlib.h>
-@@ -384,9 +385,11 @@
- 		}
- 		pos->content_size = -1U;	/* Unknown at this point */
- 		pos->packet_size = WRITE_PACKET_LEN;
-+#ifndef __UCLIBC__
- 		off = posix_fallocate(pos->fd, pos->mmap_offset,
- 				      pos->packet_size / CHAR_BIT);
- 		assert(off >= 0);
-+#endif
- 		pos->offset = 0;
- 	} else {
- 	read_next_packet:
diff --git a/package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch
b/package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch
new file mode 100644
index 0000000..d77825f
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch
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
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk
b/package/lttng-babeltrace/lttng-babeltrace.mk
index 0f3200f..dd701df 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,14 +1,7 @@
-LTTNG_BABELTRACE_SITE    = http://lttng.org/files/bundles/20111214/
-LTTNG_BABELTRACE_VERSION = 0.8
+LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
+LTTNG_BABELTRACE_VERSION = 1.0.0-rc6
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2

-# Needed to fix libtool handling, otherwise the build fails when
-# building the ctf-parser-test program, which depends on libctf-ast.so
-# which itself depends on libbabeltrace_types.so.0 (and libtool gets
-# lost in the middle of this).
-LTTNG_BABELTRACE_AUTORECONF      = YES
-HOST_LTTNG_BABELTRACE_AUTORECONF = YES
-
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2

 $(eval $(autotools-package))
-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-package-lttng-babeltrace-Bump-version-to-1.0.0-rc6.patch
Type: application/octet-stream
Size: 4733 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121019/02f129bc/attachment.obj>
