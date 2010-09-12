From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:47 +0200
Subject: [Buildroot] [PATCH 61/74] ifplugd: convert to new style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0437f157ba87fcd239a8a5381b53cf23d8f0d7a6.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/ifplugd.mk |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 945d366..5e66cea 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -16,20 +16,20 @@ IFPLUGD_CONF_OPT = --disable-lynx
 
 IFPLUGD_DEPENDENCIES = libdaemon
 
-$(eval $(call AUTOTARGETS,package,ifplugd))
-
-$(IFPLUGD_HOOK_POST_INSTALL): $(IFPLUGD_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/ifplugd
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/ifplugstatus
+define IFPLUGD_INSTALL_FIXUP
 	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
 	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
-		$(INSTALL) $(IFPLUGD_DIR)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
+		$(INSTALL) $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
 		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	fi
-	$(INSTALL) -m 0755 $(IFPLUGD_DIR)/conf/ifplugd.action \
+	$(INSTALL) -m 0755 $(@D)/conf/ifplugd.action \
 		$(TARGET_DIR)/etc/ifplugd/
-	$(INSTALL) -m 0755 $(IFPLUGD_DIR)/conf/ifplugd.init \
+	$(INSTALL) -m 0755 $(@D)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
-	touch $@
+endef
+
+IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
+
+$(eval $(call AUTOTARGETS,package,ifplugd))
-- 
1.7.0.4
