From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:37 +0200
Subject: [Buildroot] [PATCH 3/9] gawk: remove CC override
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e627989ad847f6c7b295117334ce0abeb84dbdbb.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some unknown reason, gawk.mk was overriding CC to $(TARGET_CC) at
build time, while it had already been set at configure time to
"$(TARGET_CC) $(TARGET_CFLAGS)" which is already the good value.

Setting it to just $(TARGET_CC) breaks the compilation with external
toolchains because we must pass the --sysroot option. But anyway, this
was incorrect as we were loosing some CFLAGS set by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 8886e6b..4dd1085 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -48,7 +48,7 @@ $(GAWK_DIR)/.configured: $(GAWK_DIR)/.unpacked
 	touch $@
 
 $(GAWK_DIR)/$(GAWK_BINARY): $(GAWK_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GAWK_DIR)
+	$(MAKE) -C $(GAWK_DIR)
 
 $(TARGET_DIR)/$(GAWK_TARGET_BINARY): $(GAWK_DIR)/$(GAWK_BINARY)
 	rm -f $(TARGET_DIR)/usr/bin/awk
@@ -61,7 +61,7 @@ $(TARGET_DIR)/$(GAWK_TARGET_BINARY): $(GAWK_DIR)/$(GAWK_BINARY)
 gawk: $(TARGET_DIR)/$(GAWK_TARGET_BINARY)
 
 gawk-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GAWK_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GAWK_DIR) uninstall
 	-$(MAKE) -C $(GAWK_DIR) clean
 
 gawk-dirclean:
-- 
1.6.3.3
