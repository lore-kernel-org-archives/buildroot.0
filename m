From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 15 Nov 2013 15:40:22 +0100
Subject: [Buildroot] [PATCH v9 8/8] Makefile: update comment about top-level
	parallel Makefile
In-Reply-To: <1384526422-30142-1-git-send-email-fabio.porcedda@gmail.com>
References: <1384526422-30142-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1384526422-30142-9-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the latest patches top-level parallel Makefile is working but
there are still issues when the building order is changed so change
the comment to explain that.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ae8b087..17a6ef2 100644
--- a/Makefile
+++ b/Makefile
@@ -42,7 +42,18 @@ export HOSTARCH := $(shell uname -m | \
 	    -e s/macppc/powerpc/\
 	    -e s/sh.*/sh/)
 
-# This top-level Makefile can *not* be executed in parallel
+# The parallel execution of this top-level Makefile is disabled
+# because it would change the package building order, that can be a
+# problem because some packages can have unspecified optional
+# dependencies so if those dependencies are present when the package
+# is built, they are used, otherwise they aren't (but compilation
+# happily proceeds). This means that the package order is relevant in
+# that case, and the end result will differ if the order is swapped
+# due to parallel building.
+# Taking in account the above warnings, if you still want to execute
+# this top-level Makefile in parrallel comment the following
+# line and execute:
+#	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
 .NOTPARALLEL:
 
 # absolute path
-- 
1.8.4.2
