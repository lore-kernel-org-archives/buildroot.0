From: Clark Rawlins <clark.rawlins@escient.com>
Date: Mon, 30 Nov 2009 09:05:26 -0500
Subject: [Buildroot] [PATCH][BUILD] Create $(TARGET_DIR)/usr/lib when
	installing
Message-ID: <1259589926.12315.10.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some configurations $(TARGET_DIR)/usr/lib isn't
created before the target install target for libncurses
is run.  This change makes sure it is created before
the install target copies files to it.

Signed-off-by: Clark Rawlins <clark@bit63.org>
---
 package/ncurses/ncurses.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 2c7bf79..fb22c6c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -105,6 +105,7 @@ $(STAGING_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION): $(NCURSES_DIR)/lib/libn
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
 	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
-- 
1.6.3.3
