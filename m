From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libpng: convert old-style hook
	to new-style hook
Message-ID: <20100916113826.2E9528AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20528a8449c85f5eb7e1ec829c50c6b23fda2c61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index a81d951..5608f4f 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -14,14 +14,15 @@ LIBPNG_DEPENDENCIES = host-pkg-config zlib
 HOST_LIBPNG_CONF_OPT = --without-libpng-compat
 HOST_LIBPNG_DEPENDENCIES = host-pkg-config host-zlib
 
-$(eval $(call AUTOTARGETS,package,libpng))
-$(eval $(call AUTOTARGETS,package,libpng,host))
-
-$(LIBPNG_HOOK_POST_INSTALL):
+define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng12\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/libpng12-config
-	touch $@
+endef
 
+LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
+
+$(eval $(call AUTOTARGETS,package,libpng))
+$(eval $(call AUTOTARGETS,package,libpng,host))
-- 
1.7.1
