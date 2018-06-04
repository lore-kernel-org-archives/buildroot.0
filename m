From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jun 2018 19:03:29 +0200
Subject: [Buildroot] [PATCH v2,1/1] php-amqp: selects openssl
Message-ID: <20180604170329.32233-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.8.0, php-amqp needs a rabbitmq-c with openssl support:
https://github.com/pdezwart/php-amqp/issues/310

SSL support is disabled in rabbitmq-c if BR2_STATIC_LIBS is set however
don't add an unneeded !BR2_STATIC_LIBS dependency in Config.in as all
PHP External Extensions depends on !BR2_STATIC_LIBS
(see package/Config.in)

Fixes:
 - http://autobuild.buildroot.net/results/b7c89bbbd0ca1df08dd7cbfc90c7b45dcf1fad05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach and Thomas Petazzoni):
 - Remove unneeded !BR2_STATIC_LIBS in Config.in as all PHP External
   Extensions depends on !BR2_STATIC_LIBS (see package/Config.in)

 package/php-amqp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php-amqp/Config.in b/package/php-amqp/Config.in
index 0aa2021f5a..dc779f0ee0 100644
--- a/package/php-amqp/Config.in
+++ b/package/php-amqp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PHP_AMQP
 	bool "php-amqp"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # rabbitmq-c
+	select BR2_PACKAGE_OPENSSL # rabbitmq-c: amqp_ssl_socket.h
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Communicate with any AMQP compliant server.
-- 
2.14.1
