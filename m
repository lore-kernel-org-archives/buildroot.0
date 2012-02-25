From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Feb 2012 23:18:03 +0100
Subject: [Buildroot] [git commit] Makefile: move cmake toolchain file to
	$HOST_DIR/usr/share/buildroot
Message-ID: <20120301130636.4D12290BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed7791e2e8cdade564a5f484cdfe62ffe16cb981
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make it part of the SDK installation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                  |    5 +++--
 package/Makefile.cmake.in |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d5cd8f0..9a07f9f 100644
--- a/Makefile
+++ b/Makefile
@@ -368,7 +368,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
+$(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -377,7 +377,8 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
-$(O)/toolchainfile.cmake:
+$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
+	mkdir -p $(@D)
 	@echo -en "\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
 	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index 38e459b..aea1185 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -72,7 +72,7 @@ define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
-		-DCMAKE_TOOLCHAIN_FILE="$$(BASE_DIR)/toolchainfile.cmake" \
+		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		$$($$(PKG)_CONF_OPT) \
 	)
