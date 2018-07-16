From: Christoph Engelbert <me@noctarius.com>
Date: Mon, 16 Jul 2018 18:13:03 +0300
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds
 "regulatory.db[.p7s]" to /lib/firmware
Message-ID: <20180716151303.18064-1-me@noctarius.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With kernel version 4.15, Linux started to support loading regulatory.db and regulatory.db.p7s files
directly from /lib/firmware, without the need of crda. If the kernel can't load those files it'll
fallback to using crda, but the direct way is preferred.

This patch copies those those files under /lib/firmware. The use of crda shouldn't be necessary with
kernels of 4.15 or later.

Signed-off-by: Christoph Engelbert <me@noctarius.com>
---
 package/wireless-regdb/wireless-regdb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index e9283a00e2..829374edcf 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -15,6 +15,10 @@ define WIRELESS_REGDB_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
 	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
 		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
+		$(TARGET_DIR)/lib/firmware/regulatory.db
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
+		$(TARGET_DIR)/lib/firmware/regulatory.db.p7s
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
