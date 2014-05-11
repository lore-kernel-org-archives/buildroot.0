From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 10:51:06 +0200
Subject: [Buildroot] [git commit] fs: use our own mkpasswd when creating
	users
Message-ID: <20140511085201.847889CB20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1773a2a14216f3bbae7264600471f700c400552a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Export PATH=$(BR_PATH) so that our own mkpasswd is found before
any existing host-system one.

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 831365e..47199c7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -83,7 +83,7 @@ ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
 endif
 	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
-	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
+	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
