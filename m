From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:38:44 +0200
Subject: [Buildroot] [git commit] package/nodejs: Define NPM command for
	other packages to use
Message-ID: <20150704125427.4BE787FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c50256b6d2c4357cfea39350fa6f5496995e200d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other nodejs-related packages will need to call npm with the same set of
arguments as is currently used by the nodejs package itself.

To avoid duplicating this code, set the NPM variable so those packages can
re-use it.

Signed-off-by: Martin Bark <martin@barkynet.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

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
