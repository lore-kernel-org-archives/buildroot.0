From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libgtk2: convert old-style hook
	to new-style
Message-ID: <20100916113825.6E1D08AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=39c781f33a7cf486c4872181cce8451913d06407
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 1e732d0..d669622 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -119,6 +119,13 @@ else
 LIBGTK2_CONF_OPT += --disable-cups
 endif
 
+define LIBGTK2_POST_INSTALL_TWEAKS
+	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
+	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
+endef
+
+LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK_POST_INSTALL_TWEAKS
+
 # We do not build a full version of libgtk2 for the host, because that
 # requires compiling Cairo, Pango, ATK and X.org for the
 # host. Therefore, we patch it to remove dependencies, and we hack the
@@ -155,8 +162,3 @@ endef
 
 $(eval $(call AUTOTARGETS,package,libgtk2))
 $(eval $(call AUTOTARGETS,package,libgtk2,host))
-
-$(LIBGTK2_HOOK_POST_INSTALL):
-	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
-	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
-	touch $@
-- 
1.7.1
