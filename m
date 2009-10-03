From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] ncurses: remove dedicated
	target-headers option
Message-ID: <20091003210637.7E1EA776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58508f39cc9afba83adf230bdad5a38c8dca62a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead, simply only copy headers/static lib if BR2_HAVE_DEVFILES
is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/Config.in  |    6 ------
 package/ncurses/ncurses.mk |    8 ++------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index bfbd139..d80f573 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -23,9 +23,3 @@ config BR2_PACKAGE_NCURSES_TARGET_MENU
 	depends on BR2_PACKAGE_NCURSES
 	help
 	  Includes ncurses dynamic libmenu in target
-
-config BR2_PACKAGE_NCURSES_TARGET_HEADERS
-	bool "ncurses headers in target"
-	depends on BR2_PACKAGE_NCURSES
-	help
-	  Ncurses headers in target
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index da2230a..2c7bf79 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -152,12 +152,11 @@ $(TARGET_DIR)/usr/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.a
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
 	touch -c $@
 
-ncurses: $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
+ncurses: $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION) \
+	$(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/libncurses.a)
 
 ncurses-unpacked: $(NCURSES_DIR)/.patched
 
-ncurses-headers: $(TARGET_DIR)/usr/lib/libncurses.a
-
 ncurses-source: $(DL_DIR)/$(NCURSES_SOURCE)
 
 ncurses-clean:
@@ -178,6 +177,3 @@ ncurses-dirclean:
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 TARGETS+=ncurses
 endif
-ifeq ($(BR2_PACKAGE_NCURSES_TARGET_HEADERS),y)
-TARGETS+=ncurses-headers
-endif
-- 
1.6.3.3
