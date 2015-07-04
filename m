From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:38:33 +0200
Subject: [Buildroot] [git commit] package/nodejs: Fixes for node-pre-gyp
Message-ID: <20150704125427.3399C7FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c72b8eaf21f5dc7c7cb8095357c542acb86bb356
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
