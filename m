From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:45:57 +0100
Subject: [Buildroot] [git commit] neon: fix neon-config
Message-ID: <20130104214903.8AE309A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0db5e1203df9219498fe2ffa749d8818515a5607
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a single sed invocation]
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index c2e4949..56db604 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -52,4 +52,12 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
 endif
 
+define NEON_STAGING_NEON_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/neon-config
+endef
+
+NEON_POST_INSTALL_STAGING_HOOKS += NEON_STAGING_NEON_CONFIG_FIXUP
+
 $(eval $(autotools-package))
