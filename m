From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:11 +0200
Subject: [Buildroot] [PATCH 25/74] libpng: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20528a8449c85f5eb7e1ec829c50c6b23fda2c61.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
