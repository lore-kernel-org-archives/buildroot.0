From: Michael Wei <mwei@cs.ucsd.edu>
Date: Sun, 23 Nov 2014 12:39:38 -0800
Subject: [Buildroot] [PATCH 1/1] Fix npm module cross compilation,
	use up-to-date npm and install modules globally
In-Reply-To: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
References: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
Message-ID: <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Wei <mwei@cs.ucsd.edu>
---
 package/nodejs/nodejs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 312aaa9..fbcb730 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -110,11 +110,13 @@ define NODEJS_INSTALL_MODULES
 	# npm install call below and setting npm_config_rollback=false can both
 	# help in diagnosing the problem.
 	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
+		$(HOST_DIR)/usr/bin/npm install -g npm --prefix=$(HOST_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CXX)" \
 		npm_config_arch=$(NODEJS_CPU) \
 		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
-		$(HOST_DIR)/usr/bin/npm install \
+		$(HOST_DIR)/usr/bin/npm install -g --target_arch=$(NODEJS_CPU) \
+		--prefix=$(TARGET_DIR) \
 		$(NODEJS_MODULES_LIST) \
 	)
 endef
-- 
1.9.1
