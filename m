From: Richard Braun <rbraun@sceen.net>
Date: Fri, 20 Jul 2012 15:39:32 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
	actions
Message-ID: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -reconfigure and -rebuild per package targets unconditionally
recreate the root filesystem image by depending on the all target.
Restrict their actions to their package instead.

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 package/pkg-generic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c01440e..f5b05a3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -389,12 +389,12 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild all
+$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure all
+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)-configure
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
-- 
1.7.2.5
