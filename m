From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 15:00:47 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/nodejs: properly
 pass HOST_LDFLAGS when building host tools
Message-ID: <20191203152550.1C56D8405C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aec15539e13075cbf5a1cc4871cdc8d2d10015d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
 package/nodejs/nodejs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3bd6a1c4dd..583b2276e2 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -72,6 +72,7 @@ define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 endef
@@ -80,6 +81,7 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
+		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 endef
