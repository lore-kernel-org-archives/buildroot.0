From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu,  8 Sep 2016 16:33:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/php: Set MySQL socket path
In-Reply-To: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1473345222-10563-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the buildroot MySQL server is being build set the
PHP default MySQL socket path to match what the server is using.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index deaf56e..86a8ca0 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -210,6 +210,13 @@ PHP_DEPENDENCIES += unixodbc
 endif
 endif
 
+ifneq ($(BR2_PACKAGE_PHP_EXT_MYSQLI)$(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),)
+ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
+# Set default MySQL unix socket to what the MySQL server is using by default
+PHP_CONF_OPTS += --with-mysql-sock=$(MYSQL_SOCKET)
+endif
+endif
+
 define PHP_DISABLE_PCRE_JIT
 	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
 endef
-- 
2.7.4
