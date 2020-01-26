From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2020 00:58:48 -0700
Subject: [Buildroot] [PATCH 1/1] package/nodejs: use system-icu for
 host-nodejs when available
Message-ID: <20200126075848.66484-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e6eb73d576..abc868c364 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -65,7 +65,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
 		--shared-zlib \
 		--no-cross-compiling \
-		--with-intl=small-icu \
+		--with-intl=$(if $(BR2_PACKAGE_ICU),system-icu,small-icu) \
 	)
 endef
 
@@ -80,6 +80,7 @@ define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		$(if $(BR2_PACKAGE_ICU),CXXFLAGS.target="-DU_DISABLE_RENAMING=1") \
 		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
@@ -89,6 +90,7 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
+		$(if $(BR2_PACKAGE_ICU),CXXFLAGS.target="-DU_DISABLE_RENAMING=1") \
 		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
-- 
2.20.1
