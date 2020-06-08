From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  8 Jun 2020 12:32:10 +0200
Subject: [Buildroot] [PATCH] package/nodejs: install to staging
Message-ID: <20200608103210.23757-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Install header files and libraries into the staging area. Some
packages like mraa (if enabled for Node.js) search for node.h
and v8.h. Hence, Node.js development file must be installed to
the staging area.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/nodejs/nodejs.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 37d7877226..3f35ac7c33 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -11,6 +11,7 @@ NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
+NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
@@ -215,6 +216,17 @@ define NODEJS_INSTALL_MODULES
 endef
 endif
 
+define NODEJS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+		$(MAKE) -C $(@D) install \
+		DESTDIR=$(STAGING_DIR) \
+		$(TARGET_CONFIGURE_OPTS) \
+		NO_LOAD=cctest.target.mk \
+		PATH=$(@D)/bin:$(BR_PATH) \
+		LDFLAGS="$(NODEJS_LDFLAGS)" \
+		LD="$(TARGET_CXX)"
+endef
+
 define NODEJS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
-- 
2.17.0
