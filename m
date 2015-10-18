From: James Knight <james.d.knight@live.com>
Date: Sun, 18 Oct 2015 11:08:25 -0400
Subject: [Buildroot] [PATCH 1/1] sed: handle merged usr folder
Message-ID: <1445180905-15896-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For targets prepared with a usr-move, package should not be attempting
to move binaries from `usr/bin` to `bin`.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/sed/sed.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index b819300..5f76e7e 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -19,10 +19,11 @@ SED_CONF_OPTS = \
 	--infodir=/usr/share/info \
 	--include=$(STAGING_DIR)/usr/include
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
 define SED_MOVE_BINARY
 	mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/
 endef
-
 SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
+endif
 
 $(eval $(autotools-package))
-- 
1.9.5.msysgit.1
