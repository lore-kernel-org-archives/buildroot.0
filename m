From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 08:26:07 +0200
Subject: [Buildroot] [git commit] mcookie: convert to the GENTARGETS
	infrastructure
Message-ID: <20110930063212.A8CC88DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=190700ab034670084fd71f80a42a664ade2130a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix missing newline at eof]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mcookie/mcookie.mk |   24 +++++++++++++-----------
 1 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index 12ef475..030dd74 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -4,17 +4,19 @@
 #
 #############################################################
 
-$(TARGET_DIR)/usr/bin/mcookie: package/x11r7/mcookie/mcookie.c
-	$(TARGET_CC) -Wall -Os -s package/x11r7/mcookie/mcookie.c -o $(TARGET_DIR)/usr/bin/mcookie
+# Source included in Buildroot
+MCOOKIE_SOURCE =
 
+define MCOOKIE_EXTRACT_CMDS
+	cp package/x11r7/mcookie/mcookie.c $(@D)/
+endef
 
-mcookie: $(TARGET_DIR)/usr/bin/mcookie
+define MCOOKIE_BUILD_CMDS
+	(cd $(@D); $(TARGET_CC) -Wall -Os -s mcookie.c -o mcookie)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MCOOKIE),y)
-TARGETS+=mcookie
-endif
+define MCOOKIE_INSTALL_TARGET_CMDS
+	install -m 0755 -D $(@D)/mcookie $(TARGET_DIR)/usr/bin/mcookie
+endef
+
+$(eval $(call GENTARGETS))
