From: Martin Bark <martin@barkynet.com>
Date: Thu, 14 Mar 2019 13:38:11 +0000
Subject: [Buildroot] [PATCH 1/3] package/nodejs: bump version to 10.15.3
In-Reply-To: <20190314133813.727-1-martin@barkynet.com>
References: <20190314133813.727-1-martin@barkynet.com>
Message-ID: <20190314133813.727-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v10.15.3/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash |  4 ++--
 package/nodejs/nodejs.mk   | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 5a06e5328c..e9c174e662 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v8.15.0/SHASUMS256.txt
-sha256 968523333947cc3f769d73dedc6c9c60580826d8714bc0e62ca4589de6a7c633  node-v8.15.0.tar.xz
+# From https://nodejs.org/dist/v10.15.3/SHASUMS256.txt
+sha256 4e22d926f054150002055474e452ed6cbb85860aa7dc5422213a2002ed9791d5  node-v10.15.3.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 446cb77dbf..833b1989e6 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.15.0
+NODEJS_VERSION = 10.15.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
 	libhttpparser libuv zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
+HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib host-patchelf
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
@@ -73,6 +73,8 @@ define HOST_NODEJS_BUILD_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
+
+	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/torque
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
@@ -81,6 +83,8 @@ define HOST_NODEJS_INSTALL_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
+
+	$(INSTALL) -m755 -D $(@D)/out/Release/torque $(HOST_DIR)/usr/bin/torque
 endef
 
 ifeq ($(BR2_i386),y)
@@ -128,6 +132,10 @@ define NODEJS_CONFIGURE_CMDS
 		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
 		$(NODEJS_CONF_OPTS) \
 	)
+
+	# use host version of torque
+	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/usr/bin/torque#" \
+		-i $(@D)/deps/v8/gypfiles/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
-- 
2.21.0
