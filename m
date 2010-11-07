From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 19:40:21 +0100
Subject: [Buildroot] [git commit master 1/1] mpc: fix make dependencies
Message-ID: <20101107184106.43EC28DC00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=24c9f8ca706e57dc3ccfd908c54961fb67bd3854
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So the build target isn't always considered out of date.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpc/mpc.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 4a65842..41c0ffa 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -11,7 +11,7 @@ MPC_DIR:=$(TOOLCHAIN_DIR)/mpc-$(MPC_VERSION)
 MPC_TARGET_DIR:=$(BUILD_DIR)/mpc-$(MPC_VERSION)
 MPC_BINARY:=libmpc$(LIBTGTEXT)
 MPC_HOST_BINARY:=libmpc$(HOST_LIBEXT)
-MPC_LIBVERSION:=1.0.0
+MPC_LIBVERSION:=2.0.0
 
 $(DL_DIR)/$(MPC_SOURCE):
 	 $(call DOWNLOAD,$(MPC_SITE),$(MPC_SOURCE))
@@ -43,15 +43,15 @@ $(MPC_TARGET_DIR)/.configured: $(MPC_DIR)/.unpacked
 	)
 	touch $@
 
-$(MPC_TARGET_DIR)/.libs/$(MPC_BINARY): $(MPC_TARGET_DIR)/.configured
+$(MPC_TARGET_DIR)/src/.libs/$(MPC_BINARY): $(MPC_TARGET_DIR)/.configured
 	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MPC_TARGET_DIR)
 	$(MAKE) -C $(MPC_TARGET_DIR)
 
-$(STAGING_DIR)/usr/lib/$(MPC_BINARY): $(MPC_TARGET_DIR)/.libs/$(MPC_BINARY)
+$(STAGING_DIR)/usr/lib/$(MPC_BINARY): $(MPC_TARGET_DIR)/src/.libs/$(MPC_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(MPC_TARGET_DIR) install
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(STAGING_DIR)/usr/lib/libmpc$(LIBTGTEXT)*
 
-$(TARGET_DIR)/usr/lib/libmpc.so $(TARGET_DIR)/usr/lib/libmpc.so.$(MPC_LIBVERSION) $(TARGET_DIR)/usr/lib/libmpc.a: $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
+$(TARGET_DIR)/usr/lib/libmpc.so $(TARGET_DIR)/usr/lib/libmpc.so.$(MPC_LIBVERSION): $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
 	cp -dpf $(STAGING_DIR)/usr/lib/libmpc$(LIBTGTEXT)* $(TARGET_DIR)/usr/lib/
 ifeq ($(BR2_PACKAGE_LIBMPC_HEADERS),y)
 	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
-- 
1.7.1
