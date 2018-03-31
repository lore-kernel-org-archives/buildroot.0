From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:47:25 +0200
Subject: [Buildroot] [git commit] core: introduce intermediate
 BASE_TARGET_DIR variable
Message-ID: <20180331185351.AC1A584BF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e9870ce32d6329d9e3d602247fbe1709a2275a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new BASE_TARGET_DIR variable is set in stone to point to the real
location where packages will be installed. Its name is modelled after
its definition: it is located in $(BASE_DIR), and it is named 'target/',
hence BASE_TARGET_DIR.

The already-existing TARGET_DIR variable now simply points to the same
location, except that it is recursively expanded, so that we can later
change it depending on the context.

All locations that really need to reference the existing target/
directory, are changed to use BASE_TARGET_DIR; surprinsigly enough, they
all seem to be located in the main Makefile. :-) The rest is left with
using good-old TARGET_DIR.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index d7826b67d9..6eca3c9ec6 100644
--- a/Makefile
+++ b/Makefile
@@ -215,7 +215,8 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
-TARGET_DIR := $(BASE_DIR)/target
+BASE_TARGET_DIR := $(BASE_DIR)/target
+TARGET_DIR = $(BASE_TARGET_DIR)
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -456,7 +457,7 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+TARGET_DIR_WARNING_FILE = $(BASE_TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE := $(HOST_DIR)/bin/ccache
@@ -553,7 +554,7 @@ $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
 endif
 
 .PHONY: dirs
-dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+dirs: $(BUILD_DIR) $(STAGING_DIR) $(BASE_TARGET_DIR) \
 	$(HOST_DIR) $(HOST_DIR_SYMLINK) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
@@ -974,7 +975,7 @@ printvars:
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
+	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
