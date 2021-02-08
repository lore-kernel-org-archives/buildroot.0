From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  8 Feb 2021 11:04:34 +0200
Subject: [Buildroot] [PATCH] package/memtester: fix compile and link flags
Message-ID: <f9ae74a3f5657230a29cb3133d747a77a58ae435.1612775074.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The memtester build system does not use CFLAGS/LDFLAGS variables.
Everything should be written to conf-cc and conf-ld.

Use '%' as sed expression delimiter because comma might appear in
LDFLAGS.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/memtester/memtester.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 49cc935f3966..ec515f63927f 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -13,8 +13,9 @@ MEMTESTER_CPE_ID_VENDOR = pryopus
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
 define MEMTESTER_BUILD_CMDS
-	$(SED) "s,^cc,$(TARGET_CC)," $(@D)/conf-*
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(SED) "s%^cc%$(TARGET_CC) $(TARGET_CFLAGS)%" $(@D)/conf-cc
+	$(SED) "s%^cc%$(TARGET_CC) $(TARGET_LDFLAGS)%" $(@D)/conf-ld
+	$(MAKE) -C $(@D)
 endef
 
 define MEMTESTER_INSTALL_TARGET_CMDS
-- 
2.30.0
