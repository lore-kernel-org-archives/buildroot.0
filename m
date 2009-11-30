From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Nov 2009 16:06:30 +0100
Subject: [Buildroot] [git commit master] Create $(TARGET_DIR)/usr/lib when
	installing
Message-ID: <20091130150725.0024C777DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6f8597291373a915ddcb9031000442bb1569bf76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some configurations $(TARGET_DIR)/usr/lib isn't
created before the target install target for libncurses
is run.  This change makes sure it is created before
the install target copies files to it.

Signed-off-by: Clark Rawlins <clark@bit63.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/ncurses/ncurses.mk |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index f7fbda7..97ca4e7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Additional fixes and cleanups.
 
-	Updated/fixed packages: alsamixergui, fltk
+	Updated/fixed packages: alsamixergui, fltk, ncurses
 
 	Issues resolved (http://bugs.uclibc.org):
 
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
