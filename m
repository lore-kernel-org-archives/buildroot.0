From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:53:53 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/memtester: fix
 compile and link flags
Message-ID: <20210210193755.E088481E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b456d104eef4b5ba6add719b348b71357ded13e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The memtester build system does not use CFLAGS/LDFLAGS variables.
Everything should be written to conf-cc and conf-ld.

Use '%' as sed expression delimiter because comma might appear in
LDFLAGS.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25e09fdb9e4aa1e940dbdfcdad8dedca42814fcc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memtester/memtester.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 1a319462a5..05118754f8 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -12,8 +12,9 @@ MEMTESTER_LICENSE_FILES = COPYING
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
 define MEMTESTER_BUILD_CMDS
-	$(SED) "s,^cc,$(TARGET_CC)," $(@D)/conf-*
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(SED) "s%^cc%$(TARGET_CC) $(TARGET_CFLAGS)%" $(@D)/conf-cc
+	$(SED) "s%^cc%$(TARGET_CC) $(TARGET_LDFLAGS)%" $(@D)/conf-ld
+	$(MAKE) -C $(@D)
 endef
 
 define MEMTESTER_INSTALL_TARGET_CMDS
