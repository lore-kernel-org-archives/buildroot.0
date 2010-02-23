From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:58 +0100
Subject: [Buildroot] [PATCH 34/40] libeXosip: do not re-run targets at every
	invocation of 'make'
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1cd56dc514cc4da46cd7abc1782fe258ae1b3dcb.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that we touch the target so that the target is newer than
the .compiled stamp file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libeXosip2/libeXosip2.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 09b6022..7f282b7 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -43,27 +43,33 @@ $(LIBEXOSIP2_DIR)/.compiled: $(LIBEXOSIP2_DIR)/.configured
 
 $(STAGING_DIR)/usr/lib/libeXosip2.so: $(LIBEXOSIP2_DIR)/.compiled
 	cp -dpf $(LIBEXOSIP2_DIR)/src/.libs/libeXosip2.so* $(STAGING_DIR)/usr/lib
+	touch $@
 
 $(STAGING_DIR)/usr/lib/libeXosip2.a: $(LIBEXOSIP2_DIR)/.compiled
 	cp -dpf $(LIBEXOSIP2_DIR)/src/.libs/libeXosip2.a $(STAGING_DIR)/usr/lib
 	cp -dpf $(LIBEXOSIP2_DIR)/include/*.h $(STAGING_DIR)/usr/include
+	touch $@
 
 $(STAGING_DIR)/usr/lib/libeXosip2.la: $(LIBEXOSIP2_DIR)/.compiled
 	cp -dpf $(LIBEXOSIP2_DIR)/src/libeXosip2.la $(STAGING_DIR)/usr/lib
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libeXosip2.la
+	touch $@
 
 $(STAGING_DIR)/usr/bin/sip_reg: $(LIBEXOSIP2_DIR)/.compiled
 	cp -dpf $(LIBEXOSIP2_DIR)/tools/.libs/sip_reg $(STAGING_DIR)/usr/bin
+	touch $@
 
 
 $(TARGET_DIR)/usr/lib/libeXosip2.so: $(STAGING_DIR)/usr/lib/libeXosip2.so
 	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libeXosip2.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libeXosip2.so*
+	touch $@
 
 $(TARGET_DIR)/usr/bin/sip_reg: $(STAGING_DIR)/usr/bin/sip_reg
 	mkdir -p $(TARGET_DIR)/usr/bin
 	cp -dpf $(STAGING_DIR)/usr/bin/sip_reg $(TARGET_DIR)/usr/bin
+	touch $@
 
 
 
-- 
1.6.3.3
