From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 22:05:42 +0100
Subject: [Buildroot] [git commit] nodejs: Revert "nodejs: disable ssl2 and
	ssl3 when openssl is not built"
Message-ID: <20141118210654.995B1B48E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92aa6f0cc46ee80a2a3ed8d2039cdb531f928fc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e712638b4adc6e18b3ce99ab37b94530e9aa786f.

The config options --without-ssl2 and --without-ssl3 are intended to be used if
nodejs is built with the bundled OpenSSL library for excluding the SSL2 and
SSL3 features.

Both options are actual only evaluated if --without-ssl is not set:

$ cat configure | grep configure_openssl -n -A 13
619:def configure_openssl(o):
620-  o['variables']['node_use_openssl'] = b(not options.without_ssl)
621-  o['variables']['node_shared_openssl'] = b(options.shared_openssl)
622-  o['variables']['openssl_no_asm'] = (
623-    1 if options.openssl_no_asm else 0)
624-
625-  if options.without_ssl:
626-    return
627-
628-  if options.ssl2:
629-    o['defines'] += ['OPENSSL_NO_SSL2=1']
630-
631-  if options.ssl3:
632-    o['defines'] += ['OPENSSL_NO_SSL3=1']

[Peter: adjusted commit text to make it clear that it is a revert]
Signed-off-by: J??rg Krause <jkrause@posteo.de>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 32e19b7..312aaa9 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -75,8 +75,7 @@ define NODEJS_CONFIGURE_CMDS
 		--prefix=/usr \
 		--without-snapshot \
 		--shared-zlib \
-		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,\
-			--without-ssl --without-ssl2 --without-ssl3) \
+		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--without-dtrace \
 		--without-etw \
