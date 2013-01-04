From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:30:35 +0100
Subject: [Buildroot] [git commit] giblib: fix giblib-config
Message-ID: <20130104214903.1704E9A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a6f270344f7c6e857702bbd5591a62f59f12b2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a single sed invocation]
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/giblib/giblib.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 751534c..75e21bb 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -13,4 +13,12 @@ GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 
+define GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/giblib-config
+endef
+
+GIBLIB_POST_INSTALL_STAGING_HOOKS += GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
+
 $(eval $(autotools-package))
