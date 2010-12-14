From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] input-tools: fix jscal build,
	ensure target dir exists
Message-ID: <20101214003641.4A65A8E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fbda6575f04d09cd79ff8111c94572b155b3fdb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And at the same time only build enabled applets.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/input-tools/input-tools.mk |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index bd85af3..daf0755 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -21,18 +21,20 @@ endef
 
 INPUT_TOOLS_POST_PATCH_HOOKS = INPUT_TOOLS_DEBIAN_PATCHES
 
+# jscal needs -lm
 define INPUT_TOOLS_BUILD_CMDS
-	(cd $(@D)/utils; \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o evtest evtest.c; \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o inputattach inputattach.c; \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o jscal jscal.c; \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o jstest jstest.c; \
-	)
+	for i in $(filter-out jscal,$(INPUT_TOOLS_TARGETS_y)); do \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c; \
+	done
+	for i in $(filter jscal,$(INPUT_TOOLS_TARGETS_y)); do \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c -lm; \
+	done
 endef
 
 define INPUT_TOOLS_INSTALL_TARGET_CMDS
-	test -z "$(INPUT_TOOLS_TARGETS_y)" || \
-	install -m 755 $(addprefix $(@D)/utils/,$(INPUT_TOOLS_TARGETS_y)) $(TARGET_DIR)/usr/bin/
+	for i in $(INPUT_TOOLS_TARGETS_y); do \
+		install -m 755 -D $(@D)/$$i $(TARGET_DIR)/usr/bin/$$i; \
+	done
 endef
 
 define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
@@ -40,7 +42,7 @@ define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
 endef
 
 define INPUT_TOOLS_CLEAN_CMDS
-	rm -f $(addprefix $(@D)/utils/,$(INPUT_TOOLS_TARGETS_y))
+	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
 endef
 
 $(eval $(call GENTARGETS,package,input-tools))
-- 
1.7.2.2
