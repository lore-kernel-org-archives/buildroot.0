From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:29:17 +0100
Subject: [Buildroot] [git commit] divine: fix divine-config
Message-ID: <20130104214902.E0F889A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdcbd9fb3dedc69c3b6a6742701ff204dd9fba0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a single sed invocation]
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/divine/divine.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 779322e..7c7585f 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -10,4 +10,12 @@ DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 
+define DIVINE_STAGING_DIVINE_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/divine-config
+endef
+
+DIVINE_POST_INSTALL_STAGING_HOOKS += DIVINE_STAGING_DIVINE_CONFIG_FIXUP
+
 $(eval $(autotools-package))
