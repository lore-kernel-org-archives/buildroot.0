From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:46:51 +0100
Subject: [Buildroot] [git commit] libnspr: fix nspr-config
Message-ID: <20130104214903.BD50A9A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89e642ff4807268eed15873a03af7c1d07936f6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a single sed invocation]
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/libnspr.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index a9d5812..590a755 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -38,4 +38,12 @@ define LIBNSPR_INSTALL_TARGET_PC
 endef
 LIBNSPR_POST_INSTALL_TARGET_HOOKS += LIBNSPR_INSTALL_TARGET_PC
 
+define LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/nspr-config
+endef
+
+LIBNSPR_POST_INSTALL_STAGING_HOOKS += LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
+
 $(eval $(autotools-package))
