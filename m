From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:40:22 +0100
Subject: [Buildroot] [git commit] php: install configuration file
	unconditionally
Message-ID: <20141201234334.92DC37FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e07c97adcb55629dc0cc72aed2bb652f7af640a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

[Peter: use install -D]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ae959db..e6ea65f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -238,10 +238,8 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
 define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php
 	rm -f $(TARGET_DIR)/usr/bin/phpize
-	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
-		$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
-			$(TARGET_DIR)/etc/php.ini; \
-	fi
+	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
+		$(TARGET_DIR)/etc/php.ini
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
