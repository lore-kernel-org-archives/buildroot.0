From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 16:24:38 +0100
Subject: [Buildroot] [git commit] package/memtester: fix compile and link
 flags
Message-ID: <20210208150703.B9DDC81535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25e09fdb9e4aa1e940dbdfcdad8dedca42814fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The memtester build system does not use CFLAGS/LDFLAGS variables.
Everything should be written to conf-cc and conf-ld.

Use '%' as sed expression delimiter because comma might appear in
LDFLAGS.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memtester/memtester.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 49cc935f39..ec515f6392 100644
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
