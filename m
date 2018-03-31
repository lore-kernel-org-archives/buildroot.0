From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 18:57:21 +0200
Subject: [Buildroot] [git commit] Makefile: create symlink to non-default
 HOST_DIR
Message-ID: <20180331165724.90ACF83FF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b4a4525bf30a03c1f2542b3c4d340e5e4ca42a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_HOST_DIR is not the default, it can be difficult to find the
host directory (i.e., HOST_DIR always has to be passed explicitly in
addition to the output directory). For example, the Eclipse plugin
assumes that HOST_DIR=BASE_DIR/host.

Create a symlink from $(BASE_DIR)/host to $(HOST_DIR) if it is not the
default. Also remove it in the clean target.

When BR2_HOST_DIR is the default, HOST_DIR_SYMLINK will be empty so
there will be no additional dependency to dirs and nothing to remove
in clean.

Fixes https://bugs.busybox.net/show_bug.cgi?id=10151

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 377737fb28..d7826b67d9 100644
--- a/Makefile
+++ b/Makefile
@@ -445,6 +445,12 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 # packages compiled for the host go here
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
+ifneq ($(HOST_DIR),$(BASE_DIR)/host)
+HOST_DIR_SYMLINK = $(BASE_DIR)/host
+$(HOST_DIR_SYMLINK): $(BASE_DIR)
+	ln -snf $(HOST_DIR) $(BASE_DIR)/host
+endif
+
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
@@ -548,7 +554,7 @@ endif
 
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+	$(HOST_DIR) $(HOST_DIR_SYMLINK) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -968,7 +974,7 @@ printvars:
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
+	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
