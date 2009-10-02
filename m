From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 10:24:54 +0200
Subject: [Buildroot] [git commit master] liblockfile: fix target-install
	dependencies
Message-ID: <20091002082528.58AB877756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9df3aefc60c3d569c844fb1fa8f8ec80f65931e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liblockfile.so.1.0 gets installed into /usr/lib, not /lib, so the target
install make target is always considered out-of-date.

Do various cleanups while we're here.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liblockfile/liblockfile.mk |   21 ++++++++++-----------
 1 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 950724e..6840b99 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -8,7 +8,7 @@ LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
 LIBLOCKFILE_CAT:=$(ZCAT)
 LIBLOCKFILE_DIR:=$(BUILD_DIR)/liblockfile-$(LIBLOCKFILE_VERSION)
-LIBLOCKFILE_BINARY:=liblockfile.so.1.0
+LIBLOCKFILE_BINARY:=usr/lib/liblockfile.so.1.0
 
 $(DL_DIR)/$(LIBLOCKFILE_SOURCE):
 	 $(call DOWNLOAD,$(LIBLOCKFILE_SITE),$(LIBLOCKFILE_SOURCE))
@@ -37,21 +37,20 @@ $(LIBLOCKFILE_DIR)/.configured: $(LIBLOCKFILE_DIR)/.unpacked
 	)
 	touch $@
 
-$(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY): $(LIBLOCKFILE_DIR)/.configured
+$(STAGING_DIR)/$(LIBLOCKFILE_BINARY): $(LIBLOCKFILE_DIR)/.configured
 	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
-	mkdir -p $(STAGING_DIR)/usr/share/man/man3
 	rm -f $(STAGING_DIR)/usr/lib/liblockfile.so
 	$(MAKE) -C $(LIBLOCKFILE_DIR) ROOT=$(STAGING_DIR) install
-	ln -sf $(LIBLOCKFILE_BINARY) $(STAGING_DIR)/usr/lib/liblockfile.so.1
-	cp -dpf $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/usr/lib
+	ln -sf liblockfile.so $(STAGING_DIR)/usr/lib/liblockfile.so.1
+	touch -c $@
 
-$(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY)
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
+$(TARGET_DIR)/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/$(LIBLOCKFILE_BINARY)
+	mkdir -p $(@D)
+	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(@D)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+	touch -c $@
 
-liblockfile: $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
+liblockfile: $(TARGET_DIR)/$(LIBLOCKFILE_BINARY)
 
 liblockfile-clean:
 	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
-- 
1.6.3.3
