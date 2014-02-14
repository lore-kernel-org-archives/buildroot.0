From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:10:03 +0100
Subject: [Buildroot] [git commit branch/next] Makefile: update comment about
	top-level parallel Makefile
Message-ID: <20140214201153.8D5AD9C9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2afb23a70270657a9887e35ffa0af4c248ae0b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

After the latest patches top-level parallel Makefile is working but
there is still an issue when a package has an unspecified optional
dependency so change the comment to explain that.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index c89107a..ddb1f6a 100644
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
