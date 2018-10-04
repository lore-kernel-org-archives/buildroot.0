From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  4 Oct 2018 22:48:23 +0200
Subject: [Buildroot] [PATCH v2 2/3] wireless-regdb: install crda files only
 if used
In-Reply-To: <20181004204824.17274-1-ps.report@gmx.net>
References: <20181004204824.17274-1-ps.report@gmx.net>
Message-ID: <20181004204824.17274-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since linux-4.15 the kernel supports loading the files
regulatory.db/regulatory.db.p7s directly from the /lib/firmware
directory, for earlier versions the crda helper application
is needed.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix check-package warning (help text line length)
---
 package/wireless-regdb/Config.in         | 7 ++++++-
 package/wireless-regdb/wireless-regdb.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index 0c9896deb9..17350a41d8 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -3,7 +3,12 @@ config BR2_PACKAGE_WIRELESS_REGDB
 	help
 	  Wireless regulatory database.
 
-	  Wireless regulatory database for CRDA. The database lists the
+	  Wireless regulatory database. The database lists the
 	  allowed radio frequencies for each local jurisdiction.
 
+	  Since linux-4.15 the kernel supports loading the files
+	  regulatory.db/regulatory.db.p7s directly from the
+	  /lib/firmware directory, for earlier versions the crda helper
+	  application is needed.
+
 	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index fcbba055ac..9c899f973b 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -10,11 +10,17 @@ WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
-define WIRELESS_REGDB_INSTALL_TARGET_CMDS
+ifeq ($(BR2_PACKAGE_CRDA),y)
+define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
 	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
 		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+endef
+endif
+
+define WIRELESS_REGDB_INSTALL_TARGET_CMDS
+	$(WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS)
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
 		$(TARGET_DIR)/lib/firmware/regulatory.db
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
-- 
2.19.0
