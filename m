From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2020 23:10:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: fix build with
 per-package directories
Message-ID: <20201114221007.262746-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix wrong path in usr/lib/dovecot-config which was copied from the
dovecot staging dir.

Fixes:
http://autobuild.buildroot.net/results/5fb/5fb1cd57bc3fdf4f75019c7b25d65ef887eea539/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index d7068cd873..462c992902 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -13,4 +13,12 @@ DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
 
 DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
+	$(SED) 's,$(PER_PACKAGE_DIR)/dovecot/,$(PER_PACKAGE_DIR)/dovecot-pigeonhole/,g' \
+		$(STAGING_DIR)/usr/lib/dovecot-config
+endef
+DOVECOT_PIGEONHOLE_PRE_CONFIGURE_HOOKS = DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0
