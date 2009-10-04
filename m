From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Oct 2009 22:44:23 +0200
Subject: [Buildroot] [git commit master] tremor: build specific svn revision
Message-ID: <20091004204624.6926577762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5f4154801223e1689af3d720634ee3118245fe58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select a specific svn revision (current trunk: r16259) instead of the
latest from the trunk. Simplifies support, mirroring and makes the system
reproducible.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libvorbis/libvorbis.mk |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index a84fa84..6c5dc7b 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -28,21 +28,15 @@ else
 ############################################################
 
 TREMOR_TRUNK:=http://svn.xiph.org/trunk/Tremor/
-TREMOR_VERSION:=svn-$(DATE)
-TREMOR_NAME:=Tremor-$(TREMOR_VERSION)
+TREMOR_VERSION:=16259
+TREMOR_NAME:=Tremor-svn-r$(TREMOR_VERSION)
 TREMOR_DIR:=$(BUILD_DIR)/$(TREMOR_NAME)
 TREMOR_SOURCE:=$(TREMOR_NAME).tar.bz2
 TREMOR_CAT=$(BZCAT)
 
 $(DL_DIR)/$(TREMOR_SOURCE):
-	(cd $(BUILD_DIR); \
-		$(SVN_CO) $(TREMOR_TRUNK); \
-		mv -f Tremor $(TREMOR_NAME); \
-		tar -cvf $(TREMOR_NAME).tar $(TREMOR_NAME); \
-		bzip2 $(TREMOR_NAME).tar; \
-		rm -rf $(TREMOR_DIR); \
-		mv $(TREMOR_SOURCE) $(DL_DIR)/$(TREMOR_SOURCE); \
-	)
+	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_TRUNK) $(TREMOR_DIR)
+	tar -cv -C $(BUILD_DIR) $(TREMOR_NAME) | bzip2 - -c > $@
 
 $(TREMOR_DIR)/.source: $(DL_DIR)/$(TREMOR_SOURCE)
 	$(TREMOR_CAT) $(DL_DIR)/$(TREMOR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-- 
1.6.3.3
