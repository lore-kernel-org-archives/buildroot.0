From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed,  4 Jan 2017 22:55:09 -0500
Subject: [Buildroot] [PATCH 1/1] skeleton: ensure that /usr/{lib, bin,
	sbin} exist
Message-ID: <1483588509-2653-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is possible to have a custom skeleton without a /usr/{lib,bin,sbin},
and indeed without a /usr directory at all.  These directories eventually
get created when packages install there, but at skeleton installation time,
the following command fails if /usr does not yet exist:

ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)

So, in the spirit of ensuring that directories exist before installing there,
ensure that at least /usr exists to avoid the above failure.  While doing
so, lets ensure that /usr/{lib,bin,sbin} exist too, to be thematically
consistent with SKELETON_USR_SYMLINKS_OR_DIRS.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/skeleton/skeleton.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1000161..4b661fe 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -91,6 +91,9 @@ define SKELETON_INSTALL_TARGET_CMDS
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/sbin
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
 	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
-- 
1.9.1
