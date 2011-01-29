From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 00:40:13 +0100
Subject: [Buildroot] [git commit master 1/1] libcuefile: convert to
	cmaketargets infrastructure
Message-ID: <20110129234038.CD3958E076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=950a63a75383ec42795ec4a0c1559bbc832912be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libcuefile/libcuefile.mk |   31 +++++---------------------
 1 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/multimedia/libcuefile/libcuefile.mk
index 934113b..86ec070 100644
--- a/package/multimedia/libcuefile/libcuefile.mk
+++ b/package/multimedia/libcuefile/libcuefile.mk
@@ -7,36 +7,17 @@
 LIBCUEFILE_VERSION = r453
 LIBCUEFILE_SITE = http://files.musepack.net/source
 LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
-LIBCUEFILE_DEPENDENCIES = host-cmake
 LIBCUEFILE_INSTALL_STAGING = YES
 
-# CMake doesn't support having the --sysroot option directly in the
-# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
-# It also gets confused by ccache, so don't use ccache here.
-LIBCUEFILE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
-LIBCUEFILE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
-
-define LIBCUEFILE_CONFIGURE_CMDS
-	(cd $(@D) ; \
-		$(HOST_DIR)/usr/bin/cmake . \
-		-DCMAKE_C_COMPILER:FILEPATH="$(LIBCUEFILE_TARGET_CC)" \
-		-DCMAKE_C_FLAGS:STRING="$(LIBCUEFILE_TARGET_CFLAGS)" \
-		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
-	)
-endef
-
-define LIBCUEFILE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define LIBCUEFILE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+define LIBCUEFILE_INSTALL_STAGING_INCLUDES
 	cp -r $(@D)/include $(STAGING_DIR)/usr
 endef
 
-define LIBCUEFILE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+define LIBCUEFILE_INSTALL_TARGET_INCLUDES
 	cp -r $(@D)/include $(TARGET_DIR)/usr
 endef
 
-$(eval $(call GENTARGETS,package/multimedia,libcuefile))
+LIBCUEFILE_POST_INSTALL_STAGING_HOOKS += LIBCUEFILE_INSTALL_STAGING_INCLUDES
+LIBCUEFILE_POST_INSTALL_TARGET_HOOKS += LIBCUEFILE_INSTALL_TARGET_INCLUDES
+
+$(eval $(call CMAKETARGETS,package/multimedia,libcuefile))
-- 
1.7.3.4
