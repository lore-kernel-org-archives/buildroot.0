From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 10:45:58 -0300
Subject: [Buildroot] [PATCH] mpd: add patch to fix build failures
Message-ID: <1422279958-1335-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpd is using snprintf without including stdio.h when pthread_setname_np
isn't available leading to failure, hence patch it. Fixes:
http://autobuild.buildroot.net/results/14c/14cf165e63fd7bb076d7c8f5aab92d24aa4622c4/

Patch status: sent upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ad-Name-include-stdio.h-for-prctl-as-well.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch

diff --git a/package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch b/package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch
new file mode 100644
index 0000000..1711da3
--- /dev/null
+++ b/package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch
@@ -0,0 +1,28 @@
+From 36139b29cccae008c74924d81ea67d265327f7ac Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 26 Jan 2015 09:55:04 -0300
+Subject: [PATCH] thread/Name: include stdio.h for prctl as well
+
+We're still using snprintf so we need it, otherwise it leads to build
+failure.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/thread/Name.hxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/thread/Name.hxx b/src/thread/Name.hxx
+index 1576b3f..8d46d33 100644
+--- a/src/thread/Name.hxx
++++ b/src/thread/Name.hxx
+@@ -26,6 +26,7 @@
+ #  include <stdio.h>
+ #elif defined(HAVE_PRCTL)
+ #  include <sys/prctl.h>
++#  include <stdio.h>
+ #  ifdef PR_SET_NAME
+ #    define HAVE_THREAD_NAME
+ #  endif
+-- 
+2.0.5
+
-- 
2.0.5
