From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 15 Aug 2014 19:20:03 +0200
Subject: [Buildroot] [PATCH v2] nodejs: Add dependency on zlib
Message-ID: <1408123203-6255-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to this commit, nodejs would build zlib itself and link statically
to it.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/nodejs/Config.in | 1 +
 package/nodejs/nodejs.mk | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 344b7f6..077a043 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_NODEJS
 	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
 	# uses fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_ZLIB
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index d59fb57..ed09b53 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,9 +7,9 @@
 NODEJS_VERSION = 0.10.30
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-python host-nodejs \
+NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
     $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-python
+HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
@@ -32,6 +32,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--without-snapshot \
 		--without-dtrace \
 		--without-etw \
+		--shared-zlib \
 	)
 endef
 
@@ -69,6 +70,7 @@ define NODEJS_CONFIGURE_CMDS
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
 		--without-snapshot \
+		--shared-zlib \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--without-dtrace \
-- 
2.0.1
