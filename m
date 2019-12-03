From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 15:48:49 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/nodejs: properly
 pass HOST_LDFLAGS when building host tools
Message-ID: <20191203152546.0930584CDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e956106bf252a75050eeb23874cefe23f85acd31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

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
(cherry picked from commit f4abcbe112a0a45b87545f32981be87212116e94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 09edf365a6..c5490886aa 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -10,7 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
 	libhttpparser libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib host-patchelf
+HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
@@ -72,16 +72,16 @@ define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
-
-	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(@D)/out/Release/torque
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
+		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 
