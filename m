From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Sep 2009 11:52:56 +0200
Subject: [Buildroot] [git commit master] zlib: Replace negative logic in
	Makefile with positive
Message-ID: <20090930095310.1A36F7775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=72a119c84be19c8d3d792d7476644e71892ef377
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Positive logic is easier to read and understand than something
like 'if not option=yes then foo else bar'.

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 41d0632..a67a5e8 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -18,14 +18,14 @@ $(ZLIB_DIR)/.patched: $(DL_DIR)/$(ZLIB_SOURCE)
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
-ZLIB_PIC := -fPIC
-ZLIB_SHARED := --shared
-ZLIB_TARGET := $(TARGET_DIR)/usr/lib/libz.so
-else
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ZLIB_PIC :=
 ZLIB_SHARED :=
 ZLIB_TARGET := $(STAGING_DIR)/usr/lib/libz.a
+else
+ZLIB_PIC := -fPIC
+ZLIB_SHARED := --shared
+ZLIB_TARGET := $(TARGET_DIR)/usr/lib/libz.so
 endif
 
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
-- 
1.6.3.3
