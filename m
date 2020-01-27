From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2020 17:55:39 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: use system-icu for
 host-nodejs when available
Message-ID: <20200127005539.125369-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed LDFLAGS.host as it doesn't appear to be needed.

Set CXXFLAGS.target to -DU_DISABLE_RENAMING=1 when building with
system-icu since host-icu is built with --disable-renaming.

Fixes:
 - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - removed LDFLAGS.host
  - Rework style for setting
---
 package/nodejs/nodejs.mk | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e6eb73d576..432f47c66a 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -25,6 +25,17 @@ NODEJS_CONF_OPTS = \
 	--cross-compiling \
 	--dest-os=linux
 
+HOST_NODEJS_CONF_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--without-snapshot \
+	--without-dtrace \
+	--without-etw \
+	--shared-openssl \
+	--shared-openssl-includes=$(HOST_DIR)/include/openssl \
+	--shared-openssl-libpath=$(HOST_DIR)/lib \
+	--shared-zlib \
+	--no-cross-compiling
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NODEJS_DEPENDENCIES += openssl
 NODEJS_CONF_OPTS += --shared-openssl
@@ -35,8 +46,11 @@ endif
 ifeq ($(BR2_PACKAGE_ICU),y)
 NODEJS_DEPENDENCIES += icu
 NODEJS_CONF_OPTS += --with-intl=system-icu
+HOST_NODEJS_CONF_OPTS += --with-intl=system-icu
+HOST_NODEJS_CXXFLAGS = -DU_DISABLE_RENAMING=1
 else
 NODEJS_CONF_OPTS += --with-intl=none
+HOST_NODEJS_CONF_OPTS += --with-intl=small-icu
 endif
 
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
@@ -56,16 +70,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/bin/python2 \
 		$(HOST_DIR)/bin/python2 ./configure \
-		--prefix=$(HOST_DIR) \
-		--without-snapshot \
-		--without-dtrace \
-		--without-etw \
-		--shared-openssl \
-		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
-		--shared-openssl-libpath=$(HOST_DIR)/lib \
-		--shared-zlib \
-		--no-cross-compiling \
-		--with-intl=small-icu \
+		$(HOST_NODEJS_CONF_OPTS) \
 	)
 endef
 
@@ -80,7 +85,7 @@ define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
-		LDFLAGS.host="$(HOST_LDFLAGS)" \
+		$(if $(HOST_NODEJS_CXXFLAGS),CXXFLAGS.target="$(HOST_NODEJS_CXXFLAGS)") \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 endef
@@ -89,7 +94,7 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
-		LDFLAGS.host="$(HOST_LDFLAGS)" \
+		$(if $(HOST_NODEJS_CXXFLAGS),CXXFLAGS.target="$(HOST_NODEJS_CXXFLAGS)") \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 
-- 
2.20.1
