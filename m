From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 23:11:44 +0200
Subject: [Buildroot] [git commit] freetype: freetype-patch: depends on
	host-automake
Message-ID: <20140511212437.408D49CB14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c965ad639f3e6c8c224ae5c280ae0be8356794db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "make freetype-patch" fails because does not found autogen.sh,
because autogen.sh available only for the configure stage.
To fix this add host-automake as a prerequisite to freetype-patch.

This change also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index c7c9a06..a6ae0a0 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -83,3 +83,7 @@ HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+# freetype-patch uses autogen.sh so add it as a order-only-prerequisite
+# because it is a phony target.
+$(FREETYPE_TARGET_PATCH): | host-automake
