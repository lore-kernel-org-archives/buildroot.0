From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 19 Oct 2009 23:45:58 +0200
Subject: [Buildroot] [PATCH 1/2] libnl: handle all installed libraries
Message-ID: <1255988758-4787-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnl does not only install libnl.so, but also libnl-nf.so,
libnl-genl.so and libnl-route.so. Change the post-install
and uninstall hooks to handle these libraries as well.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libnl/libnl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 1a66746..b9224f2 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -14,9 +14,11 @@ $(eval $(call AUTOTARGETS,package,libnl))
 
 $(LIBNL_HOOK_POST_INSTALL): $(LIBNL_TARGET_INSTALL_TARGET)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl.so*
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl-*.so*
 	touch $@
 
 $(LIBNL_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnl-*.so*
 	rm -f $(LIBNL_TARGET_INSTALL_TARGET) $(LIBNL_HOOK_POST_INSTALL)
-- 
1.6.5
