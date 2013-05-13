From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 May 2013 17:25:41 +0200
Subject: [Buildroot] [PATCH] Fix bug with dependencies of *-rebuild and
	*-reconfigure
Message-ID: <1368458741-8838-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If targets $PKG-rebuild or $PKG-reconfigure are launched on a not fully built
directory, Buildroot finish build of all packages instead of only build asked
package.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-generic.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b55b5f0..d25797c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -437,12 +437,12 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild all
+$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure all
+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
-- 
1.7.9.5
