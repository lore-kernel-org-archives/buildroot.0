From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:08 +0100
Subject: [Buildroot] [PATCH 30/38] matchbox: fix dependency to not always
	rebuilt libmatchbox
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <67f0e558cb1494f4dd8a225621355d49c5610aa8.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Real targets should not depend on phony targets, otherwise they get
rebuilt every time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/matchbox.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 8665d41..4abc9d6 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -219,7 +219,7 @@ else
 endif
 
 
-$(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked xlib_libXext-install-staging
+$(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked
 	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	./configure $(QUIET) \
@@ -610,7 +610,7 @@ $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_KB_B
 	cp -af $(STAGING_DIR)/usr/share/matchbox/matchbox-keyboard $(TARGET_DIR)/usr/share/matchbox/
 	cp -dpf ./package/matchbox/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
 
-matchbox: host-pkg-config expat $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
+matchbox: host-pkg-config expat xlib_libXext $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
 
 matchbox-panel: matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN) $(TARGET_DIR)/usr/bin/matchbox-session $(MATCHBOX_PANEL_DEPS)
 
-- 
1.6.3.3
