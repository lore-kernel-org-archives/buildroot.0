From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jan 2011 16:08:50 +0100
Subject: [Buildroot] [git commit master 1/1] crosstool-ng: install toolchain
	into HOST_DIR like the internal toolchain
Message-ID: <20110125150944.C5F238D244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58d107ec3fb77b05bc16911a04ca7d42c46eb4d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Simplifies code and helps us when we add SDK support in the future.
With this we no longer need to copy headers/libraries to STAGING_DIR either.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                              |    4 +---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    8 +++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 468d30c..d3f51ad 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -106,7 +106,7 @@ TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
@@ -116,8 +116,6 @@ else
 TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_LOCATION)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
-TARGET_CROSS=$(TOOLCHAIN_DIR)/bin/$(REAL_GNU_TARGET_NAME)-
 endif
 
 # Quotes are needed for spaces et al in path components.
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 0da7629..ee267df 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -60,7 +60,7 @@ endif
 $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	$(Q)mkdir -p $(TARGET_DIR)/lib
 	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
-	    CTNG_SYSROOT="$(TOOLCHAIN_DIR)/$${CTNG_TUPLE}/sys-root";        \
+	    CTNG_SYSROOT="$(HOST_DIR)/usr/$${CTNG_TUPLE}/sys-root";        \
 	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
 	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
 	    echo "Copy external toolchain libraries to target...";          \
@@ -69,9 +69,7 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	    done;                                                           \
 	    for libs in $(CTNG_LIBS_USR_LIB); do                            \
 	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/usr/lib); \
-	    done;                                                           \
-	    echo "Copy external toolchain sysroot to staging...";           \
-	    $(call copy_toolchain_sysroot,$${CTNG_SYSROOT},$${CTNG_SYSROOT},)
+	    done;
 	$(Q)touch $@
 
 #-----------------------------------------------------------------------------
@@ -236,7 +234,7 @@ endif
 
 #--------------
 # And the specials for paths
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(HOST_DIR)/usr":;
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 
-- 
1.7.3.4
