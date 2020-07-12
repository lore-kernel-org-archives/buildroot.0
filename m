From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:23:00 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/nodejs: install
 to staging
Message-ID: <20200712212910.2CF09869AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bb5762c4112e704cf4576aa93a49d2336f03058
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Install header files and libraries into the staging area. Some
packages like mraa (if enabled for Node.js) search for node.h
and v8.h. Hence, Node.js development file must be installed to
the staging area.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f6e6e648cef2a1678d9ece72559301848caf08b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 7f875058b3..e291939981 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -11,6 +11,7 @@ NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
+NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
@@ -215,6 +216,17 @@ define NODEJS_INSTALL_MODULES
 endef
 endif
 
+define NODEJS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+		$(MAKE) -C $(@D) install \
+		DESTDIR=$(STAGING_DIR) \
+		$(TARGET_CONFIGURE_OPTS) \
+		NO_LOAD=cctest.target.mk \
+		PATH=$(@D)/bin:$(BR_PATH) \
+		LDFLAGS="$(NODEJS_LDFLAGS)" \
+		LD="$(TARGET_CXX)"
+endef
+
 define NODEJS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
