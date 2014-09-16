From: Maarten ter Huurne <maarten@treewalker.org>
Date: Tue, 16 Sep 2014 17:42:21 +0200
Subject: [Buildroot] [PATCH] xinetd: Patch configure script to fix rlim_t
	test
Message-ID: <1410882141-16213-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build with musl libc.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 package/xinetd/xinetd-005-configure-rlim_t.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/xinetd/xinetd-005-configure-rlim_t.patch

diff --git a/package/xinetd/xinetd-005-configure-rlim_t.patch b/package/xinetd/xinetd-005-configure-rlim_t.patch
new file mode 100644
index 0000000..e1cb48a
--- /dev/null
+++ b/package/xinetd/xinetd-005-configure-rlim_t.patch
@@ -0,0 +1,18 @@
+Have the configure script look for rlim_t in <sys/resource.h>
+
+That's where POSIX says it should be. Some libcs will include its
+definition via <sys/types.h> as well, but musl doesn't.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+
+--- xinetd-2.3.15.orig/configure	2007-09-20 16:58:27.000000000 +0200
++++ xinetd-2.3.15/configure	2014-09-16 17:20:22.787665449 +0200
+@@ -7909,7 +7909,7 @@
+ cat confdefs.h >>conftest.$ac_ext
+ cat >>conftest.$ac_ext <<_ACEOF
+ /* end confdefs.h.  */
+-#include <sys/types.h>
++#include <sys/resource.h>
+ #if STDC_HEADERS
+ #include <stdlib.h>
+ #endif
-- 
1.8.4.5
