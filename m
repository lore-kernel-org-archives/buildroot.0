From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 10:51:57 +0200
Subject: [Buildroot] [git commit] php: fixup paths in php-config for cross
	compilation
Message-ID: <20120501090031.A146A96C44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9374f6c1255b368b9ff3bd596408dbb35640d5d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 7f848b1..6de6a9e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -171,6 +171,15 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 endif
 endif
 
+# Fixup prefix= and exec_prefix= in php-config
+define PHP_FIXUP_PHP_CONFIG
+	$(SED) 's%^prefix="/usr"%prefix="$(STAGING_DIR)/usr"%' \
+		-e 's%^exec_prefix="/usr"%exec_prefix="$(STAGING_DIR)/usr"%' \
+		$(STAGING_DIR)/usr/bin/php-config
+endef
+
+PHP_POST_INSTALL_STAGING_HOOKS += PHP_FIXUP_PHP_CONFIG
+
 define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php
 	rm -f $(TARGET_DIR)/usr/bin/phpize
