From: Martin Bark <martin@barkynet.com>
Date: Sat, 27 Jun 2015 03:01:38 +0100
Subject: [Buildroot] [v2 6/6] package/nodejs: Add npm_config_target_arch to
	npm command
In-Reply-To: <1435370498-25473-1-git-send-email-martin@barkynet.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
Message-ID: <1435370498-25473-6-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages use node-pre-gpy as a way of deploying pre compiled binary
dependencies with fall back to compilation for other targets.  node-gyp
uses the option --arch to determine its target architecture (which is
already set correctly), however, node-pre-gyp uses --target-arch.  Without
this set node.js packages that uses node-pre-gyp will pick the wrong target
architecture.

This patch sets npm_config_target_arch to solve this issue.  I have tested
this using the node.js package serialport.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - No changes, new in v2

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 8cd4fd3..50215be 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -99,6 +99,7 @@ NODEJS_MODULES_LIST= $(call qstrip,\
 NPM = $(TARGET_CONFIGURE_OPTS) \
 	LD="$(TARGET_CXX)" \
 	npm_config_arch=$(NODEJS_CPU) \
+	npm_config_target_arch=$(NODEJS_CPU) \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 	$(HOST_DIR)/usr/bin/npm
 
-- 
2.1.4
