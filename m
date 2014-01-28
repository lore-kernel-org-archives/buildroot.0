From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:51:47 +0100
Subject: [Buildroot] [git commit] target: ensure target/ dir is writable
Message-ID: <20140128215820.9C2039C6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f52d7a8bd659664849cb4c58d7d791f129de8ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the source target skeleton is read-only (eg. because Buildroot's
source dir is), modifications to the output target (such as creating
/etc/hostname and /etc/issue) fail.

(This can happen if the Buildroot source dir is NFS-mounted read-only
to be shared between different machines, for example).

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: we use rsync now, not cp; --chmod=Du+w
 suggested by Arnout; clarify commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 067458b..d8a8dad 100644
--- a/Makefile
+++ b/Makefile
@@ -473,7 +473,7 @@ RSYNC_VCS_EXCLUSIONS = \
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	rsync -a $(RSYNC_VCS_EXCLUSIONS) \
-		--exclude .empty --exclude '*~' \
+		--chmod=Du+w --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
@@ -549,7 +549,7 @@ endif
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
-			--exclude .empty --exclude '*~' \
+			--chmod=Du+w --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
