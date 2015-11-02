From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 23:12:02 +0100
Subject: [Buildroot] [git commit] package/nodejs: Fixed npm global install
Message-ID: <20151102221242.01829819BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1325da4a28f0c701c09b9f090df706838540948d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set npm_config_prefix to $(TARGET_DIR)/usr so that npm -g will correctly
install global modules to $(TARGET_DIR)/usr/lib/node_modules.

By using npm -g to install global modules npm will now automatically create
the symlinks to executables under $(TARGET_DIR)/usr/bin.

See https://docs.npmjs.com/misc/config#global and
https://docs.npmjs.com/files/folders for information on how the prefix
setting is used by global installs.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

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
 
