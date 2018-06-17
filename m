From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:14:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] php-amqp: needs openssl
 support in rabbitmq-c
Message-ID: <20180617155626.07C9D81070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64ba5b40a408003e1daa6b307faf04d55c645e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Since version 1.8.0, php-amqp needs a rabbitmq-c with openssl support:
https://github.com/pdezwart/php-amqp/issues/310

SSL support is disabled in rabbitmq-c if BR2_STATIC_LIBS is set however
don't add an unneeded !BR2_STATIC_LIBS dependency in Config.in as all
PHP External Extensions depends on !BR2_STATIC_LIBS
(see package/Config.in)

Fixes:
 - http://autobuild.buildroot.net/results/b7c89bbbd0ca1df08dd7cbfc90c7b45dcf1fad05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d93305744b1dc758a3d86088473d571194762e19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
