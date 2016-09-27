From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 27 Sep 2016 18:28:32 +0200
Subject: [Buildroot] [PATCH] Fix 'make toolchain-external-reinstall'
Message-ID: <1474993712-27904-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

toolchain-wrapper was not reinstalled on 'make
toolchain-external-reinstall'

In add, normalize variable name: s/TOOLCHAIN_BUILD_WRAPPER/TOOLCHAIN_WRAPPER_BUILD/

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 toolchain/toolchain-external/toolchain-external.mk |  3 ++-
 toolchain/toolchain-wrapper.mk                     | 12 ++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 6fd2742..e9e6340 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -787,9 +787,10 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	fi
 endef
 
-TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
+TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_WRAPPER_INSTALL)
 	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..21690fd 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -30,11 +30,15 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
-# For simplicity, build directly into the install location
-define TOOLCHAIN_BUILD_WRAPPER
-	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-wrapper.c \
-		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
+		-o toolchain/toolchain-wrapper
+endef
+
+define TOOLCHAIN_WRAPPER_INSTALL
+	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 toolchain/toolchain-wrapper \
+	    $(HOST_DIR)/usr/bin/toolchain-wrapper
 endef
-- 
1.9.1
