From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 10:10:21 +0100
Subject: [Buildroot] [git commit] freetype: host-freetype-patch requires
	host-automake
Message-ID: <20150228094510.1FAEF7FD16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c499247ff10e994528e3a9ebfc227d21b5781e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "make host-freetype-patch" fails because using the autogen.sh script
doesn't find the autoconf tool. The problem was already fixed for
"make freetype-patch" adding the "host-automake" as a prerequisite to
freetype-patch, so fix it by adding "host-automake" as a prerequisite to
"host-freetype-patch" too.

Fix build failure:
running `autoconf --force'
./autogen.sh: line 15: autoconf: command not found
error while running `autoconf --force'
package/pkg-generic.mk:146: recipe for target 'buildroot/output/build/host-freetype-2.5.5/.stamp_patched' failed

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 0de5ce3..56274cb 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -98,6 +98,7 @@ HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-# freetype-patch uses autogen.sh so add it as a order-only-prerequisite
-# because it is a phony target.
-$(FREETYPE_TARGET_PATCH): | host-automake
+# freetype-patch and host-freetype-patch use autogen.sh so add
+# host-automake as a order-only-prerequisite because it is a phony
+# target.
+$(FREETYPE_TARGET_PATCH) $(HOST_FREETYPE_TARGET_PATCH): | host-automake
