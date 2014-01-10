From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 10 Jan 2014 11:06:08 +0100
Subject: [Buildroot] [PATCH v11 8/8] Makefile: update comment about
	top-level parallel Makefile
In-Reply-To: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1389348368-2509-9-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the latest patches top-level parallel Makefile is working but
there is still an issue when a package has an unspecified optional
dependency so change the comment to explain that.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3115049..f55fb2c 100644
--- a/Makefile
+++ b/Makefile
@@ -42,7 +42,20 @@ export HOSTARCH := $(shell uname -m | \
 	    -e s/macppc/powerpc/\
 	    -e s/sh.*/sh/)
 
-# This top-level Makefile can *not* be executed in parallel
+# Parallel execution of this Makefile is disabled because it changes
+# the packages building order, that can be a problem for two reasons:
+# - If a package has an unspecified optional dependency and that
+#   dependency is present when the package is built, it is used,
+#   otherwise it isn't (but compilation happily proceeds) so the end
+#   result will differ if the order is swapped due to parallel
+#   building.
+# - Also changing the building order can be a problem if two packages
+#   manipulate the same file in the target directory.
+#
+# Taking into account the above considerations, if you still want to execute
+# this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
+# build using the following command:
+#	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
 .NOTPARALLEL:
 
 # absolute path
-- 
1.8.5.2
