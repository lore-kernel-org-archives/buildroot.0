From: Michael Roth <mroth@nessie.de>
Date: Wed, 30 Sep 2009 00:36:03 +0200
Subject: [Buildroot] [PATCH] zlib: Replace negative logic in Makefile with
	positive
Message-ID: <1254263763-21605-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Positive logic is easier to read and understand than something
like 'if not option=yes then foo else bar'.

Signed-off-by: Michael Roth <mroth@nessie.de>
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
