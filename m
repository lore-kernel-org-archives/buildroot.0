From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 10:24:54 +0200
Subject: [Buildroot] [git commit master] libuuid: fix target-install
	dependencies
Message-ID: <20091002082526.F1E5477756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e3f0e4f670761064efe45e45f00cea5f71b88f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuuid.so gets installed into /usr/lib, not /lib, so the target
install make target is always considered out-of-date.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 63e787d..8ab7da9 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -80,7 +80,7 @@ $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
 
-$(STAGING_DIR)/lib/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/$(LIBUUID_TARGET_BINARY)
+$(STAGING_DIR)/usr/lib/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/$(LIBUUID_TARGET_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(LIBUUID_DIR) install
 
@@ -134,7 +134,7 @@ endif
 	rm -rf $(TARGET_DIR)/usr/share/doc
 	touch -c $@
 
-$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/lib/$(LIBUUID_TARGET_BINARY)
+$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/usr/lib/$(LIBUUID_TARGET_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(LIBUUID_DIR) install
 	cp -a $(STAGING_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)* \
-- 
1.6.3.3
