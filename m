From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 19:18:11 +0200
Subject: [Buildroot] [git commit] php.ini: set date.timezone
Message-ID: <20150502171816.E4B308079D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f37843ab78d2faa5a1cf48f7dd97df29d1fcd80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set date.timezone in php.ini to match time zone settings.
Prevents a warning being logged about it not being set
each time a PHP date/time method is used.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 3b9a117..47811ff 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -24,6 +24,12 @@ PHP_CONF_ENV = \
 	ac_cv_func_strcasestr=yes \
 	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
+ifeq ($(BR2_TARGET_LOCALTIME),)
+PHP_LOCALTIME = UTC
+else
+PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
+endif
+
 # PHP can't be AUTORECONFed the standard way unfortunately
 PHP_DEPENDENCIES += host-autoconf host-automake host-libtool
 define PHP_BUILDCONF
@@ -288,6 +294,8 @@ define PHP_INSTALL_FIXUP
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
+	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
+		$(TARGET_DIR)/etc/php.ini
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
