From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:07 +0200
Subject: [Buildroot] [PATCH 14/20] Introduce support for host config cache
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <26082e79af64550d16fb1e314a904456b90a464e.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now have for quite some time a configuration cache used to speed-up
the execution of ./configure scripts when compiling programs for the
target. This commit introduces a similar concept when Buildroot
compiles programs for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                      |    8 ++++----
 package/Makefile.autotools.in |    1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index df276c1..d6bcb36 100644
--- a/Makefile
+++ b/Makefile
@@ -441,12 +441,12 @@ show-targets:
 	@echo $(TARGETS)
 
 ifeq ($(BR2_CONFIG_CACHE),y)
-# drop configure cache if configuration is changed
-$(BUILD_DIR)/tgt-config.cache: $(CONFIG_DIR)/.config
+# drop configure caches if configuration is changed
+$(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache: $(CONFIG_DIR)/.config
 	rm -f $@
 	touch $@
 
-$(BASE_TARGETS): | $(BUILD_DIR)/tgt-config.cache
+$(BASE_TARGETS): | $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
 endif
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
@@ -580,7 +580,7 @@ endif
 	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.config.cmd $(CONFIG_DIR)/.auto.deps
 
 flush:
-	rm -f $(BUILD_DIR)/tgt-config.cache
+	rm -f $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
 
 %_defconfig: $(TOPDIR)/configs/%_defconfig
 	cp $^ $(CONFIG_DIR)/.config
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 318bd71..337aee4 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -117,6 +117,7 @@ define $(2)_CONFIGURE_CMDS
 		LDFLAGS="$$(HOST_LDFLAGS)" \
                 $$($$(PKG)_CONF_ENV) \
 		./configure \
+		$$(if $$(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/host-config.cache",) \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		$$($$(PKG)_CONF_OPT) \
-- 
1.7.0.4
