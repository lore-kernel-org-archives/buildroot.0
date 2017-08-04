From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 4 Aug 2017 18:31:30 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: create symlink to non-default
	HOST_DIR
In-Reply-To: <20170804163130.15772-1-arnout@mind.be>
References: <20170804163130.15772-1-arnout@mind.be>
Message-ID: <20170804163130.15772-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
This depends on the previous patch, otherwise there are two rules for
the $(BASE_DIR)/host target.

Note that this implementation assumes that HOST_DIR is an absolute
path, but that assumption is made in dozens of other places as well.
Perhaps an abspath should be added to it.
---
 Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6ca5d835f4..77684b5b60 100644
--- a/Makefile
+++ b/Makefile
@@ -430,6 +430,12 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
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
 
@@ -533,7 +539,7 @@ endif
 
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
+	$(HOST_DIR) $(HOST_DIR_SYMLINK) $(HOST_DIR)/usr $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -955,7 +961,7 @@ printvars:
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
+	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
-- 
2.13.3
