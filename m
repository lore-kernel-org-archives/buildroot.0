From: Martin Bark <martin@barkynet.com>
Date: Thu,  2 Jul 2015 10:43:26 +0100
Subject: [Buildroot] [v4 3/4] package/nodejs: Fixes for node-pre-gyp
In-Reply-To: <1435830207-16664-1-git-send-email-martin@barkynet.com>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
Message-ID: <1435830207-16664-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages use node-pre-gyp as a way of deploying precompiled binary
dependencies with fall back to compilation for other targets.  Currently
installing node modules that use node-pre-gyp can fail to use the correct
binary for the target.  This patch fixes this issue by correctly
configuring node-pre-gyp.

Firstly, node-gyp uses the option --arch to determine its target
architecture (which is already set correctly), however, node-pre-gyp uses
--target-arch.  Without this set node.js packages that uses node-pre-gyp
will pick the wrong target architecture.

Secondly, the use of precompiled binary packages is not desirable due to
potential security and licensing issues.  To solve this we use the
--build-from-source option to force node-pre-gyp to always build the C++
code.

This patch passes npm_config_target_arch and npm_config_build_from_source
to npm which causes --target-arch and --build-from-source to be passed to
node-pre-gyp.

I have tested this using the node.js package serialport which now
successfully builds and runs.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v3 -> v4
 - Force always building from source (Suggested by Yann E. MORIN)
 - Improved commit message

Changes v2 -> v3
 - Adjusted patch order so this is before the new definition of $(NPM)

Changes v1 -> v2
 - No changes, new in v2
---
 package/nodejs/nodejs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0b3f8a5..156b151 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -107,6 +107,8 @@ define NODEJS_INSTALL_MODULES
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CXX)" \
 		npm_config_arch=$(NODEJS_CPU) \
+		npm_config_target_arch=$(NODEJS_CPU) \
+		npm_config_build_from_source=true \
 		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 		$(HOST_DIR)/usr/bin/npm install \
 		$(NODEJS_MODULES_LIST) \
-- 
2.1.4
