From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  5 May 2014 16:08:22 +0200
Subject: [Buildroot] [PATCH v2] freetype: freetype-patch: depends on
	host-automake
Message-ID: <1399298902-19863-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "make freetype-patch" fails because does not found autogen.sh,
because autogen.sh available only for the configure stage.
To fix this add host-automake as a prerequisite to freetype-patch.

This change also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
v2:
 - Add host-automake as a order-only-prerequisite because it is a
   phony target.

 package/freetype/freetype.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.9.1
