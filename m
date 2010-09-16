From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] gawk: convert old-style hook to
	new-style hook
Message-ID: <20100916113829.044FF8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d30d8f4ebd4a8f4a259e214a96aab0f7124501f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 7ed7f9d..8a544d8 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -8,18 +8,19 @@ GAWK_VERSION = 3.1.8
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
 
-$(eval $(call AUTOTARGETS,package,gawk))
-$(eval $(call AUTOTARGETS,package,gawk,host))
-
-$(GAWK_HOOK_POST_INSTALL): $(GAWK_TARGET_INSTALL_TARGET)
+define GAWK_CREATE_SYMLINK
 	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
-	touch $@
+endef
+
+GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
-$(GAWK_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define GAWK_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GAWK_TARGET_BINS))
 	rm -f $(TARGET_DIR)/usr/share/info/gawk*.info
 	rm -f $(TARGET_DIR)/usr/share/man/man*/*gawk.1
 	rm -rf $(TARGET_DIR)/usr/libexec/awk
 	rm -rf $(TARGET_DIR)/usr/share/awk
-	rm -f $(GAWK_TARGET_INSTALL_TARGET) $(GAWK_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,gawk))
+$(eval $(call AUTOTARGETS,package,gawk,host))
-- 
1.7.1
