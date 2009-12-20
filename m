From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Dec 2009 22:27:35 +0100
Subject: [Buildroot] [git commit master] libusb: move phony dependencies to
	toplevel libusb target
Message-ID: <20091220213801.1F1F9777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20788aef4d8a7c6ca9774bb01c8226f30f0b403a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Real targets shouldn't have phony dependencies, as make otherwise
always consider them out of date.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb/libusb.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 618d36b..adf3e20 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -23,7 +23,7 @@ $(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: host-autoconf host-automake host-libtool $(DL_DIR)/$(LIBUSB_SOURCE)
+$(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
@@ -58,7 +58,7 @@ $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/usr/lib/libusb.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
 
-libusb: host-pkg-config $(TARGET_DIR)/$(LIBUSB_BINARY)
+libusb: host-pkg-config host-autoconf host-automake host-libtool $(TARGET_DIR)/$(LIBUSB_BINARY)
 
 libusb-clean:
 	rm -f $(STAGING_DIR)/bin/libusb-config
-- 
1.6.3.3
