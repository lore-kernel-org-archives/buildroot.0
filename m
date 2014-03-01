From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Mar 2014 15:26:21 -0300
Subject: [Buildroot] [PATCH] php-gnupg: force gnupg detection
Message-ID: <1393698381-21984-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hardcode the gpg path and detection otherwise it will fail on a host
that doesn't have gnupg installed. Fixes:
http://autobuild.buildroot.net/results/757/757fb0b12af12de4f128d9c503d45b20776c2313/
Also define PHP_AUTOCONF and PHP_AUTOHEADER as other extensions do to
avoid stray issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-gnupg/php-gnupg.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index 5fc1dc4..989c55b 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -9,12 +9,15 @@ PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = http://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
-PHP_GNUPG_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
+PHP_GNUPG_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
 PHP_GNUPG_LICENSE = BSD-2c
 PHP_GNUPG_LICENSE_FILES = LICENSE
 
 define PHP_GNUPG_PHPIZE
 	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
-- 
1.8.3.2
