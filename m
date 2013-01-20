From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 21:25:25 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the output
	directory
In-Reply-To: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358713538-4364-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new directory will be used to extract the source directory of the
different packages, as part of the out of tree support.

Note that we need to explicitly re-add write permissions on the
contents of this directory, because write permissions are removed from
the source code of packages in order to ensure that the packages are
not incorrectly modifying their source directory during an out of tree
build. We also re-add write permissions to the build directory since
some packages copy files from their source directory to the build
directory, causing rm to fail due to lack of permissions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6f8ed0e..15ce4e4 100644
--- a/Makefile
+++ b/Makefile
@@ -260,6 +260,7 @@ GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
 STAMP_DIR:=$(BASE_DIR)/stamps
 
 BINARIES_DIR:=$(BASE_DIR)/images
+SRC_DIR:=$(BASE_DIR)/src
 TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/system/skeleton
@@ -383,7 +384,7 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(SRC_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
 
@@ -409,7 +410,7 @@ world: toolchain $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
-$(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
+$(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(SRC_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -704,9 +705,10 @@ ifeq ($(NEED_WRAPPER),y)
 endif
 
 clean:
+	-chmod u+w -R $(SRC_DIR)/* $(BUILD_DIR)/*
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR)
+		$(LEGAL_INFO_DIR) $(SRC_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
-- 
1.7.9.5
