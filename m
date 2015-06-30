From: Martin Bark <martin@barkynet.com>
Date: Tue, 30 Jun 2015 11:42:45 +0100
Subject: [Buildroot] [v3 3/4] package/nodejs: Add npm_config_target_arch to
	npm command
In-Reply-To: <1435660966-11347-1-git-send-email-martin@barkynet.com>
References: <1435660966-11347-1-git-send-email-martin@barkynet.com>
Message-ID: <1435660966-11347-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages use node-pre-gpy as a way of deploying precompiled binary
dependencies with fall back to compilation for other targets.  node-gyp
uses the option --arch to determine its target architecture (which is
already set correctly), however, node-pre-gyp uses --target-arch.  Without
this set node.js packages that uses node-pre-gyp will pick the wrong target
architecture.

This patch sets npm_config_target_arch to solve this issue.  I have tested
this using the node.js package serialport.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v2 -> v3
 - Adjusted patch order so this is before the new definition of $(NPM)

Changes v1 -> v2
 - No changes, new in v2
---
 package/nodejs/nodejs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0b3f8a5..78db49d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -107,6 +107,7 @@ define NODEJS_INSTALL_MODULES
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CXX)" \
 		npm_config_arch=$(NODEJS_CPU) \
+		npm_config_target_arch=$(NODEJS_CPU) \
 		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 		$(HOST_DIR)/usr/bin/npm install \
 		$(NODEJS_MODULES_LIST) \
-- 
2.1.4
