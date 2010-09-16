From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libxslt: convert old-style hook
	to new-style hook
Message-ID: <20100916113822.67A998AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c8e89f4ce9a13fb1050426e3f31a3e23598b125
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/libxslt.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index e77663d..5437e29 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -32,12 +32,13 @@ HOST_LIBXSLT_CONF_OPT = --enable-shared \
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
-$(eval $(call AUTOTARGETS,package,libxslt))
-$(eval $(call AUTOTARGETS,package,libxslt,host))
-
-$(LIBXSLT_HOOK_POST_INSTALL):
+define LIBXSLT_XSLT_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
 	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/xslt-config
-	touch $@
+endef
 
+LIBXSLT_POST_INSTALL_STAGING_HOOKS += LIBXSLT_XSLT_CONFIG_FIXUP
+
+$(eval $(call AUTOTARGETS,package,libxslt))
+$(eval $(call AUTOTARGETS,package,libxslt,host))
-- 
1.7.1
