From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:42:44 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] wireless-regdb: add
 regulatory.db[.p7s] to /lib/firmware
Message-ID: <20180719214007.C19708909A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eeb197947b70014d7522de79fefd6b56959387e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Starting from kernel version 4.15, Linux supports loading
regulatory.db and regulatory.db.p7s files directly from /lib/firmware,
without the need of crda. If the kernel can't load those files it'll
fallback to using crda, but the direct way is preferred.

This patch copies those those files under /lib/firmware. The use of
crda shouldn't be necessary with kernels of 4.15 or later.

Signed-off-by: Christoph Engelbert <me@noctarius.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39e4b467487084b866c1ae35a3e2f74867ba2404)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless-regdb/wireless-regdb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9d7a375461..e3381adefc 100644
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
