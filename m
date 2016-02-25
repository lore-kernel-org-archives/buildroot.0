From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 25 Feb 2016 09:56:35 -0500
Subject: [Buildroot] [PATCH 1/1] erlang: remove unwanted packages from
	staging too
Message-ID: <1456412195-8283-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes an issue where an Erlang program compiles fine against files
in staging, but fails to run on the target due to the unwanted packages
being removed.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 638d2c2..88b0d42 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -74,7 +74,13 @@ ifneq ($(BR2_PACKAGE_ERLANG_MEGACO),y)
 ERLANG_REMOVE_PACKAGES += megaco
 endif
 
-define ERLANG_REMOVE_UNUSED
+define ERLANG_REMOVE_STAGING_UNUSED
+	for package in $(ERLANG_REMOVE_PACKAGES); do \
+		rm -rf $(STAGING_DIR)/usr/lib/erlang/lib/$${package}-*; \
+	done
+endef
+
+define ERLANG_REMOVE_TARGET_UNUSED
 	find $(TARGET_DIR)/usr/lib/erlang -type d -name src -prune -exec rm -rf {} \;
 	find $(TARGET_DIR)/usr/lib/erlang -type d -name examples -prune -exec rm -rf {} \;
 	for package in $(ERLANG_REMOVE_PACKAGES); do \
@@ -82,7 +88,8 @@ define ERLANG_REMOVE_UNUSED
 	done
 endef
 
-ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_UNUSED
+ERLANG_POST_INSTALL_STAGING_HOOKS += ERLANG_REMOVE_STAGING_UNUSED
+ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_TARGET_UNUSED
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.5.0
