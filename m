From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Oct 2019 10:41:29 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: bump version to 12.12.0
Message-ID: <20191016164129.58902-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed libhttpparser dependency as nodejs now uses built in llhttp.

Installed additional build tools to host that are required for target build.

License file change is due to 3rd party dependency changes and date updates.

Dependencies still appear to have Apache and BSD family licenses.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v1 -> v2:
  - remove libhttpparser from config
  - refactor host tool installation
---
 package/nodejs/Config.in   |  1 -
 package/nodejs/nodejs.hash |  6 +++---
 package/nodejs/nodejs.mk   | 35 ++++++++++++++++++++++++++---------
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index ad31f7ec27..ba3fde887d 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -27,7 +27,6 @@ config BR2_PACKAGE_NODEJS
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_LIBHTTPPARSER
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_NGHTTP2
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
index 5a143845d1..e7f6f8ee8e 100644
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
@@ -64,10 +64,18 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
 		--shared-zlib \
-		--with-intl=none \
+		--no-cross-compiling \
+		--with-intl=small-icu \
 	)
 endef
 
+NODEJS_HOST_TOOLS_V8 = \
+        torque \
+        gen-regexp-special-case \
+        bytecode_builtins_list_generator
+NODEJS_HOST_TOOLS_NODE = mkcodecache
+NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
+
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
@@ -75,7 +83,9 @@ define HOST_NODEJS_BUILD_CMDS
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 
-	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/torque
+	$(foreach f,$(NODEJS_HOST_TOOLS), \
+		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/$(f)$(sep)
+	)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
@@ -85,7 +95,9 @@ define HOST_NODEJS_INSTALL_CMDS
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 
-	$(INSTALL) -m755 -D $(@D)/out/Release/torque $(HOST_DIR)/bin/torque
+	$(foreach f,$(NODEJS_HOST_TOOLS), \
+		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)$(sep)
+	)
 endef
 
 ifeq ($(BR2_i386),y)
@@ -141,9 +153,14 @@ define NODEJS_CONFIGURE_CMDS
 		$(NODEJS_CONF_OPTS) \
 	)
 
-	# use host version of torque
-	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/torque#" \
-		-i $(@D)/deps/v8/gypfiles/v8.gyp
+	$(foreach f,$(NODEJS_HOST_TOOLS_V8), \
+		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
+			$(@D)/tools/v8_gypfiles/v8.gyp$(sep)
+	)
+	$(foreach f,$(NODEJS_HOST_TOOLS_NODE), \
+		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
+			-i $(@D)/node.gyp$(sep)
+	)
 endef
 
 define NODEJS_BUILD_CMDS
-- 
2.20.1
