From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:57:49 +0100
Subject: [Buildroot] [git commit] package/nodejs: link with libatomic when
 needed
Message-ID: <20190318210112.166C18F402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=620038c1492311ce446d38d73318ef6b4ab8a7ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/804951467d3f5b212bd33b95dc8fe9c6f5f63838

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
