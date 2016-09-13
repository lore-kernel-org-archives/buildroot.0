From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 14 Sep 2016 00:03:51 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/php: set MySQL socket path
In-Reply-To: <1473804231-9767-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473804231-9767-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1473804231-9767-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the PHP default MySQL socket path to match what the
mysql package is using.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 7df10be..1ea47f2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -211,6 +211,11 @@ PHP_DEPENDENCIES += unixodbc
 endif
 endif
 
+ifneq ($(BR2_PACKAGE_PHP_EXT_MYSQLI)$(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),)
+# Set default MySQL unix socket to what the MySQL server is using by default
+PHP_CONF_OPTS += --with-mysql-sock=$(MYSQL_SOCKET)
+endif
+
 define PHP_DISABLE_PCRE_JIT
 	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
 endef
-- 
2.7.4
