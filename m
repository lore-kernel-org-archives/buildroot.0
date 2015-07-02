From: Martin Bark <martin@barkynet.com>
Date: Thu,  2 Jul 2015 10:43:27 +0100
Subject: [Buildroot] [v4 4/4] package/nodejs: Define NPM command for other
	packages to use
In-Reply-To: <1435830207-16664-1-git-send-email-martin@barkynet.com>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
Message-ID: <1435830207-16664-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other nodejs-related packages will need to call npm with the same set of
arguments as is currently used by the nodejs package itself.

To avoid duplicating this code, set the NPM variable so those packages can
re-use it.

Signed-off-by: Martin Bark <martin@barkynet.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: currently, this is only used in the nodejs package itself. I
plan on sending new nodejs-related packages that will use this, like
a pm2 (https://github.com/Unitech/pm2) package which I have tested
successfully using this $(NPM).

Changes v3 -> v4
 - Merged in npm_config_build_from_source=true added by previous patch
 - Added Acked-by: Yann E. MORIN

Changes v2 -> v3
 - Improved commit message (Suggested by Yann E. MORIN)

Changes v1 -> v2
 - No changes
---
 package/nodejs/nodejs.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 156b151..414f3f3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -95,6 +95,15 @@ NODEJS_MODULES_LIST= $(call qstrip,\
 	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
+# Define NPM for other packages to use
+NPM = $(TARGET_CONFIGURE_OPTS) \
+	LD="$(TARGET_CXX)" \
+	npm_config_arch=$(NODEJS_CPU) \
+	npm_config_target_arch=$(NODEJS_CPU) \
+	npm_config_build_from_source=true \
+	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
+	$(HOST_DIR)/usr/bin/npm
+
 #
 # We can only call NPM if there's something to install.
 #
@@ -104,14 +113,7 @@ define NODEJS_INSTALL_MODULES
 	# npm install call below and setting npm_config_rollback=false can both
 	# help in diagnosing the problem.
 	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
-		$(TARGET_CONFIGURE_OPTS) \
-		LD="$(TARGET_CXX)" \
-		npm_config_arch=$(NODEJS_CPU) \
-		npm_config_target_arch=$(NODEJS_CPU) \
-		npm_config_build_from_source=true \
-		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
-		$(HOST_DIR)/usr/bin/npm install \
-		$(NODEJS_MODULES_LIST) \
+		$(NPM) install $(NODEJS_MODULES_LIST) \
 	)
 
 	# Symlink all executables in $(TARGET_DIR)/usr/lib/node_modules/.bin to
-- 
2.1.4
