From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Jun 2018 21:31:26 +0200
Subject: [Buildroot] [PATCH 1/1] php-amqp: selects openssl
Message-ID: <20180603193126.7582-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

php-amqp needs a rabbitmq-c with openssl support:
https://github.com/pdezwart/php-amqp/issues/310

Fixes:
 - http://autobuild.buildroot.net/results/b7c89bbbd0ca1df08dd7cbfc90c7b45dcf1fad05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-amqp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/Config.in b/package/php-amqp/Config.in
index 0aa2021f5a..cf32ec10b2 100644
--- a/package/php-amqp/Config.in
+++ b/package/php-amqp/Config.in
@@ -1,12 +1,14 @@
 config BR2_PACKAGE_PHP_AMQP
 	bool "php-amqp"
 	depends on BR2_PACKAGE_PHP
+	depends on !BR2_STATIC_LIBS # rabbitmq-c: amqp_ssl_socket.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # rabbitmq-c
+	select BR2_PACKAGE_OPENSSL # rabbitmq-c: amqp_ssl_socket.h
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Communicate with any AMQP compliant server.
 
 	  http://pecl.php.net/package/amqp
 
-comment "php-amqp needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "php-amqp needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.14.1
