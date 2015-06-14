From: Martin Bark <martin@barkynet.com>
Date: Sun, 14 Jun 2015 17:12:56 +0100
Subject: [Buildroot] [PATCH 4/4] package/nodejs: Define NPM command for
	other packages to use
In-Reply-To: <1434298376-31893-1-git-send-email-martin@barkynet.com>
References: <1434298376-31893-1-git-send-email-martin@barkynet.com>
Message-ID: <1434298376-31893-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5d95f77..8cd4fd3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -95,6 +95,13 @@ NODEJS_MODULES_LIST= $(call qstrip,\
 	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
+# Define NPM for other packages to use
+NPM = $(TARGET_CONFIGURE_OPTS) \
+	LD="$(TARGET_CXX)" \
+	npm_config_arch=$(NODEJS_CPU) \
+	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
+	$(HOST_DIR)/usr/bin/npm
+
 #
 # We can only call NPM if there's something to install.
 #
@@ -104,12 +111,7 @@ define NODEJS_INSTALL_MODULES
 	# npm install call below and setting npm_config_rollback=false can both
 	# help in diagnosing the problem.
 	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
-		$(TARGET_CONFIGURE_OPTS) \
-		LD="$(TARGET_CXX)" \
-		npm_config_arch=$(NODEJS_CPU) \
-		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
-		$(HOST_DIR)/usr/bin/npm install \
-		$(NODEJS_MODULES_LIST) \
+		$(NPM) install $(NODEJS_MODULES_LIST) \
 	)
 
 	# Add global node_modules to PATH
-- 
2.1.4
