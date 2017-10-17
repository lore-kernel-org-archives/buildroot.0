From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:40:47 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] HOST_DIR/lib: symlink
	respectively to lib32/64
Message-ID: <20171017090326.420B87FD24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afbb937e08e1f31ed6f21f5e9bff540a4e140513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Discovered the issue on a RHEL7.4 machine where
the cmake build dynamically selected HOST_DIR/lib64
as the installation path for the lzo2 library.

Fixes failures like the following:
host-mtd
http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/

host-squashfs
http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5ad679c8a8369f27df7080e678f9b004bf9d9647)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6dd9c6f..d859e25 100644
--- a/Makefile
+++ b/Makefile
@@ -542,7 +542,7 @@ endif
 
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
+	$(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -565,6 +565,13 @@ sdk: world
 $(HOST_DIR)/usr: $(HOST_DIR)
 	@ln -snf . $@
 
+$(HOST_DIR)/lib: $(HOST_DIR)
+	@mkdir -p $@
+	@case $(HOSTARCH) in \
+		(*64) ln -snf lib $(@D)/lib64;; \
+		(*)   ln -snf lib $(@D)/lib32;; \
+	esac
+
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
