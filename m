From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:58:27 +0100
Subject: [Buildroot] [git commit] package/nodejs: properly pass HOST_LDFLAGS
 when building host tools
Message-ID: <20191128155150.B23BA818E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4abcbe112a0a45b87545f32981be87212116e94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After building host tools, we currently run a pass of patchelf to add
the proper RPATH to these tools so that they are able to find the
libraries they depend on.

Unfortunately, the "torque" host tool is used during the build itself,
before we have a chance to run "patchelf" on it. Since it is linked
against libcrypto.so available in $(HOST_DIR)/lib, the build aborts
because the RPATH is not set.

To fix this, we make sure that $(HOST_LDFLAGS) are properly taken into
account: since they contain the -Wl,-rpath option, the host tools will
have the correct RPATH. This both fixes the build failure, and makes
the patchelf hack no longer necessary.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12211
  http://autobuild.buildroot.net/results/a1f5e336ddaf386ba08eb5a7a299a48e2bdfe2d9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 7fb02970cf..107e0b8d19 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -10,7 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib host-patchelf
+HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
@@ -80,18 +80,16 @@ define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
-
-	$(foreach f,$(NODEJS_HOST_TOOLS), \
-		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/$(f)
-	)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
+		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 
