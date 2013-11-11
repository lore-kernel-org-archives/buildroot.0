From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 18:45:16 +0100
Subject: [Buildroot] [PATCH 1/2] target: ensure target/ dir is writable
In-Reply-To: <cover.1384191560.git.yann.morin.1998@free.fr>
References: <cover.1384191560.git.yann.morin.1998@free.fr>
Message-ID: <eb18aa1f5f3ba9939deb9ba922a1e83f8a951f1f.1384191560.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Lynch <ntl@pobox.com>

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
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2f7db59..b821b2e 100644
--- a/Makefile
+++ b/Makefile
@@ -433,7 +433,7 @@ RSYNC_VCS_EXCLUSIONS = \
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	rsync -a $(RSYNC_VCS_EXCLUSIONS) \
-		--exclude .empty --exclude '*~' \
+		--chmod=Du+w --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
@@ -508,7 +508,7 @@ endif
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
-			--exclude .empty --exclude '*~' \
+			--chmod=Du+w --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-- 
1.8.1.2
