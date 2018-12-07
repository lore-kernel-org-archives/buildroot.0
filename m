From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu,  6 Dec 2018 20:50:52 -0700
Subject: [Buildroot] [PATCH 1/1] core/sdk: don't mangle symlinks with '.' or
 '..' at start
Message-ID: <20181207035052.316-1-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous transform of changing any '.' at the start of a line to
$(BR2_SDK_PREFIX) mangles any symlinks with a relative path starting
with '.' or '..' in the host folder, as --transform operates on the link
target as opposed to the link name.

You might end up with something like:
$(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
$(BR2_SDK_PREFIX)./opt/ext-toolchain/bin/aarch64-linux-gnu-ar

when it should be:
$(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
../opt/ext-toolchain/bin/aarch64-linux-gnu-ar

Instead, don't change to HOST_DIR when creating the tarball, and pass
the path to HOST_DIR. Tar will strip the leading / from member names,
so then transform that path (HOST_DIR with leading / removed) to
BR2_SDK_PREFIX.

However hardlinks are still linking to HOST_DIR, so do an additional
transform of $(HOST_DIR) (keeping the leading slash) to BR2_SDK_PREFIX
in order to catch those.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
If accepted, this should probably get put on 2018.11.x.
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 37df98520e..668c3e09e0 100644
--- a/Makefile
+++ b/Makefile
@@ -591,6 +591,7 @@ prepare-sdk: world
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
 
 BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
+HOST_DIR_NO_LEAD_SLASH=$(shell echo $(HOST_DIR) | tail -c +2)
 .PHONY: sdk
 sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
 	@$(call MESSAGE,"Generating SDK tarball")
@@ -598,8 +599,8 @@ sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
 	$(Q)mkdir -p $(BINARIES_DIR)
 	$(TAR) czf "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" \
 		--owner=0 --group=0 --numeric-owner \
-		--transform='s#^\.#$(BR2_SDK_PREFIX)#' \
-		-C $(HOST_DIR) "."
+		--transform='s#^$(HOST_DIR_NO_LEAD_SLASH)#$(BR2_SDK_PREFIX)#' \
+		--transform='s#^$(HOST_DIR)#$(BR2_SDK_PREFIX)#' $(HOST_DIR)
 
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
-- 
2.17.1
