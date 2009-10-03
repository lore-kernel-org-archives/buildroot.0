From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] shared-mime-info: create
	post-install-hook stamp file
Message-ID: <20091003210637.C6F6E776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c3bb9c1cc4e86367ced83f9f7117541172f5570b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensures that the hook isn't run every time. Also use the real stamp
file from the host build instead of host-share-mime-info as dependency,
as otherwise the target is always considered out-of-date.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/shared-mime-info/shared-mime-info.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 3818f47..48895e0 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -66,6 +66,7 @@ host-shared-mime-info-dirclean:
 	rm -rf $(SHARED_MIME_INFO_HOST_DIR)
 
 # update the shared-mime-info database in the target
-$(SHARED_MIME_INFO_HOOK_POST_INSTALL): host-shared-mime-info
+$(SHARED_MIME_INFO_HOOK_POST_INSTALL): $(STAMP_DIR)/host_shared-mime-info_installed
 	$(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
+	touch $@
-- 
1.6.3.3
