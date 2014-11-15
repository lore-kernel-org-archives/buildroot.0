From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 15 Nov 2014 22:32:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix build error without
	OpenSSL support
Message-ID: <1416087173-21595-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.10.33 of nodejs introduced a bug which prevents us from building
nodejs without OpenSSL support. The bug is reported upstream:
https://github.com/joyent/node/issues/8676

This bug caused some build errors:
  * http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/
  * http://autobuild.buildroot.net/results/e1f/e1fb34818ff1167aa008b4011befb9fd14c81293/

and more...

nodejs can be build with shared linking to an external OpenSSL library (by
setting `--shared-openssl`) or with static linking to the bundled OpenSSL
library.

With this patch nodejs is build with static linking to the bundled OpenSSL
library in case no OpenSSL package is selected.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 32e19b7..080bc68 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -76,7 +76,7 @@ define NODEJS_CONFIGURE_CMDS
 		--without-snapshot \
 		--shared-zlib \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,\
-			--without-ssl --without-ssl2 --without-ssl3) \
+			--without-ssl2 --without-ssl3) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--without-dtrace \
 		--without-etw \
-- 
2.1.3
