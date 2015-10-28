From: Martin Bark <martin@barkynet.com>
Date: Wed, 28 Oct 2015 15:59:53 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Fixed npm global install
Message-ID: <1446047993-17436-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set npm_config_prefix to $(TARGET_DIR)/usr so that npm -g will correctly
install global modules to $(TARGET_DIR)/usr/lib/node_modules.

By using npm -g to install global modules npm will now automatically create
the symlinks to executables under $(TARGET_DIR)/usr/bin.

Signed-off-by: Martin Bark <martin@barkynet.com>
---

See https://docs.npmjs.com/misc/config#global and
https://docs.npmjs.com/files/folders for information on how the
prefix setting is used by global installs.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 099b3f0..7b6ae6b 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -106,6 +106,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_target_arch=$(NODEJS_CPU) \
 	npm_config_build_from_source=true \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
+	npm_config_prefix=$(TARGET_DIR)/usr \
 	$(HOST_DIR)/usr/bin/npm
 
 #
@@ -116,17 +117,7 @@ define NODEJS_INSTALL_MODULES
 	# If you're having trouble with module installation, adding -d to the
 	# npm install call below and setting npm_config_rollback=false can both
 	# help in diagnosing the problem.
-	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
-		$(NPM) install $(NODEJS_MODULES_LIST) \
-	)
-
-	# Symlink all executables in $(TARGET_DIR)/usr/lib/node_modules/.bin to
-	# $(TARGET_DIR)/usr/bin so they are accessible from the command line
-	cd $(TARGET_DIR)/usr/bin; \
-	for f in ../../usr/lib/node_modules/.bin/*; do \
-		[ -f "$${f}" -a -x "$${f}" ] || continue; \
-		ln -sf "$${f}" "$${f##*/}" || exit 1; \
-	done
+	$(NPM) install -g $(NODEJS_MODULES_LIST)
 endef
 endif
 
-- 
2.5.0
