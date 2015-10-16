From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 16:50:19 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: support comments in user table
	files
Message-ID: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The format of the users table files is non trivial, so it is sometimes handy
to add comments explaining the syntax (or simply the reason for the user)
inline in the files.

Support comment lines prefixed with '#' similar to shell / makedevs files and strip
those lines before passing to the mkusers script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 528e194..7110bc7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -87,7 +87,7 @@ endif
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
 ifneq ($$(ROOTFS_USERS_TABLES),)
-	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
+	sed '/^#/d' $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
 endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
-- 
2.1.4
