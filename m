From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Feb 2011 20:56:15 +0100
Subject: [Buildroot] [git commit master 1/1] icu: tweak icu-config
	exec_prefix output
Message-ID: <20110224195645.C9FBE8F6D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6dc2737d9a68d48ad31e74120b0adc7ab423ba31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3259

We need to tweak icu-config's exec_prefix too, otherwise if the host
system lacks icu the build fails when looking for the libraries in
/usr/lib rather than the staging directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/icu/icu.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index ffea1f1..4eddb11 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -16,7 +16,9 @@ ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
 define ICU_PREFIX_FIXUP
-	$(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/icu-config
+	$(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/icu-config
 endef
 
 ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
-- 
1.7.3.4
