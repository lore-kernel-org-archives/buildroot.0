From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Dec 2013 11:36:47 +0100
Subject: [Buildroot] [PATCH v10 8/8] Makefile: update comment about
	top-level parallel Makefile
In-Reply-To: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1387363007-19846-9-git-send-email-fabio.porcedda@gmail.com>
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
index ef2582e..27a6a65 100644
--- a/Makefile
+++ b/Makefile
@@ -42,7 +42,20 @@ export HOSTARCH := $(shell uname -m | \
 	    -e s/macppc/powerpc/\
 	    -e s/sh.*/sh/)
 
-# This top-level Makefile can *not* be executed in parallel
+# Parallel execution of this Makefile is disabled because it could
+# change the build result if a package has an unspecified optional
+# dependency.
+# Parallel execution changes the packages building order, that can be
+# a problem when a package has an unspecified optional dependency,
+# because if that dependency is present when the package is built, it
+# is used, otherwise it isn't (but compilation happily proceeds). This
+# means that the packages building order is relevant in that case, and
+# the end result will differ if the order is swapped due to parallel
+# building.
+# Taking in account the above warning, if you still want to execute
+# this top-level Makefile in parrallel comment the following line and
+# execute:
+#	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
 .NOTPARALLEL:
 
 # absolute path
-- 
1.8.5
