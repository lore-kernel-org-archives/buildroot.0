From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Aug 2009 13:46:05 +0200
Subject: [Buildroot] [git commit] libuuid: add -source and -clean targets
Message-ID: <20090805114636.291A9775F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ccc42efe227ab5b4ac23522f6bde879c164b5f66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fbadfb0..3931548 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -151,7 +151,16 @@ e2fsprogs-clean:
 e2fsprogs-dirclean:
 	rm -rf $(E2FSPROGS_DIR)
 
-libuuid-dirclean:: e2fsprogs-dirclean
+libuuid-clean:
+	-$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
+		-C $(LIBUUID_DIR) uninstall
+	# make uninstall misses the includes
+	rm -rf $(STAGING_DIR)/usr/include/uuid
+	rm -f $(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)*
+	-$(MAKE1) -C $(LIBUUID_DIR) clean
+
+libuuid-source: e2fsprogs-source
+libuuid-dirclean: e2fsprogs-dirclean
 
 #############################################################
 #
-- 
1.6.3.3
