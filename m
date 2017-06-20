From: Martin Bark <martin@barkynet.com>
Date: Tue, 20 Jun 2017 09:39:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: don't build cctest target
In-Reply-To: <1497947941-11463-1-git-send-email-martin@barkynet.com>
References: <1497947941-11463-1-git-send-email-martin@barkynet.com>
Message-ID: <1497947941-11463-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cctest is a test package that is built by default.  We don't use of it
and recently it has been failing to build in the host-nodejs builds
so disable it.

Fixes:
http://autobuild.buildroot.net/results/1d7642073d169de941e74dc3a0efba6e992e2de7
http://autobuild.buildroot.net/results/8801109c1976e1c7a08dc4036c6a38efdbb8cd7e
http://autobuild.buildroot.net/results/6d52bc9fef4c9f12f0091e93c020ab2cd4c4c5a1
http://autobuild.buildroot.net/results/a8b8a781bdea668b657311c68b6f0ca0f74169c7

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index c757b25..b5d73be 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -68,6 +68,7 @@ define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 endef
 
@@ -75,6 +76,7 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
+		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
 
 	$(INSTALL) -m755 -D $(@D)/out/Release/mkpeephole $(HOST_DIR)/usr/bin/mkpeephole
@@ -134,6 +136,7 @@ define NODEJS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
+		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		LD="$(TARGET_CXX)"
 endef
@@ -171,6 +174,7 @@ define NODEJS_INSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
+		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		LD="$(TARGET_CXX)"
 	$(NODEJS_INSTALL_MODULES)
-- 
2.7.4
