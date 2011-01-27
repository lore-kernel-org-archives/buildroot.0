From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 11:21:33 -0300
Subject: [Buildroot] [PATCH 8/9] libcuefile: convert to cmaketargets
	infrastructure
In-Reply-To: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296138094-502-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/libcuefile/libcuefile.mk |   22 +---------------------
 1 files changed, 1 insertions(+), 21 deletions(-)

diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/multimedia/libcuefile/libcuefile.mk
index 934113b..b801185 100644
--- a/package/multimedia/libcuefile/libcuefile.mk
+++ b/package/multimedia/libcuefile/libcuefile.mk
@@ -7,28 +7,8 @@
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
 define LIBCUEFILE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
 	cp -r $(@D)/include $(STAGING_DIR)/usr
@@ -39,4 +19,4 @@ define LIBCUEFILE_INSTALL_TARGET_CMDS
 	cp -r $(@D)/include $(TARGET_DIR)/usr
 endef
 
-$(eval $(call GENTARGETS,package/multimedia,libcuefile))
+$(eval $(call CMAKETARGETS,package/multimedia,libcuefile))
-- 
1.7.3.4
