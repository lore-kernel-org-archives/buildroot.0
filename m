From: Martin Bark <martin@barkynet.com>
Date: Sun, 17 Mar 2019 20:48:00 +0000
Subject: [Buildroot] [PATCH 2/2] package/nodejs: link with libatomic when
 needed
In-Reply-To: <20190317204800.17703-1-martin@barkynet.com>
References: <20190317204800.17703-1-martin@barkynet.com>
Message-ID: <20190317204800.17703-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/804951467d3f5b212bd33b95dc8fe9c6f5f63838

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5cae449244..2577239e19 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -116,6 +116,12 @@ NODEJS_MIPS_ARCH_VARIANT = r1
 endif
 endif
 
+NODEJS_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NODEJS_LDFLAGS += -latomic
+endif
+
 define NODEJS_CONFIGURE_CMDS
 	mkdir -p $(@D)/bin
 	ln -sf $(HOST_DIR)/bin/python2 $(@D)/bin/python
@@ -123,6 +129,7 @@ define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
+		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
 		PYTHON=$(HOST_DIR)/bin/python2 \
 		$(HOST_DIR)/bin/python2 ./configure \
@@ -145,6 +152,7 @@ define NODEJS_BUILD_CMDS
 		$(TARGET_CONFIGURE_OPTS) \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH) \
+		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)"
 endef
 
@@ -156,6 +164,7 @@ NODEJS_MODULES_LIST= $(call qstrip,\
 
 # Define NPM for other packages to use
 NPM = $(TARGET_CONFIGURE_OPTS) \
+	LDFLAGS="$(NODEJS_LDFLAGS)" \
 	LD="$(TARGET_CXX)" \
 	npm_config_arch=$(NODEJS_CPU) \
 	npm_config_target_arch=$(NODEJS_CPU) \
@@ -184,6 +193,7 @@ define NODEJS_INSTALL_TARGET_CMDS
 		$(TARGET_CONFIGURE_OPTS) \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH) \
+		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)"
 	$(NODEJS_INSTALL_MODULES)
 endef
-- 
2.21.0
