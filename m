From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:50 -0000
Subject: [Buildroot] [git commit branch/next] iw: fix static linking
Message-ID: <20120802195247.BDB3D96FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ffd15029fbe4f1223e1604653672f0f313e6017
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Libnl needs explicit -lpthread / -lm when statically linking.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 5cd40a3..2b322f6 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -13,6 +13,12 @@ IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+# libnl needs pthread/m, so we need to explicitly with them when static
+# these need to added AFTER libnl, so we have to override LIBS completely
+IW_MAKE_OPT = LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
+endif
+
 define IW_CONFIGURE_CMDS
 	echo "CC = $(TARGET_CC)" >$(IW_CONFIG)
 	echo "CFLAGS = $(TARGET_CFLAGS)" >>$(IW_CONFIG)
@@ -20,7 +26,7 @@ define IW_CONFIGURE_CMDS
 endef
 
 define IW_BUILD_CMDS
-	$(IW_MAKE_ENV) $(MAKE) -C $(@D)
+	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPT) -C $(@D)
 endef
 
 define IW_INSTALL_TARGET_CMDS
