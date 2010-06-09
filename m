From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jun 2010 12:04:25 +0200
Subject: [Buildroot] [git commit master 1/1] file: use new-style target
	override for uninstall
Message-ID: <20100609100642.99E967FA57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=239181f865e8b6fa286264b190c0b89796fdd19e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file.mk |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 11fe05a..c4f9709 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -10,11 +10,10 @@ FILE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 
-$(eval $(call AUTOTARGETS,package,file))
-$(eval $(call AUTOTARGETS,package,file,host))
-
-$(FILE_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define FILE_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
 	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
-	rm -f $(FILE_TARGET_INSTALL_TARGET) $(FILE_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,file))
+$(eval $(call AUTOTARGETS,package,file,host))
-- 
1.7.1
