From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:31:23 +0200
Subject: [Buildroot] [PATCH 15/15] mcookie: convert to the GENTARGETS
	infrastructure
In-Reply-To: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <501fe5405f63822e31d103b6bfd48e8d323598bb.1314826232.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/mcookie/mcookie.mk |   24 +++++++++++++-----------
 1 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index 12ef475..b3530de 100644
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
\ No newline at end of file
-- 
1.7.4.1
