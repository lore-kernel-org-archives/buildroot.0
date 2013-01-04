From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:33:34 +0100
Subject: [Buildroot] [git commit] libgcrypt: fix libgcrypt-config
Message-ID: <20130104214903.68C5B9A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=857413845eac7f00a9219d7ed45177ae1d271f65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a single sed invocation]
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgcrypt/libgcrypt.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 3aa60c6..b0a8a73 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -25,5 +25,13 @@ endef
 
 LIBGCRYPT_POST_PATCH_HOOKS += LIBGCRYPT_DISABLE_TESTS
 
+define LIBGCRYPT_STAGING_LIBGCRYPT_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/libgcrypt-config
+endef
+
+LIBGCRYPT_POST_INSTALL_STAGING_HOOKS += LIBGCRYPT_STAGING_LIBGCRYPT_CONFIG_FIXUP
+
 
 $(eval $(autotools-package))
