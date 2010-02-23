From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] matchbox: fix dependency to not
	always rebuilt libmatchbox
Message-ID: <20100223202933.D4821776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec5ab1dbd7def2276b13800e05cdc248edae6caa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
