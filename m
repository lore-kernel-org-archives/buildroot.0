From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Oct 2019 08:53:58 -0600
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 12.12.0
Message-ID: <20191014145358.62394-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed libhttpparser dependency as nodejs now uses built in llhttp.

Installed additional build tools to host that are required for target build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.hash |  6 +++---
 package/nodejs/nodejs.mk   | 29 ++++++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index c7de1e637c..a773bb293c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v10.16.3/SHASUMS256.txt
-sha256 7bf1123d7415964775b8f81fe6ec6dd5c3c08abb42bb71dfe4409dbeeba26bbd  node-v10.16.3.tar.xz
+# From https://nodejs.org/dist/v12.12.0/SHASUMS256.txt
+sha256 d9fa875aba9764f1b919115ce1d5e828b02c2a55a6e9e1b6fc771bb6b24a8cc1  node-v12.12.0.tar.xz
 
 # Hash for license file
-sha256 2b0fe00a83916d0290c8531db25a827e18d01e7c4bf000e9a0f2e826604ba41e  LICENSE
+sha256 950bbc741dc021489c47683e34e7637e9b96fb4a1f430b2f77a744130516e293  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5a143845d1..eb4fe11085 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 10.16.3
+NODEJS_VERSION = 12.12.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-	libhttpparser libuv zlib nghttp2 \
+	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib host-patchelf
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -18,11 +18,11 @@ NODEJS_CONF_OPTS = \
 	--without-snapshot \
 	--shared-zlib \
 	--shared-cares \
-	--shared-http-parser \
 	--shared-libuv \
 	--shared-nghttp2 \
 	--without-dtrace \
 	--without-etw \
+	--cross-compiling \
 	--dest-os=linux
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -64,7 +64,8 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
 		--shared-zlib \
-		--with-intl=none \
+		--no-cross-compiling \
+		--with-intl=small-icu \
 	)
 endef
 
@@ -76,6 +77,9 @@ define HOST_NODEJS_BUILD_CMDS
 		PATH=$(@D)/bin:$(BR_PATH)
 
 	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/torque
+	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/mkcodecache
+	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/gen-regexp-special-case
+	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/bytecode_builtins_list_generator
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
@@ -86,6 +90,9 @@ define HOST_NODEJS_INSTALL_CMDS
 		PATH=$(@D)/bin:$(BR_PATH)
 
 	$(INSTALL) -m755 -D $(@D)/out/Release/torque $(HOST_DIR)/bin/torque
+	$(INSTALL) -m755 -D $(@D)/out/Release/mkcodecache $(HOST_DIR)/bin/mkcodecache
+	$(INSTALL) -m755 -D $(@D)/out/Release/gen-regexp-special-case $(HOST_DIR)/bin/gen-regexp-special-case
+	$(INSTALL) -m755 -D $(@D)/out/Release/bytecode_builtins_list_generator $(HOST_DIR)/bin/bytecode_builtins_list_generator
 endef
 
 ifeq ($(BR2_i386),y)
@@ -143,7 +150,19 @@ define NODEJS_CONFIGURE_CMDS
 
 	# use host version of torque
 	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/torque#" \
-		-i $(@D)/deps/v8/gypfiles/v8.gyp
+		-i $(@D)/tools/v8_gypfiles/v8.gyp
+
+	# use host version of mkcodecache
+	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)mkcodecache<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/mkcodecache#" \
+		-i $(@D)/node.gyp
+
+	# use host version of gen-regexp-special-case
+	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/gen-regexp-special-case#" \
+		-i $(@D)/tools/v8_gypfiles/v8.gyp
+
+	# use host version of bytecode_builtins_list_generator
+	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/bytecode_builtins_list_generator#" \
+		-i $(@D)/tools/v8_gypfiles/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
-- 
2.20.1
